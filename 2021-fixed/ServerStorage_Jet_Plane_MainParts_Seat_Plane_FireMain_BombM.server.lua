-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Bomb = script.Parent
local Tracker = Bomb.Tracker
local PlaneSpd = Bomb.PlaneSpd
local BG = Bomb.BodyGyro
local BV = Bomb.BodyVelocity
while true do
	if Tracker.Value.Parent == game.Workspace then
		BG.cframe = CFrame.new(Bomb.Position,Tracker.Value.Position)
		local SpdX = (Bomb.CFrame.lookVector*PlaneSpd.Value).X
		local SpdY = (Bomb.CFrame.lookVector*PlaneSpd.Value).Y
		local SpdZ = (Bomb.CFrame.lookVector*PlaneSpd.Value).Z
		BV.velocity = Vector3.new(SpdX,SpdY,SpdZ)
	elseif Tracker.Value.Parent == game.Lighting then
		break
	end
	wait()
end