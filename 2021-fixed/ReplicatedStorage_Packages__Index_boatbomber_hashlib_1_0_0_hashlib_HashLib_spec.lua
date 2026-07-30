-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = function(_, _) --[[ Line: 1 ]] --[[ Name: describe ]]

end;
local _ = function(_, _) --[[ Line: 2 ]] --[[ Name: it ]]

end;
local _ = function(_) --[[ Line: 3 ]] --[[ Name: expect ]]

end;
return function() --[[ Line: 5 ]]
    local l_sha256_0 = require(script.Parent).sha256;
    local _ = function() --[[ Line: 9 ]]
        local function v10() --[[ Line: 10 ]]
            local v9 = l_sha256_0("abc").to.equal("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
            v9 = l_sha256_0("The quick brown fox jumps over the lazy dog").to.equal("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");
            v9 = l_sha256_0("123456").to.equal("8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92");
        end;
        v10 = function() --[[ Line: 20 ]]
            local v11 = l_sha256_0();
            v11("The quick brown fox");
            v11(" jumps ");
            v11("");
            v11("over the lazy dog");
            local _ = v11();
            (nil).to.equal("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");
        end;
        v10 = function() --[[ Line: 29 ]]
            local v13 = l_sha256_0();
            v13("The quick brown fox");
            v13(" jumps ");
            v13("");
            v13("over the lazy dog");
            v13();
            local _ = v13();
            (nil).to.equal("d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592");
        end;
    end;
end;