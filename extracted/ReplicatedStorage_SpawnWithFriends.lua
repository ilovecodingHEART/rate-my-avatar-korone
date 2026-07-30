-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.SpawnWithFriendsConfiguration);
local v1 = require(script.TeleportToPlayer);
local v2 = require(script.teleportToRandomFriend);
return {
    configure = v0.configure, 
    teleportToRandomFriend = v2, 
    setTeleportationValidator = v1.setTeleportationValidator
};