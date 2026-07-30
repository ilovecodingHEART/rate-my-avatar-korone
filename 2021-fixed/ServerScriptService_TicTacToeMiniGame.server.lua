-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x1
-- no manual fixes needed; paste as-is.
-- ============================================================
-- fixed a few bugs - 22slipz

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local MinigamesUtil = require(ReplicatedStorage:WaitForChild("Slerp"):WaitForChild("Shared"):WaitForChild("MinigamesUtil"))
local TicTacToe = require(ReplicatedStorage:WaitForChild("Slerp"):WaitForChild("Shared"):WaitForChild("MinigamesUtil")).TicTacToe
local TicTacToeEvent = ReplicatedStorage:WaitForChild("Slerp"):WaitForChild("RemoteEvents"):WaitForChild("TicTacToeEvent")

local ActiveGames = {}

local MOVE_TIMEOUT = 30
local REMATCH_TIMEOUT = 15
local DEFAULT_MESSAGE = "Waiting for players"

local function updateGameMessage(board: Instance, message: string)
	board:SetAttribute("GameMessage", message)
end

local function updateGameData(board, gameData)
	board:SetAttribute("GameData", TicTacToe.EncodeGameData(gameData))
end

-------------------------------------------------
-- Function: getPlayerFromUserID
-- Gets a player from their UserId.
-- @param userID (number): The userID of the player.
-- @return (Player): The player
-------------------------------------------------
local function getPlayerFromUserID(userID)
	return Players:GetPlayerByUserId(userID)
end

-------------------------------------------------
-- Function: cleanupGame
-- Cleans up the board and gets ready for the other players
-- @param board (Instance): The board model.
-------------------------------------------------
local function cleanupGame(board)
	local gameState = ActiveGames[board]
	if gameState then
		if gameState.moveTimer then
			task.cancel(gameState.moveTimer)
		end
		if gameState.rematchTimer then
			task.cancel(gameState.rematchTimer)
		end
		ActiveGames[board] = nil
	end

	local player1 = getPlayerFromUserID(board:GetAttribute("Player1"))
	local player2 = getPlayerFromUserID(board:GetAttribute("Player2"))
	for _, plr in pairs({player1, player2}) do
		if plr and plr.Character then
			local root = plr.Character:FindFirstChild("HumanoidRootPart")
			if root then
				root.Anchored = false
			end
			
			local lastPos = plr.Character:GetAttribute("LastPosition")
			if lastPos then
				root.CFrame = lastPos
				plr.Character:SetAttribute("LastPosition", nil)
			end
		end
	end
	board:SetAttribute("Player1", nil)
	board:SetAttribute("Player2", nil)
	board:SetAttribute("ActivePlayer", nil)
	updateGameData(board, TicTacToe.BlankData)
	updateGameMessage(board, DEFAULT_MESSAGE)
end

-------------------------------------------------
-- Function: checkWinCondition
-- Evaluates the results of all moves.
-- @param gameData (custom GameState): The game data with the players moves.
-- @return (number, {[number]} | number | boolean)
-------------------------------------------------
local function checkWinCondition(gameData)
	return MinigamesUtil.TicTacToe.EvaluateResults(gameData)
end

-------------------------------------------------
-- Function: startMoveTimer
-- Starts the move timer, if player doesnt choose in 10 seconds, the game ends.
-- @param board (Instance): The board model.
-------------------------------------------------
local function startMoveTimer(board)
	local gameState = ActiveGames[board]
	if gameState.moveTimer then
		task.cancel(gameState.moveTimer)
	end

	local timeLeft = MOVE_TIMEOUT
	gameState.moveTimer = task.spawn(function()
		while timeLeft > 0 and ActiveGames[board] == gameState do
			if timeLeft <= 10 then
				updateGameMessage(board, string.format("%s's turn (%d)", 
					getPlayerFromUserID(board:GetAttribute("ActivePlayer")).DisplayName,
					timeLeft))
			end
			task.wait(1)
			timeLeft = timeLeft - (1); --[[ 2021: was compound assignment ]]
		end

		if ActiveGames[board] == gameState then
			TicTacToeEvent:FireAllClients("EndGame", board, false)
			cleanupGame(board)
		end
	end)
end

-------------------------------------------------
-- Function: findMissingNumber
-- Read the function.
-- @param tbl ({[number]})
-- @return (number): The missing number.
-------------------------------------------------
local function findMissingNumber(tbl)
	local lookup = {}
	for _, v in ipairs(tbl) do
		lookup[v] = true
	end

	local position = 0
	local missingNum = 0

	for i = 1, #tbl do
		if tbl[i] == 0 then
			position = i
			break
		end
	end

	return position, tbl[position]
end

-------------------------------------------------
-- Function: handleGameMove
-- Read the function.
-- @param player (Player): The player that placed the move.
-- @param board (Instance): The model of the board.
-- @param move (number): The number of the move.
-------------------------------------------------
local function handleGameMove(player, board, move)
	local gameState = ActiveGames[board]
	if not gameState then return end

	local playerID = player.UserId
	if board:GetAttribute("ActivePlayer") ~= playerID then return end

	if move < 1 or move > 9 or gameState.gameData[move] ~= 0 then return end

	local playerSymbol = playerID == board:GetAttribute("Player1") and 1 or 2
	gameState.gameData[move] = playerSymbol
	updateGameData(board, gameState.gameData)

	local winner, winningLine = checkWinCondition(gameState.gameData)
	if winner then
		winner = winner == 0 and 0 or 1
		local lastMove = move
		local playerSymbol = winner

		TicTacToeEvent:FireAllClients("RematchGame", board, findMissingNumber(gameState.gameData) or nil, playerSymbol, winner, winningLine)

		gameState.rematchTimer = task.spawn(function()
			task.wait(REMATCH_TIMEOUT)
			if ActiveGames[board] == gameState then
				TicTacToeEvent:FireAllClients("EndGame", board, false)
				cleanupGame(board)
			end
		end)
		return
	end

	MinigamesUtil.TicTacToe.UpdateGameStatus(board)

	startMoveTimer(board)
end

-------------------------------------------------
-- Function: handleRematch
-- Read the function.
-- @param player (Player): The player that placed the move.
-- @param board (Instance): The model of the board.
-- @param wantsRematch (boolean): Does the player want a rematch?
-------------------------------------------------
local function handleRematch(player, board, wantsRematch)
	local gameState = ActiveGames[board]
	if not gameState then return end

	local playerID = player.UserId
	if playerID ~= board:GetAttribute("Player1") and playerID ~= board:GetAttribute("Player2") then
		return
	end

	if wantsRematch then
		if not gameState.rematchVotes then
			gameState.rematchVotes = {}
		end
		gameState.rematchVotes[playerID] = true

		local player1Voted = gameState.rematchVotes[board:GetAttribute("Player1")]
		local player2Voted = gameState.rematchVotes[board:GetAttribute("Player2")]

		if player1Voted and player2Voted then
			gameState.gameData = table.create(9, 0)
			gameState.rematchVotes = nil
			if gameState.rematchTimer then
				task.cancel(gameState.rematchTimer)
				gameState.rematchTimer = nil
			end



			updateGameData(board, gameState.gameData)
			MinigamesUtil.TicTacToe.UpdateGameStatus(board)

			TicTacToeEvent:FireAllClients("EndGame", board, true)
			startMoveTimer(board)
		end
	else
		TicTacToeEvent:FireAllClients("EndGame", board, false)
		cleanupGame(board)
	end
end

local function handlePlayerJoin(player, board, position)
	local playerID = player.UserId

	if position ~= 1 and position ~= 2 then return end

	local positionAttr = "Player" .. position
	if board:GetAttribute(positionAttr) then return end

	board.RaycastBoard.Prompts:FindFirstChild(position).PlayTicTacToe.Enabled = false
	board:SetAttribute(positionAttr, playerID)
	player.Character:SetAttribute("LastPosition", player.Character.HumanoidRootPart.CFrame)
	player.Character.HumanoidRootPart.CFrame = board.RaycastBoard.PlayerPositions:FindFirstChild(position).WorldCFrame
	player.Character.HumanoidRootPart.Anchored = true
	local Humanoid = player.Character.Humanoid
	local animator = Humanoid.Animator;
	local humanoidAnimation = Instance.new("Animation")
	humanoidAnimation.AnimationId = "rbxassetid://15333527300";
	local anim = animator:LoadAnimation(humanoidAnimation)

	anim.Looped = true;
	anim:Play();

	if not ActiveGames[board] then
		ActiveGames[board] = {
			gameData = table.create(9, 0)
		}
		board:SetAttribute(positionAttr, playerID)
		updateGameMessage(board, "Waiting for an opponent")
		return
	end

	MinigamesUtil.TicTacToe.UpdateGameStatus(board)
	startMoveTimer(board) -- 15333527300
end

local function handlePlayerLeave(player, board)
	local playerID = player.UserId
	if playerID ~= board:GetAttribute("Player1") and playerID ~= board:GetAttribute("Player2") then
		return
	end

	local position = 0;
	if board:GetAttribute("Player1") == playerID then
		position = 1
	else
		position = 2
	end

	board.RaycastBoard.Prompts:FindFirstChild(position).PlayTicTacToe.Enabled = true
	player.Character.HumanoidRootPart.CFrame = player.Character:GetAttribute("LastPosition")
	player.Character:SetAttribute("LastPosition", nil)
	player.Character.HumanoidRootPart.Anchored = false
	local Humanoid = player.Character.Humanoid
	local animator = Humanoid.Animator;
	for _, animation in pairs(animator:GetPlayingAnimationTracks()) do
		animation:Stop();
	end

	TicTacToeEvent:FireAllClients("LeaveGame", board, player)
	cleanupGame(board)
end

Players.PlayerRemoving:Connect(function(player)
	for board, gameState in pairs(ActiveGames) --[[ 2021 ]] do
		if player.UserId == board:GetAttribute("Player1") or 
			player.UserId == board:GetAttribute("Player2") then
			TicTacToeEvent:FireAllClients("LeaveGame", board, player)
			cleanupGame(board)
		end
	end
end)

TicTacToeEvent.OnServerEvent:Connect(function(player, board, action)
	if action.Join then
		handlePlayerJoin(player, board, action.Join)
	elseif action.Move then
		handleGameMove(player, board, action.Move)
	elseif action.Leave then
		handlePlayerLeave(player, board)
	elseif action.Rematch ~= nil then
		handleRematch(player, board, action.Rematch)
	end
end)

for _, board in CollectionService:GetTagged("TicTacToe") do
	updateGameMessage(board, DEFAULT_MESSAGE)
	updateGameData(board, TicTacToe.BlankData)
end