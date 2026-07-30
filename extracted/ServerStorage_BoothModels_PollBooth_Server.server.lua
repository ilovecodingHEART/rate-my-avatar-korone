local startPoll = script.Parent.StartPoll
local addVote = script.Parent.AddVote

local votedPlayers = script.Parent.VotedPlayers
local totalVotes = script.Parent.TotalVotes

local pollUI = script.Parent.PollPart.SurfaceGui.Poll

local hasStarted = false
function _filtertext(arg1, arg2)
	local _data = 'failed to filter text';
	local IsSuccess, ErrorMessage = pcall(function()
		local Result = game:GetService("TextService"):FilterStringAsync(arg1, arg2, Enum.TextFilterContext.PublicChat);
		_data = Result:GetNonChatStringForUserAsync(arg2);
	end)
	if not IsSuccess or not _data then
		return 'Failed to filter the text please try again or report to staff.'
	end
	return _data;
end;
startPoll.OnServerEvent:Connect(function(Player, optionsTable)
	if #optionsTable < 2 then return end
	if script.Parent:GetAttribute("OwnerId") ~= Player.UserId then return end
	hasStarted = true
	totalVotes.Value = 0
	votedPlayers:ClearAllChildren()
	for optionNumber = 1, 4 do
		local optionValue = script.Parent:FindFirstChild("Option"..optionNumber)
		if optionValue then
			optionValue.Value = 0
		end
	end
	local options = #optionsTable
	local sizeY = options == 4 and 0.25 or options == 3 and 0.35 or options == 2 and 0.5
	for _, pollOption in pairs(pollUI:GetChildren()) do
		if pollOption:IsA("TextButton") then
			pollOption.Visible = false
		end
	end
	for index, optionText in pairs(optionsTable) do
		local pollOption = pollUI:FindFirstChild("Option"..index)
		if pollOption then
			pollOption.Size = UDim2.new(1, 0, sizeY, 0)
			pollOption.OptionText.Text = _filtertext(tostring(optionText), Player.UserId); -- ADD FILTERING
			pollOption.Visible = true
		end
	end
end)

addVote.OnServerEvent:Connect(function(Player, optionNumber)
	if not hasStarted then return end
	if not pollUI:FindFirstChild("Option"..optionNumber).Visible then return end
	if votedPlayers:FindFirstChild((tostring(Player.UserId))) == nil then
		local optionValue = script.Parent:FindFirstChild("Option"..optionNumber)
		if not optionValue then return end
		optionValue.Value += 1
		totalVotes.Value += 1
		local votedPlayer = Instance.new("BoolValue")
		votedPlayer.Value = true
		votedPlayer.Name = Player.UserId
		votedPlayer.Parent = votedPlayers
	end
end)