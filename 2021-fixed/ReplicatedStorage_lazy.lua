-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, ...) --[[ Line: 5 ]] --[[ Name: lazy ]]
    local v1 = nil;
    local v2 = nil;
    local v5 = task.spawn(function(...) --[[ Line: 8 ]]
        coroutine.yield();
        v2 = {};
        v1 = {
            pcall(v0, ...)
        };
        for _, v4 in pairs(v2) --[[ 2021 ]] do
            task.spawn(v4);
        end;
        v2 = nil;
    end, ...);
    return function() --[[ Line: 17 ]]
        if v1 == nil then
            task.spawn(v5);
        end;
        if v1 == nil then
            table.insert(v2, coroutine.running());
            coroutine.yield();
        end;
        if v1[1] then
            return unpack(v1, 2);
        else
            error(v1[2], 2);
            return;
        end;
    end;
end;