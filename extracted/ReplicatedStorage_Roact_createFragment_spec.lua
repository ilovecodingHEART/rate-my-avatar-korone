-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.ElementKind);
    local v1 = require(script.Parent.Type);
    local v2 = require(script.Parent.createFragment);
    it("should create new primitive elements", function() --[[ Line: 7 ]]
        local v3 = v2({});
        expect(v3).to.be.ok();
        expect(v1.of(v3)).to.equal(v1.Element);
        expect(v0.of(v3)).to.equal(v0.Fragment);
    end);
    it("should accept children", function() --[[ Line: 15 ]]
        local v4 = v2({});
        local v5 = v2({
            key = v4
        });
        expect(v5.elements.key).to.equal(v4);
    end);
end;