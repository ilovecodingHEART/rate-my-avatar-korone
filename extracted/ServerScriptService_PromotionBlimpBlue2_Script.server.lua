local l_BadgeService_0 = game:GetService("BadgeService");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = script.Parent:WaitForChild("AlignOrientation", 50);
RotateBlimp = function()
	local v4 = l_TweenService_0:Create(v3, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		CFrame = v3.CFrame * CFrame.Angles(0.017453292519943295, -3.141592653589793, 0)
	});
	v4:Play();
	return v4;
end;
RotateBlimp2 = function()
	local v5 = l_TweenService_0:Create(v3, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		CFrame = v3.CFrame * CFrame.Angles(0.017453292519943295, 2.443460952792061, 0)
	});
	v5:Play();
	return v5;
end;
AwardBlimpBadge = function(v6)
	if l_BadgeService_0:UserHasBadgeAsync(v6.UserId, 1739944382) then
		return ;
	else
		l_BadgeService_0:AwardBadge(v6.UserId, 1739944382);
		return ;
	end;
end;
script.Parent.Body.Touched:Connect(function(v7)
	if v7.Parent:FindFirstChild("Humanoid") then
		local v8 = game.Players:WaitForChild(v7.Parent.Name, 5);
		--[[if l_BadgeService_0:UserHasBadgeAsync(v8.UserId, 1739944382) then
			return ;
		else
			l_BadgeService_0:AwardBadge(v8.UserId, 1739944382);
		end;]]
	end;
end);
v3.CFrame = script.Parent:WaitForChild("Body", 10).CFrame * CFrame.Angles(0.017453292519943295, 0, 0);
script.Parent:WaitForChild("LinearVelocity", 25).VectorVelocity = Vector3.new(-10, -4, 0);
wait(18);
script.Parent:WaitForChild("LinearVelocity", 25).VectorVelocity = Vector3.new(-10, 0, 0);
wait(2);
RotateBlimp().Completed:Connect(function()
	wait(3);
	RotateBlimp2().Completed:Connect(function()
		wait(4);
		script.Parent:WaitForChild("LinearVelocity", 50).VectorVelocity = Vector3.new(-10, 4, 0);
		l_TweenService_0:Create(script.Parent:WaitForChild("LinearVelocity", 25), TweenInfo.new(27.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			VectorVelocity = Vector3.new(-10, 0, 0)
		}):Play();
		wait(22);
		script.Parent:Destroy();
	end);
end);