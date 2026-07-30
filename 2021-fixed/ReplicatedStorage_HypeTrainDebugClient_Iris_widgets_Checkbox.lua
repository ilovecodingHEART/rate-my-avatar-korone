-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("Checkbox", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1
        }, 
        Events = {
            checked = {
                Init = function(_) --[[ Line: 13 ]]

                end, 
                Get = function(v4) --[[ Line: 14 ]]
                    -- upvalues: v1 (copy)
                    return v4.lastCheckedTick == v1._cycleTick;
                end
            }, 
            unchecked = {
                Init = function(_) --[[ Line: 19 ]]

                end, 
                Get = function(v6) --[[ Line: 20 ]]
                    -- upvalues: v1 (copy)
                    return v6.lastUncheckedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 24 ]]
                return v7.Instance;
            end)
        }, 
        Generate = function(v8) --[[ Line: 28 ]] --[[ Name: Generate ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Name = "Iris_Checkbox";
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.BackgroundTransparency = 1;
            l_TextButton_0.BorderSizePixel = 0;
            l_TextButton_0.Text = "";
            l_TextButton_0.AutoButtonColor = false;
            l_TextButton_0.ZIndex = v8.ZIndex;
            l_TextButton_0.LayoutOrder = v8.ZIndex;
            v2.UIListLayout(l_TextButton_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local v10 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Box";
            l_Frame_0.Size = UDim2.fromOffset(v10, v10);
            l_Frame_0.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_0.BackgroundTransparency = v1._config.FrameBgTransparency;
            v2.applyFrameStyle(l_Frame_0, true);
            v2.UIPadding(l_Frame_0, Vector2.new(math.floor(v10 / 10), (math.floor(v10 / 10))));
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_Frame_0, {
                Color = v1._config.FrameBgColor, 
                Transparency = v1._config.FrameBgTransparency, 
                HoveredColor = v1._config.FrameBgHoveredColor, 
                HoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                ActiveColor = v1._config.FrameBgActiveColor, 
                ActiveTransparency = v1._config.FrameBgActiveTransparency
            });
            l_Frame_0.Parent = l_TextButton_0;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            l_ImageLabel_0.Name = "Checkmark";
            l_ImageLabel_0.Size = UDim2.fromScale(1, 1);
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.ImageColor3 = v1._config.CheckMarkColor;
            l_ImageLabel_0.ImageTransparency = v1._config.CheckMarkTransparency;
            l_ImageLabel_0.ScaleType = Enum.ScaleType.Fit;
            l_ImageLabel_0.Parent = l_Frame_0;
            v2.applyButtonClick(l_TextButton_0, function() --[[ Line: 75 ]]
                -- upvalues: v8 (copy)
                local l_value_0 = v8.state.isChecked.value;
                v8.state.isChecked:set(not l_value_0);
            end);
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "TextLabel";
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.BorderSizePixel = 0;
            l_TextLabel_0.LayoutOrder = 1;
            v2.applyTextStyle(l_TextLabel_0);
            l_TextLabel_0.Parent = l_TextButton_0;
            return l_TextButton_0;
        end, 
        Update = function(v15) --[[ Line: 92 ]] --[[ Name: Update ]]
            v15.Instance.TextLabel.Text = v15.arguments.Text or "Checkbox";
        end, 
        Discard = function(v16) --[[ Line: 96 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v16.Instance:Destroy();
            v2.discardState(v16);
        end, 
        GenerateState = function(v17) --[[ Line: 100 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v17.state.isChecked == nil then
                v17.state.isChecked = v1._widgetState(v17, "checked", false);
            end;
        end, 
        UpdateState = function(v18) --[[ Line: 105 ]] --[[ Name: UpdateState ]]
            -- upvalues: v2 (copy), v1 (copy)
            local l_Checkmark_0 = v18.Instance.Box.Checkmark;
            if v18.state.isChecked.value then
                l_Checkmark_0.Image = v2.ICONS.CHECK_MARK;
                v18.lastCheckedTick = v1._cycleTick + 1;
                return;
            else
                l_Checkmark_0.Image = "";
                v18.lastUncheckedTick = v1._cycleTick + 1;
                return;
            end;
        end
    });
end;