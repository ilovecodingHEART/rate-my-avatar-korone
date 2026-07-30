-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x1, compound-assign x0
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

return function(v0, v1, v2, v3) --[[ Line: 1 ]] --[[ Name: createUseContext ]]
    local v4 = setmetatable({}, {
        __index = v0
    });
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy), v1 (copy)
        local v8 = v3(function() --[[ Line: 10 ]]
            -- upvalues: v4 (ref), v5 (copy)
            local v6 = nil;
            v4.props = {
                render = function(v7) --[[ Line: 14 ]] --[[ Name: render ]]
                    -- upvalues: v6 (ref)
                    v6 = v7;
                end
            };
            v5.Consumer.render(v4);
            return v6;
        end, {});
        v5.Consumer.init(v4);
        local l_contextEntry_0 = v4.contextEntry;
        local v10, v11 = v2(__2021_if(function() return l_contextEntry_0 == nil end, function() return v8 end, function() return l_contextEntry_0.value end));
        v1(function() --[[ Line: 28 ]]
            -- upvalues: l_contextEntry_0 (copy), v10 (copy), v8 (copy), v11 (copy)
            if l_contextEntry_0 == nil then
                if v10 ~= v8 then
                    v11(v8);
                end;
                return;
            else
                if v10 ~= l_contextEntry_0.value then
                    v11(l_contextEntry_0.value);
                end;
                return l_contextEntry_0.onUpdate:subscribe(v11);
            end;
        end, {
            l_contextEntry_0
        });
        return v10;
    end;
end;