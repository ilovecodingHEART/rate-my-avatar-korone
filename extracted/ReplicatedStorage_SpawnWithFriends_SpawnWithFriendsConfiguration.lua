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