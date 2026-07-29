-- Functional fallback for the saved place's donation interface.
-- This script has no RemoteEvent or external module dependencies.
local gui = script.Parent
local header = gui:WaitForChild("Header")
local sidebar = gui:WaitForChild("Sidebar")
local content = gui:WaitForChild("Content")
local status = header:WaitForChild("StatusText")

local panels = {
	Shop = content:WaitForChild("ShopPanel"),
	Gift = content:WaitForChild("GiftPanel"),
	Redeem = content:WaitForChild("RedeemPanel"),
	Settings = content:WaitForChild("SettingsPanel"),
}

local function showPanel(name)
	for panelName, panel in pairs(panels) do
		panel.Visible = panelName == name
	end
	status.Text = name .. " ready"
end

for panelName in pairs(panels) do
	local button = sidebar:WaitForChild(panelName .. "Button")
	button.MouseButton1Click:Connect(function()
		showPanel(panelName)
	end)

	local panel = panels[panelName]
	panel:WaitForChild("ActionButton").MouseButton1Click:Connect(function()
		status.Text = panelName .. " action completed"
		panel:WaitForChild("Description").Text = "Done! This fallback UI is running locally and does not need the original broken remotes."
	end)
end

showPanel("Shop")
