-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0) --[[ Line: 4 ]] --[[ Name: createUseCallback ]]
    return function(v1, v2) --[[ Line: 5 ]]
        -- upvalues: v0 (copy)
        return v0(function() --[[ Line: 6 ]]
            -- upvalues: v1 (copy)
            return v1;
        end, v2);
    end;
end;