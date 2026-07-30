-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_TrackerRole_0 = require(script:WaitForChild("Data"):WaitForChild("TrackerRole"));
local l_CombinedInput_0 = require(script:WaitForChild("Input"):WaitForChild("CombinedInput"));
local l_CompanionPluginInput_0 = require(script:WaitForChild("Input"):WaitForChild("CompanionPluginInput"));
local l_TextBoxInput_0 = require(script:WaitForChild("Input"):WaitForChild("TextBoxInput"));
local l_DeserializeOpenVrInputs_0 = require(script:WaitForChild("Serialization"):WaitForChild("DeserializeOpenVrInputs"));
local l_CalculateRolloff_0 = require(script:WaitForChild("Util"):WaitForChild("CalculateRolloff"));
return {
    Enabled = false, 
    TrackerRoles = l_TrackerRole_0, 
    Input = nil, 
    LastInputData = "", 
    LastInputTime = tick(), 
    LastFloorCFrameToOrigin = CFrame.identity, 
    LastInputs = {}, 
    IsActive = function(v8) --[[ Line: 34 ]] --[[ Name: IsActive ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
        if l_l_UserInputService_0_FocusedTextBox_0 and l_l_UserInputService_0_FocusedTextBox_0.Parent and l_l_UserInputService_0_FocusedTextBox_0.Name == "EnigmaTextBox" then
            return true;
        else
            return tick() - v8.LastInputTime < 0.5;
        end;
    end, 
    UpdateUserCFrames = function(v10) --[[ Line: 50 ]] --[[ Name: UpdateUserCFrames ]]
        -- upvalues: l_DeserializeOpenVrInputs_0 (copy), l_VRService_0 (copy)
        if not v10.Input then
            warn("Enigma is not enabled. Call Enigma:Enable() before calling.");
            return;
        else
            local l_CurrentText_0 = v10.Input:GetCurrentText();
            if l_CurrentText_0 == v10.LastInputData then
                if tick() - v10.LastInputTime >= 0.5 then
                    v10.LastInputs = {};
                end;
                return;
            else
                pcall(function() --[[ Line: 69 ]]
                    -- upvalues: l_DeserializeOpenVrInputs_0 (ref), l_CurrentText_0 (copy), v10 (copy), l_VRService_0 (ref)
                    local v12 = {};
                    for _, v14 in l_DeserializeOpenVrInputs_0(l_CurrentText_0) do
                        if not v12[v14.TrackerRole] then
                            v12[v14.TrackerRole] = {};
                        end;
                        table.insert(v12[v14.TrackerRole], v14);
                    end;
                    v10.LastInputData = l_CurrentText_0;
                    v10.LastInputTime = tick();
                    v10.LastFloorCFrameToOrigin = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor);
                    v10.LastInputs = v12;
                end);
                return;
            end;
        end;
    end, 
    GetUserCFrameEnabled = function(v15, v16, v17) --[[ Line: 86 ]] --[[ Name: GetUserCFrameEnabled ]]
        v15:UpdateUserCFrames();
        local v18 = v15.LastInputs[v16];
        local v19 = false;
        if v18 ~= nil then
            v19 = v18[v17 or 1] ~= nil;
        end;
        return v19;
    end, 
    GetUserCFrame = function(v20, v21, v22) --[[ Line: 97 ]] --[[ Name: GetUserCFrame ]]
        -- upvalues: l_CalculateRolloff_0 (copy)
        v20:UpdateUserCFrames();
        local v23 = v20.LastInputs[v21];
        if not v23 then
            return nil;
        else
            local v24 = v23[v22 or 1];
            if not v24 then
                return nil;
            else
                local v25 = l_CalculateRolloff_0(0.03, 0.09, tick() - v20.LastInputTime);
                return v20.LastFloorCFrameToOrigin * (CFrame.new(v24.FloorRelativeVelocity * v25) * v24.FloorRelativeCFrame);
            end;
        end;
    end, 
    Enable = function(v26) --[[ Line: 110 ]] --[[ Name: Enable ]]
        -- upvalues: l_CombinedInput_0 (copy), l_TextBoxInput_0 (copy), l_CompanionPluginInput_0 (copy)
        if v26.Input then
            return;
        else
            v26.Input = l_CombinedInput_0.new({
                l_TextBoxInput_0.new(), 
                l_CompanionPluginInput_0.new()
            });
            v26.Enabled = true;
            return;
        end;
    end
};