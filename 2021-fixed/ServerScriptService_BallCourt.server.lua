-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x2
-- no manual fixes needed; paste as-is.
-- ============================================================
local worskpace = game:GetService("Workspace")
local _physicsservice = game:GetService("PhysicsService");

local RedNet = worskpace.Map.ClubIsland.BallCourt.BallCourt.RedNet
local BlueNet = worskpace.Map.ClubIsland.BallCourt.BallCourt.BlueNet
local HitboxRed = worskpace.Map.ClubIsland.BallCourt.BallCourt.RedNet.HitBox
local HitboxBlue = worskpace.Map.ClubIsland.BallCourt.BallCourt.BlueNet.HitBox
local Results = worskpace.MapUI.ScoreBoard
local _ballCourt = worskpace.Map.ClubIsland.BallCourt;
local RedScore = 0
local BlueScore = 0

local function Reset()
	worskpace.Map.ClubIsland.BallCourt.BallCourt.Ball.Position = Vector3.new(-5.445, 2.785, -542.531)
end

local function setupCollisionGroup(name)
	local success, err = pcall(function()
		_physicsservice:CreateCollisionGroup(name)
	end)

	if not success then
		if err:find("already exists") then
			return
		else
		end
	end
end
local Barriers = {}
for _, child in pairs(_ballCourt.BallCourt:GetChildren()) do
	if child.Name == "Barrier" then
		table.insert(Barriers, child)
	end
end
setupCollisionGroup("Players")
setupCollisionGroup("Ball")
setupCollisionGroup("Barriers") 

_physicsservice:CollisionGroupSetCollidable("Players", "Players", false) 
_physicsservice:CollisionGroupSetCollidable("Players", "Ball", true) 
_physicsservice:CollisionGroupSetCollidable("Players", "Barriers", false) 
_physicsservice:CollisionGroupSetCollidable("Ball", "Default", true)
_physicsservice:CollisionGroupSetCollidable("Ball", "Barriers", true) 
_physicsservice:CollisionGroupSetCollidable("Barriers", "Default", true) 

local function setCollisionGroups()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			_physicsservice:SetPartCollisionGroup(player.Character.HumanoidRootPart, "Players")
			for _, part in ipairs(player.Character:GetChildren()) do
				if part:IsA("BasePart") then
					_physicsservice:SetPartCollisionGroup(part, "Players")
				end
			end
		end
	end
	local ball = _ballCourt.Parent:FindFirstChild("BallCourt"):FindFirstChild("Ball")
	if ball then
		_physicsservice:SetPartCollisionGroup(ball, "Ball")
	end
	for _, barrier in pairs(Barriers) do
		_physicsservice:SetPartCollisionGroup(barrier, "Barriers") 
	end
end

setCollisionGroups()
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		setCollisionGroups()
	end)
end)


local function Goal(net)
	if net == "Red" then
		RedScore = RedScore + (1); --[[ 2021: was compound assignment ]]
		Results.Red.Score.Text = tostring(RedScore)
		RedNet.Frame.Clouds:Emit(2)
		RedNet.Frame.Confetti1:Emit(1)
		RedNet.Frame.Confetti2:Emit(1)
		RedNet.Frame.Confetti3:Emit(1)
		RedNet.Frame.Confetti4:Emit(1)
		RedNet.Frame.Middle.Circle:Emit(1)
		RedNet.Frame.Popper1.Confetti1:Emit(1)
		RedNet.Frame.Popper1.Confetti2:Emit(1)
		RedNet.Frame.Popper1.Confetti3:Emit(1)
		RedNet.Frame.Popper1.Confetti4:Emit(1)
		RedNet.Frame.Popper2.Confetti1:Emit(1)
		RedNet.Frame.Popper2.Confetti2:Emit(1)
		RedNet.Frame.Popper2.Confetti3:Emit(1)
		RedNet.Frame.Popper2.Confetti4:Emit(1)
		Reset()
	end
	if net == "Blue" then
		BlueScore = BlueScore + (1); --[[ 2021: was compound assignment ]]
		Results.Blue.Score.Text = tostring(BlueScore)
		BlueNet.Frame.Clouds:Emit(2)
		BlueNet.Frame.Confetti1:Emit(1)
		BlueNet.Frame.Confetti2:Emit(1)
		BlueNet.Frame.Confetti3:Emit(1)
		BlueNet.Frame.Confetti4:Emit(1)
		BlueNet.Frame.Middle.Circle:Emit(1)
		BlueNet.Frame.Popper1.Confetti1:Emit(1)
		BlueNet.Frame.Popper1.Confetti2:Emit(1)
		BlueNet.Frame.Popper1.Confetti3:Emit(1)
		BlueNet.Frame.Popper1.Confetti4:Emit(1)
		BlueNet.Frame.Popper2.Confetti1:Emit(1)
		BlueNet.Frame.Popper2.Confetti2:Emit(1)
		BlueNet.Frame.Popper2.Confetti3:Emit(1)
		BlueNet.Frame.Popper2.Confetti4:Emit(1)
		Reset()
	end
end

local function updateCountdown(minutes, seconds)
	Results.Status.Text = string.format("Score Resets in %02d:%02d", minutes, seconds)
end

local function convertSecondsToMinutesAndSeconds(seconds)
	local minutes = math.floor(seconds / 60)
	local remainingSeconds = seconds % 60
	return minutes, remainingSeconds
end

HitboxRed.Touched:Connect(function(Object)
	if Object.Name == "Ball" then
		Goal("Red")
	end
end)
HitboxBlue.Touched:Connect(function(Object)
	if Object.Name == "Ball" then
		Goal("Blue")
	end
end)

while true do
	for i = 1200, 0, -1 do
		local minutes, seconds = convertSecondsToMinutesAndSeconds(i)
		updateCountdown(minutes, seconds)
		wait(1) 
	end
	Reset()
	Results.Red.Number.Text = 0
	Results.Cyan.Number.Text = 0
	RedScore = 0
	BlueScore = 0
end