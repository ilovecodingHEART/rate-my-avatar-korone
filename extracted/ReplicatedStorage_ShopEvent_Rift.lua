-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 05:01:32
-- Luau version 6, Types version 3
-- Time taken: 0.008922 seconds

local function Emit_upvr(arg1, arg2) -- Line 7, Named "Emit"
	for _, v in pairs(arg1:GetChildren()) do
		if v:IsA("ParticleEmitter") then
			if arg2 then
				v.Color = ColorSequence.new(arg2)
			end
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
end
local function _(arg1, arg2, arg3) -- Line 19, Named "EmitSound"
	local clone_upvr_4 = arg2:Clone()
	clone_upvr_4.Parent = arg1
	clone_upvr_4.Volume = arg3
	clone_upvr_4:Play()
	task.spawn(function() -- Line 25
		--[[ Upvalues[1]:
			[1]: clone_upvr_4 (readonly)
		]]
		repeat
			task.wait()
		until 0 < clone_upvr_4.TimeLength
		task.delay(clone_upvr_4.TimeLength, function() -- Line 28
			--[[ Upvalues[1]:
				[1]: clone_upvr_4 (copied, readonly)
			]]
			clone_upvr_4:Destroy()
		end)
	end)
end
local module = {}
local Players_upvr = game:GetService("Players")
local Assets_upvr = script:WaitForChild("Assets")
local random_state_upvr = Random.new()
local TweenService_upvr = game:GetService("TweenService")
function module.Rift(arg1, arg2, arg3, arg4, arg5) -- Line 36
	--[[ Upvalues[5]:
		[1]: Players_upvr (readonly)
		[2]: Assets_upvr (readonly)
		[3]: random_state_upvr (readonly)
		[4]: TweenService_upvr (readonly)
		[5]: Emit_upvr (readonly)
	]]
	local Folder_upvr = Instance.new("Folder")
	Folder_upvr.Name = tick().." Rift Debris"
	Folder_upvr.Parent = workspace
	local Model_upvr = Instance.new("Model")
	Model_upvr.Name = tick().." Rift Distortion Debris"
	Model_upvr.Parent = workspace
	local Highlight = Instance.new("Highlight")
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1
	Highlight.Parent = Model_upvr
	local clone_upvr = Assets_upvr.Sound.RiftSFX1:Clone()
	clone_upvr.Parent = Players_upvr.LocalPlayer
	clone_upvr.Volume = 0.5
	clone_upvr:Play()
	task.spawn(function() -- Line 25
		--[[ Upvalues[1]:
			[1]: clone_upvr (readonly)
		]]
		repeat
			task.wait()
		until 0 < clone_upvr.TimeLength
		task.delay(clone_upvr.TimeLength, function() -- Line 28
			--[[ Upvalues[1]:
				[1]: clone_upvr (copied, readonly)
			]]
			clone_upvr:Destroy()
		end)
	end)
	local clone_upvr_3 = Assets_upvr.Rift1:Clone()
	clone_upvr_3:PivotTo(arg2 * CFrame.Angles(0, math.rad(random_state_upvr:NextNumber(-180, 180)), 0))
	clone_upvr_3:ScaleTo(arg3)
	clone_upvr_3.Parent = Folder_upvr
	local children_2_upvr = clone_upvr_3:GetChildren()
	clone_upvr = table.sort
	clone_upvr(children_2_upvr, function(arg1_2, arg2_2) -- Line 59
		local var41
		if tonumber(arg1_2.Name) >= tonumber(arg2_2.Name) then
			var41 = false
		else
			var41 = true
		end
		return var41
	end)
	clone_upvr = {}
	local var42_upvr = clone_upvr
	for i_2 = 1, #children_2_upvr do
		local tbl = {}
		table.insert(var42_upvr, tbl)
		for _, v_2 in pairs(children_2_upvr[i_2]:GetChildren()) do
			tbl[v_2] = v_2.Size
			v_2.Size = Vector3.new(0, 0, 0)
			local var47 = arg4
			if not var47 then
				var47 = Color3.fromRGB(112, 145, 255)
			end
			v_2.Color = var47
		end
	end
	local clone_upvr_2 = Assets_upvr.Rift1_Distortion:Clone()
	clone_upvr_2:PivotTo(arg2 * CFrame.Angles(0, math.rad(random_state_upvr:NextNumber(-180, 180)), 0))
	clone_upvr_2:ScaleTo(arg3)
	clone_upvr_2.Parent = Model_upvr
	clone_upvr_2.PrimaryPart.Size = Vector3.new(0, 0, 0)
	clone_upvr_2.PrimaryPart.Transparency = 1
	TweenService_upvr:Create(clone_upvr_2.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = clone_upvr_2.PrimaryPart.Size;
		Transparency = 5;
	}):Play()
	task.spawn(function() -- Line 91
		--[[ Upvalues[3]:
			[1]: children_2_upvr (readonly)
			[2]: var42_upvr (readonly)
			[3]: TweenService_upvr (copied, readonly)
		]]
		for i_4 = 1, #children_2_upvr do
			for i_5, v_3 in pairs(var42_upvr[i_4]) do
				i_5.CFrame *= CFrame.new(0, 0, v_3.Z / 2)
				TweenService_upvr:Create(i_5, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					Size = v_3;
					CFrame = i_5.CFrame * CFrame.new(0, 0, -v_3.Z / 2);
				}):Play()
			end
			task.wait(0.02)
		end
	end)
	local function GetFrag_upvr() -- Line 107, Named "GetFrag"
		--[[ Upvalues[1]:
			[1]: Assets_upvr (copied, readonly)
		]]
		local children = Assets_upvr.Frags:GetChildren()
		if 1 <= #children then
			return children[math.random(1, #children)]
		end
		return Assets_upvr.Rift_Cells:GetChildren()[math.random(1, #Assets_upvr.Rift_Cells:GetChildren())]:Clone()
	end
	local function LaunchFrags(arg1_3, arg2_3) -- Line 117
		--[[ Upvalues[9]:
			[1]: GetFrag_upvr (readonly)
			[2]: random_state_upvr (copied, readonly)
			[3]: arg3 (readonly)
			[4]: arg4 (readonly)
			[5]: Folder_upvr (readonly)
			[6]: Model_upvr (readonly)
			[7]: arg2 (readonly)
			[8]: TweenService_upvr (copied, readonly)
			[9]: Assets_upvr (copied, readonly)
		]]
		for _ = 1, arg2_3 do
			local GetFrag_upvr_result1_upvr = GetFrag_upvr()
			local OriginalSize = GetFrag_upvr_result1_upvr:GetAttribute("OriginalSize")
			if not OriginalSize then
				OriginalSize = GetFrag_upvr_result1_upvr.Size
			end
			GetFrag_upvr_result1_upvr.Size = OriginalSize
			if not arg1_3 then
				GetFrag_upvr_result1_upvr.Material = Enum.Material.Neon
				GetFrag_upvr_result1_upvr.Size = GetFrag_upvr_result1_upvr.Size * random_state_upvr:NextNumber(1.25, 1.75) * arg3
				local var63 = arg4
				if not var63 then
					var63 = Color3.fromRGB(112, 145, 255)
				end
				GetFrag_upvr_result1_upvr.Color = var63
				GetFrag_upvr_result1_upvr.Parent = Folder_upvr
			else
				GetFrag_upvr_result1_upvr.Material = Enum.Material.Glass
				GetFrag_upvr_result1_upvr.Size = GetFrag_upvr_result1_upvr.Size * random_state_upvr:NextNumber(1.65, 2.15) * arg3
				GetFrag_upvr_result1_upvr.Transparency = 15
				GetFrag_upvr_result1_upvr.Parent = Model_upvr
			end
			GetFrag_upvr_result1_upvr.CFrame = arg2 * CFrame.Angles(math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)))
			TweenService_upvr:Create(GetFrag_upvr_result1_upvr, TweenInfo.new(random_state_upvr:NextNumber(0.4, 1), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				CFrame = arg2 * CFrame.new(random_state_upvr:NextNumber(-100, 100) * arg3, random_state_upvr:NextNumber(15, 90) * arg3, random_state_upvr:NextNumber(-100, 100) * arg3) * CFrame.Angles(math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)));
			}):Play()
			local Size_upvr = GetFrag_upvr_result1_upvr.Size
			task.delay(random_state_upvr:NextNumber(0.7, 1.2), function() -- Line 146
				--[[ Upvalues[5]:
					[1]: TweenService_upvr (copied, readonly)
					[2]: GetFrag_upvr_result1_upvr (readonly)
					[3]: random_state_upvr (copied, readonly)
					[4]: Size_upvr (readonly)
					[5]: Assets_upvr (copied, readonly)
				]]
				TweenService_upvr:Create(GetFrag_upvr_result1_upvr, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					CFrame = GetFrag_upvr_result1_upvr.CFrame * CFrame.Angles(math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)), math.rad(random_state_upvr:NextNumber(-360, 360)));
					Size = Vector3.new(0, 0, 0);
				}):Play()
				task.delay(2, function() -- Line 152
					--[[ Upvalues[3]:
						[1]: GetFrag_upvr_result1_upvr (copied, readonly)
						[2]: Size_upvr (copied, readonly)
						[3]: Assets_upvr (copied, readonly)
					]]
					GetFrag_upvr_result1_upvr.Size = Size_upvr
					GetFrag_upvr_result1_upvr.Transparency = 0
					GetFrag_upvr_result1_upvr.Parent = Assets_upvr.Frags
				end)
			end)
		end
	end
	LaunchFrags(false, 25)
	LaunchFrags(true, 37.5)
	local clone_upvr_5 = Assets_upvr.Particles:Clone()
	clone_upvr_5:PivotTo(arg2)
	clone_upvr_5:ScaleTo(arg3)
	clone_upvr_5.Parent = Folder_upvr
	for _, v_4_upvr in pairs(clone_upvr_5.Particles.Particles.Beams:GetChildren()) do
		v_4_upvr.Beam.Width0 = 0
		v_4_upvr.Beam.Width1 = 0
		if arg4 then
			v_4_upvr.Beam.Color = ColorSequence.new(arg4)
		end
		TweenService_upvr:Create(v_4_upvr.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Width0 = 165 * arg3;
			Width1 = 125 * arg3;
		}):Play()
		task.delay(1.25, function() -- Line 184
			--[[ Upvalues[2]:
				[1]: TweenService_upvr (copied, readonly)
				[2]: v_4_upvr (readonly)
			]]
			TweenService_upvr:Create(v_4_upvr.Beam, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Brightness = 0;
			}):Play()
		end)
	end
	for i_8, v_5 in pairs(clone_upvr_5.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
		if v_5:IsA("Beam") then
			v_5.Width0 = 0
			v_5.Width1 = 0
			if arg4 then
				v_5.Color = ColorSequence.new(arg4)
			end
			TweenService_upvr:Create(v_5, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Width0 = 185 * arg3;
				Width1 = 650 * arg3;
			}):Play()
			if arg5 and arg5.AutoSlowBeams then
				TweenService_upvr:Create(v_5, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					TextureSpeed = 0;
					Brightness = 0;
				}):Play()
			end
		end
	end
	if arg4 then
		i_8 = clone_upvr_5.Particles
		for _, v_6 in pairs(i_8.Particles.Main:GetChildren()) do
			if v_6:IsA("ParticleEmitter") then
				v_6.Color = ColorSequence.new(arg4)
			end
		end
	end
	Emit_upvr(clone_upvr_5.Particles.Particles.Main)
	local function CloseRift() -- Line 227
		--[[ Upvalues[9]:
			[1]: children_2_upvr (readonly)
			[2]: var42_upvr (readonly)
			[3]: TweenService_upvr (copied, readonly)
			[4]: clone_upvr_2 (readonly)
			[5]: arg5 (readonly)
			[6]: clone_upvr_5 (readonly)
			[7]: clone_upvr_3 (readonly)
			[8]: Model_upvr (readonly)
			[9]: Folder_upvr (readonly)
		]]
		task.spawn(function() -- Line 228
			--[[ Upvalues[3]:
				[1]: children_2_upvr (copied, readonly)
				[2]: var42_upvr (copied, readonly)
				[3]: TweenService_upvr (copied, readonly)
			]]
			for i_10 = 1, #children_2_upvr do
				for i_11, _ in pairs(var42_upvr[i_10]) do
					TweenService_upvr:Create(i_11, TweenInfo.new(2.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						Size = Vector3.new(0, 0, i_11.Size.Z);
					}):Play()
				end
			end
		end)
		TweenService_upvr:Create(clone_upvr_2.PrimaryPart, TweenInfo.new(2.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Transparency = 1;
		}):Play()
		if arg5 and not arg5.AutoSlowBeams then
			for _, v_8 in pairs(clone_upvr_5.Particles.Particles.Main.Burst_Beam1:GetChildren()) do
				if v_8:IsA("Beam") then
					TweenService_upvr:Create(v_8, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						TextureSpeed = 0;
						Brightness = 0;
					}):Play()
				end
			end
		end
		task.wait(3)
		clone_upvr_3:Destroy()
		clone_upvr_2:Destroy()
		clone_upvr_5:Destroy()
		task.wait(2)
		Model_upvr:Destroy()
		Folder_upvr:Destroy()
	end
	if arg5 and arg5.AutoCloseRift then
		task.delay(2, CloseRift)
	end
	return CloseRift
end
return module