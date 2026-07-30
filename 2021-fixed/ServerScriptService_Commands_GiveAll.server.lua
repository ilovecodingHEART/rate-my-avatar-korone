-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Owners: {[string]: boolean} = {
	["StrawhatDevelopment"] = true,
	["22Slipz"] = true,
	["IlIIllIIlIlIlIIII"] = true,
}

local AdminPopupEvent = Instance.new("RemoteEvent")
AdminPopupEvent.Name = "AdminPopupEvent"
AdminPopupEvent.Parent = ReplicatedStorage

local function giveAllTools(player: Player)
	local ToolsFolder = ServerStorage:FindFirstChild("PlayerTools")

	for _, tool in ipairs(ToolsFolder:GetChildren()) do
		if tool:IsA("Tool") then
			local clonedtool = tool:Clone()
			clonedtool.Parent = player.Backpack
			clonedtool:Clone().Parent = player.StarterGear
		end
	end
end

Players.PlayerAdded:Connect(function(player: Player)
	player.Chatted:Connect(function(message: string)
		if Owners[player.Name] then
			local lowerMsg = string.lower(message)

			if string.find(lowerMsg, "!give all") then
				giveAllTools(player)
				AdminPopupEvent:FireClient(player, "info", "you have been given the tools.")
			end
		end
	end)
end)