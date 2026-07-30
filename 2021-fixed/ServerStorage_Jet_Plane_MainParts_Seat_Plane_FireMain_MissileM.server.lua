-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Missile = script.Parent
local Tracker = Missile.Tracker
local BV = Missile.BodyVelocity
-------------------------------------------
while true do
	if Tracker.Value then
		if Tracker.Value.Parent == game.Workspace then
			Missile.CFrame = CFrame.new(Missile.Position,Tracker.Value.Position)
			BV.velocity = Missile.CFrame.lookVector * 1500
		elseif Tracker.Value.Parent == game.Lighting then
			break
		end
	end
	wait()
end