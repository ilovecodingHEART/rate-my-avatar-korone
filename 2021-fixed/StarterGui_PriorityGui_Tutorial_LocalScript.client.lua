-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ArrowBeams_0 = require(script:WaitForChild("ArrowBeams"));
local v5 = require(game.ReplicatedStorage.ConfettiCannon);
local l_HumanoidRootPart_0 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");
local v7 = l_ArrowBeams_0.new(l_HumanoidRootPart_0);
local v8 = nil;
local l_Parent_0 = script.Parent;
local l_SelectionBox_0 = Instance.new("SelectionBox");
l_SelectionBox_0.LineThickness = 0.05;
l_SelectionBox_0.SurfaceTransparency = 0.5;
l_SelectionBox_0.Color3 = Color3.fromRGB(255, 255, 0);
l_SelectionBox_0.Name = "BoothSelector";
l_SelectionBox_0.Visible = false;
l_SelectionBox_0.Parent = workspace;
local v11 = nil;
local function v14() --[[ Line: 27 ]] --[[ Name: playerAlreadyHasBooth ]]
	-- upvalues: l_LocalPlayer_0 (copy)
	for _, v13 in pairs(workspace.BoothInteractions:GetChildren()) do
		if v13:GetAttribute("BoothOwner") == l_LocalPlayer_0.UserId then
			return true;
		end;
	end;
	return false;
end;
local function v21() --[[ Line: 36 ]] --[[ Name: getClosestUnclaimedBooth ]]
	-- upvalues: l_HumanoidRootPart_0 (copy)
	local v15 = nil;
	local v16 = 1e999;
	for _, v18 in pairs(workspace.BoothInteractions:GetChildren()) do
		local l_v18_Attribute_0 = v18:GetAttribute("BoothOwner");
		if l_v18_Attribute_0 == 0 or l_v18_Attribute_0 == nil then
			local l_Magnitude_0 = (v18.Position - l_HumanoidRootPart_0.Position).Magnitude;
			if l_Magnitude_0 < v16 then
				v16 = l_Magnitude_0;
				v15 = v18;
			end;
		end;
	end;
	return v15;
end;
l_LocalPlayer_0.PlayerGui.PriorityGui.Tutorial.Buttons.Exit.Activated:Connect(function() --[[ Line: 54 ]]
	-- upvalues: l_LocalPlayer_0 (copy)
	l_LocalPlayer_0.PlayerGui.PriorityGui.Tutorial.Visible = false;
	l_LocalPlayer_0.PlayerGui.CustomCoreGui.Toolbar.Visible = true;
	l_LocalPlayer_0.PlayerGui.ScreenGui.Giftbux.Visible = true;
	l_LocalPlayer_0.PlayerGui.ScreenGui.NavigationButtons.Visible = true;
end);
local function v29() --[[ Line: 61 ]] --[[ Name: playTutorial ]]
	-- upvalues: l_Parent_0 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy), v14 (copy), v5 (copy), v7 (copy), v8 (ref), l_SelectionBox_0 (copy), v11 (ref), v21 (copy)
	l_Parent_0.Visible = true;
	l_LocalPlayer_0.PlayerGui.CustomCoreGui.Toolbar.Visible = false;
	l_LocalPlayer_0.PlayerGui.ScreenGui.Giftbux.Visible = false;
	l_LocalPlayer_0.PlayerGui.ScreenGui.NavigationButtons.Visible = false;
	local v22 = false;
	local v23 = nil;
	v23 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 70 ]]
		-- upvalues: v14 (ref), v22 (ref), v5 (ref), v7 (ref), v8 (ref), l_SelectionBox_0 (ref), v11 (ref), l_Parent_0 (ref), v23 (ref), v21 (ref), l_RunService_0 (ref)
		if v14() and not v22 then
			v22 = true;
			game.SoundService.SFX.TutorialSuccess:Play();
			v5.Fire({
				Parent = script.Parent.Parent, 
				Template = script.ImageLabel, 
				Count = 20, 
				RandomColors = true, 
				Colors = {
					Color3.fromRGB(255, 106, 106), 
					Color3.fromRGB(106, 255, 142), 
					Color3.fromRGB(106, 184, 255), 
					Color3.fromRGB(255, 234, 106)
				}
			});
			v7:Disable();
			v7:Destroy();
			if v8 then
				l_SelectionBox_0.Visible = false;
				l_SelectionBox_0.Adornee = nil;
			end;
			if v11 then
				v11:Disconnect();
				v11 = nil;
			end;
			l_Parent_0.Buttons.Visible = true;
			l_Parent_0.Hint.Text = "Now, you have to create a gamepass on the Roblox website to start earning Robux! Press View Tutorial to know how!";
			task.wait(0.1)
			l_LocalPlayer_0.PlayerGui.ScreenGui.TutorialA.Visible = true;
			if v23 then
				v23:Disconnect();
				v23 = nil;
			end;
			return;
		else
			local v24 = v21();
			if v24 ~= v8 then
				v8 = v24;
				if v8 then
					v7:setTarget(v8.Position);
					v7:Enable();
				else
					v7:Disable();
				end;
				if v11 then
					v11:Disconnect();
					v11 = nil;
				end;
				l_SelectionBox_0.Visible = false;
				l_SelectionBox_0.Adornee = nil;
				if v8 then
					local v25 = v8:FindFirstChild("HighlightPart") or v8:FindFirstChildWhichIsA("BasePart");
					if v25 then
						l_SelectionBox_0.Adornee = v25;
						l_SelectionBox_0.Visible = true;
						local l_Y_0 = v25.Position.Y;
						v11 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 143 ]]
							-- upvalues: v25 (copy), l_Y_0 (copy)
							local v27 = math.sin(tick() * 2) * 0.25;
							local l_Position_0 = v25.Position;
							v25.Position = Vector3.new(l_Position_0.X, l_Y_0 + v27, l_Position_0.Z);
						end);
					end;
				end;
			end;
			task.wait(1);
			return;
		end;
	end);
end;
task.delay(1, function() --[[ Line: 157 ]]
	-- upvalues: l_LocalPlayer_0 (copy), v29 (copy)
	if l_LocalPlayer_0:GetAttribute("RaisedNumber") == 0 and l_LocalPlayer_0:GetAttribute("DonatedNumber") == 0 then
		v29();
	end;
end);
l_LocalPlayer_0.PlayerGui.ScreenGui.TutorialD:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 163 ]]
	-- upvalues: l_LocalPlayer_0 (copy), v5 (copy)
	if l_LocalPlayer_0.PlayerGui.ScreenGui.TutorialD.Visible == true then
		game.SoundService.SFX.TutorialSuccess:Play();
		v5.Fire({
			Parent = script.Parent.Parent, 
			Template = script.ImageLabel, 
			Count = 20, 
			RandomColors = true, 
			Colors = {
				Color3.fromRGB(255, 106, 106), 
				Color3.fromRGB(106, 255, 142), 
				Color3.fromRGB(106, 184, 255), 
				Color3.fromRGB(255, 234, 106)
			}
		});
		v5.Fire({
			Parent = script.Parent.Parent, 
			Template = script.RobuxIcon, 
			Count = 15, 
			RandomColors = true, 
			Colors = {
				Color3.fromRGB(255, 170, 0), 
				Color3.fromRGB(255, 217, 0), 
				Color3.fromRGB(255, 217, 80), 
				Color3.fromRGB(255, 193, 35)
			}
		});
	end;
end);