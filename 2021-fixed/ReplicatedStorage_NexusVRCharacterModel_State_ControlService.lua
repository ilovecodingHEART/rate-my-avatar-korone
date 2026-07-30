-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x1, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_BaseController_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Controller"):WaitForChild("BaseController"));
local l_TeleportController_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Controller"):WaitForChild("TeleportController"));
local l_SmoothLocomotionController_0 = require(l_Parent_0:WaitForChild("Character"):WaitForChild("Controller"):WaitForChild("SmoothLocomotionController"));
local v4 = {};
v4.__index = v4;
local v5 = nil;
v4.new = function() --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_BaseController_0 (copy), l_TeleportController_0 (copy), l_SmoothLocomotionController_0 (copy)
    local v6 = setmetatable({
        RegisteredControllers = {}
    }, v4);
    local v7 = l_BaseController_0.new();
    v7.ActionsToLock = {
        Enum.KeyCode.Thumbstick1, 
        Enum.KeyCode.Thumbstick2, 
        Enum.KeyCode.ButtonR3, 
        Enum.KeyCode.ButtonA
    };
    v6:RegisterController("None", v7);
    v6:RegisterController("Teleport", (l_TeleportController_0.new()));
    v6:RegisterController("SmoothLocomotion", (l_SmoothLocomotionController_0.new()));
    return v6;
end;
v4.GetInstance = function() --[[ Line: 50 ]] --[[ Name: GetInstance ]]
    -- upvalues: v5 (ref), v4 (copy)
    if not v5 then
        v5 = v4.new();
    end;
    return v5;
end;
v4.RegisterController = function(v8, v9, v10) --[[ Line: 60 ]] --[[ Name: RegisterController ]]
    v8.RegisteredControllers[v9] = v10;
end;
v4.SetActiveController = function(v11, v12) --[[ Line: 67 ]] --[[ Name: SetActiveController ]]
    if v11.ActiveController == v12 then
        return;
    else
        v11.ActiveController = v12;
        if v11.CurrentController then
            v11.CurrentController:Disable();
        end;
        v11.CurrentController = v11.RegisteredControllers[v12];
        if v11.CurrentController then
            v11.CurrentController:Enable();
            return;
        else
            if v12 ~= nil then
                warn((("Nexus VR Character Model controller \"%s\" is not registered."):format(v12)));
            end;
            return;
        end;
    end;
end;
v4.UpdateCharacter = function(v13) --[[ Line: 89 ]] --[[ Name: UpdateCharacter ]]
    if v13.CurrentController then
        v13.CurrentController:UpdateCharacter();
    end;
end;
return v4;