-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_typeof_0 = typeof;
return function(v1) --[[ Line: 5 ]] --[[ Name: typeof ]]
    -- upvalues: l_typeof_0 (copy)
    local v2 = l_typeof_0(v1);
    if v2 ~= "table" then
        return v2;
    else
        local v3 = getmetatable(v1);
        if l_typeof_0(v3) ~= "table" then
            return v2;
        else
            local l___type_0 = v3.__type;
            if l___type_0 == nil then
                return v2;
            else
                return l___type_0;
            end;
        end;
    end;
end;