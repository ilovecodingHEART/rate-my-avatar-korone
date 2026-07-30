local FractureGeneratorModule = {}

-------------------------
-- Created by kirbyzaz --
-------------------------

-- Generates a crack effect and returns a model of the result





--[[ USAGE
	
local Fracture = FractureGeneratorModule.NewCrack(
	CFrame.new(0,10,0), -- Starting point CFrame
	5, -- Starting lines
	0.5, -- Spread angle percent (Min: 0, Max: 1)
	5, -- Maximum branch lines
	NumberRange.new(1,10), -- Line length (randomized size of how long a eby Min and Max)
	NumberRange.new(0.1,1), -- Line thickness (goes from Max to Min in the center to outside)
	Vector3.new(1,0,1), -- Scaling (determines the scale of each part)
	NumberRange.new(1,5), -- Line branching (how many lines will split from the previous branch)
	Part -- A valid basepart to give the module what part to reference when generating the model. (Optional if you want the module to include particles, lights, etc.)
	123456 -- Generation seed (determines the result of the generated crack, optional: Leave blank or nil to use a random seed)
)
Fracture.Parent = workspace
	
--]]



function Lerp(a, b, t, Cap)
	if Cap == true then math.clamp(t,0,1) end
	return a + (b - a) * t
end

local DefaultTemplate = Instance.new("Part") do
	DefaultTemplate.Name = "CrackedPart"
	DefaultTemplate.Anchored = true
	DefaultTemplate.BottomSurface = Enum.SurfaceType.Smooth
	DefaultTemplate.CanCollide = false
	DefaultTemplate.TopSurface = Enum.SurfaceType.Smooth
	DefaultTemplate.CanQuery = false
	DefaultTemplate.Material = Enum.Material.Neon
	DefaultTemplate.Color = Color3.fromRGB(243, 132, 227)
	DefaultTemplate.CanTouch = false
end


function FractureGeneratorModule.CreateCrack(PrimaryCFrame,StartingLines,SpreadAnglePercent,MaxBranchLines,LineLength,LineThickness,Scaling,LineBranching,BasepartTemplate,Seed)

	if Seed ~= nil then
		math.randomseed(Seed)
	else
		math.randomseed(tick())
	end

	local TemplatePart
	if BasepartTemplate ~= nil then
		TemplatePart = BasepartTemplate:Clone()
	else
		TemplatePart = DefaultTemplate:Clone()
	end

	local CrackGroupModel = Instance.new("Model")
	CrackGroupModel:SetAttribute("MaxBranchLines",MaxBranchLines)
	CrackGroupModel.Parent = workspace
	CrackGroupModel.Name = "Crack"
	local Center = TemplatePart:Clone()
	Center:ClearAllChildren()
	Center.Name = "Center"
	Center.Size = Vector3.new(0,0,0)
	Center.Transparency = 1
	Center.Parent = CrackGroupModel
	Center.CFrame = PrimaryCFrame
	CrackGroupModel.PrimaryPart = Center

	-- get all particeles in script
	local Particles = script:GetChildren()
	local ParticleTable = {}
	for _,Particle in pairs(Particles) do
		if Particle:IsA("ParticleEmitter") and Particle.Name ~= "Shards" then
			table.insert(ParticleTable,Particle)
		end
	end
	-- put them in center
	for _,Particle in pairs(ParticleTable) do
		local NewParticle = Particle:Clone()
		NewParticle.Parent = Center
	end

	-- get all sounds of scirpt
	local Sounds = script:GetChildren()
	local SoundTable = {}
	for _,Sound in pairs(Sounds) do
		if Sound:IsA("Sound") then
			table.insert(SoundTable,Sound)
		end
	end
	-- put them in center
	for _,Sound in pairs(SoundTable) do
		local NewSound = Sound:Clone()
		if NewSound.Name ~= "Seal" then
			NewSound.Parent = Center
		end
	end
	local RotOffset = math.random(-180000,18000)/1000
	for i = 1 , StartingLines do
		local StartingCrack = TemplatePart:Clone()
		StartingCrack.Name = "Crack"
		StartingCrack:SetAttribute("Index",1)
		StartingCrack:SetAttribute("BranchesLeft",MaxBranchLines)
		StartingCrack.Parent = CrackGroupModel

		local Thickness,Length = Lerp(LineThickness.Min,LineThickness.Max,StartingCrack:GetAttribute("BranchesLeft")/MaxBranchLines,true), math.random(LineLength.Min*1000,LineLength.Max*1000)/1000
		StartingCrack.Size = Vector3.new(Thickness,Thickness,Length)*Scaling
		StartingCrack.CFrame = Center.CFrame:ToWorldSpace(CFrame.new(0,0,0)):ToWorldSpace(CFrame.Angles(0, math.rad(((i/StartingLines)*360+RotOffset+((math.random(-180000,180000)/1000)/StartingLines))), 0)):ToWorldSpace(CFrame.new(0,0,Length/2))
	end

	local LinesAdded = false
	repeat
		LinesAdded = false
		for _,CrackPart in pairs(CrackGroupModel:GetChildren()) do
			if CrackPart.Name == "Crack" and CrackPart:GetAttribute("BranchesLeft") ~= nil then

				local BranchCount = math.random(LineBranching.Min,LineBranching.Max)
				for Branch = 1, BranchCount do

					CrackPart:SetAttribute("BranchesLeft",CrackPart:GetAttribute("BranchesLeft")-1)

					if CrackPart:GetAttribute("BranchesLeft") > 0 then
						LinesAdded = true
						local NextCrack = TemplatePart:Clone()
						NextCrack.Name = "Crack"
						NextCrack:SetAttribute("Index",CrackPart:GetAttribute("Index")+1)
						NextCrack:SetAttribute("BranchesLeft",CrackPart:GetAttribute("BranchesLeft"))
						NextCrack.Parent = CrackGroupModel

						local Thickness,Length = Lerp(LineThickness.Min,LineThickness.Max,NextCrack:GetAttribute("BranchesLeft")/MaxBranchLines,true), math.random(LineLength.Min*1000,LineLength.Max*1000)/1000
						NextCrack.Size = Vector3.new(Thickness,Thickness,Length)*Scaling
						NextCrack.CFrame = CrackPart.CFrame:ToWorldSpace(CFrame.new(0,0,CrackPart.Size.Z/2)):ToWorldSpace(CFrame.Angles(0, math.rad((math.random(-360000,360000)/1000)/(StartingLines+BranchCount)), 0)):ToWorldSpace(CFrame.new(0,0,NextCrack.Size.Z/2))
					end

				end



				CrackPart:SetAttribute("BranchesLeft",nil)

			end
		end
	until LinesAdded == false

	-- Make each crack one that is farthest away deep pink color


	-- name eachcrack in order like from the position farthest away from center to closes, and also make the ones farthest pink, but closest to center white

	local Cracks = {}
	for _,Crack in pairs(CrackGroupModel:GetChildren()) do
		if Crack.Name == "Crack" then
			table.insert(Cracks,Crack)
		end
	end
	table.sort(Cracks,function(a,b)
		return (a.Position-Center.Position).Magnitude > (b.Position-Center.Position).Magnitude
	end)
	for i,Crack in pairs(Cracks) do
		Crack.Name = "Crack" .. i
		local bruh = script.Shards:Clone()
		bruh.Parent = Crack
		local seals = script.Seal:Clone()
		seals.Parent = Crack
	end
	-- color
	
	


	return CrackGroupModel

end

return FractureGeneratorModule