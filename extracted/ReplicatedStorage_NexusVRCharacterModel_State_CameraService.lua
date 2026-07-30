-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_CommonCamera_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Camera"):WaitForChild("CommonCamera"));
local l_DefaultCamera_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Camera"):WaitForChild("DefaultCamera"));
local l_ThirdPersonTrackCamera_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Camera"):WaitForChild("ThirdPersonTrackCamera"));
local v4 = {};
v4.__index = v4;
local v5 = nil;
v4.new = function() --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_DefaultCamera_0 (copy), l_ThirdPersonTrackCamera_0 (copy), l_CommonCamera_0 (copy)
    local v6 = setmetatable({
        RegisteredCameras = {}
    }, v4);
    v6:RegisterCamera("Default", (l_DefaultCamera_0.new()));
    v6:RegisterCamera("ThirdPersonTrack", (l_ThirdPersonTrackCamera_0.new()));
    v6:RegisterCamera("Disabled", (l_CommonCamera_0.new()));
    return v6;
end;
v4.GetInstance = function() --[[ Line: 48 ]] --[[ Name: GetInstance ]]
    -- upvalues: v5 (ref), v4 (copy)
    if not v5 then
        v5 = v4.new();
    end;
    return v5;
end;
v4.RegisterCamera = function(v7, v8, v9) --[[ Line: 58 ]] --[[ Name: RegisterCamera ]]
    v7.RegisteredCameras[v8] = v9;
end;
v4.SetActiveCamera = function(v10, v11) --[[ Line: 65 ]] --[[ Name: SetActiveCamera ]]
    if v10.ActiveCamera == v11 then
        return;
    else
        v10.ActiveCamera = v11;
        if v10.CurrentCamera then
            v10.CurrentCamera:Disable();
        end;
        v10.CurrentCamera = v10.RegisteredCameras[v11];
        if v10.CurrentCamera then
            v10.CurrentCamera:Enable();
            return;
        else
            if v11 ~= nil then
                warn((("Nexus VR Character Model camera \"%*\" is not registered."):format(v11)));
            end;
            return;
        end;
    end;
end;
v4.UpdateCamera = function(v12, v13) --[[ Line: 87 ]] --[[ Name: UpdateCamera ]]
    if v12.CurrentCamera then
        v12.CurrentCamera:UpdateCamera(v13);
    end;
end;
return v4;