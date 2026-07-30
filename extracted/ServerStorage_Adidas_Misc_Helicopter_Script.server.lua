-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_PropellerTop1_0 = l_Parent_0:WaitForChild("PropellerTop1");
local l_PropellerTop2_0 = l_Parent_0:WaitForChild("PropellerTop2");
local l_PropellerBack1_0 = l_Parent_0:WaitForChild("PropellerBack1");
local l_PropellerBack2_0 = l_Parent_0:WaitForChild("PropellerBack2");
local l_SpinCenter_0 = l_PropellerTop1_0:WaitForChild("SpinCenter");
local l_SpinCenter_1 = l_PropellerTop2_0:WaitForChild("SpinCenter");
local l_SpinCenter_2 = l_PropellerBack1_0:WaitForChild("SpinCenter");
local l_SpinCenter_3 = l_PropellerBack2_0:WaitForChild("SpinCenter");
local l_CFrame_0 = l_SpinCenter_0.CFrame;
local l_CFrame_1 = l_SpinCenter_1.CFrame;
local l_CFrame_2 = l_SpinCenter_2.CFrame;
local l_CFrame_3 = l_SpinCenter_3.CFrame;
for _, v15 in ipairs(l_Parent_0:GetDescendants()) do
    if v15:IsA("BasePart") then
        v15.Anchored = true;
    end;
end;
local l_l_Parent_0_Pivot_0 = l_Parent_0:GetPivot();
local function v20() --[[ Line: 52 ]] --[[ Name: randomPointInRegion ]]
    local v17 = (math.random() - 0.5) * Vector3.new(500, 60, 500, 0).X;
    local v18 = (math.random() - 0.5) * Vector3.new(500, 60, 500, 0).Y;
    local v19 = (math.random() - 0.5) * Vector3.new(500, 60, 500, 0).Z;
    return Vector3.new(4428.40283203125, 80.447998046875, -285.947998046875, 0) + Vector3.new(v17, v18, v19);
end;
local function _(v21, v22, v23, v24) --[[ Line: 59 ]] --[[ Name: spinAroundAttachment ]]
    v24 = v24 or 0;
    v21.CFrame = v21.CFrame * v22 * CFrame.Angles(v24, v23, 0) * v22:Inverse();
end;
local l_l_l_Parent_0_Pivot_0_0 = l_l_Parent_0_Pivot_0;
local l_Position_0 = l_l_Parent_0_Pivot_0.Position;
local v28 = Vector3.new(1, 0, 0, 0);
local v29 = v20();
local v30 = 0;
local v31 = 0;
l_RunService_0.RenderStepped:Connect(function(v32) --[[ Line: 74 ]]
    -- upvalues: v29 (ref), l_Position_0 (ref), v20 (copy), v28 (ref), v30 (ref), v31 (ref), l_l_l_Parent_0_Pivot_0_0 (ref), l_Parent_0 (copy), l_PropellerTop1_0 (copy), l_CFrame_0 (copy), l_PropellerTop2_0 (copy), l_CFrame_1 (copy), l_PropellerBack1_0 (copy), l_CFrame_2 (copy), l_PropellerBack2_0 (copy), l_CFrame_3 (copy)
    local v33 = v29 - l_Position_0;
    if v33.Magnitude < 60 then
        v29 = v20();
        v33 = v29 - l_Position_0;
    end;
    local v34 = Vector3.new(v33.X, 0, v33.Z);
    if v34.Magnitude < 0.001 then
        v34 = v28;
    end;
    local l_Unit_0 = v34.Unit;
    v28 = v28:Lerp(l_Unit_0, 1.4 * v32).Unit;
    local v36 = math.clamp(0.8 * v32, 0, 1);
    v30 = v30 + (35 - v30) * v36;
    l_Position_0 = l_Position_0 + v28 * v30 * v32;
    local l_Y_0 = v29.Y;
    l_Position_0 = Vector3.new(l_Position_0.X, l_Position_0.Y + (l_Y_0 - l_Position_0.Y) * 0.3 * v32, l_Position_0.Z);
    v31 = v31 + v32 * 2.4;
    local v38 = math.sin(v31) * 1.5;
    local v39 = l_Position_0 + Vector3.new(0, v38, 0);
    local v40 = -v28 or v28;
    local v41 = CFrame.lookAt(v39, v39 + v40, (Vector3.new(0, 1, 0, 0)));
    local v42 = math.clamp(-v28:Cross(l_Unit_0).Y * 2, -0.3141592653589793, 0.3141592653589793);
    local v43 = v30 / 35 * -0.12217304763960307;
    local v44 = v41 * CFrame.Angles(v43, 0, v42);
    local v45 = math.clamp(2.2 * v32, 0, 1);
    l_l_l_Parent_0_Pivot_0_0 = l_l_l_Parent_0_Pivot_0_0:Lerp(v44, v45);
    l_l_l_Parent_0_Pivot_0_0 = CFrame.new(v39) * l_l_l_Parent_0_Pivot_0_0.Rotation;
    l_Parent_0:PivotTo(l_l_l_Parent_0_Pivot_0_0);
    local v46 = 24.434609527920614 * v32;
    local v47 = 38.39724354387525 * v32;
    local l_l_PropellerTop1_0_0 = l_PropellerTop1_0;
    local l_l_CFrame_0_0 = l_CFrame_0;
    local v50 = nil or 0;
    l_l_PropellerTop1_0_0.CFrame = l_l_PropellerTop1_0_0.CFrame * l_l_CFrame_0_0 * CFrame.Angles(v50, v46, 0) * l_l_CFrame_0_0:Inverse();
    l_l_PropellerTop1_0_0 = l_PropellerTop2_0;
    l_l_CFrame_0_0 = l_CFrame_1;
    v50 = nil or 0;
    l_l_PropellerTop1_0_0.CFrame = l_l_PropellerTop1_0_0.CFrame * l_l_CFrame_0_0 * CFrame.Angles(v50, v46, 0) * l_l_CFrame_0_0:Inverse();
    l_l_PropellerTop1_0_0 = l_PropellerBack1_0;
    l_l_CFrame_0_0 = l_CFrame_2;
    v50 = v47 or 0;
    l_l_PropellerTop1_0_0.CFrame = l_l_PropellerTop1_0_0.CFrame * l_l_CFrame_0_0 * CFrame.Angles(v50, 0, 0) * l_l_CFrame_0_0:Inverse();
    l_l_PropellerTop1_0_0 = l_PropellerBack2_0;
    l_l_CFrame_0_0 = l_CFrame_3;
    v50 = v47 or 0;
    l_l_PropellerTop1_0_0.CFrame = l_l_PropellerTop1_0_0.CFrame * l_l_CFrame_0_0 * CFrame.Angles(v50, 0, 0) * l_l_CFrame_0_0:Inverse();
end);