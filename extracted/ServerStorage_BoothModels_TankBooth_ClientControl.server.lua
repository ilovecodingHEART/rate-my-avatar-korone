task.wait(0.5);
local l_FirstChildWhichIsA_0 = script.Parent:FindFirstChildWhichIsA("Seat", true);
local function v2(v1) --[[ Line: 3 ]] --[[ Name: setupCraneGui ]]
	v1.Frame.Main.Up.MouseButton1Down:Connect(function() --[[ Line: 5 ]]
		script.Parent.RemoteEvent:FireServer("PitchUpBegan");
	end);
	v1.Frame.Main.Up.MouseButton1Up:Connect(function() --[[ Line: 8 ]]
		script.Parent.RemoteEvent:FireServer("PitchUpEnded");
	end);
	v1.Frame.Main.Down.MouseButton1Down:Connect(function() --[[ Line: 12 ]]
		script.Parent.RemoteEvent:FireServer("PitchDownBegan");
	end);
	v1.Frame.Main.Down.MouseButton1Up:Connect(function() --[[ Line: 15 ]]
		script.Parent.RemoteEvent:FireServer("PitchDownEnded");
	end);
	v1.Frame.Main.Left.MouseButton1Down:Connect(function() --[[ Line: 19 ]]
		script.Parent.RemoteEvent:FireServer("RotateLeftBegan");
	end);
	v1.Frame.Main.Left.MouseButton1Up:Connect(function() --[[ Line: 22 ]]
		script.Parent.RemoteEvent:FireServer("RotateLeftEnded");
	end);
	v1.Frame.Main.Right.MouseButton1Down:Connect(function() --[[ Line: 26 ]]
		script.Parent.RemoteEvent:FireServer("RotateRightBegan");
	end);
	v1.Frame.Main.Right.MouseButton1Up:Connect(function() --[[ Line: 29 ]]
		script.Parent.RemoteEvent:FireServer("RotateRightEnded");
	end);
	v1.Frame.Shoot.Activated:Connect(function() --[[ Line: 33 ]]
		script.Parent.RemoteEvent:FireServer("Shoot");
	end);
end;
local v3 = nil;
l_FirstChildWhichIsA_0:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 39 ]]
	if l_FirstChildWhichIsA_0.Occupant and l_FirstChildWhichIsA_0.Occupant.Parent == game.Players.LocalPlayer.Character then
		if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("CraneGui") then
			v3 = script.CraneGui:Clone();
			v3.Parent = game.Players.LocalPlayer.PlayerGui;
			v2(v3);
			return;
		end;
	elseif v3 then
		v3:Destroy();
	end;
end);
local l_UserInputService_0 = game:GetService("UserInputService");
l_UserInputService_0.InputBegan:Connect(function(v5, v6) --[[ Line: 87 ]]
	if v6 then
		return;
	else
		if v5.UserInputType == Enum.UserInputType.MouseButton1 then
			script.Parent.RemoteEvent:FireServer("Shoot");
		end;
		if v5.KeyCode == Enum.KeyCode.W then
			script.Parent.RemoteEvent:FireServer("PitchUpBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.S then
			script.Parent.RemoteEvent:FireServer("PitchDownBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.A then
			script.Parent.RemoteEvent:FireServer("RotateLeftBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.D then
			script.Parent.RemoteEvent:FireServer("RotateRightBegan");
		end;
		return;
	end;
end);
l_UserInputService_0.InputEnded:Connect(function(v7, v8) --[[ Line: 113 ]]
	if v8 then
		return;
	else
		if v7.KeyCode == Enum.KeyCode.W then
			script.Parent.RemoteEvent:FireServer("PitchUpEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.S then
			script.Parent.RemoteEvent:FireServer("PitchDownEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.A then
			script.Parent.RemoteEvent:FireServer("RotateLeftEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.D then
			script.Parent.RemoteEvent:FireServer("RotateRightEnded");
		end;
		return;
	end;
end);
local l_FirstChildWhichIsA_1 = script.Parent:FindFirstChildWhichIsA("ProximityPrompt", true);
local l_BoothInteractions_0 = workspace.BoothInteractions;
script.Parent.Destroying:Connect(function() --[[ Line: 146 ]]
	l_BoothInteractions_0.Parent = workspace;
end);
local v13 = script.Parent:GetAttribute("OwnerId") == game.Players.LocalPlayer.UserId;
l_FirstChildWhichIsA_1.Enabled = v13;
if v13 then
	l_FirstChildWhichIsA_0:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 154 ]]
		if l_FirstChildWhichIsA_0.Occupant and l_FirstChildWhichIsA_0.Occupant.Parent == game.Players.LocalPlayer.Character then
			l_FirstChildWhichIsA_1.Enabled = false;
			l_BoothInteractions_0.Parent = game.ReplicatedStorage;
			return;
		else
			l_FirstChildWhichIsA_1.Enabled = true;
			l_BoothInteractions_0.Parent = workspace;
			return;
		end;
	end);
end;
