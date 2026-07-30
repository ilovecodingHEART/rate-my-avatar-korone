-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 5 ]] --[[ Name: cached ]]
    local v2 = {};
    local v3 = {};
    local function v5(v4) --[[ Line: 8 ]] --[[ Name: remove ]]
        v2[v4] = nil;
    end;
    return {
        getor = function(v6, ...) --[[ Line: 11 ]] --[[ Name: getor ]]
            if v2[v6] == nil then
                task.spawn(function(...) --[[ Line: 13 ]]
                    v3[v6] = {};
                    v2[v6] = {
                        pcall(v0, ...)
                    };
                    if v1 then
                        task.delay(v1, v5, v6);
                    end;
                    for _, v8 in v3[v6] do
                        task.spawn(v8);
                    end;
                    v3[v6] = nil;
                end, ...);
            end;
            if v2[v6] == nil then
                table.insert(v3[v6], coroutine.running());
                coroutine.yield();
            end;
            if v2[v6][1] then
                return unpack(v2[v6], 2);
            else
                error(v2[v6][2], 2);
                return;
            end;
        end, 
        remove = v5
    };
end;