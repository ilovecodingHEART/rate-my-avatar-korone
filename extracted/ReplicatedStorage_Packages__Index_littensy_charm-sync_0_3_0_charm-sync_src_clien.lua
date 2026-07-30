-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Parent.charm);
local v1 = require(script.Parent.patch);
local _ = require(script.Parent.types);
return function(v3) --[[ Line: 36 ]] --[[ Name: client ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_atoms_0 = v3.atoms;
    local v5 = v3.ignoreUnhydrated ~= false;
    local v6 = {};
    local v7 = false;
    local function _(v8) --[[ Line: 43 ]] --[[ Name: hydrate ]]
        -- upvalues: v7 (ref), l_atoms_0 (copy)
        v7 = true;
        for v9, v10 in next, v8 do
            l_atoms_0[v9](v10);
        end;
    end;
    local function v18(v12) --[[ Line: 52 ]] --[[ Name: apply ]]
        -- upvalues: l_atoms_0 (copy), v1 (ref)
        local v13 = {};
        for v14, v15 in next, l_atoms_0 do
            v13[v14] = v15();
        end;
        v13 = v1.apply(v13, v12);
        for v16, v17 in next, l_atoms_0 do
            v17(v13[v16]);
        end;
    end;
    v6.sync = function(_, ...) --[[ Line: 66 ]] --[[ Name: sync ]]
        -- upvalues: v0 (ref), v7 (ref), l_atoms_0 (copy), v5 (copy), v18 (copy)
        for v20 = 1, select("#", ...) do
            local v21 = select(v20, ...);
            v0.batch(function() --[[ Line: 70 ]]
                -- upvalues: v21 (copy), v7 (ref), l_atoms_0 (ref), v5 (ref), v18 (ref)
                if v21.type == "init" then
                    local l_data_0 = v21.data;
                    v7 = true;
                    for v23, v24 in next, l_data_0 do
                        l_atoms_0[v23](v24);
                    end;
                    return;
                else
                    if not v5 or v7 then
                        v18(v21.data);
                    end;
                    return;
                end;
            end);
        end;
    end;
    return v6;
end;