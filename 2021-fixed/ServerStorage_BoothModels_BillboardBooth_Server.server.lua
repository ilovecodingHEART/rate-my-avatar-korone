-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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
