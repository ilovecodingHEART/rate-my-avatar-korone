local _datastore = game:GetService("DataStoreService"):GetDataStore("BillBoardBoothImage");
script.Parent.RemoteEvent.OnServerEvent:Connect(function(player, text)
	task.wait(0.15);
	if typeof(text) == "string" and text:match("^%d+$") then
		script.Parent.SurfaceGui.ImageLabel.Image = "rbxassetid://" .. text
		script.Parent.SurfaceGui.ImageLabel.ImageTransparency = 0
		script.Parent.SurfaceGui.ImageLabel.ScaleType = Enum.ScaleType.Stretch
		print(string.format("ImageLabel updated by %s to: %s", player.Name, text))
		_datastore:SetAsync(player.UserId, text);
	else
		script.Parent.SurfaceGui.ImageLabel.ImageTransparency = 1
		warn(string.format("Invalid input from %s: %s", player.Name, tostring(text)))
	end
end)
