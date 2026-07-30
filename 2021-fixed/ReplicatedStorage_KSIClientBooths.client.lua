-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_KSIBoothOnStage_0 = require(l_ReplicatedStorage_0:WaitForChild("KSIBoothOnStage"));
l_ReplicatedStorage_0:WaitForChild("KSI"):WaitForChild("NewPlayerOnStage").OnClientEvent:Connect(function(v2) --[[ Line: 6 ]]
    -- upvalues: l_KSIBoothOnStage_0 (copy)
    l_KSIBoothOnStage_0.Clear();
    l_KSIBoothOnStage_0.LoadOnlineBoothOnStage(v2);
end);