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

local l_Jetpack_0 = game:GetService("ReplicatedStorage").Slerp.RemoteEvents.Jetpack;
local v1 = {
    RemoteEvents = {
        AddJetpack = l_Jetpack_0.AddJetpack, 
        AddJetpacks = l_Jetpack_0.AddJetpacks, 
        RemoveJetpack = l_Jetpack_0.RemoveJetpack, 
        SetOwner = l_Jetpack_0.SetOwner
    }
};
__2021_freeze(v1);
return v1;