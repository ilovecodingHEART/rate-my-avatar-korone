-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local v_u_1 = script.Parent:WaitForChild("CenterPole2")
local v2 = script.Parent:WaitForChild("Horses"):GetChildren()
local v3 = script.Parent:WaitForChild("Poles"):GetChildren()
local v_u_4 = {}
local v_u_5 = {}

for _, v6 in pairs(v2) do
	local v7 = v6:GetPivot()
	local phaseShift = 0
	if v6.Name == "Horse2" or v6.Name == "Horse4" then
		phaseShift = 0 
	elseif v6.Name == "Horse3" or v6.Name == "Horse1" then
		phaseShift = math.pi 
	end

	local v8 = {
		["model"] = v6,
		["offset"] = v_u_1.CFrame:ToObjectSpace(v7),
		["baseY"] = v7.Position.Y, 
		["phaseShift"] = phaseShift
	}
	table.insert(v_u_4, v8)
end

for _, v9 in pairs(v3) do
	local v10 = v9.Position
	local v11 = {
		["model"] = v9,
		["offset"] = v_u_1.CFrame:ToObjectSpace(CFrame.new(v10))
	}
	table.insert(v_u_5, v11)
end

local function rotateHorse(p_u_12, p_u_13)
	for _, v_u_14 in pairs(v_u_4) do
		spawn(function()
			local v15 = p_u_12
			local v16 = CFrame.Angles(0, math.rad(v15), 0)
			local verticalOffset = math.sin(p_u_13 * 0.7 + v_u_14.phaseShift) * 0.7
			local currentCFrame = v_u_1.CFrame * v16 * v_u_14.offset
			local finalCFrame = currentCFrame + Vector3.new(0, verticalOffset, 0)

			v_u_14.model:PivotTo(finalCFrame)
		end)
	end
end

local function rotatePole(p_u_24)
	for _, v_u_25 in pairs(v_u_5) do
		spawn(function()
			local v26 = p_u_24
			local v27 = CFrame.Angles(0, math.rad(v26), 0)
			local v28 = v_u_1.CFrame * v27 * v_u_25.offset
			v_u_25.model.CFrame = v28
		end)
	end
end

local v29 = game:GetService("RunService")
local v_u_30 = 0
local v_u_31 = 0
v29.RenderStepped:Connect(function(p32)
	v_u_30 = v_u_30 + 45 * p32
	v_u_31 = v_u_31 + p32
	rotateHorse(v_u_30, v_u_31)
	rotatePole(v_u_30)
end)
