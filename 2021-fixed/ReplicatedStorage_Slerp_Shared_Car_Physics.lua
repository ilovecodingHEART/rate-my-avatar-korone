-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    CAR_MODEL_COLLISION_GROUP = "CarModel", 
    CAR_RAYCAST_COLLISION_GROUP = "CarRaycast", 
    PLAYER_CHARACTER_COLLISION_GROUP = "PlayerCharacter", 
    PLAYER_CHARACTER_DESCENDANT_COLLISION_GROUP = "PlayerCharacterDescendant"
};
__2021_freeze(v0);
return v0;