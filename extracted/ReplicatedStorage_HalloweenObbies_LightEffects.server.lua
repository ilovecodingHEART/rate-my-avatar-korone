-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled by Krnl

task.wait(3)
local v_u_1 = game:GetService("TweenService")
for _, v2 in ipairs(workspace:GetDescendants()) do
	if v2.Name == "Light" then
		local v_u_3 = v2:FindFirstChild("LampLayer1")
		local v_u_4 = v2:FindFirstChild("LampLayer2")
		local v_u_5 = v2:FindFirstChildWhichIsA("SpotLight", true)
		local v_u_6
		if v_u_3 then
			v_u_6 = v_u_3.Transparency
		else
			v_u_6 = v_u_3
		end
		local v_u_7
		if v_u_4 then
			v_u_7 = v_u_4.Transparency
		else
			v_u_7 = v_u_4
		end
		local v_u_8
		if v_u_5 then
			v_u_8 = v_u_5.Brightness
		else
			v_u_8 = v_u_5
		end
		task.spawn(function()
			-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_1, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_8
			while true do
				for _ = 1, math.random(2, 3) do
					local v9 = math.random(2, 3) / 10
					local v10 = math.random(3, 10) / 100
					if v_u_3 and v_u_6 then
						local v11 = v_u_3
						local v12 = {
							["Transparency"] = v_u_6 + (1 - v_u_6) * (1 - v9)
						}
						if v11 then
							v_u_1:Create(v11, TweenInfo.new(v10, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v12):Play()
						end
					end
					if v_u_4 and v_u_7 then
						local v13 = v_u_4
						local v14 = {
							["Transparency"] = v_u_7 + (1 - v_u_7) * (1 - v9)
						}
						if v13 then
							v_u_1:Create(v13, TweenInfo.new(v10, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v14):Play()
						end
					end
					if v_u_5 and v_u_8 then
						local v15 = v_u_5
						local v16 = {
							["Brightness"] = v_u_8 * v9
						}
						if v15 then
							v_u_1:Create(v15, TweenInfo.new(v10, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v16):Play()
						end
					end
					task.wait(v10)
					if v_u_3 and v_u_6 then
						local v17 = v_u_3
						local v18 = {
							["Transparency"] = v_u_6
						}
						if v17 then
							v_u_1:Create(v17, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v18):Play()
						end
					end
					if v_u_4 and v_u_7 then
						local v19 = v_u_4
						local v20 = {
							["Transparency"] = v_u_7
						}
						if v19 then
							v_u_1:Create(v19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v20):Play()
						end
					end
					if v_u_5 and v_u_8 then
						local v21 = v_u_5
						local v22 = {
							["Brightness"] = v_u_8
						}
						if v21 then
							v_u_1:Create(v21, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v22):Play()
						end
					end
					task.wait(math.random(2, 8) / 100)
				end
				task.wait(math.random(2, 10))
			end
		end)
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_1
	while true do
		local v23 = workspace:GetDescendants()
		for _ = 1, math.random(2, 3) do
			local v24 = math.random(2, 3) / 10
			local v25 = math.random(3, 10) / 100
			for _, v26 in ipairs(v23) do
				if v26.Name == "WindowPart" and (v26.Material == Enum.Material.Neon and v26.Color ~= Color3.fromRGB(130, 104, 213)) then
					v_u_1:Create(v26, TweenInfo.new(v25), {
						["Transparency"] = 1 - v24
					}):Play()
				end
			end
			task.wait(v25)
			for _, v27 in ipairs(v23) do
				if v27.Name == "WindowPart" and (v27.Material == Enum.Material.Neon and v27.Color ~= Color3.fromRGB(130, 104, 213)) then
					v_u_1:Create(v27, TweenInfo.new(0.2), {
						["Transparency"] = 0
					}):Play()
				end
			end
			task.wait(math.random(2, 8) / 100)
		end
		task.wait(math.random(3, 8))
	end
end)
