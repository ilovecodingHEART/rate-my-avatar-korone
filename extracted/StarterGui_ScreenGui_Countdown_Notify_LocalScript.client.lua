-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("SocialService")
local v_u_3 = script.Parent
local _ = v1.LocalPlayer
local v4, v5 = pcall(function()
	-- upvalues: (copy) v_u_2
	return v_u_2:GetEventRsvpStatusAsync("2099110196851507756")
end)
print(v5, "RSVP STATUS")
if v4 and v5 == Enum.RsvpStatus.Going then
	v_u_3.Visible = false
else
	v_u_3.Visible = true
end
v_u_3.Activated:Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if v_u_2:PromptRsvpToEventAsync("2099110196851507756") == Enum.RsvpStatus.Going then
		v_u_3.Visible = false
	end
end)
