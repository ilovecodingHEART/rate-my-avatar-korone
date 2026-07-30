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

local v0 = require(script.Parent.store);
local v1 = require(script.Parent.subscribe);
local _ = require(script.Parent.types);
local function v3() --[[ Line: 6 ]] --[[ Name: noop ]]

end;
return function(v4, v5) --[[ Line: 17 ]] --[[ Name: observe ]]
    -- upvalues: v3 (copy), v1 (copy), v0 (copy)
    local v6 = {};
    local function v12(v7) --[[ Line: 20 ]] --[[ Name: listener ]]
        -- upvalues: v6 (copy), v5 (copy), v3 (ref)
        for v8, v9 in next, v6 do
            if v7[v8] == nil then
                v6[v8] = nil;
                v9();
            end;
        end;
        for v10, v11 in next, v7 do
            if not v6[v10] then
                v6[v10] = v5(v11, v10) or v3;
            end;
        end;
    end;
    local v13 = v1(v4, v12);
    v0.peek(function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy), v4 (copy)
        v12(v4());
    end);
    return function() --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v6 (copy)
        v13();
        for _, v15 in next, v6 do
            v15();
        end;
        __2021_clear(v6);
    end;
end;