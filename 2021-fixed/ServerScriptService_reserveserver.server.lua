-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local MessagingService = game:GetService("MessagingService")
local ReservedServerCodeStore = DataStoreService:GetDataStore("ReservedServerCodeStore")
local ServerCodes = {}
local VIPPlayer = {}
local Remotes = require(game.ReplicatedStorage.Remotes)
local AdminResponse = Remotes.Event("AdminCommandResponse");
local function ReserveServer(player)
	local success, ServerCode = pcall(function()
		return TeleportService:ReserveServer(game.PlaceId)
	end)
	if success then
		ServerCodes[ServerCode] = player.UserId
		local saveSuccess, saveError = pcall(function()
			ReservedServerCodeStore:SetAsync(player.UserId, ServerCode)
		end)

		if not saveSuccess then
			warn("Failed to save server code:", saveError)
		end

		local TeleportData = {
			["ReservedServerCode"] = ServerCode
		}
		TeleportService:TeleportToPrivateServer(game.PlaceId, ServerCode, {player}, nil, TeleportData)
		AdminResponse:FireClient(player, ("Your reserved server was created! %s"):format(ServerCode));
	else
		warn("Failed to reserve server:", ServerCode)
	end
end
local function JoinReservedServer(player, code)
	if ServerCodes[code] then
		local TeleportData = {
			ReservedServerCode = code
		}
		TeleportService:TeleportToPrivateServer(game.PlaceId, code, {player}, nil, TeleportData)
	else
		print("Invalid server code")
	end
end
Players.PlayerAdded:Connect(function(player)
	local success, ServerCode = pcall(function()
		return ReservedServerCodeStore:GetAsync(player.UserId)
	end)
	local _datastore = DataStoreService:GetDataStore("PlayerVIPV2");
	if _datastore:GetAsync(player.UserId) then
		VIPPlayer[player.UserId] = true;
	end;
	if success and ServerCode then
		workspace:SetAttribute("ReservedServerCode", ServerCode)
	else
		warn("No reserved server code found.")
	end
	player.Chatted:Connect(function(message)
		if message:lower() == "!reserveserver" then
			if VIPPlayer[player.UserId] then
				ReserveServer(player)
			end;
		elseif message:match("^!joinserver%s+(%S+)$") then
			local code = message:match("^!joinserver%s+(%S+)$")
			JoinReservedServer(player, code)
		end
	end)
end)
Remotes.Event("SummonUserToServer").OnServerEvent:Connect(function(admin, targetUserId)
	local success, serverCode = pcall(function()
		return ReservedServerCodeStore:GetAsync(admin.UserId)
	end)
	print(targetUserId)
	if success and serverCode then
		MessagingService:PublishAsync("SummonPlayerToServer", {
			['targetUserId'] = targetUserId,
			['serverCode'] = serverCode
		});
	else
		warn("No reserved server code found for user:", targetUserId)
	end
end)
MessagingService:SubscribeAsync("SummonPlayerToServer", function(message)
	local targetUserId = message.Data['targetUserId'];
	local serverCode = message.Data['serverCode'];
	local targetPlayer = Players:GetPlayerByUserId(targetUserId);
	if targetPlayer then
		TeleportService:TeleportToPrivateServer(game.PlaceId, serverCode, {targetPlayer}, nil, nil);
	end;
end);
Players.PlayerAdded:Connect(function(player: plr)
	player.Chatted:Connect(function(msg: message)
		if msg:match("^!summon%s+(%S+)$") then
			local code = msg:match("^!summon%s+(%S+)$");
			local GetPlayer = Players:GetUserIdFromNameAsync(code);
			if GetPlayer then
				local success, serverCode = pcall(function()
					return ReservedServerCodeStore:GetAsync(player.UserId);
				end);
				print(code);
				if success and serverCode then
					MessagingService:PublishAsync("SummonPlayerToServer", {
						['targetUserId'] = GetPlayer,
						['serverCode'] = serverCode
					});
				else
					warn("No reserved server code found for user:", GetPlayer);
				end
			else
				warn("your so cooked buddy");
			end;
		end;
	end);
end);
