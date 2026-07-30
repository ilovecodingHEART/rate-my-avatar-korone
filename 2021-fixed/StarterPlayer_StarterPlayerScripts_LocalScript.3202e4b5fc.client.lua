-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local player = Players.LocalPlayer

local function getGUI()
	local pg = player:FindFirstChild("PlayerGui")
	if not pg then return nil end

	local sg = pg:FindFirstChild("ScreenGui")
	if not sg then return nil end

	return sg:FindFirstChild("LeaderboardHistory")
end

local GUI = getGUI()


task.spawn(function()
	while not GUI do
		GUI = getGUI()
		task.wait(1)
	end
end)

local MapUI = workspace:WaitForChild("MapUI", 20)
local Boards = {
	["Top Donated"] = MapUI:WaitForChild("TopDonated", 10),
	["Top Raised"] = MapUI:WaitForChild("TopRaised", 10)
}

local currentBoard = "Top Donated"

local function render()
	if not GUI or not GUI:FindFirstChild("Frame") then return end
	local historyFrame = GUI.Frame:FindFirstChild("History")
	if not historyFrame then return end

	for _, v in ipairs(historyFrame:GetChildren()) do
		if v:IsA("Frame") or CollectionService:HasTag(v, "LeaderboardEntry") then
			v:Destroy()
		end
	end

	local board = Boards[currentBoard]
	if not board then return end

	local sortFrame = GUI.Frame:FindFirstChild("Sort")
	local timeLabel = sortFrame and sortFrame:FindFirstChild("Time")
	if timeLabel and (timeLabel.Text == "" or timeLabel.Text == nil) then
		timeLabel.Text = "All Time"
	end

	local rangeName = (timeLabel and timeLabel.Text or "All Time"):gsub("%s+", "")
	local source = board:FindFirstChild(rangeName) or board:FindFirstChild("AllTime")

	if source then
		for _, entry in ipairs(source:GetChildren()) do
			if entry:IsA("Frame") then
				local clone = entry:Clone()
				clone.Parent = historyFrame
			end
		end
	end

	local loading = historyFrame:FindFirstChild("Loading")
	if loading then loading.Visible = false end
end

local function bindPrompt(objName, mode)
	local obj = workspace:FindFirstChild(objName)
	if not obj then return end

	local prompt = obj:FindFirstChildOfClass("ProximityPrompt") or obj:WaitForChild("ProximityPrompt", 10)
	if prompt then
		prompt.ClickablePrompt = true
		prompt.Triggered:Connect(function(plr)
			if plr ~= player then return end


			if not GUI then GUI = getGUI() end
			if not GUI then return end

			currentBoard = mode

			local sort = GUI.Frame:FindFirstChild("Sort")
			if sort and sort:FindFirstChild("Type") then
				sort.Type.Text = mode
			end

			if GUI.Parent:IsA("ScreenGui") then
				GUI.Parent.Enabled = true
			end

			GUI.Visible = true
			render()
		end)
	end
end


task.spawn(function()
	while not GUI do task.wait(0.5) end

	local timeBtn = GUI.Frame.Sort:FindFirstChild("Time")
	if timeBtn then
		timeBtn.Text = "All Time"
		if timeBtn:IsA("GuiButton") then
			timeBtn.MouseButton1Click:Connect(render)
		end
		timeBtn:GetPropertyChangedSignal("Text"):Connect(render)
	end

	local typeLabel = GUI.Frame.Sort:FindFirstChild("Type")
	if typeLabel then
		typeLabel.Text = currentBoard
		typeLabel:GetPropertyChangedSignal("Text"):Connect(function()
			currentBoard = typeLabel.Text
			render()
		end)
	end

	local closeBtn = GUI.Frame:FindFirstChild("Close") or GUI.Frame:FindFirstChild("CloseBtn")
	if closeBtn and closeBtn:IsA("GuiButton") then
		closeBtn.MouseButton1Click:Connect(function()
			GUI.Visible = false
		end)
	end
end)

bindPrompt("TopDonatedHistory", "Top Donated")
bindPrompt("TopRaisedHistory", "Top Raised")