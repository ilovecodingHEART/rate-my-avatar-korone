-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x1, if-expr -> __2021_if x1, compound-assign x0, shims: __2021_find, __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v3 = false;
    local v4 = nil;
    local v5 = {};
    local function v11(v6) --[[ Line: 8 ]] --[[ Name: EmptyMenuStack ]]
        -- upvalues: v5 (copy), v1 (copy), v3 (ref), v4 (ref)
        local v7 = #v5;
        local v8 = v6 and v6 + 1 or 1;
        for v9 = v7, v8, -1 do
            local v10 = v5[v9];
            v10.state.isOpened:set(false);
            v10.Instance.BackgroundColor3 = v1._config.HeaderColor;
            v10.Instance.BackgroundTransparency = 1;
            table.remove(v5, v9);
        end;
        if #v5 == 0 then
            v3 = false;
            v4 = nil;
        end;
    end;
    local function v24(v12) --[[ Line: 25 ]] --[[ Name: UpdateChildContainerTransform ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v13 = v12.parentWidget.type == "Menu";
        local l_Instance_0 = v12.Instance;
        local l_ChildContainer_0 = v12.ChildContainer;
        l_ChildContainer_0.Size = UDim2.fromOffset(l_Instance_0.AbsoluteSize.X, 0);
        if l_ChildContainer_0.Parent == nil then
            return;
        else
            local v16 = l_Instance_0.AbsolutePosition - v2.GuiOffset;
            local l_AbsoluteSize_0 = l_Instance_0.AbsoluteSize;
            local l_AbsoluteSize_1 = l_ChildContainer_0.AbsoluteSize;
            local l_PopupBorderSize_0 = v1._config.PopupBorderSize;
            local l_AbsoluteSize_2 = l_ChildContainer_0.Parent.AbsoluteSize;
            local l_X_0 = v16.X;
            local v22 = nil;
            local l_zero_0 = Vector2.zero;
            if v13 then
                if v16.X + l_AbsoluteSize_1.X > l_AbsoluteSize_2.X then
                    l_zero_0 = Vector2.xAxis;
                else
                    l_X_0 = v16.X + l_AbsoluteSize_0.X;
                end;
            end;
            if v16.Y + l_AbsoluteSize_1.Y > l_AbsoluteSize_2.Y then
                v22 = v16.Y - l_PopupBorderSize_0 + (v13 and l_AbsoluteSize_0.Y or 0);
                l_zero_0 = l_zero_0 + Vector2.yAxis;
            else
                v22 = v16.Y + l_PopupBorderSize_0 + (v13 and 0 or l_AbsoluteSize_0.Y);
            end;
            l_ChildContainer_0.Position = UDim2.fromOffset(l_X_0, v22);
            l_ChildContainer_0.AnchorPoint = l_zero_0;
            return;
        end;
    end;
    v2.registerEvent("InputBegan", function(v25) --[[ Line: 65 ]]
        -- upvalues: v1 (copy), v3 (ref), v4 (ref), v2 (copy), v5 (copy), v11 (copy)
        if not v1._started then
            return;
        elseif v25.UserInputType ~= Enum.UserInputType.MouseButton1 and v25.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        elseif v3 == false then
            return;
        elseif v4 == nil then
            return;
        else
            local v26 = false;
            local v27 = v2.getMouseLocation();
            for _, v29 in pairs(v5) --[[ 2021 ]] do
                for _, v31 in {
                    v29.ChildContainer, 
                    v29.Instance
                } do
                    local v32 = v31.AbsolutePosition - v2.GuiOffset;
                    local v33 = v32 + v31.AbsoluteSize;
                    if v2.isPosInsideRect(v27, v32, v33) then
                        v26 = true;
                        break;
                    end;
                end;
                if v26 then
                    break;
                end;
            end;
            if not v26 then
                v11();
            end;
            return;
        end;
    end);
    v1.WidgetConstructor("MenuBar", {
        hasState = false, 
        hasChildren = true, 
        Args = {}, 
        Events = {}, 
        Generate = function(v34) --[[ Line: 107 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_MenuBar";
            l_Frame_0.Size = UDim2.fromScale(1, 0);
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.BackgroundColor3 = v1._config.MenubarBgColor;
            l_Frame_0.BackgroundTransparency = v1._config.MenubarBgTransparency;
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.LayoutOrder = v34.ZIndex;
            l_Frame_0.ClipsDescendants = true;
            v2.UIPadding(l_Frame_0, Vector2.new(v1._config.WindowPadding.X, 1));
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new()).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyFrameStyle(l_Frame_0, true, true);
            return l_Frame_0;
        end, 
        Update = function(_) --[[ Line: 124 ]] --[[ Name: Update ]]

        end, 
        ChildAdded = function(v37, _) --[[ Line: 127 ]] --[[ Name: ChildAdded ]]
            return v37.Instance;
        end, 
        Discard = function(v39) --[[ Line: 130 ]] --[[ Name: Discard ]]
            v39.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("Menu", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            Text = 1
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v40) --[[ Line: 143 ]]
                return v40.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v41) --[[ Line: 146 ]]
                return v41.Instance;
            end), 
            opened = {
                Init = function(_) --[[ Line: 150 ]]

                end, 
                Get = function(v43) --[[ Line: 151 ]]
                    -- upvalues: v1 (copy)
                    return v43.lastOpenedTick == v1._cycleTick;
                end
            }, 
            closed = {
                Init = function(_) --[[ Line: 156 ]]

                end, 
                Get = function(v45) --[[ Line: 157 ]]
                    -- upvalues: v1 (copy)
                    return v45.lastClosedTick == v1._cycleTick;
                end
            }
        }, 
        Generate = function(v46) --[[ Line: 162 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v5 (copy), v3 (ref), v4 (ref), v11 (copy)
            local v47 = nil;
            v46.ButtonColors = {
                Color = v1._config.HeaderColor, 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderHoveredColor, 
                ActiveTransparency = v1._config.HeaderHoveredTransparency
            };
            if v46.parentWidget.type == "Menu" then
                v47 = Instance.new("TextButton");
                v47.Name = "Menu";
                v47.BackgroundColor3 = v1._config.HeaderColor;
                v47.BackgroundTransparency = 1;
                v47.BorderSizePixel = 0;
                v47.Size = UDim2.fromScale(1, 0);
                v47.Text = "";
                v47.AutomaticSize = Enum.AutomaticSize.Y;
                v47.LayoutOrder = v46.ZIndex;
                v47.AutoButtonColor = false;
                local v48 = v2.UIPadding(v47, v1._config.FramePadding);
                v48.PaddingTop = v48.PaddingTop - UDim.new(0, 1);
                v2.UIListLayout(v47, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Name = "TextLabel";
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.BorderSizePixel = 0;
                l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
                v2.applyTextStyle(l_TextLabel_0);
                l_TextLabel_0.Parent = v47;
                local v50 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                local v51 = v50 - __2021_round(v50 * 0.2) * 2;
                local l_ImageLabel_0 = Instance.new("ImageLabel");
                l_ImageLabel_0.Name = "Icon";
                l_ImageLabel_0.Size = UDim2.fromOffset(v51, v51);
                l_ImageLabel_0.BackgroundTransparency = 1;
                l_ImageLabel_0.BorderSizePixel = 0;
                l_ImageLabel_0.ImageColor3 = v1._config.TextColor;
                l_ImageLabel_0.ImageTransparency = v1._config.TextTransparency;
                l_ImageLabel_0.Image = v2.ICONS.RIGHT_POINTING_TRIANGLE;
                l_ImageLabel_0.LayoutOrder = 1;
                l_ImageLabel_0.Parent = v47;
            else
                v47 = Instance.new("TextButton");
                v47.Name = "Menu";
                v47.AutomaticSize = Enum.AutomaticSize.XY;
                v47.Size = UDim2.fromScale(0, 0);
                v47.BackgroundColor3 = v1._config.HeaderColor;
                v47.BackgroundTransparency = 1;
                v47.BorderSizePixel = 0;
                v47.Text = "";
                v47.LayoutOrder = v46.ZIndex;
                v47.AutoButtonColor = false;
                v47.ClipsDescendants = true;
                v2.applyTextStyle(v47);
                v2.UIPadding(v47, Vector2.new(v1._config.ItemSpacing.X, v1._config.FramePadding.Y));
            end;
            v2.applyInteractionHighlights("Background", v47, v47, v46.ButtonColors);
            v2.applyButtonClick(v47, function() --[[ Line: 232 ]]
                -- upvalues: v5 (ref), v46 (copy), v3 (ref), v4 (ref)
                local v53 = #v5 > 1 or not v46.state.isOpened.value;
                v46.state.isOpened:set(v53);
                v3 = v53;
                v4 = v53 and v46 or nil;
                if #v5 <= 1 then
                    if v53 then
                        table.insert(v5, v46);
                        return;
                    else
                        table.remove(v5);
                    end;
                end;
            end);
            v2.applyMouseEnter(v47, function() --[[ Line: 248 ]]
                -- upvalues: v3 (ref), v4 (ref), v46 (copy), v5 (ref), v11 (ref)
                if v3 and v4 and v4 ~= v46 then
                    local l_parentWidget_0 = v46.parentWidget;
                    local v55 = __2021_find(v5, l_parentWidget_0);
                    v11(v55);
                    v46.state.isOpened:set(true);
                    v4 = v46;
                    v3 = true;
                    table.insert(v5, v46);
                end;
            end);
            local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
            l_ScrollingFrame_0.Name = "MenuContainer";
            l_ScrollingFrame_0.BackgroundColor3 = v1._config.PopupBgColor;
            l_ScrollingFrame_0.BackgroundTransparency = v1._config.PopupBgTransparency;
            l_ScrollingFrame_0.BorderSizePixel = 0;
            l_ScrollingFrame_0.Size = UDim2.fromOffset(0, 0);
            l_ScrollingFrame_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            l_ScrollingFrame_0.ScrollBarImageTransparency = v1._config.ScrollbarGrabTransparency;
            l_ScrollingFrame_0.ScrollBarImageColor3 = v1._config.ScrollbarGrabColor;
            l_ScrollingFrame_0.ScrollBarThickness = v1._config.ScrollbarSize;
            l_ScrollingFrame_0.CanvasSize = UDim2.fromScale(0, 0);
            l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
            l_ScrollingFrame_0.TopImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.MidImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.BottomImage = v2.ICONS.BLANK_SQUARE;
            l_ScrollingFrame_0.ZIndex = 6;
            l_ScrollingFrame_0.LayoutOrder = 6;
            l_ScrollingFrame_0.ClipsDescendants = true;
            v2.UIStroke(l_ScrollingFrame_0, v1._config.WindowBorderSize, v1._config.BorderColor, v1._config.BorderTransparency);
            v2.UIPadding(l_ScrollingFrame_0, Vector2.new(2, v1._config.WindowPadding.Y - v1._config.ItemSpacing.Y));
            v2.UIListLayout(l_ScrollingFrame_0, Enum.FillDirection.Vertical, UDim.new(0, 1)).VerticalAlignment = Enum.VerticalAlignment.Top;
            l_ScrollingFrame_0.Parent = v1._rootInstance and v1._rootInstance:FindFirstChild("PopupScreenGui");
            v46.ChildContainer = l_ScrollingFrame_0;
            return v47;
        end, 
        Update = function(v57) --[[ Line: 301 ]] --[[ Name: Update ]]
            local l_Instance_1 = v57.Instance;
            local _ = nil;
            (__2021_if(function() return v57.parentWidget.type == "Menu" end, function() return l_Instance_1.TextLabel end, function() return l_Instance_1 end)).Text = v57.arguments.Text or "Menu";
        end, 
        ChildAdded = function(v60, _) --[[ Line: 311 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v24 (copy)
            v24(v60);
            return v60.ChildContainer;
        end, 
        ChildDiscarded = function(v62, _) --[[ Line: 315 ]] --[[ Name: ChildDiscarded ]]
            -- upvalues: v24 (copy)
            v24(v62);
        end, 
        GenerateState = function(v64) --[[ Line: 318 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v64.state.isOpened == nil then
                v64.state.isOpened = v1._widgetState(v64, "isOpened", false);
            end;
        end, 
        UpdateState = function(v65) --[[ Line: 323 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v24 (copy)
            local l_ChildContainer_1 = v65.ChildContainer;
            if v65.state.isOpened.value then
                v65.lastOpenedTick = v1._cycleTick + 1;
                v65.ButtonColors.Transparency = v1._config.HeaderTransparency;
                l_ChildContainer_1.Visible = true;
                v24(v65);
                return;
            else
                v65.lastClosedTick = v1._cycleTick + 1;
                v65.ButtonColors.Transparency = 1;
                l_ChildContainer_1.Visible = false;
                return;
            end;
        end, 
        Discard = function(v67) --[[ Line: 338 ]] --[[ Name: Discard ]]
            -- upvalues: v3 (ref), v5 (copy), v11 (copy), v4 (ref), v2 (copy)
            if v3 then
                local l_parentWidget_1 = v67.parentWidget;
                local v69 = __2021_find(v5, l_parentWidget_1);
                if v69 then
                    v11(v69);
                    if #v5 ~= 0 then
                        v4 = l_parentWidget_1;
                        v3 = true;
                    end;
                end;
            end;
            v67.Instance:Destroy();
            v67.ChildContainer:Destroy();
            v2.discardState(v67);
        end
    });
    v1.WidgetConstructor("MenuItem", {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            KeyCode = 2, 
            ModifierKey = 3
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v70) --[[ Line: 368 ]]
                return v70.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v71) --[[ Line: 371 ]]
                return v71.Instance;
            end)
        }, 
        Generate = function(v72) --[[ Line: 375 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy), v11 (copy), v3 (ref), v4 (ref), v5 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "MenuItem";
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Size = UDim2.fromScale(1, 0);
            l_TextButton_0.Text = "";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_0.LayoutOrder = v72.ZIndex;
            l_TextButton_0.AutoButtonColor = false;
            local v74 = v2.UIPadding(l_TextButton_0, v1._config.FramePadding);
            v74.PaddingTop = v74.PaddingTop - UDim.new(0, 1);
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_TextButton_0, {
                Color = v1._config.HeaderColor, 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderHoveredColor, 
                ActiveTransparency = v1._config.HeaderHoveredTransparency
            });
            v2.applyButtonClick(l_TextButton_0, function() --[[ Line: 399 ]]
                -- upvalues: v11 (ref)
                v11();
            end);
            v2.applyMouseEnter(l_TextButton_0, function() --[[ Line: 403 ]]
                -- upvalues: v72 (copy), v3 (ref), v4 (ref), v5 (ref), v11 (ref)
                local l_parentWidget_2 = v72.parentWidget;
                if v3 and v4 and v4 ~= l_parentWidget_2 then
                    local v76 = __2021_find(v5, l_parentWidget_2);
                    v11(v76);
                    v4 = l_parentWidget_2;
                    v3 = true;
                end;
            end);
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "TextLabel";
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_1);
            l_TextLabel_1.Parent = l_TextButton_0;
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "Shortcut";
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            l_TextLabel_2.LayoutOrder = 1;
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_2);
            l_TextLabel_2.Text = "";
            l_TextLabel_2.TextColor3 = v1._config.TextDisabledColor;
            l_TextLabel_2.TextTransparency = v1._config.TextDisabledTransparency;
            l_TextLabel_2.Parent = l_TextButton_0;
            return l_TextButton_0;
        end, 
        Update = function(v79) --[[ Line: 441 ]] --[[ Name: Update ]]
            local l_Instance_2 = v79.Instance;
            local l_TextLabel_3 = l_Instance_2.TextLabel;
            local l_Shortcut_0 = l_Instance_2.Shortcut;
            l_TextLabel_3.Text = v79.arguments.Text;
            if v79.arguments.KeyCode then
                if v79.arguments.ModifierKey then
                    l_Shortcut_0.Text = v79.arguments.ModifierKey.Name .. " + " .. v79.arguments.KeyCode.Name;
                    return;
                else
                    l_Shortcut_0.Text = v79.arguments.KeyCode.Name;
                end;
            end;
        end, 
        Discard = function(v83) --[[ Line: 455 ]] --[[ Name: Discard ]]
            v83.Instance:Destroy();
        end
    });
    v1.WidgetConstructor("MenuToggle", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            KeyCode = 2, 
            ModifierKey = 3
        }, 
        Events = {
            checked = {
                Init = function(_) --[[ Line: 471 ]]

                end, 
                Get = function(v85) --[[ Line: 472 ]]
                    -- upvalues: v1 (copy)
                    return v85.lastCheckedTick == v1._cycleTick;
                end
            }, 
            unchecked = {
                Init = function(_) --[[ Line: 477 ]]

                end, 
                Get = function(v87) --[[ Line: 478 ]]
                    -- upvalues: v1 (copy)
                    return v87.lastUncheckedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v88) --[[ Line: 482 ]]
                return v88.Instance;
            end)
        }, 
        Generate = function(v89) --[[ Line: 486 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy), v11 (copy), v3 (ref), v4 (ref), v5 (copy)
            local l_TextButton_1 = Instance.new("TextButton");
            l_TextButton_1.Name = "MenuItem";
            l_TextButton_1.BackgroundTransparency = 1;
            l_TextButton_1.BorderSizePixel = 0;
            l_TextButton_1.Size = UDim2.fromScale(1, 0);
            l_TextButton_1.Text = "";
            l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextButton_1.LayoutOrder = v89.ZIndex;
            l_TextButton_1.AutoButtonColor = false;
            local v91 = v2.UIPadding(l_TextButton_1, v1._config.FramePadding);
            v91.PaddingTop = v91.PaddingTop - UDim.new(0, 1);
            v2.UIListLayout(l_TextButton_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            v2.applyInteractionHighlights("Background", l_TextButton_1, l_TextButton_1, {
                Color = v1._config.HeaderColor, 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderHoveredColor, 
                ActiveTransparency = v1._config.HeaderHoveredTransparency
            });
            v2.applyButtonClick(l_TextButton_1, function() --[[ Line: 510 ]]
                -- upvalues: v89 (copy), v11 (ref)
                local l_value_0 = v89.state.isChecked.value;
                v89.state.isChecked:set(not l_value_0);
                v11();
            end);
            v2.applyMouseEnter(l_TextButton_1, function() --[[ Line: 516 ]]
                -- upvalues: v89 (copy), v3 (ref), v4 (ref), v5 (ref), v11 (ref)
                local l_parentWidget_3 = v89.parentWidget;
                if v3 and v4 and v4 ~= l_parentWidget_3 then
                    local v94 = __2021_find(v5, l_parentWidget_3);
                    v11(v94);
                    v4 = l_parentWidget_3;
                    v3 = true;
                end;
            end);
            local l_TextLabel_4 = Instance.new("TextLabel");
            l_TextLabel_4.Name = "TextLabel";
            l_TextLabel_4.BackgroundTransparency = 1;
            l_TextLabel_4.BorderSizePixel = 0;
            l_TextLabel_4.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_4);
            l_TextLabel_4.Parent = l_TextButton_1;
            local l_TextLabel_5 = Instance.new("TextLabel");
            l_TextLabel_5.Name = "Shortcut";
            l_TextLabel_5.BackgroundTransparency = 1;
            l_TextLabel_5.BorderSizePixel = 0;
            l_TextLabel_5.LayoutOrder = 1;
            l_TextLabel_5.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextLabel_5);
            l_TextLabel_5.Text = "";
            l_TextLabel_5.TextColor3 = v1._config.TextDisabledColor;
            l_TextLabel_5.TextTransparency = v1._config.TextDisabledTransparency;
            l_TextLabel_5.Parent = l_TextButton_1;
            local v97 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local v98 = v97 - __2021_round(v97 * 0.2) * 2;
            local l_ImageLabel_1 = Instance.new("ImageLabel");
            l_ImageLabel_1.Name = "Icon";
            l_ImageLabel_1.Size = UDim2.fromOffset(v98, v98);
            l_ImageLabel_1.BackgroundTransparency = 1;
            l_ImageLabel_1.BorderSizePixel = 0;
            l_ImageLabel_1.ImageColor3 = v1._config.TextColor;
            l_ImageLabel_1.ImageTransparency = v1._config.TextTransparency;
            l_ImageLabel_1.Image = v2.ICONS.CHECK_MARK;
            l_ImageLabel_1.LayoutOrder = 2;
            l_ImageLabel_1.Parent = l_TextButton_1;
            return l_TextButton_1;
        end, 
        GenerateState = function(v100) --[[ Line: 570 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v100.state.isChecked == nil then
                v100.state.isChecked = v1._widgetState(v100, "isChecked", false);
            end;
        end, 
        Update = function(v101) --[[ Line: 575 ]] --[[ Name: Update ]]
            local l_Instance_3 = v101.Instance;
            local l_TextLabel_6 = l_Instance_3.TextLabel;
            local l_Shortcut_1 = l_Instance_3.Shortcut;
            l_TextLabel_6.Text = v101.arguments.Text;
            if v101.arguments.KeyCode then
                if v101.arguments.ModifierKey then
                    l_Shortcut_1.Text = v101.arguments.ModifierKey.Name .. " + " .. v101.arguments.KeyCode.Name;
                    return;
                else
                    l_Shortcut_1.Text = v101.arguments.KeyCode.Name;
                end;
            end;
        end, 
        UpdateState = function(v105) --[[ Line: 589 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Icon_0 = v105.Instance.Icon;
            if v105.state.isChecked.value then
                l_Icon_0.Image = v2.ICONS.CHECK_MARK;
                v105.lastCheckedTick = v1._cycleTick + 1;
                return;
            else
                l_Icon_0.Image = "";
                v105.lastUncheckedTick = v1._cycleTick + 1;
                return;
            end;
        end, 
        Discard = function(v107) --[[ Line: 601 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v107.Instance:Destroy();
            v2.discardState(v107);
        end
    });
end;