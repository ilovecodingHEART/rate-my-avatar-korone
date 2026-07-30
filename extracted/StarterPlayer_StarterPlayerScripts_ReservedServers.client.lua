local l_TeleportService_0 = game:GetService("TeleportService");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local l_l_TeleportService_0_LocalPlayerTeleportData_0 = l_TeleportService_0:GetLocalPlayerTeleportData();
if l_l_TeleportService_0_LocalPlayerTeleportData_0 and l_l_TeleportService_0_LocalPlayerTeleportData_0.ReservedServerCode ~= nil then
    local v11 = ("your server code is: %* - your friends can use code to join by doing !joinserver (code)"):format((workspace:GetAttribute("ReservedServerCode")));
    l_ScreenGui_0.Prompt.TopFrame.Title.Text = "CONTINUE";
    l_ScreenGui_0.Prompt.Frame.Message.Text = v11;
    l_ScreenGui_0.Prompt.Visible = true;
end;