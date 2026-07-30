-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 4 ]] --[[ Name: keys ]]
    local v1 = {};
    local v2 = 1;
    for v3 in pairs(v0) do
        v1[v2] = v3;
        v2 = v2 + 1;
    end;
    return v1;
end;