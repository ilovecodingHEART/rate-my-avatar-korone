-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.createElement);
    local v1 = require(script.Parent.Parent.createReconciler);
    local v2 = require(script.Parent.Parent.createSpy);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.Type);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v1(v3);
    it("should be invoked when unmounted", function() --[[ Line: 12 ]]
        local v7 = v5:extend("MyComponent");
        local v8 = v2();
        v7.willUnmount = v8.value;
        v7.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
            return nil;
        end;
        local v10 = v0(v7);
        local v11 = v6.mountVirtualNode(v10, nil, "Test");
        v6.unmountVirtualNode(v11);
        expect(v8.callCount).to.equal(1);
        local v12 = v8:captureValues("self");
        expect(v4.of(v12.self)).to.equal(v4.StatefulComponentInstance);
    end);
end;