-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
while true do
	for _,v in pairs(script.Parent.Main:GetChildren()) do
		if v.Transparency ~= 1 then
			v.Light.Enabled = true
			v.Light2.Enabled = true
		elseif v.Transparency == 1 then
			v.Light.Enabled = false
			v.Light2.Enabled = false
		end
	end
	wait()
end