local Remotes = game.ReplicatedStorage:WaitForChild("Slerp"):WaitForChild("RemoteEvents");
local TrampolineEffect = Remotes:WaitForChild("TrampolineEffects", 5);
TrampolineEffect.OnServerEvent:Connect(function(player, model)
	for _, players in pairs(game.Players:GetPlayers()) do
		if players.UserId ~= player.UserId then
			TrampolineEffect:FireClient(players, model);
		end;
	end;
end);