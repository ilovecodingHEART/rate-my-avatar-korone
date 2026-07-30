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
local Tip = {}

local Theme = require("./Theme")

local assets = script.Parent.Assets
local tipBarAsset = assets.MainFrame.Tip

type TipBarAsset = typeof(tipBarAsset)

local function UpdateTheme(self: Tip)
    local theme = Theme.get()
    self.instance.ImageColor3 = theme.TipColor
    self.instance.Image = theme.TipImage
end

local function Destroy(self: Tip)
    self.instance:Destroy()
    __2021_clear(self :: any)
end

export type Tip = {
    _tipBar: TipBarAsset,

    instance: ImageButton,

    UpdateTheme: typeof(UpdateTheme),
    Destroy: typeof(Destroy)
}

local function newTipButton(): ImageButton
    local button = Instance.new("ImageButton")
    button.AnchorPoint = Vector2.new(0, 0.5)
    button.BackgroundTransparency = 1
    button.Size = UDim2.fromOffset(15, 15)
    button.ZIndex = 2
    button.ImageTransparency = 0.5

    return button
end

function Tip.new(tipBar: TipBarAsset, text: string): Tip
    local instance = newTipButton()

    instance.MouseEnter:Connect(function()
        instance.ImageTransparency = 0
        tipBar.Frame.TipText.Text = text
        tipBar.Visible = true
    end)

    instance.MouseLeave:Connect(function()
        instance.ImageTransparency = 0.5
        tipBar.Visible = false
    end)

    local self: Tip = {
        _tipBar = tipBar,

        instance = instance,

        UpdateTheme = UpdateTheme,
        Destroy = Destroy,
    }
    self:UpdateTheme()
    return self
end

return Tip