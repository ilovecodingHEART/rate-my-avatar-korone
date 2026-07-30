-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_UserInputService_0 = game:GetService("UserInputService")
local l_Players_0 = game:GetService("Players")
local l_CollectionService_0 = game:GetService("CollectionService")
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage")
local l_RunService_0 = game:GetService("RunService")
local v5 = require(l_ReplicatedStorage_0.Packages.Fusion)
local l_LocalPlayer_0 = l_Players_0.LocalPlayer
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui

local function applyZebra(container)
	local entries = {}
	local layout = container:FindFirstChildOfClass("UIListLayout")
	if layout then
		layout.Padding = UDim.new(0, 0)
	end

	for _, child in ipairs(container:GetChildren()) do
		if l_CollectionService_0:HasTag(child, "LeaderboardEntry") and child:IsA("GuiObject") then
			table.insert(entries, child)
		end
	end

	table.sort(entries, function(a, b)
		return a.LayoutOrder < b.LayoutOrder
	end)

	for i, entry in ipairs(entries) do
		entry.Size = UDim2.new(1, 0, 0, 44)
		entry.BorderSizePixel = 0
		entry.BackgroundTransparency = 1
		entry.ClipsDescendants = false

		local bg = entry:FindFirstChild("ZebraStrip")
		if not bg then
			bg = Instance.new("Frame")
			bg.Name = "ZebraStrip"
			bg.ZIndex = 0
			bg.BorderSizePixel = 0
			bg.Parent = entry
		end

		bg.Size = UDim2.new(1.15, 0, 1.1, 0)
		bg.Position = UDim2.new(-0.075, 0, -0.05, 0)

		if i % 2 ~= 0 then
			bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			bg.BackgroundTransparency = 0.955
			bg.Visible = true
		else
			bg.Visible = false
		end
	end
end

local function v13()
	local mousePos = l_UserInputService_0:GetMouseLocation()
	if mousePos == nil then return end
	for _, v12 in l_PlayerGui_0:GetGuiObjectsAtPosition(mousePos.X, mousePos.Y - 36) do
		if l_CollectionService_0:HasTag(v12, "LeaderboardEntry") then
			return v12
		end
	end
end

local v14 = v5.State()
local v15 = nil
local loadDetails = nil

l_UserInputService_0.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and loadDetails then
		loadDetails()
		loadDetails = nil
	end
end)

v5.Compat(v14):onChange(function()
	if v15 then v15 = nil end
	local v16 = v14:get()
	local v17 = v16 and v16:FindFirstChild("Details")
	if v17 then
		loadDetails = function()
			local v18 = v17:InvokeServer()
			if v18 ~= "not_admin" then
				local oldTxt = v16.Info.Username.Text
				local oldImg = v16.Info.Avatar.Image
				v15 = function()
					v16.Info.Username.Text = oldTxt
					v16.Info.Avatar.Image = oldImg
				end
				if v18 then
					v16.Info.Username.Text = "@" .. v18.username
					v16.Info.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v18.id .. "&w=420&h=420"
				else
					v16.Info.Username.Text = "Terminated User"
				end
			end
		end
	end
end)

l_RunService_0.RenderStepped:Connect(function()
	v14:set(v13())
end)

for _, v23 in {workspace:WaitForChild("MapUI"):WaitForChild("TopDonated"), workspace:WaitForChild("MapUI"):WaitForChild("TopRaised")} do
	task.spawn(function()
		while true do
			local lastUpdated = v23:FindFirstChild("LastUpdated")
			if lastUpdated then
				local ts = lastUpdated:GetAttribute("Timestamp")
				if ts then
					local dt = DateTime.fromUnixTimestampMillis(ts)
					local diff = DateTime.now().UnixTimestamp - dt.UnixTimestamp
					local msg = diff < 30 and "updated live" or diff < 60 and diff .. " seconds ago" or diff < 120 and "1 minute ago" or math.floor(diff/60) .. " minutes ago"
					lastUpdated.Text = dt:FormatUniversalTime("LL", l_LocalPlayer_0.LocaleId) .. " (UTC), " .. msg
				end
			end
			task.wait(1)
		end
	end)

	local function updateTab(selectedBtn)
		for _, other in v23.TimeRange:GetChildren() do
			if other:IsA("TextButton") then
				local isSelected = (other == selectedBtn)

				other.BackgroundColor3 = isSelected and Color3.fromRGB(61, 155, 255) or Color3.fromRGB(255, 255, 255)
				other.TextColor3 = isSelected and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)

				if other:FindFirstChild("UIStroke") then 
					other.UIStroke.Color = isSelected and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0) 
				end

				local target = v23:FindFirstChild(other.Name)
				if target then
					target.Visible = isSelected
					if isSelected then
						target.CanvasPosition = Vector2.zero
						applyZebra(target)
					end
				end
			end
		end
	end

	local firstButton = nil

	for _, child in v23.TimeRange:GetChildren() do
		if child:IsA("TextButton") then
			if not firstButton then firstButton = child end

			child.Activated:Connect(function()
				updateTab(child)
			end)

			local canvas = v23:FindFirstChild(child.Name)
			if canvas and canvas:IsA("ScrollingFrame") then
				applyZebra(canvas)
				canvas.ChildAdded:Connect(function()
					applyZebra(canvas)
				end)
			end
		end
	end

	if firstButton then
		updateTab(firstButton)
	end

	if v23:FindFirstChild("AwardButton") then
		v23.AwardButton.Activated:Connect(function()
			l_PlayerGui_0.ScreenGui.Trophy.Visible = true
		end)
	end
end