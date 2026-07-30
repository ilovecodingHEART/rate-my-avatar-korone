-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local tool = script.Parent
local idlesmite = script.Animations.Idle
local swingsmite = script.Animations.Swing

local swingsmiteTrack
local idlesmiteTrack
local hit = 0

function hoyya(hammer)
	local Handle = script.Parent.Handle
	local EmitPoint = Handle.EmitPoint
	if hammer == "start" then
		Handle.Preparing:Play()
		Handle.Swoosh:Play()
		Handle.SwordAppear:Play()
	elseif hammer == "hit" then
		Handle.SwordAttachement.Impact_Ring:Play()
		Handle.SwordAttachement.Impact_Impact:Play()
		Handle.SwordAttachement.Impact_Ambiance:Play()
		
		EmitPoint.Flames:Emit(200)
		EmitPoint.Impact_RaysBurst:Emit(300)
		EmitPoint.ParticleEmitter:Emit(200)
		EmitPoint.SmoothRaysBig:Emit(70)
		EmitPoint.SparkleExplosion:Emit(30)
		EmitPoint.BrightFlare:Emit(10)
	end
end

function Swing()
	if hit == 1 then return end
	hit = 1 
	idlesmiteTrack:Stop()
	swingsmiteTrack = script.Parent.Parent.Humanoid:LoadAnimation(swingsmite)
	swingsmiteTrack.Priority = Enum.AnimationPriority.Action
	swingsmiteTrack.Looped = false

	swingsmiteTrack:Play()

	hoyya("start")
	wait(2)
	hoyya("hit")
	wait(2)
	idlesmiteTrack:Play()
	hit = 0
end


tool.Equipped:Connect(function()
	idlesmiteTrack = script.Parent.Parent.Humanoid:LoadAnimation(idlesmite)
	idlesmiteTrack.Priority = Enum.AnimationPriority.Action
	idlesmiteTrack.Looped = true
	idlesmiteTrack:Play()
end)
tool.Unequipped:Connect(function()
	if idlesmiteTrack then
		idlesmiteTrack:Stop()
	end
end)

tool.Activated:Connect(function()
	Swing()
end)



