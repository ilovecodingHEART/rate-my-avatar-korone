-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: springCoefficients ]]
    if v0 == 0 or v2 == 0 then
        return 1, 0, 0, 1;
    elseif v1 > 1 then
        local v3 = math.sqrt(v1 ^ 2 - 1);
        local v4 = (-v3 - v1) * v2;
        local v5 = (v3 - v1) * v2;
        local v6 = 1 / (v4 - v5);
        local v7 = math.exp(v0 * v4);
        local v8 = math.exp(v0 * v5);
        return (v8 * v4 - v7 * v5) * v6, (v7 - v8) * v6, v4 * v5 * (-v7 + v8) * v6, (v4 * v7 - v5 * v8) * v6;
    elseif v1 == 1 then
        local v9 = v0 * v2;
        local v10 = math.exp(-v9);
        return v10 * (1 + v9), v10 * v0, -v10 * (v0 * v2 * v2), v10 * (1 - v9);
    else
        local v11 = math.sqrt(1 - v1 ^ 2) * v2;
        local v12 = math.exp(-v0 * v1 * v2);
        local v13 = math.sin(v0 * v11);
        local v14 = v11 * math.cos(v0 * v11);
        local v15 = v1 * v2 * v13;
        local v16 = 1 / v11;
        return v12 * (v14 + v15) * v16, v12 * v13 * v16, -v12 * (v11 * v11 + v1 * v1 * v2 * v2) * v13 * v16, v12 * (v14 - v15) * v16;
    end;
end;