-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- fix soon
-- todo
-- make shade not show up when Shutdown is set to visible.
-- when u click a icon in the left make shutdown not go away.

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local function AddUI(pl)
	pl.PlayerGui.ScreenGui.Shutdown.Visible = true;
end

if (game.PrivateServerId == "" and game.VIPServerId ~= "" and game.VIPServerOwnerId == 0) then
	local m = Instance.new("Message")
	m.Text = "Rebooting servers for update.."
	m.Parent = workspace
	
	local waitTime = 5

	Players.PlayerAdded:connect(function(player)
		wait(waitTime)
		waitTime = waitTime / 2
		TeleportService:Teleport(game.PlaceId, player)
	end)
	
	for _,player in pairs(Players:GetPlayers()) do
		TeleportService:Teleport(game.PlaceId, player)
		wait(waitTime)
		waitTime = waitTime / 2
	end
else
	game:BindToClose(function()
		local con
		if (#Players:GetPlayers() == 0) then
			return
		end
		if (game:GetService("RunService"):IsStudio()) then
			return
		end
		for i,v in pairs(game.Players:GetChildren()) do
			AddUI(v)
		end
		con = Players.PlayerAdded:connect(function(v)
			wait(1)
			AddUI(v)
		end)
		wait(15) 
		con:Disconnect()
		local m = Instance.new("Message")
		m.Text = "Rebooting servers for update..."
		m.Parent = workspace
		wait(2)
		local reservedServerCode = TeleportService:ReserveServer(game.PlaceId)
		
		for _,player in pairs(Players:GetPlayers()) do
			TeleportService:TeleportToPrivateServer(game.PlaceId, reservedServerCode, { player })
		end
		Players.PlayerAdded:connect(function(player)
			TeleportService:TeleportToPrivateServer(game.PlaceId, reservedServerCode, { player })
		end)
		while (#Players:GetPlayers() > 0) do
			wait(1)
		end	
	end)
end