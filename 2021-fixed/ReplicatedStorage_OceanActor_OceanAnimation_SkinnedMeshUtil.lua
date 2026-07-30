-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
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
__2021_freeze(v6);
return v6;