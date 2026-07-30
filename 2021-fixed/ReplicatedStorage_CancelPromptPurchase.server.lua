-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = game:GetService("GuiService")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("SoundService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = game:GetService("StarterGui")
local v_u_6 = game:GetService("TweenService")
local v7 = require(game.ReplicatedStorage.Remotes)
local v8 = v2.LocalPlayer:WaitForChild("PlayerGui")
local v_u_9 = v8:WaitForChild("ScreenGui")
v8:WaitForChild("LoadingGui")
v8:WaitForChild("CustomCoreGui")
local v_u_10 = v5:WaitForChild("UITemplates")
local _ = v4.Templates
v7.OnClientEvent("CancelPromptPurchase"):Connect(function(p11)
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_10, (copy) v_u_6, (copy) v_u_1
	print("The server requested for us to cancel prompt purchase.")
	if p11 == "already_owned" then
		local v_u_12 = "warn"
		local v_u_13 = "already owned, you must delete it from your inventory"
		spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_3, (ref) v_u_10, (copy) v_u_12, (copy) v_u_13, (ref) v_u_6
			if v_u_9.Popups:GetAttribute("Enabled") then
				v_u_3.SFX.BellRing:Play()
				local v14 = v_u_10[v_u_12 .. "Popup"]
				if not v14 then
					print("NOPE")
					return
				end
				local v15 = v14:Clone()
				v15.Message.Text = v_u_13
				v15.Transparency = 1
				v15.UIScale.Scale = 0
				v15.Parent = v_u_9.Popups
				v_u_6:Create(v15, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
					["Transparency"] = 0
				}):Play()
				local v16 = v15.UIScale
				local v17 = Enum.EasingStyle.Back
				v_u_6:Create(v16, TweenInfo.new(0.3, v17 or Enum.EasingStyle.Quint), {
					["Scale"] = 1
				}):Play()
				local v18 = v15.Message
				local v19 = {
					["MaxVisibleGraphemes"] = #v_u_13
				}
				v_u_6:Create(v18, TweenInfo.new(1, Enum.EasingStyle.Quint), v19):Play()
				wait(4)
				v_u_6:Create(v15, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
					["Transparency"] = 1
				}):Play()
				local v20 = v15.UIScale
				local v21 = Enum.EasingStyle.Back
				v_u_6:Create(v20, TweenInfo.new(0.5, v21 or Enum.EasingStyle.Quint), {
					["Scale"] = 0
				}):Play()
				wait(0.5)
				v15:Destroy()
			end
		end)
	elseif p11 == "price_changed" then
		local v_u_22 = "warn"
		local v_u_23 = "price changed, please ask booth owner to refresh their buttons!"
		spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_3, (ref) v_u_10, (copy) v_u_22, (copy) v_u_23, (ref) v_u_6
			if v_u_9.Popups:GetAttribute("Enabled") then
				v_u_3.SFX.BellRing:Play()
				local v24 = v_u_10[v_u_22 .. "Popup"]
				if not v24 then
					print("NOPE")
					return
				end
				local v25 = v24:Clone()
				v25.Message.Text = v_u_23
				v25.Transparency = 1
				v25.UIScale.Scale = 0
				v25.Parent = v_u_9.Popups
				v_u_6:Create(v25, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
					["Transparency"] = 0
				}):Play()
				local v26 = v25.UIScale
				local v27 = Enum.EasingStyle.Back
				v_u_6:Create(v26, TweenInfo.new(0.3, v27 or Enum.EasingStyle.Quint), {
					["Scale"] = 1
				}):Play()
				local v28 = v25.Message
				local v29 = {
					["MaxVisibleGraphemes"] = #v_u_23
				}
				v_u_6:Create(v28, TweenInfo.new(1, Enum.EasingStyle.Quint), v29):Play()
				wait(4)
				v_u_6:Create(v25, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
					["Transparency"] = 1
				}):Play()
				local v30 = v25.UIScale
				local v31 = Enum.EasingStyle.Back
				v_u_6:Create(v30, TweenInfo.new(0.5, v31 or Enum.EasingStyle.Quint), {
					["Scale"] = 0
				}):Play()
				wait(0.5)
				v25:Destroy()
			end
		end)
	elseif p11 == "epidemic" then
		local v_u_32 = "warn"
		local v_u_33 = "gifting disabled during this time."
		spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_3, (ref) v_u_10, (copy) v_u_32, (copy) v_u_33, (ref) v_u_6
			if v_u_9.Popups:GetAttribute("Enabled") then
				v_u_3.SFX.BellRing:Play()
				local v34 = v_u_10[v_u_32 .. "Popup"]
				if not v34 then
					print("NOPE")
					return
				end
				local v35 = v34:Clone()
				v35.Message.Text = v_u_33
				v35.Transparency = 1
				v35.UIScale.Scale = 0
				v35.Parent = v_u_9.Popups
				v_u_6:Create(v35, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
					["Transparency"] = 0
				}):Play()
				local v36 = v35.UIScale
				local v37 = Enum.EasingStyle.Back
				v_u_6:Create(v36, TweenInfo.new(0.3, v37 or Enum.EasingStyle.Quint), {
					["Scale"] = 1
				}):Play()
				local v38 = v35.Message
				local v39 = {
					["MaxVisibleGraphemes"] = #v_u_33
				}
				v_u_6:Create(v38, TweenInfo.new(1, Enum.EasingStyle.Quint), v39):Play()
				wait(4)
				v_u_6:Create(v35, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
					["Transparency"] = 1
				}):Play()
				local v40 = v35.UIScale
				local v41 = Enum.EasingStyle.Back
				v_u_6:Create(v40, TweenInfo.new(0.5, v41 or Enum.EasingStyle.Quint), {
					["Scale"] = 0
				}):Play()
				wait(0.5)
				v35:Destroy()
			end
		end)
	elseif p11 == "regional_pricing_enabled" then
		local v_u_42 = "warn"
		local v_u_43 = "this gamepass has regional pricing enabled. please ask the owner to disable it."
		spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_3, (ref) v_u_10, (copy) v_u_42, (copy) v_u_43, (ref) v_u_6
			if v_u_9.Popups:GetAttribute("Enabled") then
				v_u_3.SFX.BellRing:Play()
				local v44 = v_u_10[v_u_42 .. "Popup"]
				if not v44 then
					print("NOPE")
					return
				end
				local v45 = v44:Clone()
				v45.Message.Text = v_u_43
				v45.Transparency = 1
				v45.UIScale.Scale = 0
				v45.Parent = v_u_9.Popups
				v_u_6:Create(v45, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
					["Transparency"] = 0
				}):Play()
				local v46 = v45.UIScale
				local v47 = Enum.EasingStyle.Back
				v_u_6:Create(v46, TweenInfo.new(0.3, v47 or Enum.EasingStyle.Quint), {
					["Scale"] = 1
				}):Play()
				local v48 = v45.Message
				local v49 = {
					["MaxVisibleGraphemes"] = #v_u_43
				}
				v_u_6:Create(v48, TweenInfo.new(1, Enum.EasingStyle.Quint), v49):Play()
				wait(4)
				v_u_6:Create(v45, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
					["Transparency"] = 1
				}):Play()
				local v50 = v45.UIScale
				local v51 = Enum.EasingStyle.Back
				v_u_6:Create(v50, TweenInfo.new(0.5, v51 or Enum.EasingStyle.Quint), {
					["Scale"] = 0
				}):Play()
				wait(0.5)
				v45:Destroy()
			end
		end)
	else
		local v_u_52 = "danger"
		local v_u_53 = "error occurred, please try again!"
		spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_3, (ref) v_u_10, (copy) v_u_52, (copy) v_u_53, (ref) v_u_6
			if v_u_9.Popups:GetAttribute("Enabled") then
				v_u_3.SFX.BellRing:Play()
				local v54 = v_u_10[v_u_52 .. "Popup"]
				if not v54 then
					print("NOPE")
					return
				end
				local v55 = v54:Clone()
				v55.Message.Text = v_u_53
				v55.Transparency = 1
				v55.UIScale.Scale = 0
				v55.Parent = v_u_9.Popups
				v_u_6:Create(v55, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
					["Transparency"] = 0
				}):Play()
				local v56 = v55.UIScale
				local v57 = Enum.EasingStyle.Back
				v_u_6:Create(v56, TweenInfo.new(0.3, v57 or Enum.EasingStyle.Quint), {
					["Scale"] = 1
				}):Play()
				local v58 = v55.Message
				local v59 = {
					["MaxVisibleGraphemes"] = #v_u_53
				}
				v_u_6:Create(v58, TweenInfo.new(1, Enum.EasingStyle.Quint), v59):Play()
				wait(4)
				v_u_6:Create(v55, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
					["Transparency"] = 1
				}):Play()
				local v60 = v55.UIScale
				local v61 = Enum.EasingStyle.Back
				v_u_6:Create(v60, TweenInfo.new(0.5, v61 or Enum.EasingStyle.Quint), {
					["Scale"] = 0
				}):Play()
				wait(0.5)
				v55:Destroy()
			end
		end)
	end
	v_u_3.SFX.Fail:Play()
	task.wait(0.3)
	v_u_1:InspectPlayerFromUserId(1)
	v_u_1:CloseInspectMenu()
end)