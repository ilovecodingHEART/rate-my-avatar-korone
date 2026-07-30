-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
return function(v1, v2) --[[ Line: 10 ]] --[[ Name: interval ]]
    -- upvalues: l_RunService_0 (copy)
    if v2 < 0 then
        return function() --[[ Line: 12 ]]

        end;
    else
        local v3 = 0;
        local v5 = l_RunService_0.Heartbeat:Connect(function(v4) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v2 (copy), v1 (copy)
            v3 = v3 + v4;
            if v2 <= v3 then
                v3 = 0;
                v1();
            end;
        end);
        return function() --[[ Line: 25 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    end;
end;