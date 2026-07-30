-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- by 22slipz

local Players = game:GetService("Players")

local IsPrivateServer = game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0


local ServerLocked = false

local function Owner(player)
	return IsPrivateServer and player.UserId == game.PrivateServerOwnerId
end

local function onPlayerAdded(player)
	
	if ServerLocked then
		player:Kick("The server is currently locked.")
		return
	end
	
	player.Chatted:Connect(function(message)
		
		if not Owner(player) then return end
		
		local msg = string.lower(message)
		
		if msg == "!serverlock on" then
			ServerLocked = true
			
		elseif msg == "!serverlock off" then
			ServerLocked = false
		end
	end)
end

for _, player in pairs(Players:GetPlayers()) do
	
	player.Chatted:Coonnect(function(message)
		if not Owner(player) then return end
		local msg = string.lower(message)
		
		if msg == "!serverlock on" then
			ServerLocked = true
			
		elseif msg == "!serverlock off" then
			ServerLocked = false
		end
	end)

end

Players.PlayerAdded:Connect(onPlayerAdded)