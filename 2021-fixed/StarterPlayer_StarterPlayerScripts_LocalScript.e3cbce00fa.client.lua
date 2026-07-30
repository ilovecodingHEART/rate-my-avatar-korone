-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Remote = ReplicatedStorage:WaitForChild("Eepdoop")
local DiscoModule = require(ReplicatedStorage:WaitForChild("DiscoEvent"):WaitForChild("Play"))

Remote.OnClientEvent:Connect(function(songName)
	local discoModel = ReplicatedStorage:WaitForChild("DiscoEvent1"):Clone()
	discoModel.Parent = Workspace

	DiscoModule:PlayEffect(songName)
end)
