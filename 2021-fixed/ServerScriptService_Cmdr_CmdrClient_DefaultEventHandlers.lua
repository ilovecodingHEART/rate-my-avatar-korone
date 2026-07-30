-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local StarterGui = game:GetService("StarterGui")
local Window = require(script.Parent.CmdrInterface.Window)

return function (Cmdr)
	Cmdr:HandleEvent("Message", function (text)
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = ("[Announcement] %s"):format(text);
			Color = Color3.fromRGB(249, 217, 56);
		})
	end)

	Cmdr:HandleEvent("AddLine", function (...)
		Window:AddLine(...)
	end)
end