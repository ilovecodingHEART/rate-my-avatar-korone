-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.TypeDefinitions);
local l_TestService_0 = game:GetService("TestService");
local v2 = require(script.Parent.Table);
local v3 = {};
v3.__index = v3;
v3.__type = "Signal";
local v4 = {};
v4.__index = v4;
v4.__type = "SignalConnection";
v3.new = function(v5) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        Name = v5, 
        Connections = {}, 
        YieldingThreads = {}
    }, v3));
end;
local function _(v6, v7) --[[ Line: 53 ]] --[[ Name: NewConnection ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        Signal = v6, 
        Delegate = v7, 
        Index = -1
    }, v4));
end;
local function v15(v9, v10, v11) --[[ Line: 62 ]] --[[ Name: ThreadAndReportError ]]
    -- upvalues: l_TestService_0 (copy)
    local v12 = coroutine.create(function() --[[ Line: 63 ]]
        -- upvalues: v9 (copy), v10 (copy)
        v9(unpack(v10));
    end);
    local v13, v14 = coroutine.resume(v12);
    if not v13 then
        l_TestService_0:Error(string.format("Exception thrown in your %s event handler: %s", v11, v14));
        l_TestService_0:Checkpoint(debug.traceback(v12));
    end;
end;
v3.Connect = function(v16, v17) --[[ Line: 75 ]] --[[ Name: Connect ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    assert(getmetatable(v16) == v3, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Connect", "Signal.new()"));
    local v18 = setmetatable({
        Signal = v16, 
        Delegate = v17, 
        Index = -1
    }, v4);
    v18.Index = #v16.Connections + 1;
    v2.insert(v16.Connections, v18.Index, v18);
    return v18;
end;
v3.Fire = function(v19, ...) --[[ Line: 83 ]] --[[ Name: Fire ]]
    -- upvalues: v3 (copy), v2 (copy), v15 (copy)
    assert(getmetatable(v19) == v3, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Fire", "Signal.new()"));
    local v20 = v2.pack(...);
    local l_Connections_0 = v19.Connections;
    local l_YieldingThreads_0 = v19.YieldingThreads;
    for v23 = 1, #l_Connections_0 do
        local v24 = l_Connections_0[v23];
        if v24.Delegate ~= nil then
            v15(v24.Delegate, v20, v24.Signal.Name);
        end;
    end;
    for v25 = 1, #l_YieldingThreads_0 do
        local v26 = l_YieldingThreads_0[v25];
        if v26 ~= nil then
            coroutine.resume(v26, ...);
        end;
    end;
end;
v3.FireSync = function(v27, ...) --[[ Line: 103 ]] --[[ Name: FireSync ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(getmetatable(v27) == v3, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("FireSync", "Signal.new()"));
    local v28 = v2.pack(...);
    local l_Connections_1 = v27.Connections;
    local l_YieldingThreads_1 = v27.YieldingThreads;
    for v31 = 1, #l_Connections_1 do
        local v32 = l_Connections_1[v31];
        if v32.Delegate ~= nil then
            v32.Delegate(unpack(v28));
        end;
    end;
    for v33 = 1, #l_YieldingThreads_1 do
        local v34 = l_YieldingThreads_1[v33];
        if v34 ~= nil then
            coroutine.resume(v34, ...);
        end;
    end;
end;
v3.Wait = function(v35) --[[ Line: 123 ]] --[[ Name: Wait ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(getmetatable(v35) == v3, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Wait", "Signal.new()"));
    local v36 = {};
    local v37 = coroutine.running();
    v2.insert(v35.YieldingThreads, v37);
    v36 = {
        coroutine.yield()
    };
    v2.removeObject(v35.YieldingThreads, v37);
    return unpack(v36);
end;
v3.Dispose = function(v38) --[[ Line: 133 ]] --[[ Name: Dispose ]]
    -- upvalues: v3 (copy)
    assert(getmetatable(v38) == v3, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Dispose", "Signal.new()"));
    local l_Connections_2 = v38.Connections;
    for v40 = 1, #l_Connections_2 do
        l_Connections_2[v40]:Disconnect();
    end;
    v38.Connections = {};
    setmetatable(v38, nil);
end;
v4.Disconnect = function(v41) --[[ Line: 143 ]] --[[ Name: Disconnect ]]
    -- upvalues: v4 (copy), v2 (copy)
    assert(getmetatable(v41) == v4, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Disconnect", "private function NewConnection()"));
    v2.remove(v41.Signal.Connections, v41.Index);
    v41.SignalStatic = nil;
    v41.Delegate = nil;
    v41.YieldingThreads = {};
    v41.Index = -1;
    setmetatable(v41, nil);
end;
return v3;