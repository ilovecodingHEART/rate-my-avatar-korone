-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: useProperty ]]
    local v3, v4 = v2.useState(v0[v1]);
    v2.useEffect(function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy), v1 (copy), v4 (copy)
        local v5 = v0:GetPropertyChangedSignal(v1):Connect(function() --[[ Line: 5 ]]
            -- upvalues: v4 (ref), v0 (ref), v1 (ref)
            v4(v0[v1]);
        end);
        return function() --[[ Line: 9 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    end, {
        v0, 
        v1
    });
    return v3;
end;