local vehicleSeat = script.Parent

-- Function to check if a player is sitting on the vehicle seat
local function checkPlayerSitting()
	local occupant = vehicleSeat.Occupant

	if occupant then
		local character = occupant.Parent
		if character and character:IsA("Model") then
			local player = game.Players:GetPlayerFromCharacter(character)
			if player then
				print(player.Name .. " is sitting on the vehicle seat.")
				-- Add any other actions to take when the player is sitting
			end
		end
	else
		print("No player is sitting on the vehicle seat.")
		-- Add any other actions to take when the seat is empty
	end
end

-- Call the function to check the status
checkPlayerSitting()

-- Optionally, you can connect the function to the `Changed` event of the seat to check in real-time
vehicleSeat.Changed:Connect(checkPlayerSitting)
