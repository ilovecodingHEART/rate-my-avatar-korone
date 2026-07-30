-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function v0(v1) --[[ Line: 20 ]] --[[ Name: cleanup ]]
    local v2 = typeof(v1);
    if v2 == "Instance" then
        v1:Destroy();
        return;
    elseif v2 == "RBXScriptConnection" then
        v1:Disconnect();
        return;
    elseif v2 == "function" then
        v1();
        return;
    else
        if v2 == "table" then
            if typeof(v1.destroy) == "function" then
                v1:destroy();
                return;
            elseif typeof(v1.Destroy) == "function" then
                v1:Destroy();
                return;
            elseif v1[1] ~= nil then
                for _, v4 in ipairs(v1) do
                    v0(v4);
                end;
            end;
        end;
        return;
    end;
end;
return v0;