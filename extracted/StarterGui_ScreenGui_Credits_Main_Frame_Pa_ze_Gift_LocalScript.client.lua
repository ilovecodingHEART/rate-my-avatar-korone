-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_ScreenGui_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("ScreenGui");
l_Parent_0.Activated:Connect(function() --[[ Line: 6 ]]
	-- upvalues: l_ScreenGui_0 (copy), l_Parent_0 (copy)
	l_ScreenGui_0.Gift.Visible = true;
	l_ScreenGui_0.Gift.Frame.Username.Text = l_Parent_0.Parent.Name;
end);