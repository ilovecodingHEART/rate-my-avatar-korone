-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- by 22Slipz

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local groupid = 125814458
local minrank = 35
local MAX_ZOMBIES_PER_COMMAND = 50

local playerZombies = {}

Players.PlayerAdded:Connect(function(player)

	playerZombies[player] = {}

	player.Chatted:Connect(function(message)

		message = message:lower()
		local args = message:split(" ")

		if player:GetRankInGroup(groupid) < minrank then
			return
		end

		local character = player.Character or player.CharacterAdded:Wait()
		local root = character:WaitForChild("HumanoidRootPart")

		if args[1] == "/e" and args[2] == "zombie" then

			local amount = tonumber(args[3]) or 1
			amount = math.clamp(amount, 1, MAX_ZOMBIES_PER_COMMAND)

			local zombieModel = ServerStorage:FindFirstChild("Zombie")

			if not zombieModel then
				warn("zombie model not found in serverstorage")
				return
			end

			for i = 1, amount do

				local zombie = zombieModel:Clone()
				zombie.Parent = workspace

				if zombie.PrimaryPart then
					zombie:SetPrimaryPartCFrame(
						root.CFrame * CFrame.new(0, 0, -6 - (i * 3))
					)
				else
					zombie:MoveTo(
						root.Position + Vector3.new(0, 0, -6 - (i * 3))
					)
				end

				table.insert(playerZombies[player], zombie)

			end

		end

		if args[1] == "/e" and args[2] == "remove" then

			local amount = tonumber(args[3])

			if not amount then

				for _, zombie in pairs(playerZombies[player]) do
					if zombie then
						zombie:Destroy()
					end
				end

				playerZombies[player] = {}

				return
			end

			amount = math.clamp(amount, 1, MAX_ZOMBIES_PER_COMMAND)

			for i = 1, amount do

				local zombie = table.remove(playerZombies[player])

				if zombie then
					zombie:Destroy()
				end

			end

		end

	end)

end)

local function onCharacterAdded(character)

	local player = Players:GetPlayerFromCharacter(character)

	if not player then return end

	if player:GetRankInGroup(groupid) < minrank then
		return
	end

	local humanoid = character:WaitForChild("Humanoid")

	humanoid.Died:Connect(function()

		for _, zombie in pairs(playerZombies[player] or {}) do
			if zombie then
				zombie:Destroy()
			end
		end

		playerZombies[player] = {}

	end)

end

Players.PlayerAdded:Connect(function(player)

	player.CharacterAdded:Connect(onCharacterAdded)

end)

Players.PlayerRemoving:Connect(function(player)

	for _, zombie in pairs(playerZombies[player] or {}) do
		if zombie then
			zombie:Destroy()
		end
	end

	playerZombies[player] = nil

end)