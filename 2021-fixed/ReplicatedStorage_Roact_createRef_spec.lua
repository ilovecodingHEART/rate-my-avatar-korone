-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Binding);
    local v1 = require(script.Parent.Type);
    local v2 = require(script.Parent.createRef);
    it("should create refs, which are specialized bindings", function() --[[ Line: 7 ]]
        local v3 = v2();
        expect(v1.of(v3)).to.equal(v1.Binding);
        expect(v3.current).to.equal(nil);
    end);
    it("should have a 'current' field that is the same as the internal binding's value", function() --[[ Line: 14 ]]
        local v4 = v2();
        expect(v4.current).to.equal(nil);
        v0.update(v4, 10);
        expect(v4.current).to.equal(10);
    end);
    it("should support tostring on refs", function() --[[ Line: 23 ]]
        local v5 = v2();
        expect(v5.current).to.equal(nil);
        expect((tostring(v5))).to.equal("RoactRef(nil)");
        v0.update(v5, 10);
        expect((tostring(v5))).to.equal("RoactRef(10)");
    end);
    it("should not allow assignments to the 'current' field", function() --[[ Line: 33 ]]
        local v6 = v2();
        expect(v6.current).to.equal(nil);
        v0.update(v6, 99);
        expect(v6.current).to.equal(99);
        expect(function() --[[ Line: 41 ]]
            v6.current = 77;
        end).to.throw();
        expect(v6.current).to.equal(99);
    end);
    it("should return the same thing from getValue as its current field", function() --[[ Line: 48 ]]
        local v7 = v2();
        v0.update(v7, 10);
        expect(v7:getValue()).to.equal(10);
        expect(v7:getValue()).to.equal(v7.current);
    end);
end;