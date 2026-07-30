-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Client_0 = l_ReplicatedStorage_0.Slerp.Client;
local v4 = require(l_Client_0.Cars);
local v5 = require(l_Client_0.CarSpawnTool);
local v6 = require(l_Client_0.CarSeats);
local v7 = require(l_Client_0.Jetpack);
local v8 = require(l_Client_0.JetpackSpawnTool);
local v9 = require(l_Client_0.JetpackFuel);
local v10 = require(l_Client_0.Trampolines);
v4.init();
v5.init();
v6.init();
v7.init();
v8.init();
v10.init();
for _, v12 in l_CollectionService_0:GetTagged("Trampoline") do
    v10.addFromModel(v12);
end;
l_CollectionService_0:GetInstanceAddedSignal("Trampoline"):Connect(function(v13) --[[ Line: 26 ]]
    v10.addFromModel(v13);
end);
v9.init();