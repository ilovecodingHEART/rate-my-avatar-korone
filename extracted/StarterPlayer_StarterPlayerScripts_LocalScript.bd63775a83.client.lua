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