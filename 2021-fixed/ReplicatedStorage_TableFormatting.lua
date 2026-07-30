-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x6, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function _(v0, v1) --[[ Line: 2 ]] --[[ Name: leftPad ]]
    return string.format("%" .. v1 .. "s", v0);
end;
return {
    printTable = function(v3, v4) --[[ Line: 6 ]] --[[ Name: printTable ]]
        local v5 = {};
        local v6 = 0;
        for v7, v8 in pairs(v3) --[[ 2021 ]] do
            v8 = tostring(v8);
            if v5[v7] == nil or #v8 > v5[v7] then
                v5[v7] = #v8;
            end;
        end;
        for _, v10 in pairs(v4) --[[ 2021 ]] do
            for v11, v12 in pairs(v10) --[[ 2021 ]] do
                v12 = tostring(v12);
                if v5[v11] == nil or #v12 > v5[v11] then
                    v5[v11] = #v12;
                end;
            end;
        end;
        local v13 = "\n";
        for v14, v15 in pairs(v3) --[[ 2021 ]] do
            v15 = tostring(v15);
            v6 = v6 + v5[v14];
            local l_v13_0 = v13;
            local l_v15_0 = v15;
            local v18 = v5[v14];
            v13 = l_v13_0 .. string.format("%" .. v18 .. "s", l_v15_0);
            if v14 ~= #v3 then
                v13 = v13 .. " | ";
            end;
        end;
        v13 = v13 .. "\n" .. string.rep("-", v6 + #v3 * 3);
        for _, v20 in pairs(v4) --[[ 2021 ]] do
            v13 = v13 .. "\n";
            for v21, v22 in pairs(v20) --[[ 2021 ]] do
                v22 = tostring(v22);
                local l_v13_1 = v13;
                local l_v22_0 = v22;
                local v25 = v5[v21];
                v13 = l_v13_1 .. string.format("%" .. v25 .. "s", l_v22_0);
                if v21 ~= #v20 then
                    v13 = v13 .. " | ";
                end;
            end;
        end;
        print(v13);
    end
};