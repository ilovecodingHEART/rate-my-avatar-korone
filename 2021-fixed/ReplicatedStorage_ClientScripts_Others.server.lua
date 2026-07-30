-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
task.wait(2);
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
local v12 = require(l_ReplicatedStorage_0.Remotes);
local function _(v13, v14, v15, v16) --[[ Line: 20 ]] --[[ Name: tween ]]
	local v17 = TweenInfo.new(v14, v16 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(v13, v17, v15):Play();
end;
l_ScreenGui_0.TutorialA:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 27 ]]
	l_ScreenGui_0.TutorialA.Frame.WelcomeText.Text = "Hey, " .. l_LocalPlayer_0.DisplayName .. "!";
	local v19 = v12.Function("FetchCreateLink"):InvokeServer();
	l_ScreenGui_0.TutorialB.Frame.Link.Text = v19;
end);
l_CollectionService_0:GetInstanceAddedSignal("MailBox"):Connect(function(v20) --[[ Line: 33 ]]
	v20:WaitForChild("Door");
	v20.Door.ProximityPrompt.Triggered:Connect(function() --[[ Line: 35 ]]
		l_ScreenGui_0.Gifts.Visible = true;
	end);
end);
for _, v22 in l_CollectionService_0:GetTagged("MailBox") do
	v22.Door.ProximityPrompt.Triggered:Connect(function() --[[ Line: 41 ]]
		l_ScreenGui_0.Gifts.Visible = true;
	end);
end;
local v23 = false;
local function v30()
	if workspace.CurrentCamera.CFrame.Position.Y < -12 then
		if not v23 then
			v23 = true;
			local l_Water_0 = l_PlayerGui_0.CustomCoreGui.Water;
			local v25 = {
				BackgroundTransparency = 0
			};
			local v26 = TweenInfo.new(1, Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_Water_0, v26, v25):Play();
		end;
	elseif v23 then
		v23 = false;
		local l_Water_1 = l_PlayerGui_0.CustomCoreGui.Water;
		local v28 = {
			BackgroundTransparency = 1
		};
		local v29 = TweenInfo.new(1, Enum.EasingStyle.Quint);
		l_TweenService_0:Create(l_Water_1, v29, v28):Play();
	end;
	if l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart").Position.Y < -12 then
		l_LocalPlayer_0.Character.Humanoid:SetStateEnabled("GettingUp", false);
		l_LocalPlayer_0.Character.Humanoid:ChangeState("Swimming");
		workspace.Gravity = 10;
		return;
	else
		if l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart").Position.Y > -10 then
			l_LocalPlayer_0.Character.Humanoid:SetStateEnabled("GettingUp", true);
			workspace.Gravity = 196.2;
		end;
		return;
	end;
end;
local v31 = {};
local function v44() --[[ Line: 73 ]] --[[ Name: mailboxTween ]]
	for _, v33 in l_CollectionService_0:GetTagged("MailBox") do
		local l_Magnitude_0 = (v33.Door.Position - workspace.CurrentCamera.CFrame.Position).Magnitude;
		local v35 = v31[v33];
		if l_Magnitude_0 <= 40 then
			if not v35 then
				v31[v33] = true;
				local l_UIScale_0 = v33.BillboardGui.Count.UIScale;
				local v37 = {
					Scale = 1
				};
				local l_Back_0 = Enum.EasingStyle.Back;
				local v39 = TweenInfo.new(0.3, l_Back_0 or Enum.EasingStyle.Quint);
				l_TweenService_0:Create(l_UIScale_0, v39, v37):Play();
			end;
		elseif v35 then
			v31[v33] = nil;
			local l_UIScale_1 = v33.BillboardGui.Count.UIScale;
			local v41 = {
				Scale = -0.1
			};
			local l_Back_1 = Enum.EasingStyle.Back;
			local v43 = TweenInfo.new(0.3, l_Back_1 or Enum.EasingStyle.Quint);
			l_TweenService_0:Create(l_UIScale_1, v43, v41):Play();
		end;
	end;
end;
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 91 ]] --[[ Name: onRenderStepped ]]
	v44();
	if l_Players_0.LocalPlayer:FindFirstChild("PlayerScripts") == nil then
		return;
	else
		v30();
		local l_Target_0 = l_l_LocalPlayer_0_Mouse_0.Target;
		if l_Target_0 ~= nil and l_CollectionService_0:HasTag(l_Target_0, "Prop") then
			script.Highlight.Adornee = l_Target_0;
			script.Highlight.OutlineTransparency = 0;
			script.Highlight.FillTransparency = 0.8;
			return;
		elseif l_Target_0 ~= nil and l_CollectionService_0:HasTag(l_Target_0.Parent, "Prop") then
			script.Highlight.Adornee = l_l_LocalPlayer_0_Mouse_0.Target.Parent;
			script.Highlight.OutlineTransparency = 0;
			script.Highlight.FillTransparency = 0.8;
			return;
		else
			script.Highlight.OutlineTransparency = 1;
			script.Highlight.FillTransparency = 1;
			return;
		end;
	end;
end);