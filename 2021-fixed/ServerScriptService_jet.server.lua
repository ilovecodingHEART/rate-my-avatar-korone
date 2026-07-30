-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- by polaris and 22slipz

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local Whitelist = {10337663823, 5824393709, 5502332040}

local function IsAllowed(plr)
	for _, id in pairs(Whitelist) do
		if id == plr.UserId then
			return true
		end
	end
	return false
end

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if not IsAllowed(plr) then return end

		local cmd = msg:lower()
		local char = plr.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")

		if cmd == "!jet" and root then
			local template = ServerStorage:FindFirstChild("Jet")
			if template then
				local jet = template:Clone()
				jet.Name = "SpawnedJet"
				jet.Parent = workspace

				local spawnPos = root.CFrame * CFrame.new(0, 0, -20)
				jet:PivotTo(spawnPos)
			end
		elseif cmd == "!removejet" then
			for _, obj in pairs(workspace:GetChildren()) do
				if obj.Name == "SpawnedJet" then
					obj:Destroy()
				end
			end
		end
	end)
end)