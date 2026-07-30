-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Component);
    local v1 = require(script.Parent.ElementKind);
    local v2 = require(script.Parent.GlobalConfig);
    local v3 = require(script.Parent.Logging);
    local v4 = require(script.Parent.Type);
    local v5 = require(script.Parent.Portal);
    local v6 = require(script.Parent.PropMarkers.Children);
    local v7 = require(script.Parent.createElement);
    it("should create new primitive elements", function() --[[ Line: 12 ]]
        local v8 = v7("Frame");
        expect(v8).to.be.ok();
        expect(v4.of(v8)).to.equal(v4.Element);
        expect(v1.of(v8)).to.equal(v1.Host);
    end);
    it("should create new functional elements", function() --[[ Line: 20 ]]
        local v9 = v7(function() --[[ Line: 21 ]]

        end);
        expect(v9).to.be.ok();
        expect(v4.of(v9)).to.equal(v4.Element);
        expect(v1.of(v9)).to.equal(v1.Function);
    end);
    it("should create new stateful components", function() --[[ Line: 28 ]]
        local v10 = v0:extend("Foo");
        local v11 = v7(v10);
        expect(v11).to.be.ok();
        expect(v4.of(v11)).to.equal(v4.Element);
        expect(v1.of(v11)).to.equal(v1.Stateful);
    end);
    it("should create new portal elements", function() --[[ Line: 38 ]]
        local v12 = v7(v5);
        expect(v12).to.be.ok();
        expect(v4.of(v12)).to.equal(v4.Element);
        expect(v1.of(v12)).to.equal(v1.Portal);
    end);
    it("should accept props", function() --[[ Line: 46 ]]
        local v13 = v7("StringValue", {
            Value = "Foo"
        });
        expect(v13).to.be.ok();
        expect(v13.props.Value).to.equal("Foo");
    end);
    it("should accept props and children", function() --[[ Line: 55 ]]
        local v14 = v7("IntValue");
        local v15 = v7("StringValue", {
            Value = "Foo"
        }, {
            Child = v14
        });
        expect(v15).to.be.ok();
        expect(v15.props.Value).to.equal("Foo");
        expect(v15.props[v6]).to.be.ok();
        expect(v15.props[v6].Child).to.equal(v14);
    end);
    it("should accept children with without props", function() --[[ Line: 70 ]]
        local v16 = v7("IntValue");
        local v17 = v7("StringValue", nil, {
            Child = v16
        });
        expect(v17).to.be.ok();
        expect(v17.props[v6]).to.be.ok();
        expect(v17.props[v6].Child).to.equal(v16);
    end);
    it("should warn once if children is specified in two different ways", function() --[[ Line: 82 ]]
        local v19 = v3.capture(function() --[[ Line: 83 ]]
            for _ = 1, 2 do
                v7("Frame", {
                    [v6] = {}
                }, {});
            end;
        end);
        expect(#v19.warnings).to.equal(1);
        expect(v19.warnings[1]:find("createElement")).to.be.ok();
        expect(v19.warnings[1]:find("Children")).to.be.ok();
    end);
    it("should have a `source` member if elementTracing is set", function() --[[ Line: 98 ]]
        local v20 = {
            elementTracing = true
        };
        v2.scoped(v20, function() --[[ Line: 103 ]]
            local v21 = v7("StringValue");
            expect(v21.source).to.be.a("string");
        end);
    end);
end;