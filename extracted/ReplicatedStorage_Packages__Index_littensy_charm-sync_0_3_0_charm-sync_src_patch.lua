-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.validate);
local l___DEV___0 = _G.__DEV__;
local v2 = {
    __none = "__none"
};
local function v5(v3) --[[ Line: 11 ]] --[[ Name: isNone ]]
    local v4 = false;
    if type(v3) == "table" then
        v4 = v3.__none == "__none";
    end;
    return v4;
end;
local function v11(v6) --[[ Line: 25 ]] --[[ Name: stringifySparseArray ]]
    local v7 = table.maxn(v6);
    if v7 == 0 or v7 == #v6 then
        return v6;
    else
        local v8 = {};
        for v9, v10 in next, v6 do
            v8[tostring(v9)] = v10;
        end;
        return v8;
    end;
end;
local function v12(v13, v14, v15) --[[ Line: 51 ]] --[[ Name: diff ]]
    -- upvalues: v2 (copy), v12 (copy), v11 (copy), l___DEV___0 (copy), v0 (copy)
    v15 = v15 ~= false;
    local v16 = table.clone(v14);
    for v17, v18 in next, v13 do
        local v19 = v14[v17];
        if v18 == v19 then
            v16[v17] = nil;
        elseif v19 == nil then
            v16[v17] = v2;
        elseif type(v18) == "table" and type(v19) == "table" then
            v16[v17] = v12(v18, v19, v15);
        end;
    end;
    if v15 and (v13[1] ~= nil or v14[1] ~= nil) then
        v16 = v11(v16);
    end;
    if v15 and l___DEV___0 then
        for v20, v21 in next, v16 do
            v0(v21, v20);
        end;
    end;
    return v16;
end;
local function v22(v23, v24) --[[ Line: 89 ]] --[[ Name: apply ]]
    -- upvalues: v22 (copy)
    if type(v24) == "table" and v24.__none == "__none" then
        return nil;
    elseif type(v23) ~= "table" or type(v24) ~= "table" then
        return v24;
    else
        local v25 = table.clone(v23);
        local v26 = v23[1] ~= nil;
        for v27, v28 in next, v24 do
            if v26 and type(v27) == "string" then
                v27 = tonumber(v27) or v27;
            end;
            v25[v27] = v22(v25[v27], v28);
        end;
        return v25;
    end;
end;
return {
    isNone = v5, 
    diff = v12, 
    apply = v22
};