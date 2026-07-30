-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("UserService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("StarterGui");
local l_Lighting_0 = game:GetService("Lighting");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_SoundService_0 = game:GetService("SoundService");
local l_GuiService_0 = game:GetService("GuiService");
local v10 = require(l_ReplicatedStorage_0.Remotes);
local v11 = require(l_ReplicatedStorage_0.Packages.Promise);
local l_GiftIsland_0 = l_ReplicatedStorage_0.GiftIsland;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local _ = l_LocalPlayer_0:GetMouse();
local l_ScreenGui_0 = l_PlayerGui_0:WaitForChild("ScreenGui");
local _ = l_PlayerGui_0:WaitForChild("LoadingGui");
local _ = l_PlayerGui_0:WaitForChild("CustomCoreGui");
local l_UITemplates_0 = game:GetService("StarterGui"):WaitForChild("UITemplates");
local _ = l_ReplicatedStorage_0.Templates;
local v21 = require(l_ReplicatedStorage_0.npcall);
local function _(v22, v23, v24) --[[ Line: 35 ]] --[[ Name: tween ]]
	l_TweenService_0:Create(v22, TweenInfo.new(v23, Enum.EasingStyle.Quint), v24):Play();
end;
local function v28() --[[ Line: 41 ]] --[[ Name: disableControls ]]
	local l_Controls_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule")):GetControls();
	local v27 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 44 ]]
		l_Controls_0:Disable();
	end);
	l_UserInputService_0.ModalEnabled = true;
	task.defer(function() --[[ Line: 48 ]]
		l_UserInputService_0:GetPropertyChangedSignal("ModalEnabled"):Wait();
		l_Controls_0:Enable();
		v27:Disconnect();
	end);
end;
local function v38(v29) --[[ Line: 55 ]] --[[ Name: toggleLoading ]]
	if v29 == true then
		local l_Camera_0 = workspace.Camera;
		local v31 = {
			FieldOfView = 50
		};
		l_TweenService_0:Create(l_Camera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v31):Play();
		l_Camera_0 = l_ScreenGui_0.Loading;
		v31 = {
			GroupTransparency = 0
		};
		l_TweenService_0:Create(l_Camera_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v31):Play();
		return;
	else
		if l_ScreenGui_0.Shade == 1 then
			local l_Camera_1 = workspace.Camera;
			local v33 = {
				FieldOfView = 70
			};
			l_TweenService_0:Create(l_Camera_1, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v33):Play();
		else
			local l_Camera_2 = workspace.Camera;
			local v35 = {
				FieldOfView = 60
			};
			l_TweenService_0:Create(l_Camera_2, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v35):Play();
		end;
		local l_Loading_0 = l_ScreenGui_0.Loading;
		local v37 = {
			GroupTransparency = 1
		};
		l_TweenService_0:Create(l_Loading_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v37):Play();
		return;
	end;
end;
local function QuataunV3(v39, v40) --[[ Line: 70 ]] --[[ Name: popup ]]
	spawn(function() --[[ Line: 71 ]]
		l_SoundService_0.SFX.BellRing:Play();
		local v41 = l_UITemplates_0[v39 .. "Popup"];
		if not v41 then
			print("NOPE");
			return;
		else
			local v42 = v41:Clone();
			v42.Message.Text = v40;
			v42.Transparency = 1;
			v42.UIScale.Scale = 0;
			v42.Parent = l_ScreenGui_0.Popups;
			local v43 = {
				Transparency = 0
			};
			l_TweenService_0:Create(v42, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v43):Play();
			v43 = v42.UIScale;
			local v44 = {
				Scale = 1
			};
			local l_Back_0 = Enum.EasingStyle.Back;
			l_TweenService_0:Create(v43, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v44):Play();
			v43 = v42.Message;
			v44 = {
				MaxVisibleGraphemes = #v40
			};
			l_TweenService_0:Create(v43, TweenInfo.new(1, Enum.EasingStyle.Quint), v44):Play();
			wait(4);
			v43 = {
				Transparency = 1
			};
			l_TweenService_0:Create(v42, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v43):Play();
			v43 = v42.UIScale;
			v44 = {
				Scale = 0
			};
			l_Back_0 = Enum.EasingStyle.Back;
			l_TweenService_0:Create(v43, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v44):Play();
			wait(0.5);
			v42:Destroy();
			return;
		end;
	end);
end;
local function QuataunV2() --[[ Line: 96 ]] --[[ Name: enableControls ]]
	l_UserInputService_0.ModalEnabled = false;
end;
local l_CFrame_0 = l_ReplicatedStorage_0.GiftIsland.GiftIsland.CameraPart.CFrame;
local function v52(v49, v50) --[[ Line: 101 ]] --[[ Name: cameraFocus ]]
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
	local v51 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 104 ]]
		if v50 then
			workspace.CurrentCamera.CFrame = v49 * CFrame.lookAt(Vector3.new(-10, 20, -70, 0), (Vector3.new(-10, 10, 0, 0)));
			return;
		else
			workspace.CurrentCamera.CFrame = l_CFrame_0;
			workspace.CurrentCamera.FieldOfView = 25;
			return;
		end;
	end);
	return function() --[[ Line: 116 ]]
		v51:Disconnect();
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
	end;
end;
local v53 = nil;
local function v63() --[[ Line: 123 ]] --[[ Name: userInputStopGifting ]]
	if v53 then
		local l_Camera_3 = workspace.Camera;
		local v55 = {
			FieldOfView = 70
		};
		l_TweenService_0:Create(l_Camera_3, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v55):Play();
		l_Camera_3 = spawn;
		local v56 = "success";
		local v57 = "normal mode!";
		l_Camera_3(function() --[[ Line: 71 ]]
			l_SoundService_0.SFX.BellRing:Play();
			local v58 = l_UITemplates_0[v56 .. "Popup"];
			if not v58 then
				print("NOPE");
				return;
			else
				local v59 = v58:Clone();
				v59.Message.Text = v57;
				v59.Transparency = 1;
				v59.UIScale.Scale = 0;
				v59.Parent = l_ScreenGui_0.Popups;
				local v60 = {
					Transparency = 0
				};
				l_TweenService_0:Create(v59, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v60):Play();
				v60 = v59.UIScale;
				local v61 = {
					Scale = 1
				};
				local l_Back_1 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v60, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v61):Play();
				v60 = v59.Message;
				v61 = {
					MaxVisibleGraphemes = #v57
				};
				l_TweenService_0:Create(v60, TweenInfo.new(1, Enum.EasingStyle.Quint), v61):Play();
				wait(4);
				v60 = {
					Transparency = 1
				};
				l_TweenService_0:Create(v59, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v60):Play();
				v60 = v59.UIScale;
				v61 = {
					Scale = 0
				};
				l_Back_1 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v60, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v61):Play();
				wait(0.5);
				v59:Destroy();
				return;
			end;
		end);
		l_SoundService_0.SFX.Success:Play();
		v53();
	end;
end;
task.defer(function() --[[ Line: 136 ]]
	l_LocalPlayer_0.PlayerGui:WaitForChild("ScreenGui");
	l_LocalPlayer_0.PlayerGui.ScreenGui.Exit.Close.Activated:Connect(v63);
end);
l_UserInputService_0.InputBegan:Connect(function(v64) --[[ Line: 140 ]]
	l_LocalPlayer_0.PlayerGui:WaitForChild("ScreenGui");
	if l_LocalPlayer_0.PlayerGui.ScreenGui.Exit.Visible and v64.KeyCode == Enum.KeyCode.ButtonB then
		v63();
	end;
end);
local v65 = nil;
local function v109(v66) --[[ Line: 149 ]] --[[ Name: loadOfflinePlayer ]]
	if v65 and coroutine.status(v65) ~= "dead" then
		error("already loading gifting");
	end;
	v65 = coroutine.running();
	if v53 then
		v53();
	end;
	v38(true);
	local v67 = v11.try(function() --[[ Line: 159 ]]
		return l_Players_0:CreateHumanoidModelFromUserId(v66.Id);
	end);
	local v68, v69 = v21(function() --[[ Line: 163 ]]
		return v10.Function("OfflinePlayerLookup"):InvokeServer(v66.Id);
	end);
	v38(false);
	if v68 then
		local l_spawn_0 = spawn;
		local v71 = "danger";
		local v72 = "failed to gift";
		l_spawn_0(function() --[[ Line: 71 ]]
			l_SoundService_0.SFX.BellRing:Play();
			local v73 = l_UITemplates_0[v71 .. "Popup"];
			if not v73 then
				print("NOPE");
				return;
			else
			local banInfo = v10.Function("GetBanInfo"):InvokeServer(v66.Id);

			if banInfo and banInfo.isBanned == true then
				local reasontext = ("This player was banned for: %s"):format(banInfo.reason or "no reason provided")
					spawn(function()
						QuataunV3("danger", reasontext)
					end)
					return
				end
				local v74 = v73:Clone();
				v74.Message.Text = v72;
				v74.Transparency = 1;
				v74.UIScale.Scale = 0;
				v74.Parent = l_ScreenGui_0.Popups;
				local v75 = {
					Transparency = 0
				};
				l_TweenService_0:Create(v74, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v75):Play();
				v75 = v74.UIScale;
				local v76 = {
					Scale = 1
				};
				local l_Back_2 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v75, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v76):Play();
				v75 = v74.Message;
				v76 = {
					MaxVisibleGraphemes = #v72
				};
				l_TweenService_0:Create(v75, TweenInfo.new(1, Enum.EasingStyle.Quint), v76):Play();
				wait(4);
				v75 = {
					Transparency = 1
				};
				l_TweenService_0:Create(v74, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v75):Play();
				v75 = v74.UIScale;
				v76 = {
					Scale = 0
				};
				l_Back_2 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v75, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v76):Play();
				wait(0.5);
				v74:Destroy();
				return;
			end;
		end);
		return;
	else
		v69:PivotTo(l_GiftIsland_0.GiftIsland.PrimaryPart.CFrame);
		local l_BoothUI_0 = v69.BoothUI;
		l_SoundService_0.SFX.Success:Play();
		l_ScreenGui_0.Gift.Visible = false;
		local l_spawn_2 = spawn;
		local v89 = "success";
		local v90 = "gifting mode!";
		local l_v89_0 = v89 --[[ copy: 8 -> 12 ]];
		local l_v90_0 = v90 --[[ copy: 9 -> 13 ]];
		l_spawn_2(function() --[[ Line: 71 ]]
			l_SoundService_0.SFX.BellRing:Play();
			local v93 = l_UITemplates_0[l_v89_0 .. "Popup"];
			if not v93 then
				print("NOPE");
				return;
			else
				local v94 = v93:Clone();
				v94.Message.Text = l_v90_0;
				v94.Transparency = 1;
				v94.UIScale.Scale = 0;
				v94.Parent = l_ScreenGui_0.Popups;
				local v95 = {
					Transparency = 0
				};
				l_TweenService_0:Create(v94, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v95):Play();
				v95 = v94.UIScale;
				local v96 = {
					Scale = 1
				};
				local l_Back_4 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v95, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v96):Play();
				v95 = v94.Message;
				v96 = {
					MaxVisibleGraphemes = #l_v90_0
				};
				l_TweenService_0:Create(v95, TweenInfo.new(1, Enum.EasingStyle.Quint), v96):Play();
				wait(4);
				v95 = {
					Transparency = 1
				};
				l_TweenService_0:Create(v94, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v95):Play();
				v95 = v94.UIScale;
				v96 = {
					Scale = 0
				};
				l_Back_4 = Enum.EasingStyle.Back;
				l_TweenService_0:Create(v95, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v96):Play();
				wait(0.5);
				v94:Destroy();
				return;
			end;
		end);
		l_spawn_2 = workspace.Camera;
		local v98 = {
			FieldOfView = 35
		};
		l_TweenService_0:Create(l_spawn_2, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v98):Play();
		l_spawn_2 = l_Lighting_0.Blur;
		v98 = {
			Size = 0
		};
		l_TweenService_0:Create(l_spawn_2, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v98):Play();
		l_BoothUI_0.Details.Owner.Text = v66.DisplayName .. "'s stand";
		v69.Parent = workspace;
		l_BoothUI_0.Parent = l_LocalPlayer_0.PlayerGui;
		task.defer(function() --[[ Line: 191 ]]
			while v69.Parent == workspace do
				v69.AncestryChanged:Wait();
			end;
			l_BoothUI_0.Parent = v69;
		end);
		l_spawn_2, v98 = v21(v67.expect, v67);
		if l_spawn_2 then
			v89 = spawn;
			local v99 = "warn";
			local v100 = "failed to load avatar";
			v89(function() --[[ Line: 71 ]]
				l_SoundService_0.SFX.BellRing:Play();
				local v101 = l_UITemplates_0[v99 .. "Popup"];
				if not v101 then
					print("NOPE");
					return;
				else
					local v102 = v101:Clone();
					v102.Message.Text = v100;
					v102.Transparency = 1;
					v102.UIScale.Scale = 0;
					v102.Parent = l_ScreenGui_0.Popups;
					local v103 = {
						Transparency = 0
					};
					l_TweenService_0:Create(v102, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v103):Play();
					v103 = v102.UIScale;
					local v104 = {
						Scale = 1
					};
					local l_Back_5 = Enum.EasingStyle.Back;
					l_TweenService_0:Create(v103, TweenInfo.new(0.3, Enum.EasingStyle.Quint), v104):Play();
					v103 = v102.Message;
					v104 = {
						MaxVisibleGraphemes = #v100
					};
					l_TweenService_0:Create(v103, TweenInfo.new(1, Enum.EasingStyle.Quint), v104):Play();
					wait(4);
					v103 = {
						Transparency = 1
					};
					l_TweenService_0:Create(v102, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v103):Play();
					v103 = v102.UIScale;
					v104 = {
						Scale = 0
					};
					l_Back_5 = Enum.EasingStyle.Back;
					l_TweenService_0:Create(v103, TweenInfo.new(0.5, Enum.EasingStyle.Quint), v104):Play();
					wait(0.5);
					v102:Destroy();
					return;
				end;
			end);
		end;
		if v98 then
			v98.Parent = workspace;
		end;
		v89 = v11.delay(0.5);
		v90 = nil;
		task.defer(function() --[[ Line: 210 ]]
			l_GuiService_0.AutoSelectGuiEnabled = false;
			l_GiftIsland_0.Parent = workspace;
			l_LocalPlayer_0.PlayerGui.ScreenGui.Exit.Visible = true;
			l_LocalPlayer_0.PlayerGui.CustomCoreGui.Toolbar.Visible = false;
			local l_v69_BoundingBox_0 = v69:GetBoundingBox();
			local v107 = v69.Name == "CraneBooth";
			if v98 then
				if v107 then
					local v108 = v69.ControlRoom.SeatPart.CFrame * CFrame.new(0, 0, -0.5);
					v98.HumanoidRootPart.CFrame = l_v69_BoundingBox_0;
					v98:MoveTo(v108.Position);
				else
					v98.HumanoidRootPart.CFrame = l_v69_BoundingBox_0;
					v98:MoveTo(l_v69_BoundingBox_0 * Vector3.new(0, 0, 4, 0));
				end;
			end;
			v89:andThen(function() --[[ Line: 229 ]]
				v90 = v52(l_v69_BoundingBox_0, v107);
				v28();
			end);
		end);
		v53 = function() --[[ Line: 234 ]]
			v53 = nil;
			l_GuiService_0.AutoSelectGuiEnabled = true;
			l_LocalPlayer_0.PlayerGui.ScreenGui.Exit.Visible = false;
			l_LocalPlayer_0.PlayerGui.CustomCoreGui.Toolbar.Visible = true;
			if v98 then
				v98:Destroy();
			end;
			v69.Parent = l_ReplicatedStorage_0.OfflineBooths;
			l_UserInputService_0.ModalEnabled = false;
			v90();
			v89:cancel();
			l_GiftIsland_0.Parent = nil;
		end;
		return;
	end;
end;

local function v111(v110) --[[ Line: 252 ]] --[[ Name: forCharacter ]]
	if v53 then
		v53();
	end;
	v110:WaitForChild("Humanoid").Died:Connect(function() --[[ Line: 256 ]]
		if v53 then
			v53();
		end;
	end);
end;
if l_LocalPlayer_0.Character then
	task.spawn(v111, l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:Connect(v111);
return v109;