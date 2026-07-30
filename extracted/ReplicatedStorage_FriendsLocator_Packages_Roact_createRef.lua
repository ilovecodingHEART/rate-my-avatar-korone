-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Binding);
return function() --[[ Line: 7 ]] --[[ Name: createRef ]]
    local v1, _ = v0.create(nil);
    local v3 = {};
    setmetatable(v3, {
        __index = function(_, v5) --[[ Line: 16 ]] --[[ Name: __index ]]
            if v5 == "current" then
                return v1:getValue();
            else
                return v1[v5];
            end;
        end, 
        __newindex = function(_, v7, v8) --[[ Line: 23 ]] --[[ Name: __newindex ]]
            if v7 == "current" then
                error("Cannot assign to the 'current' property of refs", 2);
            end;
            v1[v7] = v8;
        end, 
        __tostring = function(_) --[[ Line: 30 ]] --[[ Name: __tostring ]]
            return ("RoactRef(%s)"):format((tostring(v1:getValue())));
        end
    });
    return v3;
end;