--    /$$                                           
--   | $$                                           
--  /$$$$$$    /$$$$$$  /$$$$$$  /$$$$$$$$ /$$$$$$$$
-- |_  $$_/   /$$__  $$|____  $$|____ /$$/|____ /$$/
--   | $$    | $$  \__/ /$$$$$$$   /$$$$/    /$$$$/ 
--   | $$ /$$| $$      /$$__  $$  /$$__/    /$$__/  
--   |  $$$$/| $$     |  $$$$$$$ /$$$$$$$$ /$$$$$$$$
--    \___/  |__/      \_______/|________/|________/

-- trazz was here

-- gg trazz
-- << Settings >>
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Module=require(game.ReplicatedStorage.Modules.SummonLighting)
local LightningEvent = ReplicatedStorage:WaitForChild("LightningEvent")

-- << Config >>
local Color=Color3.fromRGB(0,140,255)

-- << Main Code >>
LightningEvent.OnServerEvent:Connect(function(player,pos)
	local start=Vector3.new(pos.X,300,pos.Z)
	Module.SummonLightning(start,pos,Color,Vector2.new(0,30),1.2,12,0.2,0.5)
	local s=Instance.new("Sound")
	s.SoundId="rbxassetid://821439273"
	s.RollOffMode=Enum.RollOffMode.Inverse
	s.RollOffMinDistance=100
	s.RollOffMaxDistance=100000
	s.Volume=1
	s.Parent=workspace
	s:Play()
	s.Ended:Once(function() s:Destroy() end)
end)