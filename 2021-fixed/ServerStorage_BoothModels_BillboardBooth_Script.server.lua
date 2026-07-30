-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================

local l_TextBox_0 = script.Parent:WaitForChild("SurfaceGui").TextBox;
local l_ImageLabel_0 = script.Parent:WaitForChild("SurfaceGui").ImageLabel;
if script.Parent:GetAttribute("OwnerId") == game.Players.LocalPlayer.UserId then
	l_TextBox_0.Visible = true;
	l_ImageLabel_0.MouseEnter:Connect(function() --[[ Line: 7 ]]
		l_TextBox_0.Visible = true;
	end);
	l_ImageLabel_0.MouseLeave:Connect(function() --[[ Line: 11 ]]
		l_TextBox_0.Visible = false;
	end);
end;
l_TextBox_0.FocusLost:Connect(function() --[[ Line: 16 ]]
	script.Parent.RemoteEvent:FireServer(l_TextBox_0.Text);
end);