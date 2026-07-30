-- by 22slipz

local Owners = {"22Slipz", "IlIIllIIlIlIlIIII", "StrawhatDevelopment"}

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if table.find(Owners, plr.Name) then
			if string.find(msg, "!gun") then
				local tool = game.ServerStorage.PlayerTools.Raygun:Clone()
				tool.Parent = plr.Backpack
			end
		end
	end);
end);