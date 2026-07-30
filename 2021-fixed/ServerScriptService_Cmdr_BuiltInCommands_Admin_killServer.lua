-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return function (_, players)
	for _, player in pairs(players) do
		if player.Character then
			player.Character:BreakJoints()
		end
	end

	return ("Killed %d players."):format(#players)
end