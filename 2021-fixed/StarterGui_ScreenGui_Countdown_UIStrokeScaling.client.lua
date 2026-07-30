-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
local v_u_2 = workspace.CurrentCamera
local v3 = { script.Parent.TextLabel, script.Parent.Timer }
local function v12(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v_u_5 = p4:FindFirstChildOfClass("UIStroke")
	if not v_u_5 then
		v_u_5 = Instance.new("UIStroke")
		v_u_5.Name = "AutoStroke"
		v_u_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		v_u_5.Thickness = 3
		v_u_5.Parent = p4
	end
	local function v9()
		-- upvalues: (copy) v_u_5, (ref) v_u_2
		local v6 = v_u_5
		local v7
		if v_u_2 then
			local v8 = 3 * (v_u_2.ViewportSize.Y / 1151)
			v7 = math.clamp(v8, 0.5, 8)
		else
			v7 = 3
		end
		v6.Thickness = v7
	end
	local v10
	if v_u_2 then
		local v11 = 3 * (v_u_2.ViewportSize.Y / 1151)
		v10 = math.clamp(v11, 0.5, 8)
	else
		v10 = 3
	end
	v_u_5.Thickness = v10
	if v_u_2 then
		v_u_2:GetPropertyChangedSignal("ViewportSize"):Connect(v9)
	end
	v_u_1.Heartbeat:Connect(v9)
end
for _, v13 in ipairs(v3) do
	if v13 and v13:IsA("TextLabel") then
		v12(v13)
	end
end
