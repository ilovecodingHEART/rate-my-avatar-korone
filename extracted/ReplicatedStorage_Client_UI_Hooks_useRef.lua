-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 1 ]] --[[ Name: useRef ]]
    return v0.useMemo(function() --[[ Line: 2 ]]
        -- upvalues: v1 (copy)
        return (setmetatable({
            current = v1
        }, {
            __call = function(v2, v3) --[[ Line: 6 ]] --[[ Name: __call ]]
                v2.current = v3;
            end, 
            __index = function(v4, v5) --[[ Line: 9 ]] --[[ Name: __index ]]
                return (rawget(v4, v5));
            end
        }));
    end, {});
end;