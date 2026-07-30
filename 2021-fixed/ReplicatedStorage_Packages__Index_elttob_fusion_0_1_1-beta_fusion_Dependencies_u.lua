-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clear
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 11 ]] --[[ Name: updateAll ]]
    local v3 = {};
    local v4 = {};
    local v5 = 0;
    local v6 = {};
    local v7 = 0;
    for v8 in pairs(v2.dependentSet) do
        v5 = v5 + 1;
        v4[v5] = v8;
    end;
    repeat
        local v9 = true;
        for _, v11 in ipairs(v4) do
            v3[v11] = true;
            if v11.dependentSet ~= nil then
                for v12 in pairs(v11.dependentSet) do
                    v7 = v7 + 1;
                    v6[v7] = v12;
                    v9 = false;
                end;
            end;
        end;
        local l_v6_0 = v6;
        v6 = v4;
        v4 = l_v6_0;
        v5 = v7;
        v7 = 0;
        __2021_clear(v6);
    until v9;
    v5 = 0;
    __2021_clear(v4);
    for v14 in pairs(v2.dependentSet) do
        v5 = v5 + 1;
        v4[v5] = v14;
    end;
    repeat
        local v15 = true;
        for _, v17 in ipairs(v4) do
            v3[v17] = nil;
            if v17:update() and v17.dependentSet ~= nil then
                for v18 in pairs(v17.dependentSet) do
                    local v19 = true;
                    for v20 in pairs(v18.dependencySet) do
                        if v3[v20] then
                            v19 = false;
                            break;
                        end;
                    end;
                    if v19 then
                        v7 = v7 + 1;
                        v6[v7] = v18;
                        v15 = false;
                    end;
                end;
            end;
        end;
        if not v15 then
            local l_v6_1 = v6;
            v6 = v4;
            v4 = l_v6_1;
            v5 = v7;
            v7 = 0;
            __2021_clear(v6);
        end;
    until v15;
end;