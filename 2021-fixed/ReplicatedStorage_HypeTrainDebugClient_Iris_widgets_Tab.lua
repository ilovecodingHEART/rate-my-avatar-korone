-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local function _(v3, v4) --[[ Line: 4 ]] --[[ Name: openTab ]]
        if v3.state.index.value > 0 then
            return;
        else
            v3.state.index:set(v4);
            return;
        end;
    end;
    local function v10(v6, v7) --[[ Line: 12 ]] --[[ Name: closeTab ]]
        if v6.state.index.value ~= v7 then
            return;
        else
            for v8 = v7 - 1, 1, -1 do
                if v6.Tabs[v8].state.isOpened.value == true then
                    v6.state.index:set(v8);
                    return;
                end;
            end;
            for v9 = v7, #v6.Tabs do
                if v6.Tabs[v9].state.isOpened.value == true then
                    v6.state.index:set(v9);
                    return;
                end;
            end;
            v6.state.index:set(0);
            return;
        end;
    end;
    v1.WidgetConstructor("TabBar", {
        hasState = true, 
        hasChildren = true, 
        Args = {}, 
        Events = {}, 
        Generate = function(v11) --[[ Line: 43 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_TabBar";
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.Size = UDim2.fromScale(1, 0);
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.LayoutOrder = v11.ZIndex;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Vertical, UDim.new()).VerticalAlignment = Enum.VerticalAlignment.Bottom;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Bar";
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.Size = UDim2.fromScale(1, 0);
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.BorderSizePixel = 0;
            v2.UIListLayout(l_Frame_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
            l_Frame_1.Parent = l_Frame_0;
            local l_Frame_2 = Instance.new("Frame");
            l_Frame_2.Name = "Underline";
            l_Frame_2.Size = UDim2.new(1, 0, 0, 1);
            l_Frame_2.BackgroundColor3 = v1._config.TabActiveColor;
            l_Frame_2.BackgroundTransparency = v1._config.TabActiveTransparency;
            l_Frame_2.BorderSizePixel = 0;
            l_Frame_2.LayoutOrder = 1;
            l_Frame_2.Parent = l_Frame_0;
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.Name = "TabContainer";
            l_Frame_3.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_3.Size = UDim2.fromScale(1, 0);
            l_Frame_3.BackgroundTransparency = 1;
            l_Frame_3.BorderSizePixel = 0;
            l_Frame_3.LayoutOrder = 2;
            l_Frame_3.ClipsDescendants = true;
            l_Frame_3.Parent = l_Frame_0;
            v11.ChildContainer = l_Frame_3;
            v11.Tabs = {};
            return l_Frame_0;
        end, 
        Update = function(_) --[[ Line: 91 ]] --[[ Name: Update ]]

        end, 
        ChildAdded = function(v17, v18) --[[ Line: 92 ]] --[[ Name: ChildAdded ]]
            assert(v18.type == "Tab", "Only Iris.Tab can be parented to Iris.TabBar.");
            local l_Instance_0 = v17.Instance;
            v18.ChildContainer.Parent = v17.ChildContainer;
            v18.Index = #v17.Tabs + 1;
            v17.state.index.ConnectedWidgets[v18.ID] = v18;
            table.insert(v17.Tabs, v18);
            return l_Instance_0.Bar;
        end, 
        ChildDiscarded = function(v20, v21) --[[ Line: 102 ]] --[[ Name: ChildDiscarded ]]
            -- upvalues: v10 (copy)
            local l_Index_0 = v21.Index;
            table.remove(v20.Tabs, l_Index_0);
            for v23 = l_Index_0, #v20.Tabs do
                v20.Tabs[v23].Index = v23;
            end;
            v10(v20, l_Index_0);
        end, 
        GenerateState = function(v24) --[[ Line: 112 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v24.state.index == nil then
                v24.state.index = v1._widgetState(v24, "index", 1);
            end;
        end, 
        UpdateState = function(_) --[[ Line: 117 ]] --[[ Name: UpdateState ]]

        end, 
        Discard = function(v26) --[[ Line: 119 ]] --[[ Name: Discard ]]
            v26.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("Tab", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Text = 1, 
            Hideable = 2
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v27) --[[ Line: 133 ]]
                return v27.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v28) --[[ Line: 136 ]]
                return v28.Instance;
            end), 
            selected = {
                Init = function(_) --[[ Line: 140 ]]

                end, 
                Get = function(v30) --[[ Line: 141 ]]
                    -- upvalues: v1 (copy)
                    return v30.lastSelectedTick == v1._cycleTick;
                end
            }, 
            unselected = {
                Init = function(_) --[[ Line: 146 ]]

                end, 
                Get = function(v32) --[[ Line: 147 ]]
                    -- upvalues: v1 (copy)
                    return v32.lastUnselectedTick == v1._cycleTick;
                end
            }, 
            active = {
                Init = function(_) --[[ Line: 152 ]]

                end, 
                Get = function(v34) --[[ Line: 153 ]]
                    return v34.state.index.value == v34.Index;
                end
            }, 
            opened = {
                Init = function(_) --[[ Line: 158 ]]

                end, 
                Get = function(v36) --[[ Line: 159 ]]
                    -- upvalues: v1 (copy)
                    return v36.lastOpenedTick == v1._cycleTick;
                end
            }, 
            closed = {
                Init = function(_) --[[ Line: 164 ]]

                end, 
                Get = function(v38) --[[ Line: 165 ]]
                    -- upvalues: v1 (copy)
                    return v38.lastClosedTick == v1._cycleTick;
                end
            }
        }, 
        Generate = function(v39) --[[ Line: 170 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v10 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Iris_Tab";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextButton_0.BackgroundColor3 = v1._config.TabColor;
            l_TextButton_0.BackgroundTransparency = v1._config.TabTransparency;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Text = "";
            l_TextButton_0.AutoButtonColor = false;
            v39.ButtonColors = {
                Color = v1._config.TabColor, 
                Transparency = v1._config.TabTransparency, 
                HoveredColor = v1._config.TabHoveredColor, 
                HoveredTransparency = v1._config.TabHoveredTransparency, 
                ActiveColor = v1._config.TabActiveColor, 
                ActiveTransparency = v1._config.TabActiveTransparency
            };
            v2.UIPadding(l_TextButton_0, Vector2.new(v1._config.FramePadding.X, 0));
            v2.applyFrameStyle(l_TextButton_0, true, true);
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_TextButton_0, v39.ButtonColors);
            v2.applyButtonClick(l_TextButton_0, function() --[[ Line: 193 ]]
                -- upvalues: v39 (copy)
                v39.state.index:set(v39.Index);
            end);
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIPadding(l_TextLabel_0, Vector2.new(0, v1._config.FramePadding.Y));
            l_TextLabel_0.Parent = l_TextButton_0;
            local v42 = v1._config.TextSize + (v1._config.FramePadding.Y - 1) * 2;
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "CloseButton";
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.LayoutOrder = 1;
            l_TextButton_1.Size = UDim2.fromOffset(v42, v42);
            l_TextButton_1.Text = "";
            l_TextButton_1.AutoButtonColor = false;
            v2.UICorner(l_TextButton_1);
            v2.applyButtonClick(l_TextButton_1, function() --[[ Line: 220 ]]
                -- upvalues: v39 (copy), v10 (ref)
                v39.state.isOpened:set(false);
                v10(v39.parentWidget, v39.Index);
            end);
            v2.applyInteractionHighlights("Background", l_TextButton_1, l_TextButton_1, {
                Color = v1._config.TabColor, 
                Transparency = 1, 
                HoveredColor = v1._config.ButtonHoveredColor, 
                HoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ActiveColor = v1._config.ButtonActiveColor, 
                ActiveTransparency = v1._config.ButtonActiveTransparency
            });
            l_TextButton_1.Parent = l_TextButton_0;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Icon";
            l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.BorderSizePixel = 0;
            l_ImageLabel_0.Image = v2.ICONS.MULTIPLICATION_SIGN;
            l_ImageLabel_0.ImageTransparency = 1;
            l_ImageLabel_0.Position = UDim2.fromScale(0.5, 0.5);
            l_ImageLabel_0.Size = UDim2.fromOffset(math.floor(v42 * 0.7), (math.floor(v42 * 0.7)));
            v2.applyInteractionHighlights("Image", l_TextButton_0, l_ImageLabel_0, {
                Color = v1._config.TextColor, 
                Transparency = 1, 
                HoveredColor = v1._config.TextColor, 
                HoveredTransparency = v1._config.TextTransparency, 
                ActiveColor = v1._config.TextColor, 
                ActiveTransparency = v1._config.TextTransparency
            });
            l_ImageLabel_0.Parent = l_TextButton_1;
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "TabContainer";
            l_Frame_4.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_4.Size = UDim2.fromScale(1, 0);
            l_Frame_4.BackgroundTransparency = 1;
            l_Frame_4.BorderSizePixel = 0;
            l_Frame_4.ClipsDescendants = true;
            v2.UIListLayout(l_Frame_4, Enum.FillDirection.Vertical, UDim.new(0, v1._config.ItemSpacing.Y));
            v2.UIPadding(l_Frame_4, Vector2.new(0, v1._config.ItemSpacing.Y)).PaddingBottom = UDim.new();
            v39.ChildContainer = l_Frame_4;
            return l_TextButton_0;
        end, 
        Update = function(v46) --[[ Line: 271 ]] --[[ Name: Update ]]
            local l_Instance_1 = v46.Instance;
            local l_TextLabel_1 = l_Instance_1.TextLabel;
            local l_CloseButton_0 = l_Instance_1.CloseButton;
            l_TextLabel_1.Text = v46.arguments.Text;
            l_CloseButton_0.Visible = v46.arguments.Hideable == true;
        end, 
        ChildAdded = function(v50, _) --[[ Line: 279 ]] --[[ Name: ChildAdded ]]
            return v50.ChildContainer;
        end, 
        GenerateState = function(v52) --[[ Line: 282 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            v52.state.index = v52.parentWidget.state.index;
            v52.state.index.ConnectedWidgets[v52.ID] = v52;
            if v52.state.isOpened == nil then
                v52.state.isOpened = v1._widgetState(v52, "isOpened", true);
            end;
        end, 
        UpdateState = function(v53) --[[ Line: 290 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v10 (copy)
            local l_Instance_2 = v53.Instance;
            local l_ChildContainer_0 = v53.ChildContainer;
            if v53.state.isOpened.lastChangeTick == v1._cycleTick then
                if v53.state.isOpened.value == true then
                    v53.lastOpenedTick = v1._cycleTick + 1;
                    local l_parentWidget_0 = v53.parentWidget;
                    local l_Index_1 = v53.Index;
                    if l_parentWidget_0.state.index.value <= 0 then
                        l_parentWidget_0.state.index:set(l_Index_1);
                    end;
                    l_Instance_2.Visible = true;
                else
                    v53.lastClosedTick = v1._cycleTick + 1;
                    v10(v53.parentWidget, v53.Index);
                    l_Instance_2.Visible = false;
                end;
            end;
            if v53.state.index.lastChangeTick == v1._cycleTick then
                if v53.state.index.value == v53.Index then
                    v53.ButtonColors.Color = v1._config.TabActiveColor;
                    v53.ButtonColors.Transparency = v1._config.TabActiveTransparency;
                    l_Instance_2.BackgroundColor3 = v1._config.TabActiveColor;
                    l_Instance_2.BackgroundTransparency = v1._config.TabActiveTransparency;
                    l_ChildContainer_0.Visible = true;
                    v53.lastSelectedTick = v1._cycleTick + 1;
                    return;
                else
                    v53.ButtonColors.Color = v1._config.TabColor;
                    v53.ButtonColors.Transparency = v1._config.TabTransparency;
                    l_Instance_2.BackgroundColor3 = v1._config.TabColor;
                    l_Instance_2.BackgroundTransparency = v1._config.TabTransparency;
                    l_ChildContainer_0.Visible = false;
                    v53.lastUnselectedTick = v1._cycleTick + 1;
                end;
            end;
        end, 
        Discard = function(v58) --[[ Line: 324 ]] --[[ Name: Discard ]]
            -- upvalues: v10 (copy), v2 (copy)
            if v58.state.isOpened.value == true then
                v10(v58.parentWidget, v58.Index);
            end;
            v58.Instance:Destroy();
            v58.ChildContainer:Destroy();
            v2.discardState(v58);
        end
    });
end;