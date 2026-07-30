-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.types);
return function(v1) --[[ Line: 8 ]] --[[ Name: flatten ]]
    local v2 = {};
    local function v3(v4, v5) --[[ Line: 11 ]] --[[ Name: visit ]]
        -- upvalues: v3 (copy), v2 (copy)
        for v6, v7 in v4 do
            local v8 = if v5 == "" then v6 else v5 .. "/" .. v6;
            if type(v7) == "table" then
                v3(v7, v8);
            else
                v2[v8] = v7;
            end;
        end;
    end;
    v3(v1, "");
    return v2;
end;