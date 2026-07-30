-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 09:59:12
-- Luau version 6, Types version 3
-- Time taken: 0.010842 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService_upvr = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui_upvr = LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui_upvr = PlayerGui_upvr:WaitForChild("ScreenGui")
local ButtonClick_upvr = ReplicatedStorage.KSI.ButtonClick
local Parent = script.Parent
local Button_3 = Parent.Skip.Button
local Button_4 = Parent.Gold.Button
local Button_2 = Parent.Green.Button
local Button = Parent.Parent.Gift.Robux.Button
local function _(arg1, arg2, arg3, arg4) -- Line 23, Named "tween"
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local var12 = arg4
	if not var12 then
		var12 = Enum.EasingStyle.Back
	end
	TweenService_upvr:Create(arg1, TweenInfo.new(arg2, var12), arg3):Play()
end
local function _(arg1) -- Line 27, Named "updateUIForSeat"
	--[[ Upvalues[2]:
		[1]: ScreenGui_upvr (readonly)
		[2]: PlayerGui_upvr (readonly)
	]]
	local var13 = arg1
	if var13 then
		if arg1.Name ~= "KSISeat" then
			var13 = false
		else
			var13 = true
		end
	end
	ScreenGui_upvr.Enabled = not var13
	PlayerGui_upvr.KSI.Enabled = var13
	PlayerGui_upvr.CustomCoreGui.Enabled = not var13
end
local function setupButton(arg1) -- Line 35
	--[[ Upvalues[1]:
		[1]: TweenService_upvr (readonly)
	]]
	local UIScale_upvr = arg1.Parent.UIScale
	local Position_upvr = arg1.Position
	arg1.MouseEnter:Connect(function() -- Line 40
		--[[ Upvalues[2]:
			[1]: UIScale_upvr (readonly)
			[2]: TweenService_upvr (copied, readonly)
		]]
		TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
			Scale = 0.9;
		}):Play()
	end)
	arg1.MouseLeave:Connect(function() -- Line 44
		--[[ Upvalues[4]:
			[1]: UIScale_upvr (readonly)
			[2]: TweenService_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: Position_upvr (readonly)
		]]
		TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
			Scale = 1;
		}):Play()
		TweenService_upvr:Create(arg1, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
			Position = Position_upvr;
		}):Play()
	end)
	local udim2_upvr = UDim2.new(Position_upvr.X.Scale, Position_upvr.X.Offset, Position_upvr.Y.Scale + 0.075, Position_upvr.Y.Offset)
	arg1.MouseButton1Down:Connect(function() -- Line 49
		--[[ Upvalues[4]:
			[1]: UIScale_upvr (readonly)
			[2]: TweenService_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: udim2_upvr (readonly)
		]]
		TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
			Scale = 0.8;
		}):Play()
		TweenService_upvr:Create(arg1, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
			Position = udim2_upvr;
		}):Play()
	end)
	arg1.MouseButton1Up:Connect(function() -- Line 54
		--[[ Upvalues[4]:
			[1]: UIScale_upvr (readonly)
			[2]: TweenService_upvr (copied, readonly)
			[3]: arg1 (readonly)
			[4]: Position_upvr (readonly)
		]]
		TweenService_upvr:Create(UIScale_upvr, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
			Scale = 1;
		}):Play()
		TweenService_upvr:Create(arg1, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
			Position = Position_upvr;
		}):Play()
	end)
end
setupButton(Button_3)
setupButton(Button_4)
setupButton(Button_2)
setupButton(Button)
Button_3.Activated:Connect(function() -- Line 65
	--[[ Upvalues[1]:
		[1]: ButtonClick_upvr (readonly)
	]]
	ButtonClick_upvr:FireServer("skip")
end)
Button_4.Activated:Connect(function() -- Line 69
	--[[ Upvalues[1]:
		[1]: ButtonClick_upvr (readonly)
	]]
	ButtonClick_upvr:FireServer("gold")
end)
Button_2.Activated:Connect(function() -- Line 73
	--[[ Upvalues[1]:
		[1]: ButtonClick_upvr (readonly)
	]]
	ButtonClick_upvr:FireServer("green")
end)
LocalPlayer.CharacterAdded:Connect(function(arg1) -- Line 77, Named "hookCharacter"
	--[[ Upvalues[2]:
		[1]: ScreenGui_upvr (readonly)
		[2]: PlayerGui_upvr (readonly)
	]]
	local Humanoid_2 = arg1:WaitForChild("Humanoid")
	Humanoid_2.Seated:Connect(function(arg1_2, arg2) -- Line 80
		--[[ Upvalues[2]:
			[1]: ScreenGui_upvr (copied, readonly)
			[2]: PlayerGui_upvr (copied, readonly)
		]]
		if arg1_2 then
			local var33 = arg2
			if var33 then
				if arg2.Name ~= "KSISeat" then
					var33 = false
				else
					var33 = true
				end
			end
			ScreenGui_upvr.Enabled = not var33
			PlayerGui_upvr.KSI.Enabled = var33
			PlayerGui_upvr.CustomCoreGui.Enabled = not var33
		else
			ScreenGui_upvr.Enabled = true
			PlayerGui_upvr.KSI.Enabled = nil
			PlayerGui_upvr.CustomCoreGui.Enabled = true
		end
	end)
	local SeatPart = Humanoid_2.SeatPart
	local var35 = SeatPart
	if var35 then
		if SeatPart.Name ~= "KSISeat" then
			var35 = false
		else
			var35 = true
		end
	end
	ScreenGui_upvr.Enabled = not var35
	PlayerGui_upvr.KSI.Enabled = var35
	PlayerGui_upvr.CustomCoreGui.Enabled = not var35
end)
if LocalPlayer.Character then
	local Humanoid = LocalPlayer.Character:WaitForChild("Humanoid")
	Humanoid.Seated:Connect(function(arg1, arg2) -- Line 80
		--[[ Upvalues[2]:
			[1]: ScreenGui_upvr (readonly)
			[2]: PlayerGui_upvr (readonly)
		]]
		if arg1 then
			local var38 = arg2
			if var38 then
				if arg2.Name ~= "KSISeat" then
					var38 = false
				else
					var38 = true
				end
			end
			ScreenGui_upvr.Enabled = not var38
			PlayerGui_upvr.KSI.Enabled = var38
			PlayerGui_upvr.CustomCoreGui.Enabled = not var38
		else
			ScreenGui_upvr.Enabled = true
			PlayerGui_upvr.KSI.Enabled = nil
			PlayerGui_upvr.CustomCoreGui.Enabled = true
		end
	end)
	local SeatPart_2 = Humanoid.SeatPart
	local var40 = SeatPart_2
	if var40 then
		if SeatPart_2.Name ~= "KSISeat" then
			var40 = false
		else
			var40 = true
		end
	end
	ScreenGui_upvr.Enabled = not var40
	PlayerGui_upvr.KSI.Enabled = var40
	PlayerGui_upvr.CustomCoreGui.Enabled = not var40
end
local var41_upvw
ReplicatedStorage.KSI.NewPlayerOnStage.OnClientEvent:Connect(function(arg1) -- Line 99
	--[[ Upvalues[1]:
		[1]: var41_upvw (read and write)
	]]
	var41_upvw = arg1
end)
Button.Activated:Connect(function() -- Line 103
	--[[ Upvalues[1]:
		[1]: var41_upvw (read and write)
	]]
	ClientGifting.startGifting(var41_upvw)
end)