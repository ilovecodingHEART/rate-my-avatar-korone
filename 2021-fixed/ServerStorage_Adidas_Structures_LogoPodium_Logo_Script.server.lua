-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
assert(l_Parent_0:IsA("Model"), "Script must be inside a Model");
local l_RunService_0 = game:GetService("RunService");
for _, v3 in ipairs(l_Parent_0:GetDescendants()) do
    if v3:IsA("BasePart") then
        v3.Anchored = true;
    end;
end;
local l_l_Parent_0_Pivot_0 = l_Parent_0:GetPivot();
local v5 = 0;
local v6 = 0;
local v7 = 0;
local function _(v8) --[[ Line: 24 ]] --[[ Name: targetOffset ]]
    local v9 = (math.sin(v8 * 3.141592653589793 * 2 * 0.2 - 1.5707963267948966) + 1) * 0.5;
    return v9 * v9 * (3 - v9 * 2) * 3.5;
end;
local v11 = nil;
v11 = l_RunService_0.RenderStepped:Connect(function(v12) --[[ Line: 31 ]]
    -- upvalues: l_Parent_0 (copy), v11 (ref), v5 (ref), v6 (ref), v7 (ref), l_l_Parent_0_Pivot_0 (copy)
    if not l_Parent_0.Parent then
        v11:Disconnect();
        return;
    else
        v12 = math.clamp(v12, 0, 0.05);
        v5 = v5 + v12;
        local v13 = (math.sin(v5 * 3.141592653589793 * 2 * 0.2 - 1.5707963267948966) + 1) * 0.5;
        local v14 = 28 * (v13 * v13 * (3 - v13 * 2) * 3.5 - v6) - v7 * 10;
        v7 = v7 + v14 * v12;
        v6 = v6 + v7 * v12;
        l_Parent_0:PivotTo(l_l_Parent_0_Pivot_0 * CFrame.new(0, v6, 0));
        return;
    end;
end);