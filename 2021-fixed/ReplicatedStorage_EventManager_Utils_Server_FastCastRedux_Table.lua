-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = Random.new();
local l_table_0 = table;
local v2 = {};
v2.contains = function(v3, v4) --[[ Line: 27 ]]
    -- upvalues: v2 (copy)
    return v2.indexOf(v3, v4) ~= nil;
end;
v2.indexOf = function(v5, v6) --[[ Line: 32 ]]
    -- upvalues: v2 (copy)
    local v7 = __2021_find(v5, v6);
    if v7 then
        return v7;
    else
        return v2.keyOf(v5, v6);
    end;
end;
v2.keyOf = function(v8, v9) --[[ Line: 41 ]]
    for v10, v11 in pairs(v8) do
        if v11 == v9 then
            return v10;
        end;
    end;
    return nil;
end;
v2.insertAndGetIndexOf = function(v12, v13) --[[ Line: 51 ]]
    v12[#v12 + 1] = v13;
    return #v12;
end;
v2.skip = function(v14, v15) --[[ Line: 57 ]]
    return table.move(v14, v15 + 1, #v14, 1, table.create(#v14 - v15));
end;
v2.take = function(v16, v17) --[[ Line: 62 ]]
    return table.move(v16, 1, v17, 1, table.create(v17));
end;
v2.range = function(v18, v19, v20) --[[ Line: 67 ]]
    return table.move(v18, v19, v20, 1, table.create(v20 - v19 + 1));
end;
v2.skipAndTake = function(v21, v22, v23) --[[ Line: 72 ]]
    return table.move(v21, v22 + 1, v22 + v23, 1, table.create(v23));
end;
v2.random = function(v24) --[[ Line: 77 ]]
    -- upvalues: v0 (copy)
    return v24[v0:NextInteger(1, #v24)];
end;
v2.join = function(v25, v26) --[[ Line: 82 ]]
    local v27 = table.create(#v25 + #v26);
    local _ = table.move(v25, 1, #v25, 1, v27);
    return table.move(v26, 1, #v26, #v25 + 1, v27);
end;
v2.removeObject = function(v29, v30) --[[ Line: 89 ]]
    -- upvalues: v2 (copy)
    local v31 = v2.indexOf(v29, v30);
    if v31 then
        table.remove(v29, v31);
    end;
end;
return (setmetatable({}, {
    __index = function(_, v33) --[[ Line: 97 ]] --[[ Name: __index ]]
        -- upvalues: v2 (copy), l_table_0 (copy)
        if v2[v33] ~= nil then
            return v2[v33];
        else
            return l_table_0[v33];
        end;
    end, 
    __newindex = function(_, _, _) --[[ Line: 105 ]] --[[ Name: __newindex ]]
        error("Add new table entries by editing the Module itself.");
    end
}));