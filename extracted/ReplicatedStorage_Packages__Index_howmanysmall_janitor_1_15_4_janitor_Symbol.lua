-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 2 ]] --[[ Name: Symbol ]]
    local v1 = newproxy(true);
    getmetatable(v1).__tostring = function() --[[ Line: 5 ]] --[[ Name: __tostring ]]
        return v0;
    end;
    return v1;
end;