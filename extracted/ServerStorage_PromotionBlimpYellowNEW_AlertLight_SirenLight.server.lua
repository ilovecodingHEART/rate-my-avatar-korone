-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = script.Parent
if not v1 then
	return
end
local v2 = game:GetService("TweenService")
local v3 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
local v4 = {
	["Color"] = Color3.fromRGB(255, 87, 87)
}
local v5 = {
	["Color"] = Color3.fromRGB(0, 195, 255)
}
while v1 and v1.Parent do
	v2:Create(v1, v3, v4):Play()
	task.wait(0.3)
	if not (v1 and v1.Parent) then
		break
	end
	v2:Create(v1, v3, v5):Play()
	task.wait(0.3)
end
