-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Players_0 = game:GetService("Players");
local v8 = require(script.Parent.Parent.Parent.charm);
local v9 = require(script.Parent.interval);
local v10 = require(script.Parent.patch);
local _ = require(script.Parent.types);
return function(v12) --[[ Line: 70 ]] --[[ Name: server ]]
    -- upvalues: v8 (copy), v9 (copy), v10 (copy), l_Players_0 (copy)
    local l_atoms_0 = v12.atoms;
    local v14 = v12.autoSerialize ~= false;
    local l_preserveHistory_0 = v12.preserveHistory;
    local v16 = v12.interval or 0;
    local v17 = {};
    local v18 = nil;
    local function _() --[[ Line: 79 ]] --[[ Name: createSnapshot ]]
        -- upvalues: l_atoms_0 (copy)
        local v19 = {};
        for v20, v21 in next, l_atoms_0 do
            v19[v20] = v21();
        end;
        return v19;
    end;
    v17.hydrate = function(_, v24) --[[ Line: 90 ]] --[[ Name: hydrate ]]
        -- upvalues: v18 (ref), l_atoms_0 (copy)
        assert(v18, "connect() must be called before hydrate()");
        local l_v18_0 = v18;
        local l_v24_0 = v24;
        local v27 = {
            type = "init"
        };
        local v28 = {};
        for v29, v30 in next, l_atoms_0 do
            v28[v29] = v30();
        end;
        v27.data = v28;
        l_v18_0(l_v24_0, v27);
    end;
    if l_preserveHistory_0 then
        local v31 = {};
        local v32 = {};
        for v33, v34 in next, l_atoms_0 do
            v32[v33] = v34();
        end;
        local l_v32_0 = v32;
        v6(v31, 1, l_v32_0);
        l_v32_0 = false;
        v17.connect = function(_, v37) --[[ Line: 105 ]] --[[ Name: connect ]]
            -- upvalues: v18 (ref), v31 (ref), l_atoms_0 (copy), v8 (ref), l_v32_0 (ref), v9 (ref), v10 (ref), v14 (copy), l_Players_0 (ref), v16 (copy)
            local v38 = {};
            v18 = v37;
            local function _(v39, v40, v41) --[[ Line: 110 ]] --[[ Name: pushSnapshot ]]
                -- upvalues: v31 (ref)
                local v42 = v31[#v31];
                local v43 = v31[#v31 - 1];
                if v43 and v43[v39] == v41 and v42[v39] == v41 then
                    v42[v39] = v40;
                    return;
                else
                    local v44 = table.clone(v42);
                    v44[v39] = v40;
                    table.insert(v31, v44);
                    return;
                end;
            end;
            for v46, v47 in next, l_atoms_0 do
                v38[v46] = v8.subscribe(v47, function(v48, v49) --[[ Line: 129 ]]
                    -- upvalues: v46 (copy), v31 (ref), l_v32_0 (ref)
                    local l_v46_0 = v46;
                    local v51 = v31[#v31];
                    local v52 = v31[#v31 - 1];
                    if v52 and v52[l_v46_0] == v49 and v51[l_v46_0] == v49 then
                        v51[l_v46_0] = v48;
                    else
                        local v53 = table.clone(v51);
                        v53[l_v46_0] = v48;
                        table.insert(v31, v53);
                    end;
                    l_v32_0 = true;
                end);
            end;
            local v60 = v9(function() --[[ Line: 135 ]]
                -- upvalues: l_v32_0 (ref), v31 (ref), v10 (ref), v14 (ref), l_Players_0 (ref), v37 (copy)
                if not l_v32_0 then
                    return;
                else
                    local v54 = {};
                    local v55 = nil;
                    for v56, v57 in next, v31 do
                        v55 = v57;
                        if v56 ~= 1 then
                            table.insert(v54, {
                                type = "patch", 
                                data = v10.diff(v31[v56 - 1], v57, v14)
                            });
                        end;
                    end;
                    v31 = {
                        v55
                    };
                    l_v32_0 = false;
                    for _, v59 in next, l_Players_0:GetPlayers() do
                        v37(v59, unpack(v54));
                    end;
                    return;
                end;
            end, v16);
            return function() --[[ Line: 164 ]]
                -- upvalues: v60 (copy), v38 (copy)
                v60();
                for _, v62 in next, v38 do
                    v62();
                end;
            end;
        end;
        v17._sendPatch = function(_, v64) --[[ Line: 173 ]] --[[ Name: _sendPatch ]]
            -- upvalues: v18 (ref), l_v32_0 (ref), v31 (ref), v10 (ref), v14 (copy)
            assert(v18, "connect() must be called before _sendPatch()");
            if not l_v32_0 then
                return;
            else
                local v65 = {};
                for v66, v67 in next, v31 do
                    if v66 ~= 1 then
                        table.insert(v65, {
                            type = "patch", 
                            data = v10.diff(v31[v66 - 1], v67, v14)
                        });
                    end;
                end;
                v31 = {
                    v31[#v31]
                };
                l_v32_0 = false;
                v18(v64, unpack(v65));
                return;
            end;
        end;
        return v17;
    else
        local v68 = {};
        for v69, v70 in next, l_atoms_0 do
            v68[v69] = v70();
        end;
        local l_v68_0 = v68;
        v68 = table.clone(l_v68_0);
        local v72 = false;
        v17.connect = function(_, v74) --[[ Line: 206 ]] --[[ Name: connect ]]
            -- upvalues: v18 (ref), l_atoms_0 (copy), v8 (ref), v68 (copy), v72 (ref), v9 (ref), v10 (ref), l_v68_0 (ref), v14 (copy), l_Players_0 (ref), v16 (copy)
            local v75 = {};
            v18 = v74;
            for v76, v77 in next, l_atoms_0 do
                v75[v76] = v8.subscribe(v77, function(v78) --[[ Line: 213 ]]
                    -- upvalues: v68 (ref), v76 (copy), v72 (ref)
                    v68[v76] = v78;
                    v72 = true;
                end);
            end;
            local v82 = v9(function() --[[ Line: 219 ]]
                -- upvalues: v72 (ref), v10 (ref), l_v68_0 (ref), v68 (ref), v14 (ref), l_Players_0 (ref), v74 (copy)
                if not v72 then
                    return;
                else
                    local v79 = {
                        type = "patch", 
                        data = v10.diff(l_v68_0, v68, v14)
                    };
                    l_v68_0 = table.clone(v68);
                    v72 = false;
                    for _, v81 in next, l_Players_0:GetPlayers() do
                        v74(v81, v79);
                    end;
                    return;
                end;
            end, v16);
            return function() --[[ Line: 237 ]]
                -- upvalues: v82 (copy), v75 (copy)
                v82();
                for _, v84 in next, v75 do
                    v84();
                end;
            end;
        end;
        v17._sendPatch = function(_, v86) --[[ Line: 246 ]] --[[ Name: _sendPatch ]]
            -- upvalues: v18 (ref), v72 (ref), v10 (ref), l_v68_0 (ref), v68 (copy), v14 (copy)
            assert(v18, "connect() must be called before _sendPatch()");
            if not v72 then
                return;
            else
                local v87 = {
                    type = "patch", 
                    data = v10.diff(l_v68_0, v68, v14)
                };
                l_v68_0 = table.clone(v68);
                v72 = false;
                v18(v86, v87);
                return;
            end;
        end;
        return v17;
    end;
end;