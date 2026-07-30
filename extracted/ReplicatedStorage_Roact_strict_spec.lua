-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.strict);
    it("should error when getting a nonexistent key", function() --[[ Line: 4 ]]
        local v1 = v0({
            a = 1, 
            b = 2
        });
        expect(function() --[[ Line: 10 ]]
            return v1.c;
        end).to.throw();
    end);
    it("should error when setting a nonexistent key", function() --[[ Line: 15 ]]
        local v2 = v0({
            a = 1, 
            b = 2
        });
        expect(function() --[[ Line: 21 ]]
            v2.c = 3;
        end).to.throw();
    end);
end;