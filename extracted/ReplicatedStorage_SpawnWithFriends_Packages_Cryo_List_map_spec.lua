-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.map);
    it("should return a new table", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3
        };
        expect(v0(v1, function() --[[ Line: 7 ]]

        end)).never.to.equal(v1);
    end);
    it("should call the callback for each element", function() --[[ Line: 10 ]]
        local v2 = {
            5, 
            6, 
            7
        };
        local v3 = {};
        v0(v2, function(v4, v5) --[[ Line: 13 ]]
            v3[v5] = v4;
            return v4;
        end);
        for v6, v7 in pairs(v2) do
            expect(v3[v6]).to.equal(v7);
        end;
        for v8, v9 in pairs(v3) do
            expect(v9).to.equal(v2[v8]);
        end;
    end);
    it("should copy list", function() --[[ Line: 27 ]]
        local v10 = {
            1, 
            2, 
            3
        };
        local v12 = v0(v10, function(v11) --[[ Line: 29 ]]
            return v11;
        end);
        for v13, v14 in pairs(v10) do
            expect(v12[v13]).to.equal(v14);
        end;
        for v15, v16 in pairs(v12) do
            expect(v16).to.equal(v10[v15]);
        end;
    end);
    it("should sets the new values to the result of the given callback", function() --[[ Line: 42 ]]
        local v17 = {
            5, 
            6, 
            7
        };
        local v19 = v0(v17, function(v18) --[[ Line: 44 ]]
            return v18 * 2;
        end);
        expect(#v19).to.equal(#v17);
        for v20 = 1, #v17 do
            expect(v19[v20]).to.equal(v17[v20] * 2);
        end;
    end);
    it("should work with an empty list", function() --[[ Line: 54 ]]
        local v21 = {};
        local v22 = v0(v21, function() --[[ Line: 56 ]]

        end);
        expect(v22).to.be.a("table");
        expect(v22).never.to.equal(v21);
    end);
end;