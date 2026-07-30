-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

local v1 = game:GetService("Players").LocalPlayer
local v_u_2 = script.Parent
local v3 = v_u_2:WaitForChild("Exit")
local v_u_4 = {
	"Map",
	"Halloween",
	"Structures",
	"HauntedHouse",
	"ExitPart"
}
local v_u_5 = nil
local v_u_6 = workspace:FindFirstChild("HalloweenObbies") ~= nil
local v_u_7 = nil
local function v_u_11(p8, p9)
	for _, v10 in ipairs(p9) do
		if p8 then
			p8 = p8:FindFirstChild(v10)
		end
		if not p8 then
			return nil
		end
	end
	return p8
end
local function v_u_12()
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (ref) v_u_6
	v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
end
workspace.ChildAdded:Connect(function(p13)
	-- upvalues: (ref) v_u_6, (ref) v_u_5, (copy) v_u_2
	if p13.Name == "HalloweenObbies" then
		v_u_6 = true
		v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
	end
end)
workspace.ChildRemoved:Connect(function(p14)
	-- upvalues: (ref) v_u_6, (ref) v_u_5, (copy) v_u_2
	if p14.Name == "HalloweenObbies" then
		v_u_6 = false
		v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
	end
end)
local function v16(p15)
	-- upvalues: (ref) v_u_5, (ref) v_u_7, (copy) v_u_12, (copy) v_u_2, (ref) v_u_6
	v_u_5 = p15:WaitForChild("HumanoidRootPart", 5)
	if v_u_7 then
		v_u_7:Disconnect()
	end
	if v_u_5 then
		v_u_7 = v_u_5:GetPropertyChangedSignal("Position"):Connect(v_u_12)
	end
	v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
end
if v1.Character then
	v_u_5 = v1.Character:WaitForChild("HumanoidRootPart", 5)
	if v_u_7 then
		v_u_7:Disconnect()
	end
	if v_u_5 then
		v_u_7 = v_u_5:GetPropertyChangedSignal("Position"):Connect(v_u_12)
	end
	v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
end
v1.CharacterAdded:Connect(v16)
local v_u_17 = false
v3.Activated:Connect(function()
	-- upvalues: (ref) v_u_17, (copy) v_u_11, (copy) v_u_4, (ref) v_u_5
	if not v_u_17 then
		v_u_17 = true
		local v18 = v_u_11(workspace, v_u_4)
		if not (v18 and (v18:IsA("BasePart") and v18)) then
			v18 = nil
		end
		if v_u_5 and v18 then
			local v_u_19 = v_u_5.Parent
			if v_u_19 then
				v_u_19 = v_u_5.Parent:FindFirstChildOfClass("Humanoid")
			end
			if v_u_19 then
				v_u_19:ChangeState(Enum.HumanoidStateType.Physics)
			end
			v_u_5.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			v_u_5.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			v_u_5.CFrame = v18.CFrame
			task.delay(0.05, function()
				-- upvalues: (copy) v_u_19
				if v_u_19 then
					v_u_19:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
			workspace.HalloweenObbies.Parent = game.ReplicatedStorage
		end
		task.delay(0.2, function()
			-- upvalues: (ref) v_u_17
			v_u_17 = false
		end)
	end
end)
v1.Character:WaitForChild("Humanoid").Died:Connect(function()
	if workspace:FindFirstChild("HalloweenObbies") then
		workspace.HalloweenObbies.Parent = game.ReplicatedStorage
	end
end)
v_u_2.Visible = false
v_u_2.Visible = v_u_6 and (v_u_5 and v_u_5.Position.Y > 700 and true or false)
