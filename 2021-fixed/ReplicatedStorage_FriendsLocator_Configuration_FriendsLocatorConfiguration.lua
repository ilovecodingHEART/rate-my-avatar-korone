-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Packages.t);
local l_Configuration_0 = require(script.Parent.Parent.Libraries.Configuration).Configuration;
local v2 = {
    alwaysOnTop = true, 
    showAllPlayers = false, 
    teleportToFriend = true, 
    thresholdDistance = 100, 
    maxLocators = 10, 
    enabled = true, 
    locatorSize = UDim2.new(0, 50, 0, 50)
};
local v3 = v0.strictInterface({
    alwaysOnTop = v0.optional(v0.boolean), 
    showAllPlayers = v0.optional(v0.boolean), 
    teleportToFriend = v0.optional(v0.boolean), 
    thresholdDistance = v0.optional(v0.numberPositive), 
    maxLocators = v0.optional(v0.numberPositive), 
    enabled = v0.optional(v0.boolean), 
    locatorSize = v0.optional(v0.UDim2)
});
return (l_Configuration_0.new("FriendsLocatorConfiguration", v2, v3));