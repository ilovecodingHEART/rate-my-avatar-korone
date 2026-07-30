-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.assertDeepEqual);
return function(v1) --[[ Line: 12 ]] --[[ Name: createSpy ]]
    local v2 = {
        callCount = 0, 
        values = {}, 
        valuesLength = 0
    };
    v2.value = function(...) --[[ Line: 17 ]]
        v2.callCount = v2.callCount + 1;
        v2.values = {
            ...
        };
        v2.valuesLength = select("#", ...);
        if v1 ~= nil then
            return v1(...);
        else
            return nil;
        end;
    end;
    v2.assertCalledWith = function(_, ...) --[[ Line: 28 ]]
        local v4 = select("#", ...);
        if v2.valuesLength ~= v4 then
            error(("Expected %d arguments, but was called with %d arguments"):format(v2.valuesLength, v4), 2);
        end;
        for v5 = 1, v4 do
            assert(select(v5, ...) == v2.values[v5], "value differs");
        end;
    end;
    v2.assertCalledWithDeepEqual = function(_, ...) --[[ Line: 42 ]]
        local v7 = select("#", ...);
        if v2.valuesLength ~= v7 then
            error(("Expected %d arguments, but was called with %d arguments"):format(v2.valuesLength, v7), 2);
        end;
        for v8 = 1, v7 do
            local v9 = select(v8, ...);
            v0(v2.values[v8], v9);
        end;
    end;
    v2.captureValues = function(_, ...) --[[ Line: 56 ]]
        local v11 = select("#", ...);
        local v12 = {};
        assert(v2.valuesLength == v11, "length of expected values differs from stored values");
        for v13 = 1, v11 do
            v12[select(v13, ...)] = v2.values[v13];
        end;
        return v12;
    end;
    setmetatable(v2, {
        __index = function(_, v15) --[[ Line: 71 ]] --[[ Name: __index ]]
            error(("%q is not a valid member of spy"):format(v15));
        end
    });
    return v2;
end;