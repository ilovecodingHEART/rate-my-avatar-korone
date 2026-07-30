-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.store);
return function(v1) --[[ Line: 12 ]] --[[ Name: effect ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    local v3 = nil;
    local v4 = false;
    local v5 = nil;
    local function v6() --[[ Line: 18 ]] --[[ Name: listener ]]
        -- upvalues: v3 (ref), v0 (ref), v2 (ref), v6 (copy), v1 (copy), v5 (ref), v4 (ref)
        if v3 then
            v3();
        end;
        v0.disconnect(v2, v6);
        local v7, v8 = v0.capture(v1, v5);
        v2 = v7;
        v3 = v8;
        if not v4 then
            v0.connect(v2, v6);
        end;
    end;
    v5 = function() --[[ Line: 31 ]] --[[ Name: disconnect ]]
        -- upvalues: v4 (ref), v0 (ref), v2 (ref), v6 (copy), v3 (ref)
        if v4 then
            return;
        else
            v4 = true;
            v0.disconnect(v2, v6);
            if v3 then
                v3();
            end;
            return;
        end;
    end;
    local v9, v10 = v0.capture(v1, v5);
    v2 = v9;
    v3 = v10;
    if not v4 then
        v0.connect(v2, v6);
    end;
    return v5;
end;