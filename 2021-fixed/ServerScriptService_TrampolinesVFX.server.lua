-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Remotes = game.ReplicatedStorage:WaitForChild("Slerp"):WaitForChild("RemoteEvents");
local TrampolineEffect = Remotes:WaitForChild("TrampolineEffects", 5);
TrampolineEffect.OnServerEvent:Connect(function(player, model)
	for _, players in pairs(game.Players:GetPlayers()) do
		if players.UserId ~= player.UserId then
			TrampolineEffect:FireClient(players, model);
		end;
	end;
end);