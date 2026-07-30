-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local PhysicsService = game:GetService("PhysicsService")
local Character = script.Parent

local PlayerCollisionGroupName = "Players"
local GolfCartCollisionGroupName = "CarModel"
local CarRaycastCollisionGroupName = "CarRaycast"

local PreviousCollisionGroups = {}

local function DisableCollisionBetweenGroups()
	if not pcall(function() PhysicsService:CreateCollisionGroup(PlayerCollisionGroupName) end) then
	end

	if not pcall(function() PhysicsService:CreateCollisionGroup(GolfCartCollisionGroupName) end) then
	end

	if not pcall(function() PhysicsService:CreateCollisionGroup(CarRaycastCollisionGroupName) end) then
	end

	PhysicsService:CollisionGroupSetCollidable(PlayerCollisionGroupName, GolfCartCollisionGroupName, false)
	PhysicsService:CollisionGroupSetCollidable(PlayerCollisionGroupName, CarRaycastCollisionGroupName, false)
	PhysicsService:CollisionGroupSetCollidable(GolfCartCollisionGroupName, PlayerCollisionGroupName, false)
	PhysicsService:CollisionGroupSetCollidable(CarRaycastCollisionGroupName, PlayerCollisionGroupName, false)
end

local function SetCollisionGroup(object, collisionGroupName)
	if object:IsA("BasePart") then
		PreviousCollisionGroups[object] = object.CollisionGroupId
		PhysicsService:SetPartCollisionGroup(object, collisionGroupName)
	end
end

local function SetCollisionGroupRecursive(object, collisionGroupName)
	SetCollisionGroup(object, collisionGroupName)

	for _, child in ipairs(object:GetChildren()) do
		SetCollisionGroupRecursive(child, collisionGroupName)
	end
end

local function ReSetCollisionGroup(object)
	pcall(function()
		local PreviousCollisionGroupId = PreviousCollisionGroups[object]
		if not PreviousCollisionGroupId then return end

		local PreviousCollisionGroupName = PhysicsService:GetCollisionGroupName(PreviousCollisionGroupId)
		if not PreviousCollisionGroupName then return end

		PhysicsService:SetPartCollisionGroup(object, PreviousCollisionGroupName)
		PreviousCollisionGroups[object] = nil
	end)
end

SetCollisionGroupRecursive(Character, PlayerCollisionGroupName)

DisableCollisionBetweenGroups()

Character.DescendantAdded:Connect(function(object)
	SetCollisionGroup(object, PlayerCollisionGroupName)
end)

Character.DescendantRemoving:Connect(ReSetCollisionGroup)

for _, part in pairs(Character:GetChildren()) do
	SetCollisionGroup(part, PlayerCollisionGroupName)
end