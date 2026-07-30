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
