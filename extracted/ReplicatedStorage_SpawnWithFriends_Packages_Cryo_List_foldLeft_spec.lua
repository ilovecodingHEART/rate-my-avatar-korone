-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.foldLeft);
    it("should call the callback", function() --[[ Line: 4 ]]
        local v1 = {
            1, 
            2, 
            3
        };
        local v2 = 0;
        v0(v1, function() --[[ Line: 8 ]]
            v2 = v2 + 1;
        end, 0);
        expect(v2).to.equal(3);
    end);
    it("should not call the callback when the list is empty", function() --[[ Line: 15 ]]
        local v3 = false;
        v0({}, function() --[[ Line: 18 ]]
            v3 = true;
        end, 0);
        expect(v3).to.equal(false);
    end);
    it("should call the callback for each element", function() --[[ Line: 25 ]]
        local v4 = {
            4, 
            5, 
            6
        };
        local v5 = {};
        v0(v4, function(v6, v7, v8) --[[ Line: 29 ]]
            v5[v8] = v7;
            return v6;
        end, 0);
        expect(#v5).to.equal(#v4);
        for v9, v10 in pairs(v4) do
            expect(v10).to.equal(v5[v9]);
        end;
    end);
    it("should pass the same modified initial value to the callback", function() --[[ Line: 41 ]]
        local v11 = {
            5, 
            4, 
            3
        };
        local v12 = {};
        v0(v11, function(v13) --[[ Line: 45 ]]
            expect(v13).to.equal(v12);
            return v13;
        end, v12);
    end);
    it("should call the callback in the correct order", function() --[[ Line: 51 ]]
        local v14 = {
            5, 
            4, 
            3
        };
        local v15 = 1;
        v0(v14, function(v16, v17) --[[ Line: 55 ]]
            expect(v17).to.equal(v14[v15]);
            v15 = v15 + 1;
            return v16;
        end, 0);
    end);
end;