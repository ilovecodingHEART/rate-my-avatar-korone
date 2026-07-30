-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--!native
if not _G.__ZAP then
    _G.__ZAP = {
        ZAP = {}
    };
elseif not _G.__ZAP.ZAP then
    _G.__ZAP.ZAP = {};
elseif _G.__ZAP.ZAP.ZAP ~= nil then
    error((("There is already an instance of Zap with the same remote_scope of ZAP, remote_folder of ZAP and the version of %*. Change the remote_scope or remote_folder option of both Zap instances"):format(_G.__ZAP.ZAP.ZAP)));
end;
_G.__ZAP.ZAP.ZAP = "0.6.27";
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local _ = {
    CFrame.Angles(0, 0, 0), 
    CFrame.Angles(1.5707963267948966, 0, 0), 
    CFrame.Angles(0, 3.141592653589793, 3.141592653589793), 
    CFrame.Angles(-1.5707963267948966, 0, 0), 
    CFrame.Angles(0, 3.141592653589793, 1.5707963267948966), 
    CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966), 
    CFrame.Angles(0, 0, 1.5707963267948966), 
    CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966), 
    CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0), 
    CFrame.Angles(0, -1.5707963267948966, 0), 
    CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0), 
    CFrame.Angles(0, 1.5707963267948966, 3.141592653589793), 
    CFrame.Angles(0, -1.5707963267948966, 3.141592653589793), 
    CFrame.Angles(0, 3.141592653589793, 0), 
    CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0), 
    CFrame.Angles(0, 0, 3.141592653589793), 
    CFrame.Angles(1.5707963267948966, 3.141592653589793, 0), 
    CFrame.Angles(0, 0, -1.5707963267948966), 
    CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966), 
    CFrame.Angles(0, -3.141592653589793, -1.5707963267948966), 
    CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966), 
    CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0), 
    CFrame.Angles(0, 1.5707963267948966, 0), 
    CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
};
local function v16(v14) --[[ Line: 62 ]] --[[ Name: alloc ]]
    -- upvalues: v3 (ref), v4 (ref), v2 (ref), v6 (ref)
    if v3 + v14 > v4 then
        while v3 + v14 > v4 do
            v4 = v4 * 2;
        end;
        local v15 = buffer.create(v4);
        buffer.copy(v15, 0, v2, 0, v3);
        v2 = v15;
    end;
    v6 = v3;
    v3 = v3 + v14;
    return v6;
end;
local function _(v17) --[[ Line: 80 ]] --[[ Name: read ]]
    -- upvalues: v9 (ref)
    local l_v9_0 = v9;
    v9 = v9 + v17;
    return l_v9_0;
end;
local function _() --[[ Line: 87 ]] --[[ Name: save ]]
    -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v7 (ref), v12 (ref)
    return {
        buff = v2, 
        used = v3, 
        size = v4, 
        inst = v5, 
        outgoing_ids = v7, 
        incoming_ids = v12
    };
end;
local function _(v21) --[[ Line: 98 ]] --[[ Name: load ]]
    -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v7 (ref), v12 (ref)
    v2 = v21.buff;
    v3 = v21.used;
    v4 = v21.size;
    v5 = v21.inst;
    v7 = v21.outgoing_ids;
    v12 = v21.incoming_ids;
end;
(function() --[[ Line: 114 ]] --[[ Name: load_empty ]]
    -- upvalues: v2 (ref), v3 (ref), v4 (ref), v5 (ref), v7 (ref), v12 (ref)
    v2 = buffer.create(64);
    v3 = 0;
    v4 = 64;
    v5 = {};
    v7 = {};
    v12 = {};
end)();
local _ = {};
local v24 = {};
local v25 = {};
if not l_RunService_0:IsRunning() then
    local function v26() --[[ Line: 130 ]]

    end;
    return (table.freeze({
        SendEvents = v26, 
        SyncState = table.freeze({
            On = v26
        }), 
        StartPenaltyClient = table.freeze({
            On = v26
        }), 
        StartPenalty = table.freeze({
            Fire = v26
        }), 
        SelectTeam = table.freeze({
            Fire = v26
        }), 
        RequestState = table.freeze({
            Fire = v26
        }), 
        RecieveResult = table.freeze({
            Call = v26
        }), 
        CheckReward = table.freeze({
            Call = v26
        })
    }));
else
    if l_RunService_0:IsServer() then
        error("Cannot use the client module on the server!");
    end;
    local l_ZAP_RELIABLE_0 = l_ReplicatedStorage_0:WaitForChild("ZAP"):WaitForChild("ZAP_RELIABLE");
    assert(l_ZAP_RELIABLE_0:IsA("RemoteEvent"), "Expected ZAP_RELIABLE to be a RemoteEvent");
    local function v29() --[[ Line: 165 ]] --[[ Name: SendEvents ]]
        -- upvalues: v3 (ref), v2 (ref), l_ZAP_RELIABLE_0 (copy), v5 (ref), v4 (ref)
        if v3 ~= 0 then
            local v28 = buffer.create(v3);
            buffer.copy(v28, 0, v2, 0, v3);
            l_ZAP_RELIABLE_0:FireServer(v28, v5);
            v2 = buffer.create(64);
            v3 = 0;
            v4 = 64;
            table.clear(v5);
        end;
    end;
    l_RunService_0.Heartbeat:Connect(v29);
    local v30 = table.create(4);
    local v31 = table.create(4);
    local v32 = 0;
    v30[0] = {};
    v31[0] = {};
    v30[1] = {};
    v31[1] = 0;
    v31[2] = table.create(255);
    v31[3] = table.create(255);
    l_ZAP_RELIABLE_0.OnClientEvent:Connect(function(v33, v34) --[[ Line: 190 ]]
        -- upvalues: v8 (ref), v10 (ref), v9 (ref), v11 (ref), v30 (copy), v31 (copy)
        v8 = v33;
        v10 = v34;
        v9 = 0;
        v11 = 0;
        local v35 = buffer.len(v33);
        while v9 < v35 do
            local l_v9_1 = v9;
            v9 = v9 + 1;
            local v37 = buffer.readu8(v33, l_v9_1);
            if v37 == 0 then
                local v38 = nil;
                l_v9_1 = v8;
                local l_v9_2 = v9;
                v9 = v9 + 1;
                if bit32.btest(buffer.readu8(l_v9_1, l_v9_2), 1) then
                    v11 = v11 + 1;
                    v38 = v10[v11];
                else
                    v38 = nil;
                end;
                if v30[0][1] then
                    for _, v41 in v30[0] do
                        task.spawn(v41, v38);
                    end;
                else
                    table.insert(v31[0], v38);
                    if #v31[0] > 64 then
                        warn((("[ZAP] %* events in queue for SyncState. Did you forget to attach a listener?"):format(#v31[0])));
                    end;
                end;
            elseif v37 == 1 then
                if v30[1][1] then
                    for _, v43 in v30[1] do
                        task.spawn(v43, nil);
                    end;
                else
                    local l_v31_0 = v31;
                    l_v31_0[1] = l_v31_0[1] + 1;
                    if v31[1] > 16 then
                        warn((("[ZAP] %* events in queue for StartPenaltyClient. Did you forget to attach a listener?"):format(v31[1])));
                    end;
                end;
            elseif v37 == 2 then
                local l_v8_0 = v8;
                local l_v9_3 = v9;
                v9 = v9 + 1;
                local v47 = buffer.readu8(l_v8_0, l_v9_3);
                l_v8_0 = nil;
                l_v9_3 = v8;
                local l_v9_4 = v9;
                v9 = v9 + 1;
                l_v8_0 = bit32.btest(buffer.readu8(l_v9_3, l_v9_4), 1);
                l_v9_3 = v31[2][v47];
                if l_v9_3 then
                    task.spawn(l_v9_3, l_v8_0);
                end;
                v31[2][v47] = nil;
            elseif v37 == 3 then
                local l_v8_1 = v8;
                local l_v9_5 = v9;
                v9 = v9 + 1;
                local v51 = buffer.readu8(l_v8_1, l_v9_5);
                l_v8_1 = nil;
                l_v9_1 = nil;
                local l_v8_2 = v8;
                local l_v9_6 = v9;
                v9 = v9 + 1;
                l_v9_5 = buffer.readu8(l_v8_2, l_v9_6);
                if bit32.btest(l_v9_5, 1) then
                    v11 = v11 + 1;
                    l_v8_1 = v10[v11];
                else
                    l_v8_1 = nil;
                end;
                l_v9_1 = bit32.btest(l_v9_5, 2);
                l_v8_2 = v31[3][v51];
                if l_v8_2 then
                    task.spawn(l_v8_2, l_v8_1, l_v9_1);
                end;
                v31[3][v51] = nil;
            else
                error("Unknown event id");
            end;
        end;
    end);
    table.freeze(v24);
    table.freeze(v25);
    return {
        SendEvents = v29, 
        SyncState = {
            On = function(v54) --[[ Line: 268 ]] --[[ Name: On ]]
                -- upvalues: v30 (copy), v31 (copy)
                table.insert(v30[0], v54);
                for _, v56 in v31[0] do
                    task.spawn(v54, v56);
                end;
                v31[0] = {};
                return function() --[[ Line: 274 ]]
                    -- upvalues: v30 (ref), v54 (copy)
                    table.remove(v30[0], table.find(v30[0], v54));
                end;
            end
        }, 
        StartPenaltyClient = {
            On = function(v57) --[[ Line: 280 ]] --[[ Name: On ]]
                -- upvalues: v30 (copy), v31 (copy)
                table.insert(v30[1], v57);
                for _ = 1, v31[1] do
                    task.spawn(v57);
                end;
                v31[1] = 0;
                return function() --[[ Line: 286 ]]
                    -- upvalues: v30 (ref), v57 (copy)
                    table.remove(v30[1], table.find(v30[1], v57));
                end;
            end
        }, 
        StartPenalty = {
            Fire = function() --[[ Line: 292 ]] --[[ Name: Fire ]]
                -- upvalues: v16 (copy), v2 (ref), v6 (ref)
                v16(1);
                buffer.writeu8(v2, v6, 1);
            end
        }, 
        SelectTeam = {
            Fire = function(v59) --[[ Line: 298 ]] --[[ Name: Fire ]]
                -- upvalues: v16 (copy), v2 (ref), v6 (ref)
                v16(1);
                buffer.writeu8(v2, v6, 2);
                local v60 = #v59;
                assert(utf8.len(v59) ~= nil, "value is not valid utf-8");
                v16(2);
                buffer.writeu16(v2, v6, v60);
                v16(v60);
                buffer.writestring(v2, v6, v59, v60);
            end
        }, 
        RequestState = {
            Fire = function() --[[ Line: 310 ]] --[[ Name: Fire ]]
                -- upvalues: v16 (copy), v2 (ref), v6 (ref)
                v16(1);
                buffer.writeu8(v2, v6, 0);
            end
        }, 
        RecieveResult = {
            Call = function(v61, v62, v63) --[[ Line: 316 ]] --[[ Name: Call ]]
                -- upvalues: v32 (ref), v31 (copy), v16 (copy), v2 (ref), v6 (ref)
                v32 = v32 + 1;
                v32 = v32 % 256;
                if v31[2][v32] then
                    v32 = v32 - 1;
                    error("Zap has more than 256 calls awaiting a response, and therefore this packet has been dropped");
                end;
                v16(1);
                buffer.writeu8(v2, v6, 3);
                v16(1);
                buffer.writeu8(v2, v6, v32);
                v16(4);
                buffer.writef32(v2, v6, v61);
                v16(4);
                buffer.writef32(v2, v6, v62);
                local v64 = #v63;
                assert(utf8.len(v63) ~= nil, "value is not valid utf-8");
                v16(2);
                buffer.writeu16(v2, v6, v64);
                v16(v64);
                buffer.writestring(v2, v6, v63, v64);
                v31[2][v32] = coroutine.running();
                return coroutine.yield();
            end
        }, 
        CheckReward = {
            Call = function(v65) --[[ Line: 342 ]] --[[ Name: Call ]]
                -- upvalues: v32 (ref), v31 (copy), v16 (copy), v2 (ref), v6 (ref)
                v32 = v32 + 1;
                v32 = v32 % 256;
                if v31[3][v32] then
                    v32 = v32 - 1;
                    error("Zap has more than 256 calls awaiting a response, and therefore this packet has been dropped");
                end;
                v16(1);
                buffer.writeu8(v2, v6, 4);
                v16(1);
                buffer.writeu8(v2, v6, v32);
                local v66 = #v65;
                assert(utf8.len(v65) ~= nil, "value is not valid utf-8");
                v16(2);
                buffer.writeu16(v2, v6, v66);
                v16(v66);
                buffer.writestring(v2, v6, v65, v66);
                v31[3][v32] = coroutine.running();
                return coroutine.yield();
            end
        }
    };
end;