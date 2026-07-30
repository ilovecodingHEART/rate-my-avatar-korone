-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.Parent.Flipper);
local v2 = require(script.Parent.AssignedBinding);
return function(v3) --[[ Line: 6 ]] --[[ Name: getBinding ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    assert(v3, "Missing argument #1: motor");
    if not v1.isMotor(v3) then
        error("Provided value is not a motor!", 2);
    end;
    if v3[v2] then
        return v3[v2];
    else
        local v4, v5 = v0.createBinding(v3:getValue());
        v3:onStep(v5);
        v3[v2] = v4;
        return v4;
    end;
end;