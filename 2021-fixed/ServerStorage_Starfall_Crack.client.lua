-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x1
-- no manual fixes needed; paste as-is.
-- ============================================================
local TweenService = game:GetService("TweenService")
local plsdonate = require(game.ReplicatedStorage.FractureGeneratorModule)
local boyitsjustakahal = Vector3.new(1,0,1)
local function riftgenerator()
	local uh = Instance.new("Model")
	uh.Name = "Outline"
	local uh2 = Instance.new("Model")
	uh2.Name = "Inline"
	local seed = math.random(100000, 999999)
	print(seed)
	local Fracture = plsdonate.CreateCrack(
		CFrame.new(166.436, 239.435, 307.589), -- Starting point CFrame
		5, -- Starting lines
		0.5, -- Spread angle percent (Min: 0, Max: 1)
		5, -- Maximum branch lines
		NumberRange.new(1,10), -- Line length (randomized size of how long a eby Min and Max)
		NumberRange.new(0.1,1), -- Line thickness (goes from Max to Min in the center to outside)
		boyitsjustakahal, -- Scaling (determines the scale of each part)
		NumberRange.new(1,5), -- Line branching (how many lines will split from the previous branch)
		nil, -- A valid basepart to give the module what part to reference when generating the model. (Optional if you want the module to include particles, lights, etc.)
		seed
	)
	
	local function resizeModel(model,a)
		local base = model.PrimaryPart.Position
		for _,part in pairs(model:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Position = base:Lerp(part.Position,a)
				part.Size = part.Size * (a); --[[ 2021: was compound assignment ]]
			end
		end
	end

	resizeModel(Fracture,15) --> sizes to 1/2

	--[[local Inline = plsdonate.CreateCrack(
		CFrame.new(42, 288.087, 101), -- Starting point CFrame
		5, -- Starting lines
		1, -- Spread angle percent (Min: 0, Max: 1)
		5, -- Maximum branch lines
		NumberRange.new(1,15), -- Line length (randomized size of how long a eby Min and Max)
		NumberRange.new(0.1,0.3), -- Line thickness (goes from Max to Min in the center to outside)
		Vector3.new(9,0,9), -- Scaling (determines the scale of each part)
		NumberRange.new(5,10), -- Line branching (how many lines will split from the previous branch)
		game.ReplicatedStorage.Hello, -- A valid basepart to give the module what part to reference when generating the model. (Optional if you want the module to include particles, lights, etc.)
		seed
	)]]

	Fracture.Parent = workspace
	Fracture.Name = "Rift"
	uh.Parent = Fracture
	uh2.Parent = Fracture
	-- change scale of uh to 10
	-- Loop through all parts in the model and scale them

	for _, v in ipairs(Fracture:GetDescendants()) do
		if v:IsA("BasePart") then
			local parts = v
			parts.Parent = uh
		end
	end

	--[[for _, v in ipairs(Inline:GetDescendants()) do
		if v:IsA("BasePart") then
			local parts = v
			parts.Parent = uh2
		end
	end]]

	-- For each crack in the outline, detect if its number is lower or equal to 20, then lerp the color based on its number , highest is whitest lowest is darkest 
	--[[for _, v in ipairs(uh2:GetDescendants()) do
		if v:IsA("BasePart") then
			local crackName = v.Name
			if crackName:sub(1, 5) == "Crack" then
				local crackNumber = tonumber(crackName:sub(6))
				if crackNumber and crackNumber <= 80 then
					local lerpAmount = crackNumber / 100
					local pink1 = Color3.fromRGB(234, 0, 255)
					local pink2 = Color3.fromRGB(255, 255, 255)
					local lerpedColor = pink1:Lerp(pink2, lerpAmount)
					v.Color = lerpedColor
				end
			end
		end
	end]]

	--[[ set all baseparts or cracks in uh2 to transp 1
	for _, v in ipairs(uh2:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 0.7
		end
	end]]


	for _, v in ipairs(uh:GetDescendants()) do
		if v:IsA("BasePart") then
			local crackName = v.Name
			if crackName:sub(1, 5) == "Crack" then
				local crackNumber = tonumber(crackName:sub(6))
				if crackNumber and crackNumber <= 80 then
					local lerpAmount = crackNumber / 80
					local pink1 = Color3.fromRGB(224, 101, 255)
					local pink2 = Color3.fromRGB(255, 171, 254)
					local lerpedColor = pink1:Lerp(pink2, lerpAmount)
					v.Color = lerpedColor
				end
			end
		end
	end

	--[[for _, v in ipairs(uh2:GetDescendants()) do
		if v:IsA("Sound") or v:IsA("ParticleEmitter") then
			v:Destroy()
		end
	end]]
	--Inline:Destroy()



	for _, v in ipairs(Fracture:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		elseif v:IsA("Sound") then
			v:Play()
		end
	end

	wait(2.2)

	local function FadeCrack(crack)
		local tweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
		local newSize = crack.Size + Vector3.new(-30, 0, 0)
		game.TweenService:Create(crack, tweenInfo, {Size = newSize}):Play()
	end

	local function FadeOutCracks(start, finish)
		for _, v in ipairs(Fracture:GetDescendants()) do
			if v:IsA("BasePart") then
				local crackName = v.Name
				if crackName:sub(1, 5) == "Crack" then
					local crackNumber = tonumber(crackName:sub(6))
					if crackNumber and crackNumber >= start and crackNumber <= finish then
						FadeCrack(v)
					end
				end
			end
		end
	end



	FadeOutCracks(1, 20)
	wait(.15)
	FadeOutCracks(21, 40)
	wait(.15)
	FadeOutCracks(41, 60)
	wait(.15)
	FadeOutCracks(61, 80)
	wait(1.5)

	Fracture:Destroy()

end

riftgenerator()