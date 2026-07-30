-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 3 ]] --[[ Name: createUseReducer ]]
    return function(v2, v3) --[[ Line: 4 ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v4, v5 = v1(v3);
        return v4, (v0(function(v6) --[[ Line: 6 ]]
            -- upvalues: v5 (copy), v2 (copy), v4 (copy)
            v5(v2(v4, v6));
        end, {
            v4
        }));
    end;
end;