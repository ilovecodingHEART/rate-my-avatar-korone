-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
while true do

	local changePerSpin = 10/0.03

	script.Parent.CFrame = script.Parent.CFrame * CFrame.Angles(math.rad(360/changePerSpin),0,0)
	wait()

end