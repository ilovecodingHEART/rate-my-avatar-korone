local Players = game:GetService("Players")

local player = Players.LocalPlayer

player.Chatted:Connect(function(message)
	if string.lower(message) == "!tutorial" then
		local playerGui = player:WaitForChild("PlayerGui")
		local screenGui = playerGui:WaitForChild("ScreenGui")
		local Guis = screenGui:WaitForChild("TutorialA")
		Guis.Visible = not Guis.Visible
	end
end)