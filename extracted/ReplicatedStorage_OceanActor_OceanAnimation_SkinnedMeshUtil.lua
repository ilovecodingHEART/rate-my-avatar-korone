-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v6 = {
    collectBonesByName = function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: collectBonesByName ]]
        v2 = v2 or 0;
        for _, v4 in ipairs(v0) do
            if v4:IsA("Bone") then
                local v5 = tonumber(v4.Name);
                if v5 ~= nil then
                    v1[v5 + v2] = v4;
                end;
            end;
        end;
    end
};
v6.collectMeshPartBonesByName = function(v7, v8) --[[ Line: 16 ]] --[[ Name: collectMeshPartBonesByName ]]
    local l_v7_Children_0 = v7:GetChildren();
    local v10 = table.create(#l_v7_Children_0);
    v6.collectBonesByName(l_v7_Children_0, v10, v8);
    return v10;
end;
table.freeze(v6);
return v6;