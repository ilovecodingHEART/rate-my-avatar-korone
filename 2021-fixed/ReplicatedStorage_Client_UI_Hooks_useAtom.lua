-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Charm_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Charm"));
return function(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: useAtom ]]
    -- upvalues: l_Charm_0 (copy)
    local v4, v5 = v1.useState(v2);
    v1.useEffect(function() --[[ Line: 6 ]]
        -- upvalues: v5 (copy), v2 (copy), l_Charm_0 (ref)
        v5(v2());
        return l_Charm_0.subscribe(v2, v5);
    end, v3 or {});
    return v4;
end;