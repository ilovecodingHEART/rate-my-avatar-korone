-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = Vector3.yAxis;
local v1 = {};
local function v4(v2, v3) --[[ Line: 6 ]] --[[ Name: getDragForce ]]
    return -v3 * v2 * v2.Magnitude;
end;
local function v7(v5, v6) --[[ Line: 10 ]] --[[ Name: getRollingResistanceForce ]]
    return v6 * -v5.Unit;
end;
local function v10(v8, v9) --[[ Line: 15 ]] --[[ Name: getSuspensionForceFactor ]]
    return v9 / (v8 * v8);
end;
local function v13(v11, v12) --[[ Line: 19 ]] --[[ Name: getSuspensionDampingSubtrahend ]]
    return v12 * v11;
end;
local function v17(v14, v15, v16) --[[ Line: 23 ]] --[[ Name: getSuspensionForce ]]
    return v14 * v14 * v15 - v16;
end;
local function _(v18, v19, v20, v21) --[[ Line: 27 ]] --[[ Name: getSuspensionForce2 ]]
    local v22 = v18 - v19;
    return v22 * v22 * v20 - v21;
end;
v1.getDragForce = v4;
v1.getRollingResistanceForce = v7;
v1.getSuspensionForceFactor = v10;
v1.getSuspensionDampingSubtrahend = v13;
v1.getSuspensionForce = v17;
return v1;