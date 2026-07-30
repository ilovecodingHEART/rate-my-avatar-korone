-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.SpawnWithFriendsConfiguration);
local v1 = require(script.TeleportToPlayer);
local v2 = require(script.teleportToRandomFriend);
return {
    configure = v0.configure, 
    teleportToRandomFriend = v2, 
    setTeleportationValidator = v1.setTeleportationValidator
};