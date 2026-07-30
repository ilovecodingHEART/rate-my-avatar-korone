-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.filter);
    it("should call the callback for each element", function() --[[ Line: 4 ]]
        local v1 = {
            "foo1", 
            "foo2", 
            "foo3"
        };
        local v2 = {};
        v0(v1, function(v3, v4) --[[ Line: 11 ]] --[[ Name: copyCallback ]]
            v2[v4] = v3;
            return true;
        end);
        for v5, v6 in pairs(v1) do
            expect(v2[v5]).to.equal(v6);
        end;
        for v7, v8 in pairs(v2) do
            expect(v8).to.equal(v1[v7]);
        end;
    end);
    it("should correctly use the filter callback", function() --[[ Line: 26 ]]
        local v10 = v0({
            1, 
            2, 
            3, 
            4, 
            5
        }, function(v9) --[[ Line: 28 ]] --[[ Name: evenOnly ]]
            return v9 % 2 == 0;
        end);
        expect(#v10).to.equal(2);
        expect(v10[1]).to.equal(2);
        expect(v10[2]).to.equal(4);
    end);
    it("should copy the list correctly", function() --[[ Line: 38 ]]
        local v11 = {
            1, 
            2, 
            3
        };
        local v12 = v0(v11, function() --[[ Line: 40 ]] --[[ Name: keepAll ]]
            return true;
        end);
        expect(v12).never.to.equal(v11);
        for v13, v14 in pairs(v11) do
            expect(v12[v13]).to.equal(v14);
        end;
        for v15, v16 in pairs(v12) do
            expect(v16).to.equal(v11[v15]);
        end;
    end);
    it("should work with an empty table", function() --[[ Line: 56 ]]
        local v17 = false;
        local v18 = v0({}, function() --[[ Line: 58 ]] --[[ Name: callback ]]
            v17 = true;
            return true;
        end);
        expect(#v18).to.equal(0);
        expect(v17).to.equal(false);
    end);
    it("should remove all element from a list when callback return always false", function() --[[ Line: 68 ]]
        local v19 = v0({
            6, 
            2, 
            8, 
            6, 
            7
        }, function() --[[ Line: 70 ]] --[[ Name: removeAll ]]
            return false;
        end);
        expect(#v19).to.equal(0);
    end);
end;