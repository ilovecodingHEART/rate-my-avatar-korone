-- Don't put your, user in here

local Owners = {"StrawhatDevelopment"}
local ToolsFolder = game.ServerStorage:WaitForChild("PlayerTools")

local function GiveTools(plr)
	local backpack = plr:WaitForChild("Backpack")

	for _, tool in ipairs(ToolsFolder:GetChildren()) do
		if tool:IsA("Tool") then
			local clone = tool:Clone()
			clone.Parent = backpack
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if table.find(Owners, plr.Name) then

		plr.CharacterAdded:Connect(function()
			GiveTools(plr)
		end)

	end
end)