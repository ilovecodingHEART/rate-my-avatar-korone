-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Bunni.lol Decompiler

local v_u_tween = game:GetService("TweenService")
local v_run = game:GetService("RunService")
local v_players = game:GetService("Players")
local v_replicatedstorage = game:GetService("ReplicatedStorage")
local v_u1 = require(v_replicatedstorage.popup)
local v_u_localplayer = v_players.LocalPlayer
local v_u_startpollbooth = v_u_localplayer.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("StartPollBooth")
local v_u_parent = script.Parent
local v_startpoll = v_u_startpollbooth.Frame.StartPoll
local v_u_frame = v_u_startpollbooth.Frame.Frame
function tween(arg1, arg2, arg3, arg4)
	-- upvalues: (copy) v_u_tween
	v_u_tween:Create(arg1, TweenInfo.new(arg2, arg4 or Enum.EasingStyle.Back), arg3):Play()
end
local v_u_ownerid = v_u_parent:GetAttribute("OwnerId")
if v_u_ownerid == v_u_localplayer.UserId then
	v_u_parent.PollPart.ProximityPrompt.Triggered:Connect(function()
		-- upvalues: (copy) v_u_ownerid, (copy) v_u_localplayer, (copy) v_u_startpollbooth, (copy) v_u1, (copy) v_u_parent
		if v_u_ownerid == v_u_localplayer.UserId then
			v_u_startpollbooth.Visible = true
		else
			v_u1("danger", "only booth owner can start a poll!")
			v_u_parent.PollPart.ProximityPrompt.Enabled = false
		end
	end)
else
	v_u_parent.PollPart.ProximityPrompt.Enabled = false
end
local v_u_startpoll = v_u_parent:WaitForChild("StartPoll")
local v2 = nil
if v2 then
	v2:Disconnect()
end
v2 = v_startpoll.Activated:Connect(function()
	-- upvalues: (copy) v_u_startpollbooth, (copy) v_u_frame, (copy) v_u1, (copy) v_u_startpoll
	v_u_startpollbooth.Setup.Value = true
	local v1 = {}
	for _, v2 in pairs(v_u_frame:GetChildren()) do
		if v2:IsA("TextBox") and v2.Text ~= "" then
			table.insert(v1, v2.Text)
		end
	end
	if #v1 < 2 then
		if not v_u_startpollbooth.Setup.Value then
			v_u_startpollbooth.Setup.Value = true
		end
		v_u1("warn", "you must enter at least 2 options to start the poll!")
	else
		v_u_startpoll:FireServer(v1)
		v_u_startpollbooth.Visible = false
	end
end)
local v_u_poll = v_u_parent:WaitForChild("PollPart"):WaitForChild("SurfaceGui"):WaitForChild("Poll")
local v_u_totalvotes = v_u_parent:WaitForChild("TotalVotes")
local function v_u3(arg1, arg2)
	-- upvalues: (copy) v_u_tween
	v_u_tween:Create(arg1, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Size"] = UDim2.new(arg2, 0, 1, 0)
	}):Play()
end
local function v_u4(arg1)
	-- upvalues: (copy) v_u_parent, (copy) v_u_poll, (copy) v_u_totalvotes, (copy) v_u3
	local v1 = "Option" .. arg1
	local v2 = v_u_parent:FindFirstChild(v1)
	local v3 = v_u_poll:FindFirstChild(v1)
	local v4
	if v3 then
		v4 = v3:FindFirstChild("ProgressBar")
	else
		v4 = v3
	end
	if v2 and (v3 and (v4 and v_u_totalvotes.Value > 0)) then
		v3.Counter.Text = v2.Value
		v_u3(v4, v2.Value / v_u_totalvotes.Value)
	elseif v4 then
		v3.Counter.Text = 0
		v_u3(v4, 0)
	end
end
for v_u5 = 1, 4 do
	local v6 = v_u_parent:FindFirstChild("Option" .. v_u5)
	if v6 then
		v6:GetPropertyChangedSignal("Value"):Connect(function()
			-- upvalues: (copy) v_u4, (copy) v_u5
			v_u4(v_u5)
		end)
	end
end
v_u_totalvotes:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u4
	v_u4(1)
	v_u4(2)
	v_u4(3)
	v_u4(4)
end)
task.defer(function()
	-- upvalues: (copy) v_u4
	v_u4(1)
	v_u4(2)
	v_u4(3)
	v_u4(4)
end)
local v_u_getmouse = v_u_localplayer:GetMouse()
local v_u7 = nil
v_run.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_getmouse, (ref) v_u7
	if v_u_getmouse.Target then
		if v_u_getmouse.Target.Name == "ClickButton" then
			if v_u_getmouse.Target.BillboardGui.Enabled == false then
				v_u_getmouse.Target.BillboardGui.Enabled = true
				tween(v_u_getmouse.Target.Highlight, 0.5, {
					["FillTransparency"] = 0.5
				})
				tween(v_u_getmouse.Target.Highlight, 0.5, {
					["OutlineTransparency"] = 0
				})
				v_u_getmouse.Target.BillboardGui.OptionText.UIScale.Scale = 0
				tween(v_u_getmouse.Target.BillboardGui.OptionText.UIScale, 0.25, {
					["Scale"] = 1
				})
				v_u7 = v_u_getmouse.Target
				return
			end
		elseif v_u7 ~= nil then
			tween(v_u7.Highlight, 0.5, {
				["FillTransparency"] = 1
			})
			tween(v_u7.Highlight, 0.5, {
				["OutlineTransparency"] = 1
			})
			tween(v_u7.BillboardGui.OptionText.UIScale, 0.25, {
				["Scale"] = 0
			})
			v_u7.BillboardGui.Enabled = false
		end
	end
end)
local v_u8 = true
for _, v_u9 in pairs(v_u_parent.Buttons:GetChildren()) do
	local v_clickdetector = v_u9:WaitForChild("ClickButton"):FindFirstChild("ClickDetector")
	if v_clickdetector then
		v_clickdetector.MouseClick:Connect(function(arg1)
			-- upvalues: (ref) v_u8, (copy) v_u_parent, (copy) v_u1, (copy) v_u9
			if v_u8 then
				v_u8 = false
				if v_u_parent.VotedPlayers:FindFirstChild((tostring(arg1.UserId))) == nil then
					game.SoundService.SFX.Click:Play()
					local originalPos = v_u9.ClickButton.Position
					v_u9.ClickButton.Position = v_u9.ClickButton.Position - Vector3.new(0, 0.3, 0)
					tween(v_u9.ClickButton, 0.35, {
						["Position"] = originalPos
					})
					script.Parent.AddVote:FireServer(v_u9.Name:match("Button(%d)"))
				else
					v_u1("danger", "you can only vote once per poll!")
				end
				task.wait(0.35)
				v_u8 = true
			end
		end)
	end
end
for _, v_u10 in pairs(v_u_parent.PollPart.SurfaceGui.Poll:GetChildren()) do
	if v_u10:IsA("TextButton") then
		v_u10.Activated:Connect(function()
			-- upvalues: (ref) v_u8, (copy) v_u_parent, (copy) v_u_localplayer, (copy) v_u1, (copy) v_u10
			if v_u8 then
				v_u8 = false
				if v_u_parent.VotedPlayers:FindFirstChild((tostring(v_u_localplayer.UserId))) == nil then
					game.SoundService.SFX.ButtonClick:Play()
					script.Parent.AddVote:FireServer(v_u10.Name:match("Option(%d)"))
				else
					v_u1("danger", "you can only vote once per poll!")
				end
				task.wait(0.25)
				v_u8 = true
			end
		end)
	end
end