-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 4 ]] --[[ Name: mklock ]]
    local v0 = nil;
    local v1 = {};
    return {
        waitObtain = function() --[[ Line: 8 ]] --[[ Name: waitObtain ]]
            if v0 == nil then
                v0 = coroutine.running();
                return;
            else
                table.insert(v1, coroutine.running());
                coroutine.yield();
                return;
            end;
        end, 
        release = function() --[[ Line: 16 ]] --[[ Name: release ]]
            local v2 = table.remove(v1, 1);
            if v2 then
                v0 = v2;
                task.spawn(v2);
            end;
        end
    };
end;