-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_HttpService_0 = game:GetService("HttpService");
return function() --[[ Line: 8 ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_Configuration_0 = script.Parent.Parent:WaitForChild("Configuration");
    local v2 = l_HttpService_0:JSONDecode(l_Configuration_0.Value);
    local v3 = {};
    if v2.Output and v2.Output.SuppressWarnings then
        for _, v5 in v2.Output.SuppressWarnings do
            v3[string.lower(v5)] = true;
        end;
    end;
    if v3.all then
        return;
    else
        for _, v10 in {
            {
                Key = "MissingNexusVRBackpackEnabled", 
                Message = "The configuration entry Extra.NexusVRBackpackEnabled is missing (defaults to true).", 
                Condition = function() --[[ Line: 27 ]] --[[ Name: Condition ]]
                    -- upvalues: v2 (copy)
                    local v6 = true;
                    if v2.Extra ~= nil then
                        v6 = v2.Extra.NexusVRBackpackEnabled == nil;
                    end;
                    return v6;
                end
            }, 
            {
                Key = "MissingAllowClientToOutputLoadedMessage", 
                Message = "The configuration entry Extra.AllowClientToOutputLoadedMessage is missing (defaults to true).", 
                Condition = function() --[[ Line: 34 ]] --[[ Name: Condition ]]
                    -- upvalues: v2 (copy)
                    local v7 = true;
                    if v2.Output ~= nil then
                        v7 = v2.Output.AllowClientToOutputLoadedMessage == nil;
                    end;
                    return v7;
                end
            }, 
            {
                Key = "MissingDisableHeadLocked", 
                Message = "The configuration entry Camera.DisableHeadLocked is missing (defaults to true).", 
                Condition = function() --[[ Line: 41 ]] --[[ Name: Condition ]]
                    -- upvalues: v2 (copy)
                    local v8 = true;
                    if v2.Camera ~= nil then
                        v8 = v2.Camera.DisableHeadLocked == nil;
                    end;
                    return v8;
                end
            }
        } do
            if not v3[string.lower(v10.Key)] and v10.Condition() then
                warn(v10.Message);
                warn((("\tThis warning can be disabled by adding \"%*\" or \"All\" to Output.SuppressWarnings in the configuration of Nexus VR Character Model."):format(v10.Key)));
            end;
        end;
        return;
    end;
end;