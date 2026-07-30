local v0 = require(game.ReplicatedStorage.Remotes);
task.wait(2)
local v1 = v0.Function("GetSettings"):InvokeServer();
local v2 = require(game.ReplicatedStorage.npcall);
local v3 = nil;
return (setmetatable({}, {
	__index = function(_, v5)
		return v1[v5];
	end, 
	__newindex = function(_, v7, v8)
		v1[v7] = v8;
		if v3 then
			task.cancel(v3);
			v3 = nil;
		end;
		v3 = task.defer(function()
			local v9, v10 = v2(function()
				return game:GetService("HttpService"):JSONEncode(v1);
			end);
			if v9 then
				error((("Failed to serialize settings (please only use strings, numbers and booleans): %*"):format(v9)));
			end;
			v0.Function("SetSettings"):InvokeServer(v10);
		end);
	end
}));