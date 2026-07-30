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
local Label = {}

local Theme = require("../Theme")

local assets = script.Parent.Parent.Assets
local buttonAsset = assets.Button
local asset = assets.List

local function ChangeText(self: Label, newText: string)
    self.instance.Text = newText
end

local function UpdateTheme(self: Label)
    Theme.updateText(self.instance, true)
end

local function Destroy(self: Label)
    self.instance:Destroy()

    __2021_clear(self :: any)
end

export type Label = {
    instance: typeof(buttonAsset),
    
    ChangeText: typeof(ChangeText),
    UpdateTheme: typeof(UpdateTheme),
    Destroy: typeof(Destroy),
}

function Label.new(parent: typeof(asset), text: string): Label
    local instance = buttonAsset:Clone()
    instance.Text = text

    local self: Label = {
        instance = instance,

        ChangeText = ChangeText,
        UpdateTheme = UpdateTheme,
        Destroy = Destroy,
    }

    self:UpdateTheme()
    instance.Parent = parent

    return self
end

return Label
