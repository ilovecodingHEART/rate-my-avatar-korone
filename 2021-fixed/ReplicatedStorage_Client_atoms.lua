-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Charm_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("Charm"));
return {
    GameplayStatus = l_Charm_0.atom("nothing"), 
    PenaltyStatus = l_Charm_0.atom("nothing"), 
    penaltyShootLocation = l_Charm_0.atom((Vector3.new(0, 0, 0, 0)))
};