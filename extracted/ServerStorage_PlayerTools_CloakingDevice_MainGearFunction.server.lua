local Debris = game:GetService('Debris')
local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')

local Tool = script.Parent
local Sounds = Tool.MainGearFunction.Assets:WaitForChild('Sounds', 5)
local Particles = Tool.MainGearFunction.Assets:WaitForChild('Particles', 5)

local Character = Players:WaitForChild(Tool.Parent.Parent.Name).Character

local NoEditParts = {}

function SetCharacterTransparency(Transparency)
	
	if Transparency == 1 then
		
		NoEditParts = {}
		
	end
	
	for _, Object in pairs(Character:GetDescendants()) do
		
		if Object.Name == 'HumanoidRootPart' then
			
		elseif Object:IsA('Fire') then
			
			Object.Enabled = not Object.Enabled
			
		else
			
			if Object:IsA('MeshPart') or Object:IsA('Part') then
				
				if Transparency == 1 then
					
					if Object.Transparency == 1 then
						
						table.insert(NoEditParts, Object.Name)
						
					else
						
						TweenService:Create(Object, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Transparency = tonumber(Transparency)
						}):Play()
						
					end
					
				elseif Transparency == 0 then
					
					if not table.find(NoEditParts, Object.Name) then
						
						TweenService:Create(Object, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
							Transparency = tonumber(Transparency)
						}):Play()
						
					end
					
				end

			end
			
		end
		
	end
	TweenService:Create(Tool:WaitForChild('Handle', 5), TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
		Transparency = tonumber(Transparency)
	}):Play()
	
	for _, Cloak in pairs(Tool.Handle:GetChildren()) do
		if Cloak.Name == "CloakDevicePart" then
			TweenService:Create(Cloak, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
				Transparency = tonumber(Transparency)
			}):Play()
		end
	end
	
	if Character:WaitForChild('Head', 5):FindFirstChild('face') then
		TweenService:Create(Character:WaitForChild('Head', 5).face, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
			Transparency = tonumber(Transparency)
		}):Play()
	end
	
	wait(0.3)
	
end
local Highlight = nil
local CanEffect = true
local IsPlayerVisible = true

Tool.Activated:Connect(function()
	
	if not CanEffect then
		
		return
		
	end
	
	if Character:WaitForChild('Humanoid', 5).Health > 0 then
		
	else
		
		return
		
	end
	
	CanEffect = false
	
	Tool.Handle:WaitForChild('Activate'):Play()
	
	local EffectPart = Instance.new('Part', workspace)
	EffectPart.Name = 'ApperanceVFX'
	EffectPart.CanCollide = false
	EffectPart.Anchored = true
	EffectPart.Size = Vector3.new(4, 4, 4)
	EffectPart.Position = Character:WaitForChild('HumanoidRootPart', 5).Position
	EffectPart.Orientation = Character:WaitForChild('HumanoidRootPart', 5).Orientation
	EffectPart.Transparency = 1
	Debris:AddItem(EffectPart, 10)

	if IsPlayerVisible then
		
		IsPlayerVisible = not IsPlayerVisible
		
		Character:SetAttribute('Cloaking', true)
		
		Highlight = Instance.new('Highlight', Character)
		Highlight.FillColor = Color3.fromRGB(70, 50, 255)
		Highlight.FillTransparency = 1
		Highlight.OutlineColor = Color3.fromRGB(50, 40, 215)
		Highlight.OutlineTransparency = 1
		
		Tool.Handle:WaitForChild('Dissapear'):Play()
		
		spawn(function()
			
			local Grid = Particles:WaitForChild('Grid'):Clone()
			Grid.Parent = EffectPart
			Grid:Emit(15)

			local Lines = Particles:WaitForChild('Lines'):Clone()
			Lines.Parent = EffectPart
			Lines:Emit(15)
			
			TweenService:Create(Highlight, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {

				FillTransparency = 0.1,
				OutlineTransparency = 0.1

			}):Play()
			
		end)
		
		if Character:WaitForChild('Head', 5):FindFirstChild('HeadTag') then
			
			Character:WaitForChild('Head', 5).HeadTag.Enabled = false
			
		end
		SetCharacterTransparency(1)
		
	else
		
		IsPlayerVisible = not IsPlayerVisible
		
		Character:SetAttribute('Cloaking', false)
		
		Tool.Handle:WaitForChild('Appear'):Play()
		
		spawn(function()

			local Rings = Particles:WaitForChild('Rings'):Clone()
			Rings.Parent = EffectPart
			Rings:Emit(25)

			local Flare = Particles:WaitForChild('Flare'):Clone()
			Flare.Parent = EffectPart
			Flare:Emit(25)

			local Burst = Particles:WaitForChild('Burst'):Clone()
			Burst.Parent = EffectPart
			Burst:Emit(25)
			
			local HighlightTween = TweenService:Create(Highlight, TweenInfo.new(0.75, Enum.EasingStyle.Linear), {

				FillTransparency = 1,
				OutlineTransparency = 1

			})
			
			HighlightTween:Play()
			
			HighlightTween.Completed:Connect(function()
				
				Highlight:Destroy()
				
			end)

		end)
		
		if Character:WaitForChild('Head', 5):FindFirstChild('HeadTag') then

			Character:WaitForChild('Head', 5).HeadTag.Enabled = true

		end
		
		SetCharacterTransparency(0)
		
	end
	
	wait(1)

	CanEffect = true
	
end)
