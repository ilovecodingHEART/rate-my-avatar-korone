-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = CFrame.new;
local l_identity_0 = CFrame.identity;
local l_ToObjectSpace_0 = l_identity_0.ToObjectSpace;
local v3 = {};
local function _(v4, v5, v6, v7, v8, v9) --[[ Line: 8 ]] --[[ Name: createJoint ]]
    local v10 = Instance.new(v4);
    v10.Part0 = v5;
    v10.Part1 = v6;
    v10.C0 = v7;
    v10.C1 = v8;
    if v9 then
        v10.Parent = v9;
    end;
    return v10;
end;
local function v17(v12, v13) --[[ Line: 20 ]] --[[ Name: weld ]]
    local v14 = l_ToObjectSpace_0(v12.CFrame, v13.CFrame);
    local l_l_identity_0_0 = l_identity_0;
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v12;
    l_Weld_0.Part1 = v13;
    l_Weld_0.C0 = v14;
    l_Weld_0.C1 = l_l_identity_0_0;
    return l_Weld_0;
end;
local function v24(v18, v19) --[[ Line: 24 ]] --[[ Name: weldC1 ]]
    local l_l_identity_0_1 = l_identity_0;
    local v21, v22 = l_ToObjectSpace_0(v18.CFrame, v19.CFrame):Inverse();
    local l_Weld_1 = Instance.new("Weld");
    l_Weld_1.Part0 = v18;
    l_Weld_1.Part1 = v19;
    l_Weld_1.C0 = l_l_identity_0_1;
    l_Weld_1.C1 = v21;
    if v22 then
        l_Weld_1.Parent = v22;
    end;
    return l_Weld_1;
end;
local function v30(v25, v26) --[[ Line: 27 ]] --[[ Name: blankWeld ]]
    local l_l_identity_0_2 = l_identity_0;
    local l_l_identity_0_3 = l_identity_0;
    local l_Weld_2 = Instance.new("Weld");
    l_Weld_2.Part0 = v25;
    l_Weld_2.Part1 = v26;
    l_Weld_2.C0 = l_l_identity_0_2;
    l_Weld_2.C1 = l_l_identity_0_3;
    return l_Weld_2;
end;
local function v36(v31, v32) --[[ Line: 31 ]] --[[ Name: motor ]]
    local v33 = l_ToObjectSpace_0(v31.CFrame, v32.CFrame);
    local l_l_identity_0_4 = l_identity_0;
    local l_Motor_0 = Instance.new("Motor");
    l_Motor_0.Part0 = v31;
    l_Motor_0.Part1 = v32;
    l_Motor_0.C0 = v33;
    l_Motor_0.C1 = l_l_identity_0_4;
    return l_Motor_0;
end;
local function v42(v37, v38) --[[ Line: 34 ]] --[[ Name: blankMotor ]]
    local l_l_identity_0_5 = l_identity_0;
    local l_l_identity_0_6 = l_identity_0;
    local l_Motor_1 = Instance.new("Motor");
    l_Motor_1.Part0 = v37;
    l_Motor_1.Part1 = v38;
    l_Motor_1.C0 = l_l_identity_0_5;
    l_Motor_1.C1 = l_l_identity_0_6;
    return l_Motor_1;
end;
local function v51(v43, v44) --[[ Line: 38 ]] --[[ Name: weldBasePartsTo ]]
    local v45 = table.create(#v43);
    for v46, v47 in pairs(v43) --[[ 2021 ]] do
        local v48 = l_ToObjectSpace_0(v47.CFrame, v44.CFrame);
        local l_l_identity_0_7 = l_identity_0;
        local l_Weld_3 = Instance.new("Weld");
        l_Weld_3.Part0 = v47;
        l_Weld_3.Part1 = v44;
        l_Weld_3.C0 = v48;
        l_Weld_3.C1 = l_l_identity_0_7;
        v45[v46] = l_Weld_3;
    end;
    return v45;
end;
local function v60(v52, v53) --[[ Line: 46 ]] --[[ Name: weldValidInstancesTo ]]
    local v54 = {};
    for _, v56 in pairs(v52) --[[ 2021 ]] do
        if v56:IsA("BasePart") then
            local v57 = l_ToObjectSpace_0(v56.CFrame, v53.CFrame);
            local l_l_identity_0_8 = l_identity_0;
            local l_Weld_4 = Instance.new("Weld");
            l_Weld_4.Part0 = v56;
            l_Weld_4.Part1 = v53;
            l_Weld_4.C0 = v57;
            l_Weld_4.C1 = l_l_identity_0_8;
            table.insert(v54, l_Weld_4);
        end;
    end;
    return v54;
end;
local function v63(v61, v62) --[[ Line: 56 ]] --[[ Name: weldValidChildrenTo ]]
    return (v60(v61:GetChildren(), v62));
end;
local function v66(v64, v65) --[[ Line: 60 ]] --[[ Name: weldValidDescendantsTo ]]
    return (v60(v64:GetDescendants(), v65));
end;
v3.weld = v17;
v3.weldC1 = v24;
v3.blankWeld = v30;
v3.motor = v36;
v3.blankMotor = v42;
v3.weldBasePartsTo = v51;
v3.weldValidInstancesTo = v60;
v3.weldValidChildrenTo = v63;
v3.weldValidDescendantsTo = v66;
__2021_freeze(v3);
return v3;