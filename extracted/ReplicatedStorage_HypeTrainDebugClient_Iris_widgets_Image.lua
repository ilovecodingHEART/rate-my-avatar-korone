-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v4 = {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Image = 1, 
            Size = 2, 
            Rect = 3, 
            ScaleType = 4, 
            ResampleMode = 5, 
            TileSize = 6, 
            SliceCenter = 7, 
            SliceScale = 8
        }, 
        Discard = function(v3) --[[ Line: 17 ]] --[[ Name: Discard ]]
            v3.Instance:Destroy();
        end
    };
    v1.WidgetConstructor("Image", v2.extend(v4, {
        Events = {
            hovered = v2.EVENTS.hover(function(v5) --[[ Line: 25 ]]
                return v5.Instance;
            end)
        }, 
        Generate = function(v6) --[[ Line: 29 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Iris_Image";
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.ImageColor3 = v1._config.ImageColor;
            l_ImageLabel_0.ImageTransparency = v1._config.ImageTransparency;
            l_ImageLabel_0.LayoutOrder = v6.ZIndex;
            v2.applyFrameStyle(l_ImageLabel_0, true);
            return l_ImageLabel_0;
        end, 
        Update = function(v8) --[[ Line: 42 ]] --[[ Name: Update ]]
            -- upvalues: v2 (copy)
            local l_Instance_0 = v8.Instance;
            l_Instance_0.Image = v8.arguments.Image or v2.ICONS.UNKNOWN_TEXTURE;
            l_Instance_0.Size = v8.arguments.Size;
            if v8.arguments.ScaleType then
                l_Instance_0.ScaleType = v8.arguments.ScaleType;
                if v8.arguments.ScaleType == Enum.ScaleType.Tile and v8.arguments.TileSize then
                    l_Instance_0.TileSize = v8.arguments.TileSize;
                elseif v8.arguments.ScaleType == Enum.ScaleType.Slice then
                    if v8.arguments.SliceCenter then
                        l_Instance_0.SliceCenter = v8.arguments.SliceCenter;
                    end;
                    if v8.arguments.SliceScale then
                        l_Instance_0.SliceScale = v8.arguments.SliceScale;
                    end;
                end;
            end;
            if v8.arguments.Rect then
                l_Instance_0.ImageRectOffset = v8.arguments.Rect.Min;
                l_Instance_0.ImageRectSize = Vector2.new(v8.arguments.Rect.Width, v8.arguments.Rect.Height);
            end;
            if v8.arguments.ResampleMode then
                l_Instance_0.ResampleMode = v8.arguments.ResampleMode;
            end;
        end
    }));
    v1.WidgetConstructor("ImageButton", v2.extend(v4, {
        Events = {
            clicked = v2.EVENTS.click(function(v10) --[[ Line: 76 ]]
                return v10.Instance;
            end), 
            rightClicked = v2.EVENTS.rightClick(function(v11) --[[ Line: 79 ]]
                return v11.Instance;
            end), 
            doubleClicked = v2.EVENTS.doubleClick(function(v12) --[[ Line: 82 ]]
                return v12.Instance;
            end), 
            ctrlClicked = v2.EVENTS.ctrlClick(function(v13) --[[ Line: 85 ]]
                return v13.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v14) --[[ Line: 88 ]]
                return v14.Instance;
            end)
        }, 
        Generate = function(v15) --[[ Line: 92 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.Name = "Iris_ImageButton";
            l_ImageButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_ImageButton_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_ImageButton_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_ImageButton_0.BorderSizePixel = 0;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.ImageTransparency = 1;
            l_ImageButton_0.LayoutOrder = v15.ZIndex;
            l_ImageButton_0.AutoButtonColor = false;
            v2.applyFrameStyle(l_ImageButton_0, true);
            v2.UIPadding(l_ImageButton_0, Vector2.new(v1._config.ImageBorderSize, v1._config.ImageBorderSize));
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "ImageLabel";
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.ImageColor3 = v1._config.ImageColor;
            l_ImageLabel_1.ImageTransparency = v1._config.ImageTransparency;
            l_ImageLabel_1.Parent = l_ImageButton_0;
            v2.applyInteractionHighlights("Background", l_ImageButton_0, l_ImageButton_0, {
                Color = v1._config.FrameBgColor, 
                Transparency = v1._config.FrameBgTransparency, 
                HoveredColor = v1._config.FrameBgHoveredColor, 
                HoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                ActiveColor = v1._config.FrameBgActiveColor, 
                ActiveTransparency = v1._config.FrameBgActiveTransparency
            });
            return l_ImageButton_0;
        end, 
        Update = function(v18) --[[ Line: 126 ]] --[[ Name: Update ]]
            -- upvalues: v2 (copy)
            local l_ImageLabel_2 = v18.Instance.ImageLabel;
            l_ImageLabel_2.Image = v18.arguments.Image or v2.ICONS.UNKNOWN_TEXTURE;
            l_ImageLabel_2.Size = v18.arguments.Size;
            if v18.arguments.ScaleType then
                l_ImageLabel_2.ScaleType = v18.arguments.ScaleType;
                if v18.arguments.ScaleType == Enum.ScaleType.Tile and v18.arguments.TileSize then
                    l_ImageLabel_2.TileSize = v18.arguments.TileSize;
                elseif v18.arguments.ScaleType == Enum.ScaleType.Slice then
                    if v18.arguments.SliceCenter then
                        l_ImageLabel_2.SliceCenter = v18.arguments.SliceCenter;
                    end;
                    if v18.arguments.SliceScale then
                        l_ImageLabel_2.SliceScale = v18.arguments.SliceScale;
                    end;
                end;
            end;
            if v18.arguments.Rect then
                l_ImageLabel_2.ImageRectOffset = v18.arguments.Rect.Min;
                l_ImageLabel_2.ImageRectSize = Vector2.new(v18.arguments.Rect.Width, v18.arguments.Rect.Height);
            end;
            if v18.arguments.ResampleMode then
                l_ImageLabel_2.ResampleMode = v18.arguments.ResampleMode;
            end;
        end
    }));
end;