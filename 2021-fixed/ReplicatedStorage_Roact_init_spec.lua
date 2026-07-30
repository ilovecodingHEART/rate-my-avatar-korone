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

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    it("should load with all public APIs", function() --[[ Line: 4 ]]
        local v1 = {
            createElement = "function", 
            createFragment = "function", 
            createRef = "function", 
            forwardRef = "function", 
            createBinding = "function", 
            joinBindings = "function", 
            mount = "function", 
            unmount = "function", 
            update = "function", 
            oneChild = "function", 
            setGlobalConfig = "function", 
            createContext = "function", 
            reify = "function", 
            teardown = "function", 
            reconcile = "function", 
            Component = true, 
            PureComponent = true, 
            Portal = true, 
            Children = true, 
            Event = true, 
            Change = true, 
            Ref = true, 
            None = true, 
            UNSTABLE = true
        };
        expect(v0).to.be.ok();
        for v2, v3 in pairs(v1) do
            local _ = nil;
            if not __2021_if(function() return typeof(v3) == "string" end, function() return typeof(v0[v2]) == v3 end, function() return v0[v2] ~= nil end) then
                local v5 = typeof(v3) == "boolean" and "present" or "of type " .. v3;
                local v6 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(tostring(v2), v5, (typeof(v0[v2])));
                error(v6);
            end;
        end;
        for v7 in pairs(v0) do
            if v1[v7] == nil then
                local v8 = ("Found unknown public API key %q!"):format((tostring(v7)));
                error(v8);
            end;
        end;
    end);
end;