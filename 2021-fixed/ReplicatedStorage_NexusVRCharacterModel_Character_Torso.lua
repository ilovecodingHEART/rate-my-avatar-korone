-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_NexusAppendage_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusAppendage"));
local v2 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local l_Limb_0 = l_NexusAppendage_0.Limb;
local v4 = {};
v4.__index = v4;
setmetatable(v4, l_Limb_0);
v4.new = function(v5, v6) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: l_Limb_0 (copy), v4 (copy)
    local v7 = setmetatable(l_Limb_0.new(), v4);
    v7.LowerTorso = v5;
    v7.UpperTorso = v6;
    return v7;
end;
v4.GetTorsoCFrames = function(v8, v9) --[[ Line: 35 ]] --[[ Name: GetTorsoCFrames ]]
    -- upvalues: v2 (copy)
    local v10 = v9 * v8:GetAttachmentCFrame(v8.UpperTorso, "NeckRigAttachment"):Inverse();
    local v11 = v2:GetSetting("Appearance.MaxTorsoBend") or 0.17453292519943295;
    local v12 = math.asin(v9.LookVector.Y);
    local v13 = math.sign(v12) * math.min(math.abs(v12), v11);
    return v10 * v8:GetAttachmentCFrame(v8.UpperTorso, "WaistRigAttachment") * CFrame.Angles(-v13, 0, 0) * v8:GetAttachmentCFrame(v8.LowerTorso, "WaistRigAttachment"):Inverse(), v10;
end;
v4.GetAppendageJointCFrames = function(v14, v15, v16) --[[ Line: 53 ]] --[[ Name: GetAppendageJointCFrames ]]
    return {
        RightShoulder = v16 * v14:GetAttachmentCFrame(v14.UpperTorso, "RightShoulderRigAttachment"), 
        LeftShoulder = v16 * v14:GetAttachmentCFrame(v14.UpperTorso, "LeftShoulderRigAttachment"), 
        LeftHip = v15 * v14:GetAttachmentCFrame(v14.LowerTorso, "LeftHipRigAttachment"), 
        RightHip = v15 * v14:GetAttachmentCFrame(v14.LowerTorso, "RightHipRigAttachment")
    };
end;
return v4;