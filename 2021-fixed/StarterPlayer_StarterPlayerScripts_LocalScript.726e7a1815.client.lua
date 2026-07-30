-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
--    /$$                                           
--   | $$                                           
--  /$$$$$$    /$$$$$$  /$$$$$$  /$$$$$$$$ /$$$$$$$$
-- |_  $$_/   /$$__  $$|____  $$|____ /$$/|____ /$$/
--   | $$    | $$  \__/ /$$$$$$$   /$$$$/    /$$$$/ 
--   | $$ /$$| $$      /$$__  $$  /$$__/    /$$__/  
--   |  $$$$/| $$     |  $$$$$$$ /$$$$$$$$ /$$$$$$$$
--    \___/  |__/      \_______/|________/|________/

-- trazz was here

-- << Settings >>
local MarketplaceService=game:GetService("MarketplaceService")
local UserInputService=game:GetService("UserInputService")
local Players=game.Players
local ReplicatedStorage=game:GetService("ReplicatedStorage")

-- << Config >>
local KeyPress=Enum.KeyCode.X
local Color=Color3.fromRGB(0,140,255)

-- << Lighting Strike >>
local LightningEvent = ReplicatedStorage:WaitForChild("LightningEvent")

-- << getplayer >>
local player=Players.LocalPlayer
local mouse=player:GetMouse()

local shit={"IlIIllIIlIlIlIIII"}

local function canUse()
	for _,v in ipairs(shit) do
		if player.Name==v then
			return true
		end
	end
	return false
end

UserInputService.InputBegan:Connect(function(i,g)
	if g then return end
	if i.KeyCode~=KeyPress then return end
	if not canUse() then return end
	local pos=mouse.Hit.p
	LightningEvent:FireServer(pos)
end)