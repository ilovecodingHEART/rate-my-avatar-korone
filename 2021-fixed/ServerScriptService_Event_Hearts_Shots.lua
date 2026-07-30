-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local api = {};
local Shots = {};
function api.SetShots(id, shot)
	Shots[id] = (Shots[id] or 0) + shot;
end;
function api.GetShots(id)
	return Shots[id] or 0;
end;
function api.LoadShots(id)
	Shots[id] = 0;
end;
return api;
