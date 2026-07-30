-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.types);
local l___DEV___0 = _G.__DEV__;
local v2 = setmetatable({}, {
    __mode = "k"
});
local v3 = {};
local v4 = false;
local v5 = {
    stack = {}, 
    index = 0
};
local function v19(v6, v7, ...) --[[ Line: 28 ]] --[[ Name: try ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        local v8 = coroutine.create(v6);
        local v9, v10 = coroutine.resume(v8, ...);
        if v7 then
            v7();
        end;
        if coroutine.status(v8) == "suspended" then
            local v11, v12, v13 = debug.info(v6, "sln");
            coroutine.close(v8);
            error("Yielding is not allowed in atom functions. Consider wrapping this code in a Promise or task.defer instead." .. ("\nFunction defined at: %*:%*"):format(v11, v12) .. (v13 == "" and "" or (" function %*"):format(v13)));
            return v10;
        else
            if not v9 then
                local v14, v15, v16 = debug.info(v6, "sln");
                error("An error occurred while running an atom function" .. ("\nFunction defined at: %*:%*"):format(v14, v15) .. (v16 == "" and "" or (" function %*"):format(v16)) .. ("\nError: %*"):format(v10));
            end;
            return v10;
        end;
    elseif not v7 then
        return v6(...);
    else
        local l_status_0, l_result_0 = pcall(v6, ...);
        v7();
        assert(l_status_0, l_result_0);
        return l_result_0;
    end;
end;
local function v21(v20) --[[ Line: 79 ]] --[[ Name: isAtom ]]
    -- upvalues: v2 (copy)
    return not not (v20 and v2[v20]);
end;
local function v25(v22) --[[ Line: 88 ]] --[[ Name: notify ]]
    -- upvalues: v4 (ref), v2 (copy), v3 (copy), v19 (copy)
    if v4 then
        for v23 in next, v2[v22] do
            v3[v23] = true;
        end;
        return;
    else
        for v24 in next, table.clone(v2[v22]) do
            v19(v24);
        end;
        return;
    end;
end;
local function v29(v26, ...) --[[ Line: 109 ]] --[[ Name: peek ]]
    -- upvalues: v5 (copy), v19 (copy)
    if type(v26) ~= "function" then
        return v26;
    elseif v5.index == 0 then
        return v26(...);
    else
        local l_v5_0 = v5;
        l_v5_0.index = l_v5_0.index + 1;
        v5.stack[v5.index] = {};
        return (v19(v26, function() --[[ Line: 121 ]]
            -- upvalues: v5 (ref)
            v5.stack[v5.index] = nil;
            local l_v5_1 = v5;
            l_v5_1.index = l_v5_1.index - 1;
        end, ...));
    end;
end;
local function v34(v30, ...) --[[ Line: 136 ]] --[[ Name: capture ]]
    -- upvalues: v2 (copy), v29 (copy), v5 (copy), v19 (copy)
    if v2[v30] then
        return {
            [v30] = true
        }, v29(v30);
    else
        local v31 = {};
        local l_v5_2 = v5;
        l_v5_2.index = l_v5_2.index + 1;
        v5.stack[v5.index] = v31;
        return v31, (v19(v30, function() --[[ Line: 147 ]]
            -- upvalues: v5 (ref)
            v5.stack[v5.index] = nil;
            local l_v5_3 = v5;
            l_v5_3.index = l_v5_3.index - 1;
        end, ...));
    end;
end;
local function v37(v35) --[[ Line: 161 ]] --[[ Name: batch ]]
    -- upvalues: v4 (ref), v19 (copy), v3 (copy)
    if v4 then
        return v35();
    else
        v4 = true;
        v19(v35, function() --[[ Line: 168 ]]
            -- upvalues: v4 (ref)
            v4 = false;
        end);
        for v36 in next, v3 do
            v19(v36);
        end;
        table.clear(v3);
        return;
    end;
end;
return {
    listeners = v2, 
    capturing = v5, 
    isAtom = v21, 
    notify = v25, 
    capture = v34, 
    batch = v37, 
    peek = v29, 
    connect = function(v38, v39, v40) --[[ Line: 186 ]] --[[ Name: connect ]]
        -- upvalues: v2 (copy)
        for v41 in next, v38 do
            v2[v41][v39] = v40 or true;
        end;
    end, 
    disconnect = function(v42, v43) --[[ Line: 198 ]] --[[ Name: disconnect ]]
        -- upvalues: v2 (copy)
        for v44 in next, v42 do
            v2[v44][v43] = nil;
        end;
    end
};