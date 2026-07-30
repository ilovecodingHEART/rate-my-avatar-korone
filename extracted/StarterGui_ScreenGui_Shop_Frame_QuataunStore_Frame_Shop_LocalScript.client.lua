-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 05:02:23
-- Luau version 6, Types version 3
-- Time taken: 0.001328 seconds

local PolicyService_upvr = game:GetService("PolicyService")
local popup_upvr = require(game.ReplicatedStorage.popup)
local QuataunStore_upvr = game.Players.LocalPlayer.PlayerGui.CustomCoreGui.QuataunStore
script.Parent.Activated:Connect(function() -- Line 5
	--[[ Upvalues[3]:
		[1]: PolicyService_upvr (readonly)
		[2]: popup_upvr (readonly)
		[3]: QuataunStore_upvr (readonly)
	]]
	local pcall_result1, pcall_result2 = pcall(function() -- Line 6
		--[[ Upvalues[1]:
			[1]: PolicyService_upvr (copied, readonly)
		]]
		return PolicyService_upvr:GetPolicyInfoForPlayerAsync(game.Players.LocalPlayer)
	end)
	if not pcall_result1 then
		warn("PolicyService error: "..pcall_result2)
	else
		if not pcall_result2.IsEligibleToPurchaseCommerceProduct then
			popup_upvr("warn", "Ineligible to buy commerce products through Roblox. (Outside US / Under 13)")
			if pcall_result2.AllowedExternalLinkReferences then
				popup_upvr("info", "Join and view announcements in our Discord server (discord.gg/hazem) to learn how you can view our store without being in the US/13+!")
			end
			return
		end
		QuataunStore_upvr.Visible = not QuataunStore_upvr.Visible
	end
end)