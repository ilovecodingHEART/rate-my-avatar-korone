-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Seat = script.Parent
local Anim = script.Parent:FindFirstChildOfClass("Animation")
local LastAnim = nil

Seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	if Seat.Occupant == nil and LastAnim ~= nil then
		LastAnim:Stop()
	else
		LastAnim = Seat.Occupant.Parent:FindFirstChild("Humanoid"):LoadAnimation(Anim)
		LastAnim:Play()
	end
end)