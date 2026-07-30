-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Cars_0 = game:GetService("ReplicatedStorage").Slerp.RemoteEvents.Cars;
local l_AddRecord_0 = l_Cars_0.AddRecord;
local l_RemoveRecord_0 = l_Cars_0.RemoveRecord;
local l_AddCars_0 = l_Cars_0.AddCars;
local l_SetOccupant_0 = l_Cars_0.SetOccupant;
local l_SetSteerAlphaTarget_0 = l_Cars_0.SetSteerAlphaTarget;
local l_SetThrottleSign_0 = l_Cars_0.SetThrottleSign;
local l_SetLightsAreEnabled_0 = l_Cars_0.SetLightsAreEnabled;
return {
    RemoteEvents = {
        AddCars = l_AddCars_0, 
        AddRecord = l_AddRecord_0, 
        RemoveRecord = l_RemoveRecord_0, 
        SetOccupant = l_SetOccupant_0, 
        SetSteerAlphaTarget = l_SetSteerAlphaTarget_0, 
        SetThrottleSign = l_SetThrottleSign_0, 
        SetLightsAreEnabled = l_SetLightsAreEnabled_0, 
        RegisterCar = l_Cars_0.RegisterCar, 
        RegisterCars = l_Cars_0.RegisterCars, 
        UnregisterCar = l_Cars_0.UnregisterCar, 
        SetCarOwner = l_Cars_0.SetCarOwner
    }
};