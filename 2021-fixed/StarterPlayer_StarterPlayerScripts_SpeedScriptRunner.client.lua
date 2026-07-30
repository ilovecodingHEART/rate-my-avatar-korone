-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    Enum.KeyCode.LeftControl, 
    Enum.KeyCode.ButtonL2
};
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ContextActionService");
local l_Sprint_0 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MobileGui").Buttons.Sprint;
local v4 = false;
l_Sprint_0.Activated:Connect(function() --[[ Line: 14 ]]
    if v4 then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
        l_Sprint_0.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255);
        v4 = false;
        return;
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32;
        l_Sprint_0.ImageLabel.ImageColor3 = Color3.fromRGB(0, 195, 255);
        v4 = true;
        return;
    end;
end);
l_UserInputService_0.InputBegan:Connect(function(v5, v6) --[[ Line: 27 ]]
    if v6 then
        return;
    else
        if (v5.UserInputType == Enum.UserInputType.Keyboard or v5.UserInputType == Enum.UserInputType.Gamepad1) and workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable and __2021_find(v0, v5.KeyCode) then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32;
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v7) --[[ Line: 36 ]]
    if workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable and __2021_find(v0, v7.KeyCode) then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
    end;
end);