-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Debris = game:GetService('Debris')
local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')
local ServerStorage = game:GetService('ServerStorage')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Tool = script.Parent

local Character

if Tool.Parent:IsA('Model') then

	Character = Tool.Parent

elseif Tool.Parent.Name == 'Backpack' then

	Character = Players:WaitForChild(Tool.Parent.Parent.Name).Character

end

local Highlight = nil
local CanEffect = true

local Names = {'Tom', 'Jerry', 'Alex', 'Julia', 'Soul', 'GamerXd14', 'Mat', 'bone', 'Adamnxjvx', 'CR7', 'CHICKEN', 'Sakura', 'Zoe', 'Adam', 'David', 'Noa', 'Diego12', 'avaXD', 'Patrick573', 'xui', 'BestiGamer976', 'Drucifer1001', 'zeke', 'Rip_Tomoika', 'SACRAXP', 'loki20400', 'newplayer8', 'DIAMONCR', 'Zerbian2001', 'LegendaryAdrian8', 'bruder1875', 'Daniel_1CJ', 'gabo_544', 'DragonX5454', 'Starry56', '1Lucas425', 'Flyo_X', 'sZentus75', 'isad424zo', 'yitoi2023', 'WOIKERU21', 'kaaan_zrve', 'Zeeerde20048', 'VenomBenny54', 'alextheking', 'cute_84542', 'CDO_JAYSAO1', 'scortty1423', 'Nicesnonwm', 'llostq'}
local UserIds = {3658147490, 4128664944, 2850961688, 4228612849, 3402727183, 2863669231, 2570345384, 2869061433, 2857978532, 2730499207, 2486683992, 2913460633, 2313602030, 2914589963, 2800229452, 2991906980, 2691934958, 2710207392, 4289370306, 3705707750, 3146043823, 1946217098, 1946217098, 4312065813, 4298590768, 3017020490, 1854631573, 3386578646, 3342522963, 2457282853, 2368706187, 3094569776, 3070363495, 3277892653, 3625002992, 3605493011, 3635100725, 3153720322, 379928116, 637959014, 447993080, 474532027, 482852002, 498629215}

Tool.Activated:Connect(function()

	if not CanEffect then

		return

	end

	if Character:WaitForChild('Humanoid', 5).Health > 0 and not Character:GetAttribute('Cloaking') then

	else

		return

	end

	CanEffect = false

	local RandomId = UserIds[math.random(1, #UserIds)]

	Tool.Handle:WaitForChild('Activate'):Play()

	Highlight = Instance.new('Highlight', Character)
	Highlight.FillColor = Color3.fromRGB(255, 255, 255)
	Highlight.FillTransparency = 1
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.OutlineTransparency = 1

	spawn(function()

		TweenService:Create(Highlight, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {

			FillTransparency = 0,
			OutlineTransparency = 0

		}):Play()

	end)

	Character:WaitForChild('Head', 5):FindFirstChild('HeadTag'):Destroy()

	local HeadTag = game.ServerStorage:WaitForChild('HeadTag'):Clone()
	local NewTool = ServerStorage.Tools:WaitForChild('DisguiseTool', 10):Clone()

	Character:WaitForChild('Humanoid', 5):ApplyDescription(Players:GetHumanoidDescriptionFromUserId(RandomId))

	wait(0.25)

	spawn(function()

		local HighlightTween = TweenService:Create(Highlight, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {

			FillTransparency = 1,
			OutlineTransparency = 1

		})

		HighlightTween:Play()

		HighlightTween.Completed:Connect(function()

			HeadTag.Parent = Character:WaitForChild('Head', 5)
			HeadTag.Display.Text = Names[math.random(1, #Names)]

			Tool.Parent = Players:WaitForChild(Character.Name)

			NewTool.Parent = Character

			Highlight:Destroy()
			Tool:Destroy()

			wait(1)

			CanEffect = true

		end)

	end)

end)