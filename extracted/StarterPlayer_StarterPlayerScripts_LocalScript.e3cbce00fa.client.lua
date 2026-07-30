local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Remote = ReplicatedStorage:WaitForChild("Eepdoop")
local DiscoModule = require(ReplicatedStorage:WaitForChild("DiscoEvent"):WaitForChild("Play"))

Remote.OnClientEvent:Connect(function(songName)
	local discoModel = ReplicatedStorage:WaitForChild("DiscoEvent1"):Clone()
	discoModel.Parent = Workspace

	DiscoModule:PlayEffect(songName)
end)
