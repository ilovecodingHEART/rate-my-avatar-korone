-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = Color3.fromRGB(-30, -30, -30);
local _ = require(script.Parent.Parent:WaitForChild("Button"));
local l_ButtonFactory_0 = require(script.Parent:WaitForChild("ButtonFactory"));
local v3 = {};
v3.__index = v3;
setmetatable(v3, l_ButtonFactory_0);
v3.CreateDefault = function(v4) --[[ Line: 23 ]] --[[ Name: CreateDefault ]]
    -- upvalues: v3 (copy), l_ButtonFactory_0 (copy), v0 (copy)
    local v5 = v3.new();
    v5:SetDefault("BackgroundColor3", v4);
    v5:SetDefault("BorderColor3", l_ButtonFactory_0.AddColor3(v4, v0));
    v5:SetDefault("BorderTransparency", 0.25);
    v5:SetTextDefault("Font", Enum.Font.SourceSans);
    v5:SetTextDefault("TextColor3", Color3.fromRGB(255, 255, 255));
    v5:SetTextDefault("TextStrokeColor3", Color3.fromRGB(0, 0, 0));
    v5:SetTextDefault("TextStrokeTransparency", 0);
    v5:SetTextDefault("TextScaled", true);
    return v5;
end;
v3.new = function() --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: l_ButtonFactory_0 (copy), v3 (copy)
    local v6 = setmetatable(l_ButtonFactory_0.new(), v3);
    v6.TextDefaults = {};
    return v6;
end;
v3.Create = function(v7) --[[ Line: 53 ]] --[[ Name: Create ]]
    -- upvalues: l_ButtonFactory_0 (copy)
    local v8 = l_ButtonFactory_0.Create(v7);
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.ZIndex = 5;
    l_TextLabel_0.Parent = v8:GetAdornFrame();
    for v10, v11 in v7.TextDefaults do
        l_TextLabel_0[v10] = v11;
    end;
    return v8, l_TextLabel_0;
end;
v3.SetTextDefault = function(v12, v13, v14) --[[ Line: 78 ]] --[[ Name: SetTextDefault ]]
    v12.TextDefaults[v13] = v14;
end;
v3.UnsetTextDefault = function(v15, v16) --[[ Line: 85 ]] --[[ Name: UnsetTextDefault ]]
    v15.TextDefaults[v16] = nil;
end;
return v3;