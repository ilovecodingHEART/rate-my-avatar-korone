-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--[[

   -- CXDEPOP
   
      [ Fast fake donation feed with leaderboard frames, sounds, VFX, and fireworks. ]
      [ No stat updates, no chat alerts, no badges. ]

]]

-- Services
local _ss = game:GetService("ServerScriptService")
local _rep = game:GetService("ReplicatedStorage")
local _workspace = game:GetService("Workspace")
local _serverstorage = game:GetService("ServerStorage")
local _tween = game:GetService("TweenService")
local _debris = game:GetService("Debris")
local _players = game:GetService("Players")

-- Modules
local _numberhelper = require(_rep:WaitForChild("NumberHelpers"))

-- Remotes
local _remotes = require(_rep:WaitForChild("Remotes"))
local _donationsound = _remotes.Event("PlayDonationSound")
local _chatalert = _remotes.Event("ChatDonationAlert")
local _createvfx = _rep:WaitForChild("VFXObjects"):WaitForChild("CreateVfx")

-- Colors & timing copied from Donation.lua
local _waittime = {
	[7] = 1060, [6] = 800, [5] = 450, [4] = 300, [3] = 150, [2] = 40, [1] = 0
}
local _levelcolors = {
	[7] = Color3.fromRGB(255, 0, 0),
	[6] = Color3.fromRGB(255, 0, 0),
	[5] = Color3.fromRGB(255, 0, 100),
	[4] = Color3.fromRGB(255, 64, 172),
	[3] = Color3.fromRGB(0, 200, 255),
	[2] = Color3.fromRGB(255, 179, 0),
	[1] = Color3.fromRGB(62, 255, 48)
}

-- Fireworks function (same as Donation.lua, shortened)
local function _fireworks(count, pos)
	for i = 1, count do
		task.spawn(function()
			local X = pos.X + math.random(-15, 15)
			local Z = pos.Z + math.random(-15, 15)
			local fw = _serverstorage:WaitForChild("Firework"):Clone()
			fw.Color = Color3.fromHSV(math.random(), 1, 1)
			fw.PointLight.Color = fw.Color
			fw.EmitPoint.Flash.Color = ColorSequence.new(fw.Color)
			fw.EmitPoint.Sparks.Color = ColorSequence.new(fw.Color)
			fw.EmitPoint.Stars.Color = ColorSequence.new(fw.Color)
			fw.Position = Vector3.new(X, 5, Z)
			fw.Parent = _workspace
			fw.Animate.Disabled = false
			game.Debris:AddItem(fw, 6)
		end)
	end
end

-- Frame template
local FrameTemplate = _ss:WaitForChild("Donation"):FindFirstChild("ExtraDonation")
if not FrameTemplate then
	warn("[BotDonationsVisual] ❌ Couldn't find Donation.ExtraDonation frame template.")
	return
end

-- Bots
local _bots = {
	usernames = {
		"Iliketurtles142376", "Kaito576893", "TheWatcher9821", "Cruisezy_Playz",
		"DreInvalid","Knowncrime","Elucidatorbreeyt","0nly_Inv1ctus","lyicals",
		"RobloxItemsUGCBR","deadi92","ItsTheEliteTTV","dominous14","SoulitudeMusic",
		"Dev_Loserr","garfio01","CPUVirtuaIReality","spritesdemise","cool22hamstek",
		"prothizing","duskdeeri","248rez","50uss","EdwardJackdaw21","AfraiC4t",
		"yuqiified","TakeLuca","RxnClash","Octoberswill","Marco_ZocketYT",
		"APG098_YT","k2_nz","RX_potato1","kynostia"
	},

	userids = {
		5048787935,9679566196,1752066814,995316012,3003926656,4256519333,5210164327,
		293853898,4256193534,7871147531,410645409,2014532153,405919485,5701573583,
		4404834957,527108563,301110758,3163014000,1701266264,971193650,24065355,
		3195733520,870481152,1338785703,518821929,3666991790,812619024,558649230,
		1835196136,1996394561,924747701,4166356547,5146744165,4937339051
	}
}

local function _getlevel(amount)
	if amount >= 10000000 then return 6
	elseif amount >= 1000000 then return 5
	elseif amount >= 100000 then return 4
	elseif amount >= 10000 then return 3
	elseif amount >= 1000 then return 2
	else return 1 end
end

local function _createglobalframe(donator, raiser, amount, level, section)
	local Frame = FrameTemplate:Clone()
	local Color = _levelcolors[level]
	local WaitTime = _waittime[level]
	Frame.LayoutOrder = -amount
	Frame.Donator.Username.Text = donator.Username
	Frame.Raiser.Username.Text = raiser.Username
	Frame.Donator.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. donator.Id .. "&w=420&h=420"
	Frame.Raiser.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. raiser.Id .. "&w=420&h=420"
	Frame.AmountFrame.Main.Amount.Text = "" .. _numberhelper.format(amount)
	Frame.AmountFrame.Main.Amount.TextColor3 = Color
	Frame.Bar.Main.BackgroundColor3 = Color
	Frame.Donator.Avatar.Border.Color = Color
	Frame.Raiser.Avatar.Border.Color = Color

	local target = (section == "extra") and "Extra" or "Normal"
	local folder = _workspace.MapUI.LiveDonations.Leaderboard:FindFirstChild(target)
	if not folder then return end
	Frame.Parent = folder

	local BarTween = _tween:Create(Frame.Bar, TweenInfo.new(WaitTime, Enum.EasingStyle.Linear), {Size = UDim2.new(0,0,0,5)})
	BarTween:Play()
	BarTween.Completed:Connect(function()
		_debris:AddItem(Frame, 10)
		Frame.LayoutOrder = 1
		Frame.Parent = _workspace.MapUI.LiveDonations.Leaderboard.Normal
	end)
end

-- Main function to trigger donation visuals
local function _doDonation(amount)
	local i1 = math.random(1, #_bots.usernames)
	local i2 = math.random(1, #_bots.usernames)
	while i2 == i1 do i2 = math.random(1, #_bots.usernames) end

	local donator = {Id = _bots.userids[i1], Username = "@" .. _bots.usernames[i1]}
	local raiser = {Id = _bots.userids[i2], Username = "@" .. _bots.usernames[i2]}

	local level = _getlevel(amount)
	local section = (amount >= 10000) and "extra" or ""
	local emitPoint = _workspace.Map.Functional.Leaderboards.LiveDonations.EmitPoint

	_createglobalframe(donator, raiser, amount, level, section)

	if amount >= 10000 then
		pcall(function() _chatalert:FireAllClients(donator.Username, raiser.Username, amount, "global") end)
	end

	-- Sound & Coin VFX (Server to All Clients)
	_donationsound:FireAllClients(level, emitPoint)

	-- Coin VFX
	--local players = _players:GetPlayers()
	--if #players > 0 then
	--	local targetPlayer = players[math.random(1, #players)]
		--_createvfx:FireAllClients("GiveCurrency", emitPoint.Position, targetPlayer, amount)
	--end

	-- General VFX Level
	local _vfxClone = _serverstorage.SFXLevels["Level" .. level]:Clone()
	_vfxClone.Parent = _serverstorage
	_ss.DonationVFX:Fire(_vfxClone, emitPoint, level)

	if level == 3 then _fireworks(12, emitPoint.Position) end
	if level == 4 then _fireworks(37, emitPoint.Position) end
	if level == 5 then _fireworks(55, emitPoint.Position) end
	if level >= 6 then _fireworks(70, emitPoint.Position) end
end

-- Separate loops for different timing ranges
task.spawn(function()
	while true do
		_doDonation(math.random(1, 75))
		task.wait(0.15)
	end
end)
task.spawn(function()
	while true do
		_doDonation(math.random(50, 99))
		task.wait(0.55)
	end
end)
task.spawn(function()
	while true do
		_doDonation(math.random(100, 999))
		task.wait(1.75)
	end
end)
task.spawn(function()
	while true do
		_doDonation(math.random(1000, 9999))
		task.wait(11)
	end
end)

task.spawn(function()
	while true do
		_doDonation(math.random(10000, 15000))
		task.wait(126)
	end
end)

task.spawn(function()
	while true do
		_doDonation(math.random(15000, 25000))
		task.wait(526)
	end
end)

task.spawn(function()
	while true do
		_doDonation(math.random(25000, 75000))
		task.wait(1126)
	end
end)