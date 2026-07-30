-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Concentration Line (集中線) is an effect commonly seen in manga and anime.
-- The scale attribute linked to the ScreenGui will alter the scale of the effect.
local svcWorkspace = game:GetService("Workspace")
local svcRun = game:GetService("RunService")
local svcTween = game:GetService("TweenService")

local uiMaster = script.Parent
local uiFrame = uiMaster:FindFirstChild("SpeedLines")
local uiTriangleMaster = uiFrame:FindFirstChild("Beam")

local RUN_SERVICE_NAME = "ConcentrationLineRunner"
local EFFECT_STRENGTH = 4
local IS_RUNNING = false

-- Picks a random side of the screen and a random offset and places a triangle there.
-- This could randomize an angle and then cast out to the edges of the screen instead.
local addTriangleToFrame = function(paramScale : number)
	-- Pick a side of the screen to populate.
	local axis = math.random(1, 4)
	-- Get the x, and y positions based on the random picks.
	local x, y
	local size
	if (axis < 3) then
		x = axis == 1 and 0 or 1
		y = (1/uiFrame.AbsoluteSize.Y) * math.random(0, uiFrame.AbsoluteSize.Y)
		size = (1/uiFrame.AbsoluteSize.X) * math.random(uiFrame.AbsoluteSize.X * 0.666, uiFrame.AbsoluteSize.X)
	elseif (axis >= 3) then
		y = axis == 3 and 0 or 1
		x = (1/uiFrame.AbsoluteSize.X) * math.random(0, uiFrame.AbsoluteSize.X)
		size = (1/uiFrame.AbsoluteSize.Y) * math.random(uiFrame.AbsoluteSize.Y * 0.666, uiFrame.AbsoluteSize.Y)
	end
	-- Figure out the angle between center screen and the selected point.
	local difference = Vector2.new(x, y) - Vector2.new(0.5, 0.5)
	local angle = math.deg(math.atan2(difference.Y, difference.X))
	-- Create a UI.	
	local uiTriangle = uiTriangleMaster:Clone()
	-- Set properties of the UI.
	uiTriangle.Size = UDim2.new(
		((math.random(8)/100) * paramScale) * 0.5,
		0,
		(size * paramScale) * 0.7,
		0
	)
	uiTriangle.Rotation = angle - 90
	uiTriangle.Position = UDim2.new(x,0,y,0)	
	uiTriangle.Parent = uiFrame
	uiTriangle.Visible = true
	uiTriangle.Arrow.Position = UDim2.new(0.5,0,0,0)
	uiTriangle.Arrow.ImageTransparency = math.random(0,75)/100
	-- Return so tween can be applied.
	return uiTriangle
end

-- Loops every frame and adds new instances!
local run = function(paramDeltaTime)
	local scale = uiMaster:GetAttribute("Scale") or 1
	for i = 1, math.clamp(EFFECT_STRENGTH * scale, 1, EFFECT_STRENGTH) do
		-- Makes a new triangle using the function above.
		local uiTriangle = addTriangleToFrame(scale)
		-- Creates a tween with the triangle created.
		local tween = svcTween:Create(uiTriangle.Arrow, TweenInfo.new(0.2), {["Position"] = UDim2.new(0.5,0,1,0)})
		-- When the tween ends destroy the triangle (you could also recycle, and reuse them for a performance increase.)
		tween.Completed:Connect(function()
			uiTriangle:Destroy()
		end)
		-- Play the tween.
		tween:Play()
	end	
end
-- Only run if the scale is greater than 0.
local scale = uiMaster:GetAttribute("Scale") or 1
if (scale > 0) then
	IS_RUNNING = true
	svcRun:BindToRenderStep(RUN_SERVICE_NAME, Enum.RenderPriority.Camera.Value, run)
end
-- If the scale has changed check if the run should end, or start!
uiMaster:GetAttributeChangedSignal("Scale"):Connect(function()
	local scale = uiMaster:GetAttribute("Scale") or 1
	if (scale <= 0) then
		IS_RUNNING = false
		svcRun:UnbindFromRenderStep(RUN_SERVICE_NAME)
	elseif (IS_RUNNING == false) then
		IS_RUNNING = true
		svcRun:BindToRenderStep(RUN_SERVICE_NAME, Enum.RenderPriority.Camera.Value, run)
	end	
end)


