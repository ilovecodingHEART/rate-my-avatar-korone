-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    CutCorners = {
        MainButton = {
            Image = "rbxassetid://76476290918578", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }, 
        GamepadIconBackground = {
            Image = "rbxassetid://135976734207422", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }
    }, 
    CutTopLeftCorner = {
        MainButton = {
            Image = "rbxassetid://127204475432575", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }, 
        GamepadIconBackground = {
            Image = "rbxassetid://95201075795195", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }
    }, 
    CutBottomRightCorner = {
        MainButton = {
            Image = "rbxassetid://135976734207422", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }, 
        GamepadIconBackground = {
            Image = "rbxassetid://135976734207422", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }
    }, 
    RoundedCorners = {
        MainButton = {
            Image = "rbxassetid://136205699446611", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }, 
        GamepadIconBackground = {
            Image = "rbxassetid://98913835358317", 
            SliceCenter = Rect.new(32, 32, 34, 34), 
            SliceScaleMultiplier = 0.00625
        }
    }
};
local l_NexusInstance_0 = require(script.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_SimpleWrappedInstance_0 = require(script.Parent:WaitForChild("SimpleWrappedInstance"));
local v3 = {
    Themes = v0
};
v3.__index = v3;
setmetatable(v3, l_SimpleWrappedInstance_0);
v3.__new = function(v4) --[[ Line: 85 ]] --[[ Name: __new ]]
    -- upvalues: l_SimpleWrappedInstance_0 (copy)
    l_SimpleWrappedInstance_0.__new(v4, Instance.new("ImageLabel"));
    v4:GetWrappedInstance().BackgroundTransparency = 1;
    v4:DisableChangeReplication("Theme");
    v4.Theme = "CutCorners";
    v4:DisableChangeReplication("SubTheme");
    v4.SubTheme = "MainButton";
    v4:DisableChangeReplication("BackgroundColor3");
    v4:OnPropertyChanged("BackgroundColor3", function(v5) --[[ Line: 97 ]]
        -- upvalues: v4 (copy)
        v4.ImageColor3 = v5;
    end);
    v4:DisableChangeReplication("BackgroundTransparency");
    v4:OnPropertyChanged("BackgroundTransparency", function(v6) --[[ Line: 101 ]]
        -- upvalues: v4 (copy)
        v4.ImageTransparency = v6;
    end);
    v4:DisableChangeReplication("SliceScaleMultiplier");
    v4:OnPropertyChanged("SliceScaleMultiplier", function() --[[ Line: 105 ]]
        -- upvalues: v4 (copy)
        v4:UpdateSliceScale();
    end);
    v4:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 108 ]]
        -- upvalues: v4 (copy)
        v4:UpdateSliceScale();
    end);
    v4:OnPropertyChanged("Theme", function() --[[ Line: 113 ]]
        -- upvalues: v4 (copy)
        v4:UpdateTheme();
    end);
    v4:OnPropertyChanged("SubTheme", function() --[[ Line: 116 ]]
        -- upvalues: v4 (copy)
        v4:UpdateTheme();
    end);
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    v4.BackgroundTransparency = 0;
    v4.ScaleType = Enum.ScaleType.Slice;
    v4.SliceScaleMultiplier = 1;
    v4.Size = UDim2.new(0, 100, 0, 100);
    v4:UpdateTheme();
end;
v3.UpdateSliceScale = function(v7) --[[ Line: 132 ]] --[[ Name: UpdateSliceScale ]]
    -- upvalues: v3 (copy)
    local v8 = v3.Themes[v7.Theme][v7.SubTheme];
    v7.SliceScale = math.min(v7.AbsoluteSize.X, v7.AbsoluteSize.Y) * v8.SliceScaleMultiplier * (v7.SliceScaleMultiplier or 1);
end;
v3.UpdateTheme = function(v9) --[[ Line: 140 ]] --[[ Name: UpdateTheme ]]
    -- upvalues: v3 (copy)
    local v10 = v3.Themes[v9.Theme];
    if not v10 then
        error((("Unknown theme: %*"):format(v9.Theme)));
    end;
    local v11 = v10[v9.SubTheme];
    if not v11 then
        error((("Unknown subtheme: %*"):format(v9.SubTheme)));
    end;
    v9.Image = v11.Image;
    v9.SliceCenter = v11.SliceCenter;
    v9:UpdateSliceScale();
end;
return (l_NexusInstance_0.ToInstance(v3));