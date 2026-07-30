-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Gradually regenerates the Humanoid's Health over time.

local REGEN_RATE = 1 / 100 -- Regenerate this fraction of MaxHealth per second.
local REGEN_STEP = 1 -- Wait this long between each regeneration step.

--------------------------------------------------------------------------------

local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")

--------------------------------------------------------------------------------

while true do
	while Humanoid.Health < Humanoid.MaxHealth and Humanoid.Health > 0 and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead do
		local dt = wait(REGEN_STEP)
		local dh = dt * REGEN_RATE * Humanoid.MaxHealth
		Humanoid.Health = math.min(Humanoid.Health + dh, Humanoid.MaxHealth)
	end
	Humanoid.HealthChanged:Wait()
end
