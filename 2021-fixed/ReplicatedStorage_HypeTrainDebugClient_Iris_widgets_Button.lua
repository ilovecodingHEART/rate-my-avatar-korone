-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v13 = {
        hasState = false, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Size = 2
        }, 
        Events = {
            clicked = v2.EVENTS.click(function(v3) --[[ Line: 12 ]]
                return v3.Instance;
            end), 
            rightClicked = v2.EVENTS.rightClick(function(v4) --[[ Line: 15 ]]
                return v4.Instance;
            end), 
            doubleClicked = v2.EVENTS.doubleClick(function(v5) --[[ Line: 18 ]]
                return v5.Instance;
            end), 
            ctrlClicked = v2.EVENTS.ctrlClick(function(v6) --[[ Line: 21 ]]
                return v6.Instance;
            end), 
            hovered = v2.EVENTS.hover(function(v7) --[[ Line: 24 ]]
                return v7.Instance;
            end)
        }, 
        Generate = function(v8) --[[ Line: 28 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_TextButton_0 = Instance.new("TextButton");
            l_TextButton_0.Size = UDim2.fromOffset(0, 0);
            l_TextButton_0.BackgroundColor3 = v1._config.ButtonColor;
            l_TextButton_0.BackgroundTransparency = v1._config.ButtonTransparency;
            l_TextButton_0.AutoButtonColor = false;
            l_TextButton_0.AutomaticSize = Enum.AutomaticSize.XY;
            v2.applyTextStyle(l_TextButton_0);
            l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Center;
            v2.applyFrameStyle(l_TextButton_0);
            v2.applyInteractionHighlights("Background", l_TextButton_0, l_TextButton_0, {
                Color = v1._config.ButtonColor, 
                Transparency = v1._config.ButtonTransparency, 
                HoveredColor = v1._config.ButtonHoveredColor, 
                HoveredTransparency = v1._config.ButtonHoveredTransparency, 
                ActiveColor = v1._config.ButtonActiveColor, 
                ActiveTransparency = v1._config.ButtonActiveTransparency
            });
            l_TextButton_0.ZIndex = v8.ZIndex;
            l_TextButton_0.LayoutOrder = v8.ZIndex;
            return l_TextButton_0;
        end, 
        Update = function(v10) --[[ Line: 55 ]] --[[ Name: Update ]]
            local l_Instance_0 = v10.Instance;
            l_Instance_0.Text = v10.arguments.Text or "Button";
            l_Instance_0.Size = v10.arguments.Size or UDim2.fromOffset(0, 0);
        end, 
        Discard = function(v12) --[[ Line: 60 ]] --[[ Name: Discard ]]
            v12.Instance:Destroy();
        end
    };
    v2.abstractButton = v13;
    v1.WidgetConstructor("Button", v2.extend(v13, {
        Generate = function(v14) --[[ Line: 68 ]] --[[ Name: Generate ]]
            -- upvalues: v13 (copy)
            local v15 = v13.Generate(v14);
            v15.Name = "Iris_Button";
            return v15;
        end
    }));
    v1.WidgetConstructor("SmallButton", v2.extend(v13, {
        Generate = function(v16) --[[ Line: 79 ]] --[[ Name: Generate ]]
            -- upvalues: v13 (copy)
            local v17 = v13.Generate(v16);
            v17.Name = "Iris_SmallButton";
            local l_UIPadding_0 = v17.UIPadding;
            l_UIPadding_0.PaddingLeft = UDim.new(0, 2);
            l_UIPadding_0.PaddingRight = UDim.new(0, 2);
            l_UIPadding_0.PaddingTop = UDim.new(0, 0);
            l_UIPadding_0.PaddingBottom = UDim.new(0, 0);
            return v17;
        end
    }));
end;