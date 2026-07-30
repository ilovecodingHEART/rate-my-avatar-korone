-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_FirstChildWhichIsA_0 = script.Parent:FindFirstChildWhichIsA("Seat", true);
local v1 = nil;
setupCraneGui = function(v2) --[[ Line: 5 ]] --[[ Name: setupCraneGui ]]
	v2.Frame.Main.Up.MouseButton1Down:Connect(function() --[[ Line: 7 ]]
		script.Parent.RemoteEvent:FireServer("WinchUpBegan");
	end);
	v2.Frame.Main.Up.MouseButton1Up:Connect(function() --[[ Line: 10 ]]
		script.Parent.RemoteEvent:FireServer("WinchUpEnded");
	end);
	v2.Frame.Main.Down.MouseButton1Down:Connect(function() --[[ Line: 14 ]]
		script.Parent.RemoteEvent:FireServer("WinchDownBegan");
	end);
	v2.Frame.Main.Down.MouseButton1Up:Connect(function() --[[ Line: 17 ]]
		script.Parent.RemoteEvent:FireServer("WinchDownEnded");
	end);
	v2.Frame.Main.Left.MouseButton1Down:Connect(function() --[[ Line: 21 ]]
		script.Parent.RemoteEvent:FireServer("RotateLeftBegan");
	end);
	v2.Frame.Main.Left.MouseButton1Up:Connect(function() --[[ Line: 24 ]]
		script.Parent.RemoteEvent:FireServer("RotateLeftEnded");
	end);
	v2.Frame.Main.Right.MouseButton1Down:Connect(function() --[[ Line: 28 ]]
		script.Parent.RemoteEvent:FireServer("RotateRightBegan");
	end);
	v2.Frame.Main.Right.MouseButton1Up:Connect(function() --[[ Line: 31 ]]
		script.Parent.RemoteEvent:FireServer("RotateRightEnded");
	end);
	v2.Frame.Slide.Back.MouseButton1Down:Connect(function() --[[ Line: 35 ]]
		script.Parent.RemoteEvent:FireServer("SlideBackBegan");
	end);
	v2.Frame.Slide.Back.MouseButton1Up:Connect(function() --[[ Line: 38 ]]
		script.Parent.RemoteEvent:FireServer("SlideBackEnded");
	end);
	v2.Frame.Slide.Forth.MouseButton1Down:Connect(function() --[[ Line: 42 ]]
		script.Parent.RemoteEvent:FireServer("SlideForwardBegan");
	end);
	v2.Frame.Slide.Forth.MouseButton1Up:Connect(function() --[[ Line: 45 ]]
		script.Parent.RemoteEvent:FireServer("SlideForwardEnded");
	end);
end;
l_FirstChildWhichIsA_0:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 50 ]]
	if l_FirstChildWhichIsA_0.Occupant and l_FirstChildWhichIsA_0.Occupant.Parent == game.Players.LocalPlayer.Character then
		v1 = workspace.CurrentCamera.CameraSubject;
		workspace.CurrentCamera.CameraSubject = script.Parent.ControlRoom;
		if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("CraneGui") then
			local v3 = script.CraneGui:Clone();
			v3.Parent = game.Players.LocalPlayer.PlayerGui;
			setupCraneGui(v3);
			script.Parent.ControlRoom.ControlRoom.CanCollide = false;
			script.Parent.ControlRoom.ControlRoom2.CanCollide = false;
			script.Parent.ControlRoom.ControlRoom3.CanCollide = false;
			script.Parent.ControlRoom.ControlRoom4.CanCollide = false;
			script.Parent.ControlRoom.ControlRoom5.CanCollide = false;
			script.Parent.ControlRoom.SeatPart.CanCollide = false;
			script.Parent.ControlRoom.Seat.CanCollide = false;
			script.Parent.ControlRoom.Seat2.CanCollide = false;
			script.Parent.Top.Weight.CanCollide = false;
			script.Parent.Top.Weight2.CanCollide = false;
			script.Parent.Top.Weight3.CanCollide = false;
			script.Parent.Top.Weight4.CanCollide = false;
			script.Parent.Top.Roof.CanCollide = false;
			script.Parent.Top.Roof2.CanCollide = false;
			script.Parent.Top.Roof3.CanCollide = false;
			script.Parent.Top.CraneTop.CanCollide = false;
			script.Parent.Top.CraneTop2.CanCollide = false;
			return;
		end;
	elseif v1 then
		script.Parent.ControlRoom.ControlRoom.CanCollide = true;
		script.Parent.ControlRoom.ControlRoom2.CanCollide = true;
		script.Parent.ControlRoom.ControlRoom3.CanCollide = true;
		script.Parent.ControlRoom.ControlRoom4.CanCollide = true;
		script.Parent.ControlRoom.ControlRoom5.CanCollide = true;
		script.Parent.ControlRoom.SeatPart.CanCollide = true;
		script.Parent.ControlRoom.Seat.CanCollide = true;
		script.Parent.ControlRoom.Seat2.CanCollide = true;
		script.Parent.Top.Weight.CanCollide = true;
		script.Parent.Top.Weight2.CanCollide = true;
		script.Parent.Top.Weight3.CanCollide = true;
		script.Parent.Top.Weight4.CanCollide = true;
		script.Parent.Top.Roof.CanCollide = true;
		script.Parent.Top.Roof2.CanCollide = true;
		script.Parent.Top.Roof3.CanCollide = true;
		script.Parent.Top.CraneTop.CanCollide = true;
		script.Parent.Top.CraneTop2.CanCollide = true;
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("CraneGui"):Destroy();
		workspace.CurrentCamera.CameraSubject = v1;
		v1 = nil;
	end;
end);
local l_UserInputService_0 = game:GetService("UserInputService");
l_UserInputService_0.InputBegan:Connect(function(v5, v6) --[[ Line: 102 ]]
	if v6 then
		return;
	else
		if v5.KeyCode == Enum.KeyCode.E then
			script.Parent.RemoteEvent:FireServer("WinchUpBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.Q then
			script.Parent.RemoteEvent:FireServer("WinchDownBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.W then
			script.Parent.RemoteEvent:FireServer("SlideForwardBegan");
		end;
		if v5.KeyCode == Enum.KeyCode.S then
			script.Parent.RemoteEvent:FireServer("SlideBackBegan");
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
l_UserInputService_0.InputEnded:Connect(function(v7, v8) --[[ Line: 132 ]]
	if v8 then
		return;
	else
		if v7.KeyCode == Enum.KeyCode.E then
			script.Parent.RemoteEvent:FireServer("WinchUpEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.Q then
			script.Parent.RemoteEvent:FireServer("WinchDownEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.W then
			script.Parent.RemoteEvent:FireServer("SlideForwardEnded");
		end;
		if v7.KeyCode == Enum.KeyCode.S then
			script.Parent.RemoteEvent:FireServer("SlideBackEnded");
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
local v10 = script.Parent:GetAttribute("OwnerId") == game.Players.LocalPlayer.UserId;
l_FirstChildWhichIsA_1.Enabled = v10;
if v10 then
	l_FirstChildWhichIsA_0:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 167 ]]
		if l_FirstChildWhichIsA_0.Occupant and l_FirstChildWhichIsA_0.Occupant.Parent == game.Players.LocalPlayer.Character then
			l_FirstChildWhichIsA_1.Enabled = false;
			return;
		else
			l_FirstChildWhichIsA_1.Enabled = true;
			return;
		end;
	end);
end;