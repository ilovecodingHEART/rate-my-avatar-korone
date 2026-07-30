-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = require(game.ReplicatedStorage.Remotes)
local v2 = script.Parent
local v_u_3 = require(game.ReplicatedStorage.popup)
v2.Activated:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	v_u_1.Function("HasBooth"):InvokeServer(game.Players.LocalPlayer, "RDC25Booth")
	game.SoundService.SFX.GiftOpen:Play()
	game.SoundService.SFX.GiftClaim:Play()
	game.SoundService.SFX.ItemPurchase:Play()
	script.Parent.Parent.Parent.Parent.Parent.RDC25Booth.Visible = false
	v_u_3("success", "claimed booth!")
end)
