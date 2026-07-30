-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_ScreenGui_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("screenGui");
l_Parent_0.Activated:Connect(function() --[[ Line: 6 ]]
	-- upvalues: l_ScreenGui_0 (copy), l_Parent_0 (copy)
	l_ScreenGui_0.Gift.Visible = true;
	l_ScreenGui_0.Gift.Frame.Username.Text = l_Parent_0.Parent.Name;
end);