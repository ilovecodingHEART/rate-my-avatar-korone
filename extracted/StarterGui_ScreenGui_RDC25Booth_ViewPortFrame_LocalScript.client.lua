-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = script.Parent
local v2 = script:WaitForChild("RDC25Booth")
local v3 = game:GetService("RunService")
local v4 = v1:FindFirstChildOfClass("WorldModel") or Instance.new("WorldModel", v1)
v4.Name = "World"
for _, v5 in ipairs(v4:GetChildren()) do
	v5:Destroy()
end
local v_u_6 = Instance.new("Camera")
v_u_6.FieldOfView = 18
v1.CurrentCamera = v_u_6
v_u_6.Parent = v1
local v_u_7 = v2:Clone()
v_u_7.Parent = v4
if not v_u_7.PrimaryPart then
	warn("Booth has no PrimaryPart set! Please set one so I can face it correctly.")
end
local function v_u_21()
	-- upvalues: (copy) v_u_7, (copy) v_u_6
	local v8 = (v_u_7.PrimaryPart or v_u_7:GetPrimaryPartCFrame()).CFrame
	local v9 = v_u_6.CFrame.Position
	local v10 = v8.LookVector
	local v11 = v9 - v8.Position
	local v12 = v10.X
	local v13 = v10.Z
	local v14 = Vector3.new(v12, 0, v13).Unit
	local v15 = v11.X
	local v16 = v11.Z
	local v17 = Vector3.new(v15, 0, v16).Unit
	local v18 = v14.X * v17.Z - v14.Z * v17.X
	local v19 = v14.X * v17.X + v14.Z * v17.Z
	local v20 = math.atan2(v18, v19)
	return v8 * CFrame.Angles(0, -v20, 0)
end
local v22 = v_u_7:GetExtentsSize().Y * 0.35
local v23 = Vector3.new(0, v22, 0)
local v24 = v23 + Vector3.new(0, 0, 90)
v_u_6.CFrame = CFrame.new(v24, v23)
v_u_7:PivotTo(CFrame.new(0, 0, 0))
v_u_7:PivotTo((v_u_21()))
local v_u_25 = 0
v3.RenderStepped:Connect(function(p26)
	-- upvalues: (ref) v_u_25, (copy) v_u_7, (copy) v_u_21
	v_u_25 = v_u_25 + p26 * 0.25
	local v27 = v_u_25 * 3.141592653589793 * 2
	local v28 = math.sin(v27) * 0.02
	local v29 = v_u_25 * 3.141592653589793 * 1.3
	local v30 = math.sin(v29) * 1
	local v31 = math.rad(v30)
	v_u_7:PivotTo(v_u_21() * CFrame.new(0, v28, 0) * CFrame.Angles(0, v31, 0))
end)
