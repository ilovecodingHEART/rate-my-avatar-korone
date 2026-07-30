-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Character_0 = require(l_Parent_0:WaitForChild("Character"));
local v3 = {};
v3.__index = v3;
local v4 = nil;
v3.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    local v5 = setmetatable({
        Characters = {}
    }, v3);
    l_Players_0.PlayerRemoving:Connect(function(v6) --[[ Line: 32 ]]
        -- upvalues: v5 (copy)
        v5.Characters[v6] = nil;
    end);
    return v5;
end;
v3.GetInstance = function() --[[ Line: 43 ]] --[[ Name: GetInstance ]]
    -- upvalues: v4 (ref), v3 (copy)
    if not v4 then
        v4 = v3.new();
    end;
    return v4;
end;
v3.GetCharacter = function(v7, v8) --[[ Line: 53 ]] --[[ Name: GetCharacter ]]
    -- upvalues: l_Character_0 (copy)
    if not v8.Character or not v8.Character:FindFirstChild("Head") then
        return nil;
    else
        local v9 = v7.Characters[v8];
        if not v9 or v9.Character ~= v8.Character then
            v7.Characters[v8] = {
                Character = v8.Character, 
                VRCharacter = l_Character_0.new(v8.Character)
            };
        end;
        return v7.Characters[v8].VRCharacter;
    end;
end;
v3.RefreshAllCharacters = function(v10) --[[ Line: 75 ]] --[[ Name: RefreshAllCharacters ]]
    for _, v12 in pairs(v10.Characters) --[[ 2021 ]] do
        v12.VRCharacter:RefreshCharacter();
    end;
end;
return v3;