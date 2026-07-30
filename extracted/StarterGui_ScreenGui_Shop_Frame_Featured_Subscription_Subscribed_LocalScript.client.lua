-- fixed

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"))

local Subscribed = script.Parent
Subscribed.Visible = false

local isVip = Remotes.Function("AmIVip"):InvokeServer()

if isVip then
	Subscribed.Visible = true
end