-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Packages.t);
local v1 = require(script.Parent.Configuration);
local v2 = {
    teleportToFriendOnRespawn = true, 
    teleportDistance = 5, 
    showLogs = false, 
    maxCharacterVelocity = 48, 
    bypassFriendshipCheck = false
};
local v3 = v0.strictInterface({
    teleportToFriendOnRespawn = v0.optional(v0.boolean), 
    teleportDistance = v0.optional(v0.numberPositive), 
    showLogs = v0.optional(v0.boolean), 
    maxCharacterVelocity = v0.optional(v0.numberPositive), 
    bypassFriendshipCheck = v0.optional(v0.boolean)
});
return v1.new(v2, v3);