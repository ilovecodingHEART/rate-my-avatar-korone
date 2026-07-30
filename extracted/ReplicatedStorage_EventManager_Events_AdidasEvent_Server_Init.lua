local v_u_1 = game:GetService("PhysicsService")
return {
	["Init"] = function()
		-- upvalues: (copy) v_u_1
		v_u_1:RegisterCollisionGroup("BlackholeNoClip")
		for _, v2 in ipairs(v_u_1:GetRegisteredCollisionGroups()) do
			v_u_1:CollisionGroupSetCollidable("BlackholeNoClip", v2.name, false)
		end
	end
}