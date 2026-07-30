local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_RunService_0 = game:GetService("RunService");
if game:GetService("VRService").VREnabled then
    return;
else
    local v5 = require(l_ReplicatedStorage_0.Remotes);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Humanoid_0 = l_LocalPlayer_0.Character:WaitForChild("Humanoid");
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
    local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
    local v11 = 0;
    local v12 = false;
    local v13 = false;
    l_UserInputService_0.InputBegan:Connect(function(v14, v15) --[[ Line: 29 ]]
        if v15 then
            return;
        else
			if v14.KeyCode == Enum.KeyCode.X and table.find({0, 1, 2, 3, 4, 5}, l_LocalPlayer_0.UserId) and v13 == false then
				v13 = true;
                v5.Event("Lightning"):FireServer(l_l_LocalPlayer_0_Mouse_0.Hit.Position);
                wait(0.025);
                v13 = false;
            end;
            if v14.KeyCode == Enum.KeyCode.Q and l_LocalPlayer_0.Character.Humanoid.Jump == true then
                if v11 == 0 then
                    v11 = 180;
                    for _, v17 in pairs(l_PlayerGui_0.ScreenGui:GetChildren()) do
                        if v17.ClassName ~= "LocalScript" then
                            v17.Rotation = 180;
                            workspace.Gravity = 10;
                        end;
                    end;
                else
                    v11 = 0;
                    for _, v19 in pairs(l_PlayerGui_0.ScreenGui:GetChildren()) do
                        if v19.ClassName ~= "LocalScript" then
                            v19.Rotation = 0;
                            workspace.Gravity = 196.2;
                        end;
                    end;
                end;
            end;
			if v14.KeyCode == Enum.KeyCode.X and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and l_UserInputService_0:IsKeyDown(Enum.KeyCode.Z) and l_LocalPlayer_0:IsInGroup(125814458) then
                if v12 then
                    l_Humanoid_0:SetStateEnabled("GettingUp", true);
                    v12 = not v12;
                    return;
                else
                    l_Humanoid_0:SetStateEnabled("GettingUp", false);
                    l_Humanoid_0:ChangeState("Swimming");
                    v12 = not v12;
                end;
            end;
            return;
        end;
    end);
    l_RunService_0.RenderStepped:Connect(function() --[[ Line: 76 ]]
        l_CurrentCamera_0.CFrame = CFrame.lookAt(l_CurrentCamera_0.CFrame.Position, l_CurrentCamera_0.CFrame.Position + l_CurrentCamera_0.CFrame.LookVector) * CFrame.Angles(0, 0, (math.rad(v11)));
    end);
    return;
end;