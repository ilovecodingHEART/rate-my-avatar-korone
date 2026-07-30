-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_CarSeats_0 = game:GetService("ReplicatedStorage").Slerp.RemoteEvents.CarSeats;
local v1 = {
    RemoteEvents = {
        SetOccupant = l_CarSeats_0.SetOccupant, 
        RegisterCar = l_CarSeats_0.RegisterCar, 
        RegisterCars = l_CarSeats_0.RegisterCars, 
        UnregisterCar = l_CarSeats_0.UnregisterCar
    }
};
table.freeze(v1);
return v1;