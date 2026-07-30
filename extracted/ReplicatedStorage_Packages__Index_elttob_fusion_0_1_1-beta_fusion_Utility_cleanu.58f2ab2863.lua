-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Utility.cleanup);
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
return function(v4, v5) --[[ Line: 19 ]] --[[ Name: cleanupOnDestroy ]]
    local v6 = false;
    local v7 = nil;
    local function v8() --[[ Line: 24 ]] --[[ Name: disconnect ]]
        if not v6 then
            v6 = true;
            v7:Disconnect();
        end;
    end;
    local v9 = v4.Parent == nil;
    local function v12(v10, v11) --[[ Line: 39 ]] --[[ Name: onInstanceMove ]]
        if v6 then
            return;
        else
            v10 = nil;
            v9 = v11 == nil;
            if v9 then
                coroutine.wrap(function() --[[ Line: 54 ]]
                    l_Heartbeat_0:Wait();
                    if v6 then
                        return;
                    else
                        if not v7.Connected then
                            v2(v5);
                            if not v6 then
                                v6 = true;
                                v7:Disconnect();
                                return;
                            end;
                        else
                            while v9 and v7.Connected and not v6 do
                                l_Heartbeat_0:Wait();
                            end;
                            if v6 or not v9 then
                                return;
                            else
                                v2(v5);
                                if not v6 then
                                    v6 = true;
                                    v7:Disconnect();
                                end;
                            end;
                        end;
                        return;
                    end;
                end)();
            end;
            return;
        end;
    end;
    v7 = v4.AncestryChanged:Connect(v12);
    if v9 then
        local v13 = nil;
        local l_Parent_1 = v4.Parent;
        if not v6 then
            v13 = nil;
            v9 = l_Parent_1 == nil;
            if v9 then
                coroutine.wrap(function() --[[ Line: 54 ]]
                    l_Heartbeat_0:Wait();
                    if v6 then
                        return;
                    else
                        if not v7.Connected then
                            v2(v5);
                            if not v6 then
                                v6 = true;
                                v7:Disconnect();
                                return;
                            end;
                        else
                            while v9 and v7.Connected and not v6 do
                                l_Heartbeat_0:Wait();
                            end;
                            if v6 or not v9 then
                                return;
                            else
                                v2(v5);
                                if not v6 then
                                    v6 = true;
                                    v7:Disconnect();
                                end;
                            end;
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v4 = nil;
    return v8;
end;