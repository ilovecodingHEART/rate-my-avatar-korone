local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local popup_upvr = require(ReplicatedStorage:WaitForChild("popup"))

local AdminPopupEvent = ReplicatedStorage:WaitForChild("AdminPopupEvent")

AdminPopupEvent.OnClientEvent:Connect(function(popupType: string, message: string)
	popup_upvr(popupType, message)
end)