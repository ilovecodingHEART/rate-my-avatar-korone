-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 5 ]] --[[ Name: findWhere ]]
    for v2 = 1, #v0 do
        if v1(v0[v2], v2) then
            return v2;
        end;
    end;
    return nil;
end;