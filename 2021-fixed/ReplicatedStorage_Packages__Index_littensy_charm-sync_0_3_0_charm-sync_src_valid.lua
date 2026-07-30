-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x7, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    string = true, 
    number = true
};
local v1 = {
    ["function"] = true, 
    thread = true
};
local function v7(v2) --[[ Line: 4 ]] --[[ Name: isTableUnsafe ]]
    -- upvalues: v0 (copy)
    local v3 = nil;
    local v4 = 0;
    for v5 in next, v2 do
        local v6 = type(v5);
        if not v3 and v0[v6] then
            v3 = v6;
        elseif v3 ~= v6 then
            return true;
        end;
        v4 = v4 + 1;
    end;
    if #v2 < v4 and v3 == "number" then
        return true;
    else
        return false;
    end;
end;
return function(v8, v9) --[[ Line: 37 ]] --[[ Name: validate ]]
    -- upvalues: v0 (copy), v1 (copy), v7 (copy)
    local v10 = type(v9);
    local v11 = type(v8);
    if not v0[v10] then
        error((("Invalid key type '%s' at key '%s'"):format(v10, v9)));
    elseif v1[v11] then
        error((("Invalid value type '%s' at key '%s'"):format(v11, v9)));
    elseif v11 == "table" then
        if getmetatable(v8) ~= nil then
            error((("Cannot sync tables with metatables! Got %s at key '%s'"):format(v8, v9)));
        elseif v7(v8) then
            error(("Cannot sync tables unsupported by remote events! The value has the key '%s'.\n\n"):format(v9) .. "This can be for the following reasons:\n" .. "1. The object is an array with non-sequential keys\n" .. "2. The object is a dictionary with mixed key types (e.g. string and number)\n\n" .. "Read more: https://create.roblox.com/docs/scripting/events/remote#argument-limitations");
        end;
    end;
    if v10 == "number" then
        if v9 == 1e999 or v9 == -1e999 then
            error("Cannot sync infinity as key");
            return;
        elseif v9 ~= math.floor(v9) then
            error("Cannot sync non-integer number as key");
        end;
    end;
end;