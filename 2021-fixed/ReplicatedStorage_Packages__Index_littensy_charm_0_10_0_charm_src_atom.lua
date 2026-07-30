-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.store);
local _ = require(script.Parent.types);
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: atom ]]
    -- upvalues: v0 (copy)
    local v4 = v3 and v3.equals;
    local function v5(...) --[[ Line: 16 ]] --[[ Name: atom ]]
        -- upvalues: v0 (ref), v5 (copy), v2 (ref), v4 (copy)
        if select("#", ...) == 0 then
            local l_index_0 = v0.capturing.index;
            if l_index_0 > 0 then
                v0.capturing.stack[l_index_0][v5] = true;
            end;
            return v2;
        else
            local v7 = v0.peek(..., v2);
            if v2 ~= v7 and (not v4 or not v4(v2, v7)) then
                v2 = v7;
                v0.notify(v5);
            end;
            return v2;
        end;
    end;
    v0.listeners[v5] = setmetatable({}, {
        __mode = "v"
    });
    return v5;
end;