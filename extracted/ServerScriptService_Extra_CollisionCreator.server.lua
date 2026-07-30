local PhysicsService = game:GetService("PhysicsService")

local playerCollisionGroupName = "Players"
PhysicsService:CreateCollisionGroup(playerCollisionGroupName)
PhysicsService:CollisionGroupSetCollidable(playerCollisionGroupName, playerCollisionGroupName, false)