-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.ElementUtils);
    local v1 = require(script.Parent.createElement);
    local v2 = require(script.Parent.createFragment);
    local v3 = require(script.Parent.Type);
    describe("iterateElements", function() --[[ Line: 7 ]]
        it("should iterate once for a single child", function() --[[ Line: 8 ]]
            local v4 = v1("TextLabel");
            local v5 = v0.iterateElements(v4);
            local v6, v7 = v5();
            expect(v6).to.equal(v0.UseParentKey);
            expect(v7).to.equal(v4);
            v6 = v5();
            expect(v6).to.equal(nil);
        end);
        it("should iterate over tables", function() --[[ Line: 20 ]]
            local v8 = {
                a = v1("TextLabel"), 
                b = v1("TextLabel")
            };
            local v9 = {};
            local v10 = 0;
            for v11, v12 in v0.iterateElements(v8) do
                expect((typeof(v11))).to.equal("string");
                expect(v3.of(v12)).to.equal(v3.Element);
                v9[v12] = v11;
                v10 = v10 + 1;
            end;
            expect(v10).to.equal(2);
            expect(v9[v8.a]).to.equal("a");
            expect(v9[v8.b]).to.equal("b");
        end);
        it("should return a zero-element iterator for booleans", function() --[[ Line: 41 ]]
            local v13 = v0.iterateElements(false);
            expect(v13()).to.equal(nil);
        end);
        it("should return a zero-element iterator for nil", function() --[[ Line: 46 ]]
            local v14 = v0.iterateElements(nil);
            expect(v14()).to.equal(nil);
        end);
        it("should throw if given an illegal value", function() --[[ Line: 51 ]]
            expect(function() --[[ Line: 52 ]]
                v0.iterateElements(1);
            end).to.throw();
        end);
    end);
    describe("getElementByKey", function() --[[ Line: 58 ]]
        it("should return nil for booleans", function() --[[ Line: 59 ]]
            expect(v0.getElementByKey(true, "test")).to.equal(nil);
        end);
        it("should return nil for nil", function() --[[ Line: 63 ]]
            expect(v0.getElementByKey(nil, "test")).to.equal(nil);
        end);
        describe("single elements", function() --[[ Line: 67 ]]
            local v15 = v1("TextLabel");
            it("should return the element if the key is UseParentKey", function() --[[ Line: 70 ]]
                expect(v0.getElementByKey(v15, v0.UseParentKey)).to.equal(v15);
            end);
            it("should return nil if the key is not UseParentKey", function() --[[ Line: 74 ]]
                expect(v0.getElementByKey(v15, "test")).to.equal(nil);
            end);
        end);
        it("should return the corresponding element from a table", function() --[[ Line: 79 ]]
            local v16 = {
                a = v1("TextLabel"), 
                b = v1("TextLabel")
            };
            expect(v0.getElementByKey(v16, "a")).to.equal(v16.a);
            expect(v0.getElementByKey(v16, "b")).to.equal(v16.b);
        end);
        it("should return nil if the key does not exist", function() --[[ Line: 89 ]]
            local v17 = v2({});
            expect(v0.getElementByKey(v17, "a")).to.equal(nil);
        end);
    end);
end;