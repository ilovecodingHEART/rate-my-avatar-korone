-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_clear
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.clear on this client (2022 API); equivalent for plain tables
local function __2021_clear(vt)
	for k in pairs(vt) do vt[k] = nil end
end
--!strict
local Button = {}

local Theme = require("../Theme")

local asset = script.Parent.Parent.Assets.Button

local function ColorSelected(self: Button)
	local theme = Theme.get()
	local instance = self.instance
	instance.BackgroundColor3 = theme.SelectedColor
end

local function ColorUnselected(self: Button)
	local theme = Theme.get()
	local instance = self.instance
	instance.BackgroundColor3 = theme.UnselectedColor
end

local function UpdateTheme(self: Button)
    Theme.updateText(self.instance, true)

    local theme = Theme.get()
    self.instance.BackgroundColor3 = theme.UnselectedColor
end

local function Destroy(self: Button)
    self.instance:Destroy()
    
	__2021_clear(self :: { any })
end

export type Button = {
	instance: typeof(asset),

	ColorSelected: typeof(ColorSelected),
	ColorUnselected: typeof(ColorUnselected),
    UpdateTheme: typeof(UpdateTheme),
	Destroy: typeof(Destroy),
}

function Button.new(parent: GuiObject, text: string, callback: () -> (), autoColor: boolean?): Button
    local instance = asset:Clone()
    instance.Text = text

	local self: Button = {
		instance = instance,

		ColorSelected = ColorSelected,
		ColorUnselected = ColorUnselected,
        UpdateTheme = UpdateTheme,
		Destroy = Destroy,
	}

	if autoColor == nil then
		autoColor = true
	end

	instance.MouseButton1Down:Connect(function()
		if autoColor then self:ColorSelected() end
		callback()
	end)

	if autoColor then
		local function colorUnselected()
			self:ColorUnselected()
		end

		instance.MouseButton1Up:Connect(colorUnselected)
		instance.MouseLeave:Connect(colorUnselected)
	end

    self:UpdateTheme()
    instance.Parent = parent

	return self
end

return Button
