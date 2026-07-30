-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Flipper);
local function v3(v1) --[[ Line: 3 ]] --[[ Name: createMotor ]]
    -- upvalues: v0 (copy)
    local v2 = type(v1);
    if v2 == "number" then
        return v0.SingleMotor.new(v1);
    elseif v2 == "table" then
        return v0.GroupMotor.new(v1);
    else
        error(("Invalid type for initialValue. Expected \"number\" or \"table\", got \"%s\""):format(v2));
        return;
    end;
end;
return function(v4, v5) --[[ Line: 14 ]] --[[ Name: useMotor ]]
    -- upvalues: v3 (copy)
    local l_value_0 = v4.useValue(v3(v5)).value;
    v4.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: l_value_0 (copy)
        return function() --[[ Line: 18 ]]
            -- upvalues: l_value_0 (ref)
            l_value_0:destroy();
        end;
    end, {});
    return l_value_0;
end;