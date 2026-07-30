-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = Vector2.new(1280, 832);
return function(v1) --[[ Line: 20 ]] --[[ Name: usePx ]]
    -- upvalues: v0 (copy)
    local v2, v3 = v1.useState(1);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v7 = v1.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: l_CurrentCamera_0 (copy), v0 (ref), v3 (copy)
        local v5 = math.log(l_CurrentCamera_0.ViewportSize.X / v0.X, 2);
        local v6 = v5 + (math.log(l_CurrentCamera_0.ViewportSize.Y / v0.Y, 2) - v5) * 0.5;
        v3((math.max(2 ^ v6, 0.5)));
    end, {
        v2
    });
    v1.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy), l_CurrentCamera_0 (copy)
        v7();
        local v8 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v7);
        return function() --[[ Line: 38 ]]
            -- upvalues: v8 (copy)
            v8:Disconnect();
        end;
    end, {});
    return (v1.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v2 (copy)
        return (setmetatable({
            even = function(_, v10) --[[ Line: 45 ]] --[[ Name: even ]]
                -- upvalues: v2 (ref)
                return __2021_round(v10 * v2 * 0.5) * 2;
            end, 
            scale = function(_, v12) --[[ Line: 48 ]] --[[ Name: scale ]]
                -- upvalues: v2 (ref)
                return v12 * v2;
            end, 
            floor = function(_, v14) --[[ Line: 51 ]] --[[ Name: floor ]]
                -- upvalues: v2 (ref)
                return (math.floor(v14 * v2));
            end, 
            ceil = function(_, v16) --[[ Line: 54 ]] --[[ Name: ceil ]]
                -- upvalues: v2 (ref)
                return (math.ceil(v16 * v2));
            end
        }, {
            __call = function(_, v18) --[[ Line: 58 ]] --[[ Name: __call ]]
                -- upvalues: v2 (ref)
                return (__2021_round(v18 * v2));
            end
        }));
    end, {
        v2
    }));
end;