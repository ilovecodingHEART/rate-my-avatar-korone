-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(script.Parent:WaitForChild("BaseScreenGui"));
local l_ScreenGui3D_0 = require(script.Parent:WaitForChild("ScreenGui3D"));
local l_ScreenGui2D_0 = require(script.Parent:WaitForChild("ScreenGui2D"));
if l_UserInputService_0.VREnabled then
    return l_ScreenGui3D_0;
else
    return l_ScreenGui2D_0;
end;