-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("Selectable", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Index = 2, 
            NoClick = 3
        }, 
        Events = {
            selected = {
                Init = function(_) --[[ Line: 15 ]]

                end, 
                Get = function(v4) --[[ Line: 16 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastSelectedTick == v1._cycleTick;
                end
            }, 
            unselected = {
                Init = function(_) --[[ Line: 21 ]]

                end, 
                Get = function(v6) --[[ Line: 22 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUnselectedTick == v1._cycleTick;
                end
            }, 
            active = {
                Init = function(_) --[[ Line: 27 ]]

                end, 
                Get = function(v8) --[[ Line: 28 ]]
                    return v8.state.index.value == v8.arguments.Index;
                end
            }, 
            clicked = v2.EVENTS.click(function(v9) --[[ Line: 32 ]]
                return v9.Instance.SelectableButton;
            end), 
            rightClicked = v2.EVENTS.rightClick(function(v10) --[[ Line: 36 ]]
                return v10.Instance.SelectableButton;
            end), 
            doubleClicked = v2.EVENTS.doubleClick(function(v11) --[[ Line: 40 ]]
                return v11.Instance.SelectableButton;
            end), 
            ctrlClicked = v2.EVENTS.ctrlClick(function(v12) --[[ Line: 44 ]]
                return v12.Instance.SelectableButton;
            end), 
            hovered = v2.EVENTS.hover(function(v13) --[[ Line: 48 ]]
                return v13.Instance.SelectableButton;
            end)
        }, 
        Generate = function(v14) --[[ Line: 53 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_Selectable";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new(0, v1._config.TextSize + 2 * v1._config.FramePadding.Y - v1._config.ItemSpacing.Y));
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.ZIndex = 0;
            l_Frame_0.LayoutOrder = v14.ZIndex;
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "SelectableButton";
            l_TextButton_0.Size = UDim2.new(1, 0, 0, v1._config.TextSize + 2 * v1._config.FramePadding.Y);
            l_TextButton_0.Position = UDim2.fromOffset(0, -bit32.rshift(v1._config.ItemSpacing.Y, 1));
            l_TextButton_0.BackgroundColor3 = v1._config.HeaderColor;
            l_TextButton_0.ClipsDescendants = true;
            v2.applyFrameStyle(l_TextButton_0);
            v2.applyTextStyle(l_TextButton_0);
            v2.UISizeConstraint(l_TextButton_0, Vector2.xAxis);
            v14.ButtonColors = {
                Color = v1._config.HeaderColor, 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderActiveColor, 
                ActiveTransparency = v1._config.HeaderActiveTransparency
            };
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_TextButton_0, v14.ButtonColors);
            v2.applyButtonClick(l_TextButton_0, function() --[[ Line: 84 ]]
                -- upvalues: v14 (copy)
                if v14.arguments.NoClick ~= true then
                    if type(v14.state.index.value) == "boolean" then
                        v14.state.index:set(not v14.state.index.value);
                        return;
                    else
                        v14.state.index:set(v14.arguments.Index);
                    end;
                end;
            end);
            l_TextButton_0.Parent = l_Frame_0;
            return l_Frame_0;
        end, 
        Update = function(v17) --[[ Line: 98 ]] --[[ Name: Update ]]
            v17.Instance.SelectableButton.Text = v17.arguments.Text or "Selectable";
        end, 
        Discard = function(v18) --[[ Line: 103 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v18.Instance:Destroy();
            v2.discardState(v18);
        end, 
        GenerateState = function(v19) --[[ Line: 107 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v19.state.index == nil then
                if v19.arguments.Index ~= nil then
                    error("A shared state index is required for Iris.Selectables() with an Index argument.", 5);
                end;
                v19.state.index = v1._widgetState(v19, "index", false);
            end;
        end, 
        UpdateState = function(v20) --[[ Line: 115 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy)
            local l_SelectableButton_0 = v20.Instance.SelectableButton;
            if v20.state.index.value == (v20.arguments.Index or true) then
                v20.ButtonColors.Transparency = v1._config.HeaderTransparency;
                l_SelectableButton_0.BackgroundTransparency = v1._config.HeaderTransparency;
                v20.lastSelectedTick = v1._cycleTick + 1;
                return;
            else
                v20.ButtonColors.Transparency = 1;
                l_SelectableButton_0.BackgroundTransparency = 1;
                v20.lastUnselectedTick = v1._cycleTick + 1;
                return;
            end;
        end
    });
    local v22 = false;
    local v23 = -1;
    local v24 = nil;
    local v25 = 0;
    local function v40(v26) --[[ Line: 135 ]] --[[ Name: UpdateChildContainerTransform ]]
        -- upvalues: v2 (copy), v1 (copy), v25 (ref)
        local l_PreviewContainer_0 = v26.Instance.PreviewContainer;
        local l_ChildContainer_0 = v26.ChildContainer;
        local v29 = l_PreviewContainer_0.AbsolutePosition - v2.GuiOffset;
        local l_AbsoluteSize_0 = l_PreviewContainer_0.AbsoluteSize;
        local l_PopupBorderSize_0 = v1._config.PopupBorderSize;
        local l_AbsoluteSize_1 = l_ChildContainer_0.Parent.AbsoluteSize;
        local l_Y_0 = v26.UIListLayout.AbsoluteContentSize.Y;
        v25 = l_Y_0;
        local v34 = l_Y_0 + 2 * v1._config.WindowPadding.Y;
        local l_X_0 = v29.X;
        local v36 = v29.Y + l_AbsoluteSize_0.Y + l_PopupBorderSize_0;
        local l_zero_0 = Vector2.zero;
        local v38 = l_AbsoluteSize_1.Y - v36;
        if v38 < v34 and l_AbsoluteSize_1.Y / 2 < v36 then
            v36 = v29.Y - l_PopupBorderSize_0;
            l_zero_0 = Vector2.yAxis;
            v38 = v36;
        end;
        l_ChildContainer_0.AnchorPoint = l_zero_0;
        l_ChildContainer_0.Position = UDim2.fromOffset(l_X_0, v36);
        local v39 = math.min(v34, v38);
        l_ChildContainer_0.Size = UDim2.fromOffset(l_PreviewContainer_0.AbsoluteSize.X, v39);
    end;
    table.insert(v1._postCycleCallbacks, function() --[[ Line: 170 ]]
        -- upvalues: v22 (ref), v24 (ref), v25 (ref), v40 (copy)
        if v22 and v24 and v24.UIListLayout.AbsoluteContentSize.Y ~= v25 then
            v40(v24);
        end;
    end);
    local function v47(v41) --[[ Line: 179 ]] --[[ Name: UpdateComboState ]]
        -- upvalues: v1 (copy), v22 (ref), v24 (ref), v23 (ref), v2 (copy)
        if not v1._started then
            return;
        elseif v41.UserInputType ~= Enum.UserInputType.MouseButton1 and v41.UserInputType ~= Enum.UserInputType.MouseButton2 and v41.UserInputType ~= Enum.UserInputType.Touch and v41.UserInputType ~= Enum.UserInputType.MouseWheel then
            return;
        elseif v22 == false or not v24 then
            return;
        elseif v23 == v1._cycleTick then
            return;
        else
            local v42 = v2.getMouseLocation();
            local l_PreviewContainer_1 = v24.Instance.PreviewContainer;
            local l_ChildContainer_1 = v24.ChildContainer;
            local v45 = l_PreviewContainer_1.AbsolutePosition - v2.GuiOffset;
            local v46 = l_PreviewContainer_1.AbsolutePosition - v2.GuiOffset + l_PreviewContainer_1.AbsoluteSize;
            if v2.isPosInsideRect(v42, v45, v46) then
                return;
            else
                v45 = l_ChildContainer_1.AbsolutePosition - v2.GuiOffset;
                v46 = l_ChildContainer_1.AbsolutePosition - v2.GuiOffset + l_ChildContainer_1.AbsoluteSize;
                if v2.isPosInsideRect(v42, v45, v46) then
                    return;
                else
                    v24.state.isOpened:set(false);
                    return;
                end;
            end;
        end;
    end;
    v2.registerEvent("InputBegan", v47);
    v2.registerEvent("InputChanged", v47);
    v1.WidgetConstructor("Combo", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Text = 1, 
            NoButton = 2, 
            NoPreview = 3
        }, 
        Events = {
            opened = {
                Init = function(_) --[[ Line: 227 ]]

                end, 
                Get = function(v49) --[[ Line: 228 ]]
                    -- upvalues: v1 (copy)
                    return v49.lastOpenedTick == v1._cycleTick;
                end
            }, 
            closed = {
                Init = function(_) --[[ Line: 233 ]]

                end, 
                Get = function(v51) --[[ Line: 234 ]]
                    -- upvalues: v1 (copy)
                    return v51.lastClosedTick == v1._cycleTick;
                end
            }, 
            changed = {
                Init = function(_) --[[ Line: 239 ]]

                end, 
                Get = function(v53) --[[ Line: 240 ]]
                    -- upvalues: v1 (copy)
                    return v53.lastChangedTick == v1._cycleTick;
                end
            }, 
            clicked = v2.EVENTS.click(function(v54) --[[ Line: 244 ]]
                return v54.Instance.PreviewContainer;
            end), 
            hovered = v2.EVENTS.hover(function(v55) --[[ Line: 248 ]]
                return v55.Instance;
            end)
        }, 
        Generate = function(v56) --[[ Line: 252 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v22 (ref), v24 (ref)
            local v57 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Iris_Combo";
            l_Frame_1.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.LayoutOrder = v56.ZIndex;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "PreviewContainer";
            l_TextButton_1.Size = UDim2.new(v1._config.ContentWidth, UDim.new(0, 0));
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.Text = "";
            l_TextButton_1.ZIndex = v56.ZIndex + 2;
            l_TextButton_1.AutoButtonColor = false;
            v2.applyFrameStyle(l_TextButton_1, true);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, 0));
            v2.UISizeConstraint(l_TextButton_1, Vector2.new(v57));
            l_TextButton_1.Parent = l_Frame_1;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "PreviewLabel";
            l_TextLabel_0.Size = UDim2.new(UDim.new(1, 0), v1._config.ContentHeight);
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextLabel_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_TextLabel_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.ClipsDescendants = true;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIPadding(l_TextLabel_0, v1._config.FramePadding);
            l_TextLabel_0.Parent = l_TextButton_1;
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "DropdownButton";
            l_TextLabel_1.Size = UDim2.new(0, v57, v1._config.ContentHeight.Scale, (math.max(v1._config.ContentHeight.Offset, v57)));
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.BackgroundColor3 = v1._config.ButtonColor;
            l_TextLabel_1.BackgroundTransparency = v1._config.ButtonTransparency;
            l_TextLabel_1.Text = "";
            local v62 = v57 - math.round(v57 * 0.2) * 2;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Dropdown";
            l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_0.Size = UDim2.fromOffset(v62, v62);
            l_ImageLabel_0.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_0.Parent = l_TextLabel_1;
            l_TextLabel_1.Parent = l_TextButton_1;
            v2.applyInteractionHighlightsWithMultiHighlightee("Background", l_TextButton_1, {
                {
                    l_TextLabel_0, 
                    {
                        Color = v1._config.FrameBgColor, 
                        Transparency = v1._config.FrameBgTransparency, 
                        HoveredColor = v1._config.FrameBgHoveredColor, 
                        HoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                        ActiveColor = v1._config.FrameBgActiveColor, 
                        ActiveTransparency = v1._config.FrameBgActiveTransparency
                    }
                }, 
                {
                    l_TextLabel_1, 
                    {
                        Color = v1._config.ButtonColor, 
                        Transparency = v1._config.ButtonTransparency, 
                        HoveredColor = v1._config.ButtonHoveredColor, 
                        HoveredTransparency = v1._config.ButtonHoveredTransparency, 
                        ActiveColor = v1._config.ButtonHoveredColor, 
                        ActiveTransparency = v1._config.ButtonHoveredTransparency
                    }
                }
            });
            v2.applyButtonClick(l_TextButton_1, function() --[[ Line: 348 ]]
                -- upvalues: v22 (ref), v24 (ref), v56 (copy)
                if v22 and v24 ~= v56 then
                    return;
                else
                    v56.state.isOpened:set(not v56.state.isOpened.value);
                    return;
                end;
            end);
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "TextLabel";
            l_TextLabel_2.Size = UDim2.fromOffset(0, v57);
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.X;
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Parent = l_Frame_1;
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Name = "ComboContainer";
            l_ScrollingFrame_0.BackgroundColor3 = v1._config.PopupBgColor;
            l_ScrollingFrame_0.BackgroundTransparency = v1._config.PopupBgTransparency;
            l_ScrollingFrame_0.BorderSizePixel = 0;
            l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_ScrollingFrame_0.ScrollBarImageTransparency = v1._config.ScrollbarGrabTransparency;
            l_ScrollingFrame_0.ScrollBarImageColor3 = v1._config.ScrollbarGrabColor;
            l_ScrollingFrame_0.ScrollBarThickness = v1._config.ScrollbarSize;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(0, 0);
            l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
            l_ScrollingFrame_0.TopImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.MidImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.BottomImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.ClipsDescendants = true;
            v2.UIStroke(l_ScrollingFrame_0, v1._config.WindowBorderSize, v1._config.BorderColor, v1._config.BorderTransparency);
            v2.UIPadding(l_ScrollingFrame_0, Vector2.new(2, v1._config.WindowPadding.Y));
            v2.UISizeConstraint(l_ScrollingFrame_0, Vector2.new(100));
            local v66 = v2.UIListLayout(l_ScrollingFrame_0, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v66.VerticalAlignment = Enum.VerticalAlignment.Top;
            l_ScrollingFrame_0.Parent = v1._rootInstance and v1._rootInstance:WaitForChild("PopupScreenGui");
            v56.ChildContainer = l_ScrollingFrame_0;
            v56.UIListLayout = v66;
            return l_Frame_1;
        end, 
        Update = function(v67) --[[ Line: 404 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy)
            local l_Instance_0 = v67.Instance;
            local l_PreviewContainer_2 = l_Instance_0.PreviewContainer;
            local l_PreviewLabel_0 = l_PreviewContainer_2.PreviewLabel;
            local l_DropdownButton_0 = l_PreviewContainer_2.DropdownButton;
            l_Instance_0.TextLabel.Text = v67.arguments.Text or "Combo";
            if v67.arguments.NoButton then
                l_DropdownButton_0.Visible = false;
                l_PreviewLabel_0.Size = UDim2.new(UDim.new(1, 0), l_PreviewLabel_0.Size.Height);
            else
                l_DropdownButton_0.Visible = true;
                local v72 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                l_PreviewLabel_0.Size = UDim2.new(UDim.new(1, -v72), l_PreviewLabel_0.Size.Height);
            end;
            if v67.arguments.NoPreview then
                l_PreviewLabel_0.Visible = false;
                l_PreviewContainer_2.Size = UDim2.new(0, 0, 0, 0);
                l_PreviewContainer_2.AutomaticSize = Enum.AutomaticSize.XY;
                return;
            else
                l_PreviewLabel_0.Visible = true;
                l_PreviewContainer_2.Size = UDim2.new(v1._config.ContentWidth, v1._config.ContentHeight);
                l_PreviewContainer_2.AutomaticSize = Enum.AutomaticSize.Y;
                return;
            end;
        end, 
        ChildAdded = function(v73, _) --[[ Line: 432 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v40 (copy)
            v40(v73);
            return v73.ChildContainer;
        end, 
        GenerateState = function(v75) --[[ Line: 436 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v75.state.index == nil then
                v75.state.index = v1._widgetState(v75, "index", "No Selection");
            end;
            if v75.state.isOpened == nil then
                v75.state.isOpened = v1._widgetState(v75, "isOpened", false);
            end;
            v75.state.index:onChange(function() --[[ Line: 444 ]]
                -- upvalues: v75 (copy), v1 (ref)
                v75.lastChangedTick = v1._cycleTick + 1;
                if v75.state.isOpened.value then
                    v75.state.isOpened:set(false);
                end;
            end);
        end, 
        UpdateState = function(v76) --[[ Line: 451 ]] --[[ Name: UpdateState ]]
            -- upvalues: v22 (ref), v24 (ref), v23 (ref), v1 (copy), v2 (copy), v40 (copy)
            local l_Instance_1 = v76.Instance;
            local l_ChildContainer_2 = v76.ChildContainer;
            local l_PreviewContainer_3 = l_Instance_1.PreviewContainer;
            local l_PreviewLabel_1 = l_PreviewContainer_3.PreviewLabel;
            local l_Dropdown_0 = l_PreviewContainer_3.DropdownButton.Dropdown;
            if v76.state.isOpened.value then
                v22 = true;
                v24 = v76;
                v23 = v1._cycleTick;
                v76.lastOpenedTick = v1._cycleTick + 1;
                l_Dropdown_0.Image = v2.ICONS.RIGHT_POINTING_TRIANGLE;
                l_ChildContainer_2.Visible = true;
                v40(v76);
            else
                if v22 then
                    v22 = false;
                    v24 = nil;
                    v76.lastClosedTick = v1._cycleTick + 1;
                end;
                l_Dropdown_0.Image = v2.ICONS.DOWN_POINTING_TRIANGLE;
                l_ChildContainer_2.Visible = false;
            end;
            local l_value_0 = v76.state.index.value;
            l_PreviewLabel_1.Text = if typeof(l_value_0) == "EnumItem" then l_value_0.Name else tostring(l_value_0);
        end, 
        Discard = function(v83) --[[ Line: 483 ]] --[[ Name: Discard ]]
            -- upvalues: v24 (ref), v22 (ref), v2 (copy)
            if v24 and v24 == v83 then
                v24 = nil;
                v22 = false;
            end;
            v83.Instance:Destroy();
            v83.ChildContainer:Destroy();
            v2.discardState(v83);
        end
    });
end;