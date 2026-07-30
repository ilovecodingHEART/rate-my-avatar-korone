local _replicatedstorage = game:GetService("ReplicatedStorage")
local _workspace = game:GetService("Workspace")
local _datastoreservice = game:GetService("DataStoreService")
local TweenService = game:GetService("TweenService")

local _numbershelper = require(_replicatedstorage:WaitForChild("NumberHelpers"))

local LB_ENTRY_TWEEN = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local LB_EXIT_TWEEN  = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local leaderboards = {
	Raised = {
		AllTime = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardV1"),
		Daily = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardDailyV1"),
		Weekly = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardWeeklyV1"),
		Monthly = _datastoreservice:GetOrderedDataStore("RaisedLeaderboardMonthlyV1")
	},
	Donated = {
		AllTime = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardV1"),
		Daily = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardDailyV1"),
		Weekly = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardWeeklyV1"),
		Monthly = _datastoreservice:GetOrderedDataStore("DonatedLeaderboardMonthlyV1")
	}
}

local _mapui = _workspace:WaitForChild("MapUI", 15)

local playerNamesCache = {}
local leaderboardDataCache = {}
local activeEntries = {}

local function tweenRobux(label, newAmount)

	local lastValue = label:GetAttribute("LastAmount")

	if lastValue == nil then
		label:SetAttribute("LastAmount", newAmount)
		label.Text = "\238\128\130" .. _numbershelper.format(newAmount)
		return
	end

	if lastValue == newAmount then
		return
	end

	local numberValue = Instance.new("NumberValue")
	numberValue.Value = lastValue

	numberValue:GetPropertyChangedSignal("Value"):Connect(function()
		label.Text = "\238\128\130" .. _numbershelper.format(math.floor(numberValue.Value))
	end)

	label:SetAttribute("LastAmount", newAmount)

	TweenService:Create(
		numberValue,
		TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
		{ Value = newAmount }
	):Play()

end

local function fadeChildren(frame, transparency)

	for _, ui in ipairs(frame:GetDescendants()) do

		if ui:IsA("TextLabel") then
			TweenService:Create(ui, LB_ENTRY_TWEEN, {TextTransparency = transparency}):Play()

		elseif ui:IsA("ImageLabel") then
			TweenService:Create(ui, LB_ENTRY_TWEEN, {ImageTransparency = transparency}):Play()
		end

	end

end

local function getPlayerName(userId)

	if playerNamesCache[userId] then
		return playerNamesCache[userId]
	end

	local username = "please report to staff."

	pcall(function()
		username = game.Players:GetNameFromUserIdAsync(userId)
	end)

	playerNamesCache[userId] = username

	return username

end

local function updateLeaderboardData(boardType, leaderboardName)

	local datastore = leaderboards[boardType] and leaderboards[boardType][leaderboardName]
	if not datastore then return end

	local success, sortedData = pcall(function()
		return datastore:GetSortedAsync(false, 100)
	end)

	if not success then return end

	local pages = sortedData:GetCurrentPage()
	local leaderboardData = {}

	for _, entry in ipairs(pages) do

		local username = getPlayerName(entry.key)

		table.insert(leaderboardData,{
			id = entry.key,
			username = username,
			amount = entry.value,
		})

	end

	leaderboardDataCache[boardType .. "_" .. leaderboardName] = leaderboardData

end

local function _update(boardType, leaderboardName)

	local leaderboardUI = _mapui:FindFirstChild("Top" .. boardType)
	if not leaderboardUI then return end

	local boardFrame = leaderboardUI:FindFirstChild(leaderboardName)
	if not boardFrame then return end

	activeEntries[boardFrame] = activeEntries[boardFrame] or {}
	local newActive = {}

	leaderboardUI.LastUpdated:SetAttribute("Timestamp", DateTime.now().UnixTimestampMillis)

	local leaderboardData = leaderboardDataCache[boardType .. "_" .. leaderboardName] or {}

	for index, details in ipairs(leaderboardData) do

		local entryName = details.username .. "Leaderboard"
		local template = boardFrame:FindFirstChild(entryName)

		if not template then

			template = script:WaitForChild("PlayerTemplate",5):Clone()

			template.Name = entryName
			template.LayoutOrder = index

			template.Info.Avatar.Image =
				("rbxthumb://type=AvatarHeadShot&id=%d&w=420&h=420"):format(details.id)

			template.Info.Username.Text = ("@%s"):format(details.username)
			template.Info.Rank.Text = tostring(index)

			template.Stats.Robux.Text = "\238\128\130" .. _numbershelper.format(details.amount)
			template.Stats.Robux:SetAttribute("LastAmount", details.amount)

			template.Position = UDim2.new(0,0,0,(index-1)*50 + 20)

			for _, ui in ipairs(template:GetDescendants()) do
				if ui:IsA("TextLabel") then
					ui.TextTransparency = 1
				elseif ui:IsA("ImageLabel") then
					ui.ImageTransparency = 1
				end
			end

			template.Parent = boardFrame

			TweenService:Create(template, LB_ENTRY_TWEEN,{
				Position = UDim2.new(0,0,0,(index-1)*50)
			}):Play()

			fadeChildren(template,0)

		else

			template.Info.Rank.Text = tostring(index)

			tweenRobux(template.Stats.Robux, details.amount)

			TweenService:Create(template, LB_ENTRY_TWEEN,{
				Position = UDim2.new(0,0,0,(index-1)*50)
			}):Play()

		end

		local templates = _replicatedstorage:FindFirstChild("Templates")

		if templates then

			if index == 1 then
				local golden = templates:FindFirstChild("GoldGradient")
				if golden then golden:Clone().Parent = template.Info.Username end

			elseif index == 2 then
				local silver = templates:FindFirstChild("SilverGradient")
				if silver then silver:Clone().Parent = template.Info.Username end

			elseif index == 3 then
				local bronze = templates:FindFirstChild("BronzeGradient")
				if bronze then bronze:Clone().Parent = template.Info.Username end
			end

		end

		newActive[template] = true

	end

	for _, frame in ipairs(boardFrame:GetChildren()) do

		if frame:IsA("Frame") and not newActive[frame] then

			TweenService:Create(frame, LB_EXIT_TWEEN,{
				Position = frame.Position + UDim2.new(0,0,0,20)
			}):Play()

			for _, ui in ipairs(frame:GetDescendants()) do

				if ui:IsA("TextLabel") then
					TweenService:Create(ui, LB_EXIT_TWEEN,{TextTransparency = 1}):Play()

				elseif ui:IsA("ImageLabel") then
					TweenService:Create(ui, LB_EXIT_TWEEN,{ImageTransparency = 1}):Play()
				end

			end

			task.delay(LB_EXIT_TWEEN.Time,function()

				if frame and frame.Parent then
					frame:Destroy()
				end

			end)

		end

	end

end

local function resetLeaderboard(datastore)

	local success, err = pcall(function()

		local pages = datastore:GetSortedAsync(false, 100):GetCurrentPage()

		for _, entry in ipairs(pages) do
			datastore:SetAsync(entry.key, 0)
		end

	end)

	if not success then
		warn("Failed to reset leaderboard:", err)
	end

end

local function checkAndResetLeaderboards()

	local time = os.date("!*t")
	local isMidnight = (time.hour == 0 and time.min == 0)

	if isMidnight then

		for _, boardType in pairs({"Raised","Donated"}) do
			resetLeaderboard(leaderboards[boardType].Daily)
		end

		if time.wday == 2 then

			for _, boardType in pairs({"Raised","Donated"}) do
				resetLeaderboard(leaderboards[boardType].Weekly)
			end

		end

		if time.day == 1 then

			for _, boardType in pairs({"Raised","Donated"}) do
				resetLeaderboard(leaderboards[boardType].Monthly)
			end

		end

	end

end

task.spawn(function()

	while task.wait(10) do

		for boardType,_ in pairs(leaderboards) do
			for _,period in pairs({"AllTime","Daily","Weekly","Monthly"}) do
				updateLeaderboardData(boardType,period)
			end
		end

	end

end)

task.spawn(function()

	while task.wait(60) do

		for boardType,_ in pairs(leaderboards) do
			for _,period in pairs({"AllTime","Daily","Weekly","Monthly"}) do
				_update(boardType,period)
			end
		end

	end

end)

task.spawn(function()

	while task.wait(60) do
		checkAndResetLeaderboards()
	end

end)