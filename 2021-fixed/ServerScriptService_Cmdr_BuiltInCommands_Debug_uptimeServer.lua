-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local startTime = os.time()

return function ()
	local uptime = os.time() - startTime
	return ("%dd %dh %dm %ds"):format(
		math.floor(uptime / (60 * 60 * 24)),
		math.floor(uptime / (60 * 60)) % 24,
		math.floor(uptime / 60) % 60,
		math.floor(uptime) % 60
	)
end