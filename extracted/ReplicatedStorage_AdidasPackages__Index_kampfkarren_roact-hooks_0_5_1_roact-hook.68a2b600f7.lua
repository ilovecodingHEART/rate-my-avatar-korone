-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 1 ]] --[[ Name: createUseBinding ]]
    return function(v2) --[[ Line: 2 ]]
        -- upvalues: v1 (copy), v0 (copy)
        return unpack(v1({
            v0.createBinding(v2)
        }).value);
    end;
end;