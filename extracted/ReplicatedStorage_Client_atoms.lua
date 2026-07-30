-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Charm_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("Charm"));
return {
    GameplayStatus = l_Charm_0.atom("nothing"), 
    PenaltyStatus = l_Charm_0.atom("nothing"), 
    penaltyShootLocation = l_Charm_0.atom((Vector3.new(0, 0, 0, 0)))
};