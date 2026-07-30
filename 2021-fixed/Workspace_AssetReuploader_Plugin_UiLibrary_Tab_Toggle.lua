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
local Toggle = {}

local Theme = require("../Theme")
local Tip = require("../Tip")

local asset = script.Parent.Parent.Assets.Toggle

local function DoToggle(self: Toggle)
    self.state = not self.state
    self._callback(self.state)

    local theme = Theme.get()
    local button = self.instance.Button
    button.BackgroundColor3 = self.state and theme.ToggleBackgroundColor or theme.UnselectedColor
    button.ImageTransparency = self.state and 0 or 1
end

local function AddTip(self: Toggle, tip: Tip.Tip)
    local tipFrame = tip.instance
    local toggleFrame = self.instance
    tipFrame.Position = UDim2.new(0, toggleFrame.TextLabel.TextBounds.X + 5, 0.5, 0)
    tipFrame.Parent = toggleFrame.TextLabel

    self._tip = tip
end

local function UpdateTheme(self: Toggle)
    local toggleFrame = self.instance
    Theme.updateFrame(toggleFrame)        
    Theme.updateText(toggleFrame.TextLabel, false)

    local theme = Theme.get()
    local button = toggleFrame.Button
    button.BorderColor3 = theme.BorderColor
    button.BackgroundColor3 = self.state and theme.ToggleBackgroundColor or theme.UnselectedColor
    button.ImageTransparency = self.state and 0 or 1
    button.Image = theme.ToggleImage

    if self._tip then 
        self._tip:UpdateTheme() 
    end
end

local function Destroy(self: Toggle)
    if self._tip then self._tip:Destroy() end
    self.instance:Destroy()

    __2021_clear(self :: any)
end

export type Toggle = {
    _tip: Tip.Tip?,
    _callback: (state: boolean) -> (),

    state: boolean,
    instance: typeof(asset),

    Toggle: typeof(DoToggle),
    AddTip: typeof(AddTip),
    UpdateTheme: typeof(UpdateTheme),
    Destroy: typeof(Destroy),
}

function Toggle.new(parent: GuiObject, text: string, callback: (state: boolean) -> (), defaultState: boolean?): Toggle
    local instance = asset:Clone()
    instance.TextLabel.Text = text

    local self: Toggle; self = {
        _callback = callback,

        state = false,
        instance = instance,

        Toggle = DoToggle,
        AddTip = AddTip,
        UpdateTheme = UpdateTheme,
        Destroy = Destroy,
    } :: Toggle

    instance.Button.MouseButton1Down:Connect(function()
        self:Toggle()
    end)

    self:UpdateTheme()
    if defaultState then
        self:Toggle()
    end

    instance.Parent = parent
    
    return self
end

return Toggle