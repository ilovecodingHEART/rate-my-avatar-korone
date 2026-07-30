-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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
RotateBlimp3 = function()
	local v6 = l_TweenService_0:Create(v3, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		CFrame = v3.CFrame * CFrame.Angles(-0.017453292519943295, -2.351592653589793, 0)
	});
	v6:Play();
	return v6;
end;
RotateBlimp4 = function()
	local v67= l_TweenService_0:Create(v3, TweenInfo.new(30, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		CFrame = v3.CFrame * CFrame.Angles(-0.017453292519943295, -2.351592653589793, 0)
	});
	v67:Play();
	return v67;
end;
AwardBlimpBadge = function(v6)
	if l_BadgeService_0:UserHasBadgeAsync(v6.UserId, 3604249210251033) then
		return ;
	else
		l_BadgeService_0:AwardBadge(v6.UserId, 3604249210251033);
		return ;
	end;
end;
--[[ script.Parent.Body.Touched:Connect(function(v7)
	if v7.Parent:FindFirstChild("Humanoid") then
		local v8 = game.Players:WaitForChild(v7.Parent.Name, 5);
		if l_BadgeService_0:UserHasBadgeAsync(v8.UserId, 3604249210251033) then
			return ;
		else
			local l_BadgeService_0 = game:GetService("BadgeService");
		end
	end;
end); --]]
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
		wait(3);
		RotateBlimp3().Completed:Connect(function()
			wait(15);
			spawn(function()
				RotateBlimp4().Completed:Connect(function()
					wait(5)
				end)
				spawn(function()
					wait(15) -- use ts ok
					script.Parent:Destroy()
				end)
			end)			
		end)
	end);
end);
-- do we update and ads?
-- alr

-- do them and join game
-- k