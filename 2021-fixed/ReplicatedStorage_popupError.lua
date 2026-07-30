-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local l_UserInputService_0 = game:GetService("UserInputService");
local function _(v5) --[[ Line: 12 ]] --[[ Name: controllerParentSelect ]]
    if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 then
        l_GuiService_0:Select(v5);
    end;
end;
local function _(v7, v8, v9) --[[ Line: 18 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v7, TweenInfo.new(v8, Enum.EasingStyle.Quint), v9):Play();
end;
return function(v11) --[[ Line: 23 ]] --[[ Name: popupError ]]
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError.Continue.Text = v11.button or "NICE JOB";
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError.Title.Text = v11.title;
    local v12 = require(game.ReplicatedStorage.FeaturePlaces);
	local v13 = ("PLS DONATE v%s-%s\n"):format(game.PlaceVersion, v12.PlaceName) .. v11.errorMessage;
    if v13 == "" then
        v13 = (" ____________________________\n< *unintelligible gibberish* >\n ----------------------------\n        \\   ^__^\n         \\  (oo)\\_______\n            (__)\\       )\\/\\\n                ||----w |\n                ||     ||\n"):sub(2);
    end;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError.ScrollingFrame.ErrorMessage.Text = v13;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError.Visible = true;
    l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError.Position = UDim2.new(0.5, 0, 0.55, 0);
    l_GuiService_0.AutoSelectGuiEnabled = false;
    local l_PopupError_0 = l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError;
    if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 then
        l_GuiService_0:Select(l_PopupError_0);
    end;
    l_PopupError_0 = l_LocalPlayer_0.PlayerGui.ScreenGui.PopupError;
    local v15 = {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    };
    l_TweenService_0:Create(l_PopupError_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v15):Play();
    l_PopupError_0 = workspace.Camera;
    v15 = {
        FieldOfView = 60
    };
    l_TweenService_0:Create(l_PopupError_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v15):Play();
    l_PopupError_0 = l_Lighting_0.Blur;
    v15 = {
        Size = 10
    };
    l_TweenService_0:Create(l_PopupError_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v15):Play();
end;