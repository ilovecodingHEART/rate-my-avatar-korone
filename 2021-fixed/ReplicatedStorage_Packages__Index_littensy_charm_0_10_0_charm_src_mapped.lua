-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clone
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clone on this client (2022 API); shallow clone + metatable, like the real one
local function __2021_clone(vt)
	local vn = setmetatable({}, getmetatable(vt));
	for k, v in pairs(vt) do vn[k] = v end
	return vn
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.atom);
local v1 = require(script.Parent.store);
local v2 = require(script.Parent.subscribe);
local _ = require(script.Parent.types);
return function(v4, v5) --[[ Line: 23 ]] --[[ Name: mapped ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local v6 = v0({});
    local v7 = setmetatable({
        current = v6
    }, {
        __mode = "v"
    });
    local v8 = {};
    local v9 = nil;
    local function v19(v10) --[[ Line: 29 ]] --[[ Name: listener ]]
        -- upvalues: v7 (copy), v9 (ref), v5 (copy), v8 (ref)
        local l_current_0 = v7.current;
        if not l_current_0 then
            return v9();
        else
            local v12 = __2021_clone(l_current_0());
            local v13 = {};
            for v14, v15 in next, v10 do
                local v16, v17 = v5(v15, v14);
                if v17 == nil then
                    v17 = v14;
                end;
                if v12[v17] ~= v16 then
                    v12[v17] = v16;
                else
                    v13[v17] = v14;
                end;
            end;
            for v18 in next, v8 do
                if v13[v18] == nil and v12[v18] == v8[v18] then
                    v12[v18] = nil;
                end;
            end;
            v8 = v12;
            l_current_0(v12);
            return;
        end;
    end;
    v9 = v2(v4, v19);
    v1.peek(function() --[[ Line: 64 ]]
        -- upvalues: v19 (copy), v4 (copy)
        v19(v4());
    end);
    return v6;
end;