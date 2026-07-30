-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1, v2) --[[ Line: 4 ]]
    if v2 <= v0 then
        return v2;
    else
        return v0 + math.min(v2 - v0, v1) / 2;
    end;
end;