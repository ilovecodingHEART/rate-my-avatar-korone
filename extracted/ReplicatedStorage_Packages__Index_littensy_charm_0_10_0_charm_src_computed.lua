-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.atom);
local v1 = require(script.Parent.store);
local _ = require(script.Parent.types);
return function(v3, v4) --[[ Line: 16 ]] --[[ Name: computed ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v5, v6 = v1.capture(v3);
    local v7 = v0(v6, v4);
    local v8 = setmetatable({
        current = v7
    }, {
        __mode = "v"
    });
    local function v9() --[[ Line: 21 ]] --[[ Name: listener ]]
        -- upvalues: v8 (copy), v1 (ref), v5 (ref), v9 (copy), v6 (ref), v3 (copy)
        local l_current_0 = v8.current;
        if l_current_0 then
            v1.disconnect(v5, v9);
            local v11, v12 = v1.capture(v3);
            v5 = v11;
            v6 = v12;
            v1.connect(v5, v9, l_current_0);
            l_current_0(v6);
        end;
    end;
    v1.connect(v5, v9, v7);
    return v7;
end;