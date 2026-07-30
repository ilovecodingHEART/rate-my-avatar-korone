-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Module = require(game.ReplicatedStorage.DiscoEvent.Play);
local popup = require(game.ReplicatedStorage.popup);

function loadEvent()
	Module:PlayEffect(script:GetAttribute("type"));
	popup("success", "Finished The Event.");
end;

game.ReplicatedStorage.EepDoop:Fire(function()
	loadEvent();
	script:Destroy();
end);