-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.store);
local _ = require(script.Parent.types);
return function(v2, v3) --[[ Line: 14 ]] --[[ Name: subscribe ]]
    -- upvalues: v0 (copy)
    local v4, v5 = v0.capture(v2);
    local v6 = false;
    local function v7() --[[ Line: 18 ]] --[[ Name: handler ]]
        -- upvalues: v5 (ref), v0 (ref), v4 (ref), v7 (copy), v2 (copy), v6 (ref), v3 (copy)
        local l_v5_0 = v5;
        v0.disconnect(v4, v7);
        local v9, v10 = v0.capture(v2);
        v4 = v9;
        v5 = v10;
        if not v6 then
            v0.connect(v4, v7);
        end;
        if v5 ~= l_v5_0 then
            v3(v5, l_v5_0);
        end;
    end;
    v0.connect(v4, v7);
    return function() --[[ Line: 35 ]]
        -- upvalues: v6 (ref), v0 (ref), v4 (ref), v7 (copy)
        if not v6 then
            v6 = true;
            v0.disconnect(v4, v7);
        end;
    end;
end;