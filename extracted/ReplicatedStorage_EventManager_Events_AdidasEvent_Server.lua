game:GetService("Lighting")
local v_u_1 = game:GetService("Players")
game:GetService("PhysicsService")
local v_u_2 = script.Parent:WaitForChild("Events")
return {
	["PlayEffect"] = function(_)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v3 = v_u_1:GetPlayers()
		for _, v4 in pairs(v3) do
			v_u_2.Play:FireClient(v4)
		end
		task.delay(60, function() end)
	end
}