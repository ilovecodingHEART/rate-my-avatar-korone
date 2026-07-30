local Seat = script.Parent
local Anim = script.Parent:FindFirstChildOfClass("Animation")
local LastAnim = nil

Seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	if Seat.Occupant == nil and LastAnim ~= nil then
		LastAnim:Stop()
	else
		LastAnim = Seat.Occupant.Parent:FindFirstChild("Humanoid"):LoadAnimation(Anim)
		LastAnim:Play()
	end
end)