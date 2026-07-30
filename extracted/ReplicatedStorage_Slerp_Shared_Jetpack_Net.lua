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
table.freeze(v1);
return v1;