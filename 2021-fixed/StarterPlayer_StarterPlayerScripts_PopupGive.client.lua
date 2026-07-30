-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local popup_upvr = require(ReplicatedStorage:WaitForChild("popup"))

local AdminPopupEvent = ReplicatedStorage:WaitForChild("AdminPopupEvent")

AdminPopupEvent.OnClientEvent:Connect(function(popupType: string, message: string)
	popup_upvr(popupType, message)
end)