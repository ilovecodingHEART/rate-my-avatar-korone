-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local tank = script.Parent
local pitch = tank:FindFirstChild("Pitch")
local yaw = tank:FindFirstChild("Yaw")
local velocity = 1.5
local velocity2 = 0.75
local lastshottime = 0
local shotcooldown = 5 
local function PlayCannonEffects()
	local tankshooter = pitch:FindFirstChild("TankShooter")
	local sound = tankshooter:FindFirstChild("Shoot")
	local cannonemitter = tankshooter:FindFirstChild("CannonEmitter")
	if sound then
		sound:Play()
	end
	if cannonemitter then
		for _, particle in ipairs(cannonemitter:GetChildren()) do
			if particle:IsA("ParticleEmitter") then
				particle.Enabled = true
				particle:Emit(particle:GetAttribute("EmitCount") or 1)
				particle.Enabled = false
			end
		end
	end
end
local function SetAngularVelocity(part, speed)
	local hinge = part:FindFirstChild("HingeConstraint")
	if hinge then
		hinge.AngularVelocity = speed
	end
end
local function StopAngularVelocity(part)
	SetAngularVelocity(part, 0)
end
script.Parent.RemoteEvent.OnServerEvent:Connect(function(player, action)
	if not script.Parent.Seat.Occupant or script.Parent.Seat.Occupant.Parent ~= player.Character then
		return 
	end
	if action == "Shoot" then
		local currentTime = tick()
		if currentTime - lastshottime >= shotcooldown then
			PlayCannonEffects()
			lastshottime = currentTime
		else
		end
	elseif action == "PitchUpBegan" then
		SetAngularVelocity(pitch, velocity2)
	elseif action == "PitchDownBegan" then
		SetAngularVelocity(pitch, -velocity2)
	elseif action == "RotateRightBegan" then
		SetAngularVelocity(yaw, -velocity)
	elseif action == "RotateLeftBegan" then
		SetAngularVelocity(yaw, velocity)
	elseif action == "PitchUpEnded" or action == "PitchDownEnded" then
		StopAngularVelocity(pitch)
	elseif action == "RotateRightEnded" or action == "RotateLeftEnded" then
		StopAngularVelocity(yaw)
	end
end)
script.Parent.Destroying:Connect(function()
	local boothInteractions = workspace:FindFirstChild("BoothInteractions")
	if boothInteractions then
		boothInteractions.Parent = workspace
	end
end)