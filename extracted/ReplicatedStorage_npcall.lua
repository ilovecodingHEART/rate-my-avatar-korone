-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, ...) --[[ Line: 3 ]]
    return (function(v1, ...) --[[ Line: 4 ]]
        if v1 then
            return nil, ...;
        else
            return ...;
        end;
    end)(pcall(v0, ...));
end;