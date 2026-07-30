-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local _ = l_Parent_0:WaitForChild("HumanoidRootPart");
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.Name = "Idle";
l_Animation_0.AnimationId = "http://www.roblox.com/asset/?id=17172918855";
local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
if not l_Animator_0 then
    l_Animator_0 = Instance.new("Animator");
    l_Animator_0.Parent = l_Humanoid_0;
end;
local v5 = l_Animator_0:LoadAnimation(l_Animation_0);
v5.Priority = Enum.AnimationPriority.Idle;
v5.Looped = true;
v5:Play();
local l_Parent_1 = script.Parent;
local l_Humanoid_1 = l_Parent_1:WaitForChild("Humanoid");
local _ = l_Parent_1:WaitForChild("HumanoidRootPart");
l_Humanoid_1.WalkSpeed = 0;
l_Humanoid_1.JumpPower = 0;
l_Humanoid_1.AutoRotate = false;