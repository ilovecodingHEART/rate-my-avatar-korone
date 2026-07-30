-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-12-22 10:27:19
-- Luau version 6, Types version 3
-- Time taken: 0.001778 seconds

local var1_upvw = false
local WatchAd_upvr = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui").GiftbuxEarn.Frame.Ads.WatchAd
local function toggleAdButton_upvr(arg1) -- Line 10, Named "toggleAdButton"
	--[[ Upvalues[2]:
		[1]: var1_upvw (read and write)
		[2]: WatchAd_upvr (readonly)
	]]
	if arg1 then
		var1_upvw = true
		WatchAd_upvr.Active = true
		WatchAd_upvr.AutoButtonColor = true
		WatchAd_upvr.Text = "WATCH AD"
		WatchAd_upvr.BackgroundColor3 = Color3.fromRGB(255, 0, 132)
	else
		var1_upvw = false
		WatchAd_upvr.Active = false
		WatchAd_upvr.AutoButtonColor = false
		WatchAd_upvr.Text = "CURRENTLY UNAVAILABLE"
		WatchAd_upvr.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
	end
end
local RequestShowAdEvent_upvr = game:GetService("ReplicatedStorage"):WaitForChild("RequestShowAdEvent")
script.Parent.Activated:Connect(function() -- Line 26
	--[[ Upvalues[2]:
		[1]: RequestShowAdEvent_upvr (readonly)
		[2]: toggleAdButton_upvr (readonly)
	]]
	RequestShowAdEvent_upvr:FireServer()
	toggleAdButton_upvr(false)
end)