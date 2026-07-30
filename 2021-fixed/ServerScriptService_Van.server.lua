-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- pls donate van script 1-1 (added by 22slipz)

local _cmd1 = "!van"
local _cmd2 = "!rvan"

local playerVans = {}

game.Players.PlayerAdded:Connect(function(player)
	if player:GetRankInGroup(125814458) >= 254 then
		player.CharacterAdded:Connect(function(chr)
			player.Chatted:Connect(function(msg)
				local Humanoid = chr:WaitForChild("Humanoid")
				local Desc = Humanoid:GetAppliedDescription()
				Desc.BackAccessory = 13405734044  

				if msg == _cmd2 then
					local existingVan = playerVans[player]
					if existingVan then
						existingVan:Destroy()
						playerVans[player] = nil
					end
				end

				if msg == _cmd1 then
					local existingVan = playerVans[player]
					if existingVan then
						existingVan:Destroy()
					end

					local randomVanName = "Van"..math.random(1, 3)
					local selectedVan = game.ServerStorage:FindFirstChild(randomVanName)

					if selectedVan then
						local clonedVan = selectedVan:Clone()
						clonedVan.Name = randomVanName
						clonedVan.Parent = workspace
						clonedVan:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame)
						playerVans[player] = clonedVan
					else
						warn("No van with the name " .. randomVanName .. " exists in ServerStorage")
					end
				end
			end)
		end)

		player.AncestryChanged:Connect(function(_, parent)
			if not parent then
				local existingVan = playerVans[player]
				if existingVan then
					existingVan:Destroy()
					playerVans[player] = nil
				end
			end
		end)
	end
end)