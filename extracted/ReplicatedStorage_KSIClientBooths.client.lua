-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_KSIBoothOnStage_0 = require(l_ReplicatedStorage_0:WaitForChild("KSIBoothOnStage"));
l_ReplicatedStorage_0:WaitForChild("KSI"):WaitForChild("NewPlayerOnStage").OnClientEvent:Connect(function(v2) --[[ Line: 6 ]]
    -- upvalues: l_KSIBoothOnStage_0 (copy)
    l_KSIBoothOnStage_0.Clear();
    l_KSIBoothOnStage_0.LoadOnlineBoothOnStage(v2);
end);