-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 1 ]] --[[ Name: dependenciesDifferent ]]
    local v2 = 0;
    for v3, v4 in pairs(v0) do
        v2 = v2 + 1;
        if v4 ~= v1[v3] then
            return true;
        end;
    end;
    for _ in pairs(v1) do
        v2 = v2 - 1;
    end;
    if v2 ~= 0 then
        return true;
    else
        return false;
    end;
end;