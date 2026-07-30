-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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