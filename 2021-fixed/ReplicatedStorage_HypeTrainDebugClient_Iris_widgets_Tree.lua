-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v17 = {
        hasState = true, 
        hasChildren = true, 
        Events = {
            collapsed = {
                Init = function(_) --[[ Line: 9 ]]

                end, 
                Get = function(v4) --[[ Line: 10 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastCollapsedTick == v1._cycleTick;
                end
            }, 
            uncollapsed = {
                Init = function(_) --[[ Line: 15 ]]

                end, 
                Get = function(v6) --[[ Line: 16 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUncollapsedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 20 ]]
                return v7.Instance;
            end)
        }, 
        Discard = function(v8) --[[ Line: 24 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v8.Instance:Destroy();
            v2.discardState(v8);
        end, 
        ChildAdded = function(v9, _) --[[ Line: 28 ]] --[[ Name: ChildAdded ]]
            local l_ChildContainer_0 = v9.ChildContainer;
            l_ChildContainer_0.Visible = v9.state.isUncollapsed.value;
            return l_ChildContainer_0;
        end, 
        UpdateState = function(v12) --[[ Line: 35 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_value_0 = v12.state.isUncollapsed.value;
            local l_Instance_0 = v12.Instance;
            local l_ChildContainer_1 = v12.ChildContainer;
            l_Instance_0.Header.Button.Arrow.Image = l_value_0 and v2.ICONS.DOWN_POINTING_TRIANGLE or v2.ICONS.RIGHT_POINTING_TRIANGLE;
            if l_value_0 then
                v12.lastUncollapsedTick = v1._cycleTick + 1;
            else
                v12.lastCollapsedTick = v1._cycleTick + 1;
            end;
            l_ChildContainer_1.Visible = l_value_0;
        end, 
        GenerateState = function(v16) --[[ Line: 52 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v16.state.isUncollapsed == nil then
                v16.state.isUncollapsed = v1._widgetState(v16, "isUncollapsed", v16.arguments.DefaultOpen or false);
            end;
        end
    };
    v1.WidgetConstructor("Tree", v2.extend(v17, {
        Args = {
            Text = 1, 
            SpanAvailWidth = 2, 
            NoIndent = 3, 
            DefaultOpen = 4
        }, 
        Generate = function(v18) --[[ Line: 69 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Tree";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, 0));
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.LayoutOrder = v18.ZIndex;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Vertical, UDim.new(0, 0));
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "TreeContainer";
            l_Frame_1.Size = UDim2.fromScale(1, 0);
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.LayoutOrder = 1;
            l_Frame_1.Visible = false;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_1, Vector2.zero).PaddingTop = UDim.new(0, v1._config.ItemSpacing.Y);
            l_Frame_1.Parent = l_Frame_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "Header";
            l_Frame_2.Size = UDim2.fromScale(1, 0);
            l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_2.BackgroundTransparency = 1;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.Parent = l_Frame_0;
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Button";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Text = "";
            l_TextButton_0.AutoButtonColor = false;
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_Frame_2, {
                Color = Color3.fromRGB(0, 0, 0), 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderActiveColor, 
                ActiveTransparency = v1._config.HeaderActiveTransparency
            });
            v2.UIPadding(l_TextButton_0, Vector2.zero).PaddingLeft = UDim.new(0, v1._config.FramePadding.X);
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.FramePadding.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            l_TextButton_0.Parent = l_Frame_2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Arrow";
            l_ImageLabel_0.Size = UDim2.fromOffset(v1._config.TextSize, (math.floor(v1._config.TextSize * 0.7)));
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_0.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_0.Parent = l_TextButton_0;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            l_TextLabel_0.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            v2.UIPadding(l_TextLabel_0, Vector2.zero).PaddingRight = UDim.new(0, 21);
            v2.applyTextStyle(l_TextLabel_0);
            l_TextLabel_0.Parent = l_TextButton_0;
            v2.applyButtonClick(l_TextButton_0, function() --[[ Line: 151 ]]
                -- upvalues: v18 (copy)
                v18.state.isUncollapsed:set(not v18.state.isUncollapsed.value);
            end);
            v18.ChildContainer = l_Frame_1;
            return l_Frame_0;
        end, 
        Update = function(v25) --[[ Line: 158 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_1 = v25.Instance;
            local l_ChildContainer_2 = v25.ChildContainer;
            local l_Button_0 = l_Instance_1.Header.Button;
            local l_TextLabel_1 = l_Button_0.TextLabel;
            local l_UIPadding_0 = l_ChildContainer_2.UIPadding;
            l_TextLabel_1.Text = v25.arguments.Text or "Tree";
            if v25.arguments.SpanAvailWidth then
                l_Button_0.AutomaticSize = Enum.AutomaticSize.Y;
                l_Button_0.Size = UDim2.fromScale(1, 0);
            else
                l_Button_0.AutomaticSize = Enum.AutomaticSize.XY;
                l_Button_0.Size = UDim2.fromScale(0, 0);
            end;
            if v25.arguments.NoIndent then
                l_UIPadding_0.PaddingLeft = UDim.new(0, 0);
                return;
            else
                l_UIPadding_0.PaddingLeft = UDim.new(0, v1._config.IndentSpacing);
                return;
            end;
        end
    }));
    v1.WidgetConstructor("CollapsingHeader", v2.extend(v17, {
        Args = {
            Text = 1, 
            DefaultOpen = 2
        }, 
        Generate = function(v31) --[[ Line: 192 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.Name = "Iris_CollapsingHeader";
            l_Frame_3.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, 0));
            l_Frame_3.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_3.BackgroundTransparency = 1;
            l_Frame_3.BorderSizePixel = 0;
            l_Frame_3.LayoutOrder = v31.ZIndex;
            v2.UIListLayout(l_Frame_3, Enum.FillDirection.Vertical, UDim.new(0, 0));
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "CollapsingHeaderContainer";
            l_Frame_4.Size = UDim2.fromScale(1, 0);
            l_Frame_4.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_4.BackgroundTransparency = 1;
            l_Frame_4.BorderSizePixel = 0;
            l_Frame_4.LayoutOrder = 1;
            l_Frame_4.Visible = false;
            v2.UIListLayout(l_Frame_4, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_4, Vector2.zero).PaddingTop = UDim.new(0, v1._config.ItemSpacing.Y);
            l_Frame_4.Parent = l_Frame_3;
            local l_Frame_5 = Instance.new("Frame");
            l_Frame_5.Name = "Header";
            l_Frame_5.Size = UDim2.fromScale(1, 0);
            l_Frame_5.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_5.BackgroundTransparency = 1;
            l_Frame_5.BorderSizePixel = 0;
            l_Frame_5.Parent = l_Frame_3;
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "Button";
            l_TextButton_1.Size = UDim2.new(1, 0, 0, 0);
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.BackgroundColor3 = v1._config.HeaderColor;
            l_TextButton_1.BackgroundTransparency = v1._config.HeaderTransparency;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.Text = "";
            l_TextButton_1.AutoButtonColor = false;
            l_TextButton_1.ClipsDescendants = true;
            v2.UIPadding(l_TextButton_1, v1._config.FramePadding);
            v2.applyFrameStyle(l_TextButton_1, true);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, 2 * v1._config.FramePadding.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyInteractionHighlights("Background", l_TextButton_1, l_TextButton_1, {
                Color = v1._config.HeaderColor, 
                Transparency = v1._config.HeaderTransparency, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderActiveColor, 
                ActiveTransparency = v1._config.HeaderActiveTransparency
            });
            l_TextButton_1.Parent = l_Frame_5;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "Arrow";
            l_ImageLabel_1.Size = UDim2.fromOffset(v1._config.TextSize, (math.ceil(v1._config.TextSize * 0.8)));
            l_ImageLabel_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_1.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_1.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_1.Parent = l_TextButton_1;
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "TextLabel";
            l_TextLabel_2.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            v2.UIPadding(l_TextLabel_2, Vector2.zero).PaddingRight = UDim.new(0, 21);
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Parent = l_TextButton_1;
            v2.applyButtonClick(l_TextButton_1, function() --[[ Line: 279 ]]
                -- upvalues: v31 (copy)
                v31.state.isUncollapsed:set(not v31.state.isUncollapsed.value);
            end);
            v31.ChildContainer = l_Frame_4;
            return l_Frame_3;
        end, 
        Update = function(v38) --[[ Line: 286 ]] --[[ Name: Update ]]
            v38.Instance.Header.Button.TextLabel.Text = v38.arguments.Text or "Collapsing Header";
        end
    }));
end;