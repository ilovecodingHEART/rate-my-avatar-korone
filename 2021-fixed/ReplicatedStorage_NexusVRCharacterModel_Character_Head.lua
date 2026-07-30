-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x4, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_NexusAppendage_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusAppendage"));
local v2 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local l_Limb_0 = l_NexusAppendage_0.Limb;
local v4 = {};
v4.__index = v4;
setmetatable(v4, l_Limb_0);
v4.new = function(v5) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: l_Limb_0 (copy), v4 (copy)
    local v6 = setmetatable(l_Limb_0.new(), v4);
    v6.Head = v5;
    return v6;
end;
v4.GetEyesOffset = function(v7) --[[ Line: 34 ]] --[[ Name: GetEyesOffset ]]
    return v7:GetAttachmentCFrame(v7.Head, "FaceFrontAttachment") * CFrame.new(0, v7.Head.Size.Y / 4, 0);
end;
v4.GetHeadCFrame = function(v8, v9) --[[ Line: 42 ]] --[[ Name: GetHeadCFrame ]]
    return v9 * v8:GetEyesOffset():Inverse();
end;
v4.GetNeckCFrame = function(v10, v11, v12) --[[ Line: 50 ]] --[[ Name: GetNeckCFrame ]]
    -- upvalues: v2 (copy)
    local v13 = v10:GetHeadCFrame(v11) * v10:GetAttachmentCFrame(v10.Head, "NeckRigAttachment");
    local l_LookVector_0 = v13.LookVector;
    local v15 = math.atan2(l_LookVector_0.X, l_LookVector_0.Z) + 3.141592653589793;
    local v16 = math.asin(l_LookVector_0.Y);
    local v17 = 0;
    local v18 = v2:GetSetting("Appearance.MaxNeckTilt") or 1.0471975511965976;
    if v18 < v16 then
        v17 = v16 - v18;
    elseif v16 < -v18 then
        v17 = v16 + v18;
    end;
    if v12 then
        local v19 = v15 - v12;
        while v19 > 3.141592653589793 do
            v19 = v19 - 6.283185307179586;
        end;
        while v19 < -3.141592653589793 do
            v19 = v19 + 6.283185307179586;
        end;
        local v20 = v2:GetSetting("Appearance.MaxNeckSeatedRotation") or 1.0471975511965976;
        v15 = __2021_if(function() return v20 < v19 end, function() return v19 - v20 end, function() return __2021_if(function() return v19 < -v20 end, function() return v19 + v20 end, function() return 0 end) end);
    else
        local v21 = v2:GetSetting("Appearance.MaxNeckRotation") or 0.6108652381980153;
        local l_LastNeckRotationGlobal_0 = v10.LastNeckRotationGlobal;
        if l_LastNeckRotationGlobal_0 then
            local v23 = v15 - l_LastNeckRotationGlobal_0;
            while v23 > 3.141592653589793 do
                v23 = v23 - 6.283185307179586;
            end;
            while v23 < -3.141592653589793 do
                v23 = v23 + 6.283185307179586;
            end;
            if math.abs(v23) < 1.5 * v21 then
                v15 = __2021_if(function() return v21 < v23 end, function() return v15 - v21 end, function() return __2021_if(function() return v23 < -v21 end, function() return v15 + v21 end, function() return l_LastNeckRotationGlobal_0 end) end);
            end;
        end;
    end;
    v10.LastNeckRotationGlobal = v15;
    return CFrame.new(v13.Position) * CFrame.Angles(0, v15, 0) * CFrame.Angles(v17, 0, 0);
end;
return v4;