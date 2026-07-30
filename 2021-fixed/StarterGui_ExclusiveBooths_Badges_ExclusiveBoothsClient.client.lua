-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-26 07:46:32
-- Luau version 6, Types version 3
-- Time taken: 0.002934 seconds

local Players_upvr = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local Remotes = require(game.ReplicatedStorage.Remotes)
script.Parent.Parent.Adornee = workspace.ExclusiveBoothsPart
local any_InvokeServer_result1 = Remotes.Function("ExclusiveBooths"):InvokeServer()
for _, v in ipairs(Remotes.Function("BadgeBasedBooths"):InvokeServer()) do
	local _1 = v[1]
	local _2 = v[2]
	local _3_upvr = v[3]
	if _3_upvr ~= 8737602449 then
		local any_GetBadgeInfoAsync_result1 = BadgeService:GetBadgeInfoAsync(_2)
		if not game:GetService("MarketplaceService"):GetProductInfo(_3_upvr) then
			local tbl = {
				Name = "Unknown";
				IconImageAssetId = 0;
			}
		end
		local clone = script.GameBoothTemplate:Clone()
		clone.Game.Icon.Image = `rbxassetid://{tbl.IconImageAssetId}`
		clone.Game.Info.Title.Text = tbl.Name
		local TeleportService_upvr = game:GetService("TeleportService")
		clone.Game.Join.Activated:Connect(function() -- Line 28
			--[[ Upvalues[3]:
				[1]: TeleportService_upvr (readonly)
				[2]: _3_upvr (readonly)
				[3]: Players_upvr (readonly)
			]]
			TeleportService_upvr:Teleport(_3_upvr, Players_upvr.LocalPlayer)
		end)
		if any_InvokeServer_result1[_1].icon.Image == nil then
			clone.Booth.BoothIcon.Image = "rbxassetid://15842040263"
		else
			clone.Booth.BoothIcon.Image = any_InvokeServer_result1[_1].icon.Image
			clone.Booth.BoothIcon.ImageRectSize = any_InvokeServer_result1[_1].icon.ImageRectSize
			clone.Booth.BoothIcon.ImageRectOffset = any_InvokeServer_result1[_1].icon.ImageRectOffset
		end
		clone.Booth.BoothIcon.BadgeIcon.Image = `rbxassetid://{any_GetBadgeInfoAsync_result1.IconImageId}`
		clone.Booth.Info.Title.Text = any_InvokeServer_result1[_1].name
		if #any_GetBadgeInfoAsync_result1.Description <= 1 then
			clone.Booth.Info.Description.Text = any_GetBadgeInfoAsync_result1.Name
		else
			clone.Booth.Info.Description.Text = any_GetBadgeInfoAsync_result1.Description
		end
		if not any_GetBadgeInfoAsync_result1.IsEnabled then
			clone.Inactive.Visible = true
		end
		clone.Booth.BoothIcon.Owned.Visible = BadgeService:UserHasBadgeAsync(Players_upvr.LocalPlayer.UserId, _2)
		clone.Parent = script.Parent
	end
end