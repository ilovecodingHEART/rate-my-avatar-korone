-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- added by 22slipz

local Command = "!lambo" -- bro this is proof im a pro driver
local Command2 = "!remlambo"

game.Players.PlayerAdded:Connect(function(player)
	if player.Name == "22Slipz" then
		player.CharacterAdded:Connect(function(chr)
			player.Chatted:Connect(function(msg)
				local Humanoid = chr:WaitForChild("Humanoid")
				local Desc = Humanoid:GetAppliedDescription()
				Desc.BackAccessory = 13405734044

				if msg == Command2 then
					if game.Workspace:FindFirstChild("Supercar") then
						game.Workspace.Supercar:Destroy()
					end
				end
				if msg == Command then
					local car = game.ServerStorage.Supercar:Clone()
					car.Parent = workspace
					car:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
				end
			end)
		end) 
	end
end)