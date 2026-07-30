-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    [Enum.AccessoryType.Hat] = true, 
    [Enum.AccessoryType.Hair] = true, 
    [Enum.AccessoryType.Face] = true, 
    [Enum.AccessoryType.Eyebrow] = true, 
    [Enum.AccessoryType.Eyelash] = true
};
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_CommonCamera_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Camera"):WaitForChild("CommonCamera"));
local v5 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local v6 = {};
v6.__index = v6;
setmetatable(v6, l_CommonCamera_0);
v6.ShouldHidePart = function(v7) --[[ Line: 33 ]] --[[ Name: ShouldHidePart ]]
    -- upvalues: v0 (copy)
    local l_Parent_1 = v7.Parent;
    if l_Parent_1 then
        if l_Parent_1:IsA("Accessory") then
            return v0[l_Parent_1.AccessoryType] or false;
        elseif l_Parent_1:IsA("Model") then
            return false;
        else
            return not l_Parent_1:IsA("Tool");
        end;
    elseif v7:FindFirstChildWhichIsA("WrapLayer") then
        return false;
    else
        return true;
    end;
end;
v6.new = function() --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: l_CommonCamera_0 (copy), v6 (copy)
    return (setmetatable(l_CommonCamera_0.new(), v6));
end;
v6.Enable = function(v9) --[[ Line: 63 ]] --[[ Name: Enable ]]
    -- upvalues: l_Players_0 (copy), v5 (copy), v6 (copy), l_VRService_0 (copy)
    local v10 = {};
    v9.TransparencyEvents = v10;
    if l_Players_0.LocalPlayer.Character then
        local l_v5_Setting_0 = v5:GetSetting("Appearance.LocalCharacterTransparency");
        if l_v5_Setting_0 == 0.5 then
            l_v5_Setting_0 = 0.501;
        elseif l_v5_Setting_0 < 0.5 then
            warn("Values of <0.5 with Appearance.LocalCharacterTransparency are currently known to cause black screen issues. This will hopefully be resolved by Roblox in a future update: https://devforum.roblox.com/t/vr-screen-becomes-black-due-to-non-transparent-character/2215099");
        end;
        do
            local l_l_v5_Setting_0_0 = l_v5_Setting_0;
            table.insert(v10, l_Players_0.LocalPlayer.Character.DescendantAdded:Connect(function(v13) --[[ Line: 77 ]]
                -- upvalues: l_l_v5_Setting_0_0 (ref), v6 (ref), v10 (copy)
                if v13:IsA("BasePart") then
                    local l_l_l_v5_Setting_0_0_0 = l_l_v5_Setting_0_0;
                    if v13:FindFirstAncestorOfClass("Tool") then
                        l_l_l_v5_Setting_0_0_0 = 0;
                    elseif v6.ShouldHidePart(v13) then
                        l_l_l_v5_Setting_0_0_0 = 1;
                    end;
                    v13.LocalTransparencyModifier = l_l_l_v5_Setting_0_0_0;
                    do
                        local l_l_l_l_v5_Setting_0_0_0_0 = l_l_l_v5_Setting_0_0_0;
                        table.insert(v10, v13:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() --[[ Line: 87 ]]
                            -- upvalues: v13 (copy), l_l_l_l_v5_Setting_0_0_0_0 (ref)
                            v13.LocalTransparencyModifier = l_l_l_l_v5_Setting_0_0_0_0;
                        end));
                    end;
                end;
            end));
            for _, v17 in l_Players_0.LocalPlayer.Character:GetDescendants() do
                if v17:IsA("BasePart") then
                    local l_l_l_v5_Setting_0_0_1 = l_l_v5_Setting_0_0;
                    if v17:FindFirstAncestorOfClass("Tool") then
                        l_l_l_v5_Setting_0_0_1 = 0;
                    elseif v6.ShouldHidePart(v17) then
                        l_l_l_v5_Setting_0_0_1 = 1;
                    end;
                    v17.LocalTransparencyModifier = l_l_l_v5_Setting_0_0_1;
                    do
                        local l_l_l_l_v5_Setting_0_0_1_0 = l_l_l_v5_Setting_0_0_1;
                        table.insert(v10, v17:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() --[[ Line: 102 ]]
                            -- upvalues: v17 (copy), l_l_l_l_v5_Setting_0_0_1_0 (ref)
                            v17.LocalTransparencyModifier = l_l_l_l_v5_Setting_0_0_1_0;
                        end));
                    end;
                end;
            end;
        end;
    end;
    table.insert(v10, l_Players_0.LocalPlayer:GetPropertyChangedSignal("Character"):Connect(function() --[[ Line: 110 ]]
        -- upvalues: v9 (copy)
        v9:Disable();
        v9:Enable();
    end));
    table.insert(v10, (v5:GetSettingsChangedSignal("Appearance.LocalCharacterTransparency"):Connect(function() --[[ Line: 114 ]]
        -- upvalues: v9 (copy)
        v9:Disable();
        v9:Enable();
    end)));
    if l_VRService_0.AvatarGestures then
        l_Players_0.LocalPlayer.CameraMaxZoomDistance = l_Players_0.LocalPlayer.CameraMinZoomDistance;
    end;
end;
v6.Disable = function(v20) --[[ Line: 128 ]] --[[ Name: Disable ]]
    -- upvalues: l_Players_0 (copy)
    if v20.TransparencyEvents then
        for _, v22 in pairs(v20.TransparencyEvents) --[[ 2021 ]] do
            v22:Disconnect();
        end;
        v20.TransparencyEvents = {};
    end;
    if l_Players_0.LocalPlayer.Character then
        for _, v24 in l_Players_0.LocalPlayer.Character:GetDescendants() do
            if v24:IsA("BasePart") then
                v24.LocalTransparencyModifier = 0;
            end;
        end;
    end;
end;
v6.UpdateCamera = function(v25, v26) --[[ Line: 150 ]] --[[ Name: UpdateCamera ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.AvatarGestures then
        return;
    else
        v25:SetCFrame(v26);
        return;
    end;
end;
return v6;