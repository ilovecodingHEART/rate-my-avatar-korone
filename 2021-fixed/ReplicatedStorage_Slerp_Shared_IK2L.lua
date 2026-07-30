-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_acos_0 = math.acos;
local v4 = {
    solve2d = function(v1, v2, v3) --[[ Line: 5 ]] --[[ Name: solve2d ]]
        if v1 == 0 then
            return 0, 3.141592653589793;
        elseif v2 + v3 < v1 then
            return 0, 3.141592653589793;
        else
            return l_acos_0((v2 * v2 + v1 * v1 - v3 * v3) / (2 * v2 * v1)), (l_acos_0((v3 * v3 + v2 * v2 - v1 * v1) / (2 * v3 * v2)));
        end;
    end
};
local _ = CFrame.lookAt(Vector3.zero, -Vector3.yAxis);
v4.getCFrames = function(v6, v7, v8, v9, v10) --[[ Line: 21 ]] --[[ Name: getCFrames ]]
    local v11 = v7 - v6;
    local v12, v13 = v4.solve2d(v11.Magnitude, v8, v9);
    local l_Unit_0 = v11.Unit;
    local v15 = CFrame.identity * CFrame.Angles(0, v10, 0) + v6;
    local v16 = v15:PointToObjectSpace(v7);
    v16 = v16 - Vector3.zAxis * v16.Z;
    local v17 = (-Vector3.yAxis):Angle(v16.Unit, Vector3.zAxis);
    v15 = v15 * CFrame.Angles(0, 0, v17) * CFrame.Angles(v15.LookVector:Angle(l_Unit_0, -v15.LookVector:Cross(l_Unit_0).Unit), 0, 0) * CFrame.Angles(v12, 0, 0);
    v15 = v15 + v15.LookVector * 0.5 * v8;
    local v18 = (v15 + v15.LookVector * 0.5 * v8) * CFrame.Angles(3.141592653589793 + v13, 0, 0);
    return v15, v18 + v18.LookVector * 0.5 * v9;
end;
__2021_freeze(v4);
return v4;