local RemoteEvent = script.Parent.RemoteEvent
local rope = script.Parent:FindFirstChild("RopeConstraint")
local hinge = script.Parent:FindFirstChild("HingeConstraint")
local prismaticConstraint = script.Parent:FindFirstChild("PrismaticConstraint")
local minLength = 2
local maxLength = 29
local winchSpeed = 10
local slideSpeed = 5
local maxVelocity = 10
local minVelocity = -10
local rotationSpeed = 0.75
local winchDirection = 0

local activeInputs = { Winch = 0, Rotation = 0, Slide = 0 }

game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
	if rope and winchDirection ~= 0 then
		local newTarget = rope.WinchTarget + (winchDirection * winchSpeed * deltaTime)
		rope.WinchTarget = math.clamp(newTarget, minLength, maxLength)
		if rope.WinchTarget == minLength or rope.WinchTarget == maxLength then
			winchDirection = 0
		end
	end
end)

RemoteEvent.OnServerEvent:Connect(function(player, action)
	if not script.Parent.ControlRoom.SeatPart.Occupant or script.Parent.ControlRoom.SeatPart.Occupant.Parent ~= player.Character then
		return 
	end

	if script.Parent:GetAttribute("OwnerId") ~= player.UserId then
		return
	end

	if action == "WinchDownBegan" then
		winchDirection = 1
	elseif action == "WinchUpBegan" then
		winchDirection = -1
	elseif action == "WinchDownEnded" and winchDirection == 1 then
		winchDirection = 0
	elseif action == "WinchUpEnded" and winchDirection == -1 then
		winchDirection = 0
	end

	if action == "RotateLeftBegan" then
		activeInputs.Rotation = 1
	elseif action == "RotateRightBegan" then
		activeInputs.Rotation = -1
	elseif action == "RotateLeftEnded" and activeInputs.Rotation == 1 then
		activeInputs.Rotation = 0
	elseif action == "RotateRightEnded" and activeInputs.Rotation == -1 then
		activeInputs.Rotation = 0
	end

	if action == "SlideBackBegan" then
		activeInputs.Slide = -1
	elseif action == "SlideForwardBegan" then
		activeInputs.Slide = 1
	elseif action == "SlideBackEnded" and activeInputs.Slide == -1 then
		activeInputs.Slide = 0
	elseif action == "SlideForwardEnded" and activeInputs.Slide == 1 then
		activeInputs.Slide = 0
	end

	if hinge then
		if activeInputs.Rotation ~= 0 then
			hinge.MotorMaxTorque = 5000000
			hinge.AngularVelocity = activeInputs.Rotation * rotationSpeed
		else
			hinge.AngularVelocity = 0
		end
	end

	if prismaticConstraint then
		prismaticConstraint.Velocity = activeInputs.Slide * slideSpeed
	end
end)