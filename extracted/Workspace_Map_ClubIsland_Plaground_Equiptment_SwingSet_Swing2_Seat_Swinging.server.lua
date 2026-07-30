-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_script_Attribute_0 = script:GetAttribute("SwingForce");
local v2 = nil;
script.Parent:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 7 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_script_Attribute_0 (copy), v2 (ref)
    local l_Occupant_0 = script.Parent.Occupant;
    if l_Occupant_0 and l_Occupant_0.Parent == l_LocalPlayer_0.Character then
        local v4 = 0;
        local v5 = os.clock();
        local l_LookVector_0 = script.Parent.CFrame.LookVector;
        local v8 = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 13 ]]
            -- upvalues: v5 (ref), v4 (ref), l_Occupant_0 (copy), l_LookVector_0 (copy), l_script_Attribute_0 (ref)
            if os.clock() - v5 < 0.25 then
                return;
            else
                local l_v4_0 = v4;
                if l_Occupant_0.MoveDirection:Dot(l_LookVector_0) > 0.1 then
                    v4 = -1;
                elseif l_Occupant_0.MoveDirection:Dot(l_LookVector_0) < -0.1 then
                    v4 = 1;
                end;
                if l_v4_0 < v4 then
                    v5 = os.clock();
                    print("backward");
                    task.wait(0.1);
                    script.Parent:ApplyImpulse(-l_LookVector_0 * l_script_Attribute_0);
                    return;
                else
                    if v4 < l_v4_0 then
                        v5 = os.clock();
                        print("forward");
                        task.wait(0.1);
                        script.Parent:ApplyImpulse(l_LookVector_0 * l_script_Attribute_0);
                    end;
                    return;
                end;
            end;
        end);
        v2 = function() --[[ Line: 35 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
        return;
    else
        if v2 then
            v2();
        end;
        return;
    end;
end);