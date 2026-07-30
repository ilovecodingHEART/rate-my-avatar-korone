-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = script.Parent
local v_u_4 = v_u_3:WaitForChild("Clown")
local v_u_5 = v_u_3:WaitForChild("Crank")
local v6 = v_u_3:WaitForChild("TopLid")
local v7 = v_u_5:WaitForChild("Handle"):WaitForChild("Crank2"):WaitForChild("Hold")
local v8 = v_u_4.Spring2.CFrame
local v9 = v6.TurningPart.CFrame
local v_u_10 = v1:Create(v6.TurningPart, TweenInfo.new(0.25, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
	["CFrame"] = v9
})
local v_u_11 = v1:Create(v6.TurningPart, TweenInfo.new(0.85, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
	["CFrame"] = v9 * CFrame.Angles(-2.0943951023931953, 0, 0)
})
local v_u_12 = v1:Create(v_u_4.Spring2, TweenInfo.new(0.15, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
	["CFrame"] = v8
})
local v_u_13 = v1:Create(v_u_4.Spring2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
	["CFrame"] = v8 * CFrame.new(0, -5, 0)
})
local function v_u_16(p14)
	for _, v15 in pairs(p14:GetChildren()) do
		if v15:IsA("ParticleEmitter") then
			v15:Emit(v15:GetAttribute("EmitCount"))
		end
	end
end
local v_u_17 = Random.new()
v_u_4.Spring2.CFrame = v8 * CFrame.new(0, -5, 0)
v6.TurningPart.CFrame = v9 * CFrame.Angles(-2.0943951023931953, 0, 0)
v_u_5.Handle.Highlight.Enabled = false
v7.PromptShown:Connect(function()
	-- upvalues: (copy) v_u_5
	v_u_5.Handle.Highlight.Enabled = true
end)
v7.PromptHidden:Connect(function()
	-- upvalues: (copy) v_u_5
	v_u_5.Handle.Highlight.Enabled = false
end)
local v_u_18 = nil
local v_u_19 = "Idle"
local v_u_20 = nil
local function v_u_25()
	-- upvalues: (ref) v_u_19, (ref) v_u_18, (copy) v_u_5, (copy) v_u_10, (copy) v_u_12, (copy) v_u_4, (copy) v_u_16, (copy) v_u_3, (copy) v_u_17, (copy) v_u_13, (copy) v_u_11
	if v_u_19 == "Winding" then
		v_u_19 = "Popped"
		if v_u_18 then
			v_u_18:Disconnect()
			v_u_18 = nil
		end
		if v_u_5.CrankMain.Music.IsPlaying then
			v_u_5.CrankMain.Music:Stop()
		end
		v_u_10:Play()
		v_u_12:Play()
		v_u_4.Head.Head2.Surprise1:Play()
		v_u_4.Head.Head2.Surprise2:Play()
		v_u_4.Head.Head2.Surprise3:Play()
		v_u_16(v_u_3.Particles)
		v_u_16(v_u_4.Head.Head2.Bubble)
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_17
			local v21 = 0.125
			local v22 = 0
			while true do
				v_u_4.Spring2.Head2.C0 = CFrame.new(-0.035, 3.633, -0.04) * CFrame.new(v_u_17:NextNumber(-v21, v21), v_u_17:NextNumber(-v21, v21), v_u_17:NextNumber(-v21, v21)) * CFrame.Angles(0, 0.6981317007977318, 0)
				local v23 = v21 / 10
				local v24 = math.clamp(v23, 0.01, 2)
				v22 = v22 + v24
				v21 = (1 - v22 / 2) * 0.125
				if v22 >= 2 then
					break
				end
				task.wait(v24)
			end
		end)
		task.wait(2)
		v_u_13:Play()
		task.delay(0.35, function()
			-- upvalues: (ref) v_u_11
			v_u_11:Play()
		end)
		task.wait(3)
		v_u_19 = "Idle"
	end
end
local function v_u_27()
	-- upvalues: (ref) v_u_19, (copy) v_u_17, (ref) v_u_18, (copy) v_u_2, (copy) v_u_5, (ref) v_u_20, (copy) v_u_25
	if v_u_19 == "Idle" then
		v_u_19 = "Winding"
		local v26 = v_u_17:NextNumber(4, 6)
		v_u_18 = v_u_2.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_5
			v_u_5.Handle:PivotTo(v_u_5.Handle:GetPivot() * CFrame.Angles(0.03490658503988659, 0, 0))
		end)
		v_u_5.CrankMain.Music:Play()
		v_u_20 = task.delay(v26, function()
			-- upvalues: (ref) v_u_19, (ref) v_u_25
			if v_u_19 == "Winding" then
				v_u_25()
			end
		end)
	end
end
v7.Triggered:Connect(function()
	-- upvalues: (ref) v_u_19, (copy) v_u_27
	if v_u_19 == "Idle" then
		v_u_27()
	end
end)
v7.TriggerEnded:Connect(function()
	-- upvalues: (ref) v_u_19, (ref) v_u_20, (ref) v_u_18, (copy) v_u_5
	if v_u_19 == "Winding" then
		if v_u_19 ~= "Winding" then
			return
		end
		v_u_19 = "Idle"
		if v_u_20 then
			task.cancel(v_u_20)
			v_u_20 = nil
		end
		if v_u_18 then
			v_u_18:Disconnect()
			v_u_18 = nil
		end
		if v_u_5.CrankMain.Music.IsPlaying then
			v_u_5.CrankMain.Music:Stop()
		end
	end
end)
