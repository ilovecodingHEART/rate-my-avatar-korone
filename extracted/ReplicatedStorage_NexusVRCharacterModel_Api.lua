-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
return function() --[[ Line: 9 ]]
    -- upvalues: l_RunService_0 (copy), l_UserInputService_0 (copy)
    local l_Parent_0 = script.Parent;
    local v12 = {
        Registered = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusInstance")).TypedEvent.new(), 
        Register = function(v3, v4, v5) --[[ Line: 19 ]] --[[ Name: Register ]]
            if v3[v4] ~= nil then
                error((("API already registered: %*"):format(v4)));
            end;
            v3[v4] = v5;
            v3.Registered:Fire(v4);
        end, 
        WaitFor = function(v6, v7) --[[ Line: 35 ]] --[[ Name: WaitFor ]]
            while not v6[v7] do
                v6.Registered:Wait();
            end;
            return v6[v7];
        end, 
        OnRegistered = function(v8, v9, v10) --[[ Line: 48 ]] --[[ Name: OnRegistered ]]
            if v8[v9] then
                task.spawn(function() --[[ Line: 51 ]]
                    -- upvalues: v10 (copy), v8 (copy), v9 (copy)
                    v10(v8[v9]);
                end);
                return;
            else
                v8.Registered:Connect(function(v11) --[[ Line: 58 ]]
                    -- upvalues: v9 (copy), v10 (copy), v8 (copy)
                    if v9 ~= v11 then
                        return;
                    else
                        v10(v8[v9]);
                        return;
                    end;
                end);
                return;
            end;
        end
    };
    if l_RunService_0:IsClient() then
        task.defer(function() --[[ Line: 67 ]]
            -- upvalues: l_Parent_0 (copy), v12 (copy), l_UserInputService_0 (ref)
            local v13 = require(l_Parent_0:WaitForChild("State"):WaitForChild("CameraService")).GetInstance();
            local v17 = {
                SetActiveCamera = function(_, v15) --[[ Line: 71 ]] --[[ Name: SetActiveCamera ]]
                    -- upvalues: v13 (copy)
                    v13:SetActiveCamera(v15);
                end, 
                GetActiveCamera = function(_) --[[ Line: 74 ]] --[[ Name: GetActiveCamera ]]
                    -- upvalues: v13 (copy)
                    return v13.ActiveCamera;
                end
            };
            v12:Register("Camera", v17);
            local v18 = {};
            local v19 = require(l_Parent_0:WaitForChild("State"):WaitForChild("ControlService")).GetInstance();
            local v32 = {
                SetActiveController = function(_, v21) --[[ Line: 83 ]] --[[ Name: SetActiveController ]]
                    -- upvalues: v19 (copy)
                    v19:SetActiveController(v21);
                end, 
                GetActiveController = function(_) --[[ Line: 86 ]] --[[ Name: GetActiveController ]]
                    -- upvalues: v19 (copy)
                    return v19.ActiveController;
                end, 
                SetControllerInputEnabled = function(_, v24, v25) --[[ Line: 89 ]] --[[ Name: SetControllerInputEnabled ]]
                    -- upvalues: v18 (copy)
                    if v24 ~= Enum.UserCFrame.LeftHand and v24 ~= Enum.UserCFrame.RightHand then
                        error((("The following UserCFrame is invalid and can't be disabled: %*"):format(v24)));
                    end;
                    v18[v24] = v25 ~= false;
                end, 
                EnableControllerInput = function(v26, v27) --[[ Line: 95 ]] --[[ Name: EnableControllerInput ]]
                    v26:SetControllerInputEnabled(v27, true);
                end, 
                DisableControllerInput = function(v28, v29) --[[ Line: 98 ]] --[[ Name: DisableControllerInput ]]
                    v28:SetControllerInputEnabled(v29, false);
                end, 
                IsControllerInputEnabled = function(_, v31) --[[ Line: 101 ]] --[[ Name: IsControllerInputEnabled ]]
                    -- upvalues: v18 (copy)
                    if v31 ~= Enum.UserCFrame.LeftHand and v31 ~= Enum.UserCFrame.RightHand then
                        error((("The following UserCFrame is invalid and can't be disabled: %*"):format(v31)));
                    end;
                    return v18[v31] ~= false;
                end
            };
            v12:Register("Controller", v32);
            local v33 = require(l_Parent_0:WaitForChild("State"):WaitForChild("VRInputService")).GetInstance();
            local v36 = {
                Recentered = v33.Recentered, 
                EyeLevelSet = v33.EyeLevelSet, 
                Recenter = function(_) --[[ Line: 114 ]] --[[ Name: Recenter ]]
                    -- upvalues: v33 (copy)
                    v33:Recenter();
                end, 
                SetEyeLevel = function(_) --[[ Line: 117 ]] --[[ Name: SetEyeLevel ]]
                    -- upvalues: v33 (copy)
                    v33:SetEyeLevel();
                end
            };
            v12:Register("Input", v36);
            local v37 = {};
            local function _() --[[ Line: 126 ]] --[[ Name: GetMainMenu ]]
                -- upvalues: v37 (copy), l_Parent_0 (ref)
                if not v37.Enabled then
                    error("Menu API is not enabled for non-VR players. Check Api.Menu.Enabled before calling.");
                end;
                return require(l_Parent_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance();
            end;
            if l_UserInputService_0.VREnabled then
                v37.Enabled = true;
            else
                v37.Enabled = false;
                l_UserInputService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 136 ]]
                    -- upvalues: v37 (copy), l_UserInputService_0 (ref)
                    v37.Enabled = l_UserInputService_0.VREnabled;
                end);
            end;
            v37.CreateView = function(_, ...) --[[ Line: 141 ]]
                -- upvalues: v37 (copy), l_Parent_0 (ref)
                if not v37.Enabled then
                    error("Menu API is not enabled for non-VR players. Check Api.Menu.Enabled before calling.");
                end;
                return require(l_Parent_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance():CreateView(...);
            end;
            v37.IsOpen = function() --[[ Line: 144 ]]
                -- upvalues: v37 (copy), l_Parent_0 (ref)
                if not v37.Enabled then
                    error("Menu API is not enabled for non-VR players. Check Api.Menu.Enabled before calling.");
                end;
                return require(l_Parent_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance().ScreenGui.Enabled;
            end;
            v37.Open = function(v40) --[[ Line: 147 ]]
                -- upvalues: v37 (copy), l_Parent_0 (ref)
                if v40:IsOpen() then
                    return;
                else
                    if not v37.Enabled then
                        error("Menu API is not enabled for non-VR players. Check Api.Menu.Enabled before calling.");
                    end;
                    require(l_Parent_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance():Toggle();
                    return;
                end;
            end;
            v37.Close = function(v41) --[[ Line: 151 ]]
                -- upvalues: v37 (copy), l_Parent_0 (ref)
                if not v41:IsOpen() then
                    return;
                else
                    if not v37.Enabled then
                        error("Menu API is not enabled for non-VR players. Check Api.Menu.Enabled before calling.");
                    end;
                    require(l_Parent_0:WaitForChild("UI"):WaitForChild("MainMenu")).GetInstance():Toggle();
                    return;
                end;
            end;
            v12:Register("Menu", v37);
            local v42 = require(l_Parent_0:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
            local v50 = {
                GetSetting = function(_, v44) --[[ Line: 160 ]] --[[ Name: GetSetting ]]
                    -- upvalues: v42 (copy)
                    return v42:GetSetting(v44);
                end, 
                SetSetting = function(_, v46, v47) --[[ Line: 163 ]] --[[ Name: SetSetting ]]
                    -- upvalues: v42 (copy)
                    v42:SetSetting(v46, v47);
                end, 
                GetSettingsChangedSignal = function(_, v49) --[[ Line: 166 ]] --[[ Name: GetSettingsChangedSignal ]]
                    -- upvalues: v42 (copy)
                    return v42:GetSettingsChangedSignal(v49);
                end
            };
            v12:Register("Settings", v50);
        end);
    end;
    return v12;
end;