-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_FindCollidablePartOnRay_0 = require(l_Parent_0:WaitForChild("Util"):WaitForChild("FindCollidablePartOnRay"));
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v5 = setmetatable({
        BeamParts = {}
    }, v4);
    v5:Hide();
    return v5;
end;
v4.Update = function(v6, v7) --[[ Line: 39 ]] --[[ Name: Update ]]
    -- upvalues: l_Workspace_0 (copy), l_FindCollidablePartOnRay_0 (copy), l_Players_0 (copy)
    local l_Position_0 = v7.Position;
    local v9 = math.atan2(-v7.LookVector.X, -v7.LookVector.Z);
    local v10 = math.asin(v7.LookVector.Y);
    v10 = v10 + 1.0471975511965976 * (1.5707963267948966 - math.abs(v10)) / 1.5707963267948966;
    local v11 = CFrame.new(l_Position_0) * CFrame.Angles(0, v9, 0);
    local v12 = math.tan(v10) / -0.4;
    local v13 = v12 ^ 2 * -0.2;
    for v14 = 0, 99 do
        local l_Position_1 = (v11 * CFrame.new(0, -0.2 * (v14 + v12) ^ 2 - v13, -2 * v14)).Position;
        local l_Position_2 = (v11 * CFrame.new(0, -0.2 * (v14 + 1 + v12) ^ 2 - v13, -2 * (v14 + 1))).Position;
        if not v6.BeamParts[v14] then
            v6.BeamParts[v14] = Instance.new("Part");
            v6.BeamParts[v14].Transparency = 1;
            v6.BeamParts[v14].Size = Vector3.new(0, 0, 0, 0);
            v6.BeamParts[v14].Anchored = true;
            v6.BeamParts[v14].CanCollide = false;
            v6.BeamParts[v14].CanQuery = false;
            v6.BeamParts[v14].Parent = l_Workspace_0.CurrentCamera;
            local l_Attachment_0 = Instance.new("Attachment");
            l_Attachment_0.Name = "BeamAttachment";
            l_Attachment_0.CFrame = CFrame.Angles(0, 0, 1.5707963267948966);
            l_Attachment_0.Parent = v6.BeamParts[v14];
        end;
        if not v6.BeamParts[v14 + 1] then
            v6.BeamParts[v14 + 1] = Instance.new("Part");
            v6.BeamParts[v14 + 1].Transparency = 1;
            v6.BeamParts[v14 + 1].Size = Vector3.new(0, 0, 0, 0);
            v6.BeamParts[v14 + 1].Anchored = true;
            v6.BeamParts[v14 + 1].CanCollide = false;
            v6.BeamParts[v14 + 1].CanQuery = false;
            v6.BeamParts[v14 + 1].Parent = l_Workspace_0.CurrentCamera;
            local l_Attachment_1 = Instance.new("Attachment");
            l_Attachment_1.Name = "BeamAttachment";
            l_Attachment_1.CFrame = CFrame.Angles(0, 0, 1.5707963267948966);
            l_Attachment_1.Parent = v6.BeamParts[v14 + 1];
            local l_Beam_0 = Instance.new("Beam");
            l_Beam_0.Name = "Beam";
            l_Beam_0.Attachment0 = v6.BeamParts[v14].BeamAttachment;
            l_Beam_0.Attachment1 = l_Attachment_1;
            l_Beam_0.Segments = 1;
            l_Beam_0.Width0 = 0.1;
            l_Beam_0.Width1 = 0.1;
            l_Beam_0.Parent = v6.BeamParts[v14 + 1];
        end;
        local v20, v21 = l_FindCollidablePartOnRay_0(l_Position_1, l_Position_2 - l_Position_1, l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character and l_Players_0.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"));
        v6.BeamParts[v14].CFrame = CFrame.new(l_Position_1) * CFrame.Angles(0, v9, 0);
        v6.BeamParts[v14 + 1].Beam.Enabled = true;
        if v20 then
            v6.BeamParts[v14 + 1].CFrame = CFrame.new(v21);
            for v22 = 0, v14 do
                v6.BeamParts[v22 + 1].Beam.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255));
            end;
            for v23 = v14 + 1, #v6.BeamParts - 1 do
                v6.BeamParts[v23 + 1].Beam.Enabled = false;
            end;
            return v20, v21;
        else
            v6.BeamParts[v14 + 1].CFrame = CFrame.new(l_Position_2);
        end;
    end;
    for v24 = 0, #v6.BeamParts - 1 do
        v6.BeamParts[v24 + 1].Beam.Color = ColorSequence.new(Color3.fromRGB(200, 0, 0));
    end;
    return nil, nil;
end;
v4.Hide = function(v25) --[[ Line: 128 ]] --[[ Name: Hide ]]
    for v26 = 0, #v25.BeamParts - 1 do
        v25.BeamParts[v26 + 1].Beam.Enabled = false;
    end;
end;
v4.Destroy = function(v27) --[[ Line: 137 ]] --[[ Name: Destroy ]]
    for _, v29 in pairs(v27.BeamParts) --[[ 2021 ]] do
        v29:Destroy();
    end;
    v27.BeamParts = {};
end;
return v4;