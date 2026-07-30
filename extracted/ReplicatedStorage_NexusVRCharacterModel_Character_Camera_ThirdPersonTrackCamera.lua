-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_CommonCamera_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Camera"):WaitForChild("CommonCamera"));
local v3 = {};
v3.__index = v3;
setmetatable(v3, l_CommonCamera_0);
v3.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: l_CommonCamera_0 (copy), v3 (copy)
    return (setmetatable(l_CommonCamera_0.new(), v3));
end;
v3.Enable = function(v4) --[[ Line: 32 ]] --[[ Name: Enable ]]
    v4.FetchInitialCFrame = true;
end;
v3.Disable = function(v5) --[[ Line: 39 ]] --[[ Name: Disable ]]
    v5.FetchInitialCFrame = nil;
end;
v3.UpdateCamera = function(v6, v7) --[[ Line: 46 ]] --[[ Name: UpdateCamera ]]
    -- upvalues: l_Players_0 (copy)
    if v6.FetchInitialCFrame then
        local v8 = math.atan2(-v7.LookVector.X, -v7.LookVector.Z);
        v6.BaseFaceAngleY = v8;
        v6.BaseCFrame = CFrame.new(v7.Position) * CFrame.Angles(0, v8, 0);
        v6.FetchInitialCFrame = nil;
    end;
    local v9 = 1;
    local l_Character_0 = l_Players_0.LocalPlayer.Character;
    if l_Character_0 then
        local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            local l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("BodyHeightScale");
            if l_BodyHeightScale_0 then
                v9 = l_BodyHeightScale_0.Value;
            end;
        end;
    end;
    local l_BaseCFrame_0 = v6.BaseCFrame;
    local v14 = l_BaseCFrame_0:Inverse() * v7;
    v6:SetCFrame(l_BaseCFrame_0 * CFrame.new(0, 0, v9 * -10) * CFrame.Angles(0, 3.141592653589793, 0) * v14);
end;
return v3;