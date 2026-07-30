-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CharacterBackpack_0 = require(script:WaitForChild("CharacterBackpack"));
return {
    Enabled = true, 
    CreateBackpack = function(v3) --[[ Line: 23 ]] --[[ Name: CreateBackpack ]]
        -- upvalues: l_Players_0 (copy), l_CharacterBackpack_0 (copy)
        if v3.CurrentBackpack then
            v3.CurrentBackpack:Destroy();
            v3.CurrentBackpack = nil;
        end;
        if not l_Players_0.LocalPlayer.Character then
            return;
        else
            local v4 = l_CharacterBackpack_0.new(l_Players_0.LocalPlayer.Character);
            v4.Enabled = v3.Enabled;
            if v3.OverrideKeyCode then
                v4:SetKeyCode(v3.OverrideKeyCode);
            end;
            if v3.OverrideUserCFrame then
                v4:SetUserCFrame(v3.OverrideUserCFrame);
            end;
            v3.CurrentBackpack = v4;
            return;
        end;
    end, 
    Load = function(v5) --[[ Line: 46 ]] --[[ Name: Load ]]
        -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_CharacterBackpack_0 (copy)
        l_Players_0.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 48 ]]
            -- upvalues: v5 (copy)
            v5:CreateBackpack();
        end);
        v5:CreateBackpack();
        task.spawn(function() --[[ Line: 54 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), l_CharacterBackpack_0 (ref), v5 (copy)
            local v6 = require(l_ReplicatedStorage_0:WaitForChild("NexusVRCharacterModel", 1.0E99));
            if not v6.Api then
                warn("Nexus VR Character Model is loaded by no API is found. This was added in V.2.4.0. Inputs on the right controller won't be disabled when interacting with the backpack.");
                return;
            else
                l_CharacterBackpack_0.NexusVRCharacterModelControllerApi = v6.Api:WaitFor("Controller");
                v6.Api:Register("Backpack", {
                    GetBackpackEnabled = function(_) --[[ Line: 65 ]] --[[ Name: GetBackpackEnabled ]]
                        -- upvalues: v5 (ref)
                        return v5:GetBackpackEnabled();
                    end, 
                    SetBackpackEnabled = function(_, v9) --[[ Line: 68 ]] --[[ Name: SetBackpackEnabled ]]
                        -- upvalues: v5 (ref)
                        v5:SetBackpackEnabled(v9);
                    end, 
                    SetKeyCode = function(_, v11) --[[ Line: 71 ]] --[[ Name: SetKeyCode ]]
                        -- upvalues: v5 (ref)
                        v5:SetKeyCode(v11);
                    end, 
                    SetUserCFrame = function(_, v13) --[[ Line: 74 ]] --[[ Name: SetUserCFrame ]]
                        -- upvalues: v5 (ref)
                        v5:SetUserCFrame(v13);
                    end
                });
                return;
            end;
        end);
    end, 
    GetBackpackEnabled = function(v14) --[[ Line: 84 ]] --[[ Name: GetBackpackEnabled ]]
        return v14.Enabled;
    end, 
    SetBackpackEnabled = function(v15, v16) --[[ Line: 91 ]] --[[ Name: SetBackpackEnabled ]]
        v15.Enabled = v16 ~= false;
        if v15.CurrentBackpack then
            v15.CurrentBackpack.Enabled = v15.Enabled;
            if not v15.Enabled then
                v15.CurrentBackpack:Close();
            end;
        end;
    end, 
    SetKeyCode = function(v17, v18) --[[ Line: 104 ]] --[[ Name: SetKeyCode ]]
        v17.OverrideKeyCode = v18;
        if v17.CurrentBackpack then
            v17.CurrentBackpack:SetKeyCode(v18 or Enum.KeyCode.ButtonR3);
        end;
    end, 
    SetUserCFrame = function(v19, v20) --[[ Line: 114 ]] --[[ Name: SetUserCFrame ]]
        v19.OverrideUserCFrame = v20;
        if v19.CurrentBackpack then
            v19.CurrentBackpack:SetUserCFrame(v20 or Enum.UserCFrame.RightHand);
        end;
    end
};