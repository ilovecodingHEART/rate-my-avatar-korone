-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x1, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.types);
return function(v1) --[[ Line: 8 ]] --[[ Name: flatten ]]
    local v2 = {};
    local function v3(v4, v5) --[[ Line: 11 ]] --[[ Name: visit ]]
        -- upvalues: v3 (copy), v2 (copy)
        for v6, v7 in pairs(v4) --[[ 2021 ]] do
            local v8 = __2021_if(function() return v5 == "" end, function() return v6 end, function() return v5 .. "/" .. v6 end);
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