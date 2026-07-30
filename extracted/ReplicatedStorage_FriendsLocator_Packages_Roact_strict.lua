-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function(v0, v1) --[[ Line: 2 ]] --[[ Name: strict ]]
    v1 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v3) --[[ Line: 6 ]] --[[ Name: __index ]]
            local v4 = ("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1);
            error(v4, 2);
        end, 
        __newindex = function(_, v6, _) --[[ Line: 12 ]] --[[ Name: __newindex ]]
            local v8 = ("%q (%s) is not a valid member of %s"):format(tostring(v6), typeof(v6), v1);
            error(v8, 2);
        end
    }));
end;