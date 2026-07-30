local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local spawnWithFriendsRoot = ReplicatedStorage.SpawnWithFriends
local SpawnWithFriendsConfiguration = require(spawnWithFriendsRoot.SpawnWithFriendsConfiguration)
local teleportToRandomFriend = require(spawnWithFriendsRoot.teleportToRandomFriend)

local function onCharacterAdded(player: Player, character: Model)
	character:WaitForChild("HumanoidRootPart")
	local configuration = SpawnWithFriendsConfiguration.getValues()
	if configuration.teleportToFriendOnRespawn then
		task.wait() -- Teleportation is performed on the next step, to avoid conflicts with spawn locations
		teleportToRandomFriend(player)
	end
end

local function onPlayerAdded(player: Player)
	player.CharacterAdded:Connect(function(character)
		onCharacterAdded(player, character)
	end)

	if player.Character then
		onCharacterAdded(player, player.Character)
	end
end

Players.ChildAdded:Connect(onPlayerAdded)
for _, player in ipairs(Players:GetChildren()) do
	onPlayerAdded(player)
end
