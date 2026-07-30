-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = require(game.ReplicatedStorage.Remotes)
local v_u_2 = require(game.ReplicatedStorage.popup)
local v_u_3 = require(game.ReplicatedStorage.ConfettiCannon)
local v_u_4 = game:GetService("TweenService")
script.Parent.Triggered:Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_1
	v_u_2("success", "claimed!")
	script.ObbyReward:Play()
	game.SoundService.SFX.TutorialSuccess:Play()
	game.Lighting.ExposureCompensation = 10
	v_u_4:Create(game.Lighting, TweenInfo.new(3, Enum.EasingStyle.Quint), {
		["ExposureCompensation"] = 0
	}):Play()
	v_u_3.Fire({
		["Parent"] = game.Players.LocalPlayer.PlayerGui.PriorityGui,
		["Template"] = script.ImageLabel,
		["Count"] = 20,
		["RandomColors"] = true,
		["Colors"] = {
			Color3.fromRGB(255, 106, 106),
			Color3.fromRGB(106, 255, 142),
			Color3.fromRGB(106, 184, 255),
			Color3.fromRGB(255, 234, 106)
		}
	})
	v_u_1.Event("ClaimHalloweenObbyBooth"):FireServer()
end)
