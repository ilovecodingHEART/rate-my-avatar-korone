-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Packages.Cryo);
return function(v1, v2, v3) --[[ Line: 18 ]] --[[ Name: selectUserIdsByDistance ]]
    local v6 = v0.List.sort(v1, function(v4, v5) --[[ Line: 20 ]]
        return (v2[v4] or 1e999) < (v2[v5] or 1e999);
    end);
    local v7 = {};
    for _, v9 in ipairs(v6) do
        if #v7 < v3.maxLocators then
            if (v2[v9] or 0) > v3.thresholdDistance then
                table.insert(v7, v9);
            end;
        else
            break;
        end;
    end;
    return v7;
end;