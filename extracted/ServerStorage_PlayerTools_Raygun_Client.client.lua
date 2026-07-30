local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Shot_0 = l_Parent_0:WaitForChild("Shot");
local l_Animations_0 = l_Parent_0:WaitForChild("Animations");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
repeat
    task.wait();
until l_LocalPlayer_0.Character;
local l_Character_0 = l_LocalPlayer_0.Character;
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_HumanoidRootPart_0 = l_Character_0:WaitForChild("HumanoidRootPart");
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local v9 = nil;
local v10 = nil;
local v11 = true;
local v12 = l_Humanoid_0:LoadAnimation(l_Animations_0.Hold);
local v13 = l_Humanoid_0:LoadAnimation(l_Animations_0.Shot);
local l_IKControl_0 = Instance.new("IKControl");
l_IKControl_0.Enabled = false;
l_IKControl_0.EndEffector = l_Character_0:FindFirstChild("LeftHand");
l_IKControl_0.Target = l_Parent_0.Handle.EmitPoint;
l_IKControl_0.ChainRoot = l_Character_0:FindFirstChild("LeftUpperArm");
l_IKControl_0.SmoothTime = 0;
l_IKControl_0.Priority = 2;
l_IKControl_0.Offset = CFrame.Angles(0, 0, -1.5707963267948966);
l_IKControl_0.Parent = l_HumanoidRootPart_0;
l_Parent_0.Equipped:Connect(function() --[[ Line: 41 ]]
    v12:Play();
    l_IKControl_0.Enabled = true;
    v9 = l_l_LocalPlayer_0_Mouse_0.Button1Down:Connect(function() --[[ Line: 47 ]]
        if v11 then
            v11 = false;
            v13:Play();
            l_Shot_0:FireServer(l_l_LocalPlayer_0_Mouse_0.Hit.Position, l_Parent_0);
            task.wait(0.25);
            v11 = true;
        end;
    end);
    v10 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 64 ]]
        l_Parent_0.Handle.MouseLook.WorldPosition = Vector3.new(l_l_LocalPlayer_0_Mouse_0.Hit.Position.X, l_HumanoidRootPart_0.Position.Y + 2, l_l_LocalPlayer_0_Mouse_0.Hit.Position.Z);
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 70 ]]
    v12:Stop();
    v9:Disconnect();
    v10:Disconnect();
    l_IKControl_0.Enabled = false;
end);