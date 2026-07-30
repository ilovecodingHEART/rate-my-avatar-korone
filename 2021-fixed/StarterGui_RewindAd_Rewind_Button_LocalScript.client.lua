-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Button = script.Parent

-- UI references (wait for safety)
local TransitionGui = PlayerGui:WaitForChild("TransitionGui")
local Transition = TransitionGui:WaitForChild("Transition")

local RewindGui = PlayerGui:WaitForChild("Rewind")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")

local RewindButton = RewindGui:WaitForChild("RewindButton")
local PDRewind = RewindGui:WaitForChild("PDRewind")
local PDMain = PDRewind:WaitForChild("Main")

local ClickSound = SoundService:WaitForChild("SFX"):WaitForChild("Click")
local HoverSound = SoundService:WaitForChild("SFX"):WaitForChild("Hover")

local busy = false

local function tween(object, time, properties, easingStyle)
	local info = TweenInfo.new(time, easingStyle or Enum.EasingStyle.Quint)
	local tweenObj = TweenService:Create(object, info, properties)
	tweenObj:Play()
	return tweenObj
end

Button.Activated:Connect(function()

	if busy then return end
	busy = true

	ClickSound:Play()

	Transition.Position = UDim2.new(0, 0, 0, 0)

	local tween1 = tween(
		Transition,
		1,
		{Position = UDim2.new(0, 0, 1, 0)}
	)

	tween1.Completed:Wait()

	RewindGui.Enabled = true
	ScreenGui.Enabled = false

	local tween2 = tween(
		Transition,
		1,
		{Position = UDim2.new(0, 0, 2, 0)}
	)

	RewindButton.Text = "START REWIND"
	PDMain.Enabled = true

	tween2.Completed:Wait()

	busy = false

end)


Button.MouseEnter:Connect(function()
	HoverSound:Play()
end)