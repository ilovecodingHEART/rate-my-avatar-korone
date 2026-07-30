-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x1, compound-assign x0
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
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    v1.WidgetConstructor("ProgressBar", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Format = 2
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v3) --[[ Line: 13 ]]
                return v3.Instance;
            end), 
            changed = {
                Init = function(_) --[[ Line: 17 ]]

                end, 
                Get = function(v5) --[[ Line: 18 ]]
                    -- upvalues: v1 (copy)
                    return v5.lastChangedTick == v1._cycleTick;
                end
            }
        }, 
        Generate = function(v6) --[[ Line: 23 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Name = "Iris_ProgressBar";
            l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_0.LayoutOrder = v6.ZIndex;
            v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.Name = "Bar";
            l_Frame_1.Size = UDim2.new(v1._config.ContentWidth, v1._config.ContentHeight);
            l_Frame_1.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_1.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_Frame_1.BorderSizePixel = 0;
            l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_1.ClipsDescendants = true;
            v2.applyFrameStyle(l_Frame_1, true);
            l_Frame_1.Parent = l_Frame_0;
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = "Progress";
            l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextLabel_0.Size = UDim2.new(UDim.new(0, 0), v1._config.ContentHeight);
            l_TextLabel_0.BackgroundColor3 = v1._config.PlotHistogramColor;
            l_TextLabel_0.BackgroundTransparency = v1._config.PlotHistogramTransparency;
            l_TextLabel_0.BorderSizePixel = 0;
            v2.applyTextStyle(l_TextLabel_0);
            v2.UIPadding(l_TextLabel_0, v1._config.FramePadding);
            v2.UICorner(l_TextLabel_0, v1._config.FrameRounding);
            l_TextLabel_0.Text = "";
            l_TextLabel_0.Parent = l_Frame_1;
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Name = "Value";
            l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_1.Size = UDim2.new(UDim.new(0, 0), v1._config.ContentHeight);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.BorderSizePixel = 0;
            l_TextLabel_1.ZIndex = 1;
            v2.applyTextStyle(l_TextLabel_1);
            v2.UIPadding(l_TextLabel_1, v1._config.FramePadding);
            l_TextLabel_1.Parent = l_Frame_1;
            local l_TextLabel_2 = Instance.new("TextLabel");
            l_TextLabel_2.Name = "TextLabel";
            l_TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_2.AnchorPoint = Vector2.new(0, 0.5);
            l_TextLabel_2.BackgroundTransparency = 1;
            l_TextLabel_2.BorderSizePixel = 0;
            l_TextLabel_2.LayoutOrder = 1;
            v2.applyTextStyle(l_TextLabel_2);
            v2.UIPadding(l_TextLabel_1, v1._config.FramePadding);
            l_TextLabel_2.Parent = l_Frame_0;
            return l_Frame_0;
        end, 
        GenerateState = function(v12) --[[ Line: 90 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v12.state.progress == nil then
                v12.state.progress = v1._widgetState(v12, "Progress", 0);
            end;
        end, 
        Update = function(v13) --[[ Line: 95 ]] --[[ Name: Update ]]
            local l_Instance_0 = v13.Instance;
            local l_TextLabel_3 = l_Instance_0.TextLabel;
            local l_Value_0 = l_Instance_0.Bar.Value;
            if v13.arguments.Format ~= nil and typeof(v13.arguments.Format) == "string" then
                l_Value_0.Text = v13.arguments.Format;
            end;
            l_TextLabel_3.Text = v13.arguments.Text or "Progress Bar";
        end, 
        UpdateState = function(v17) --[[ Line: 107 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy)
            local l_Bar_0 = v17.Instance.Bar;
            local l_Progress_0 = l_Bar_0.Progress;
            local l_Value_1 = l_Bar_0.Value;
            local v21 = math.clamp(v17.state.progress.value, 0, 1);
            local l_X_0 = l_Bar_0.AbsoluteSize.X;
            if l_Value_1.AbsoluteSize.X > l_X_0 * (1 - v21) then
                l_Value_1.AnchorPoint = Vector2.xAxis;
                l_Value_1.Position = UDim2.fromScale(1, 0);
            else
                l_Value_1.AnchorPoint = Vector2.zero;
                l_Value_1.Position = UDim2.new(v21, 0, 0, 0);
            end;
            l_Progress_0.Size = UDim2.new(UDim.new(v21, 0), l_Progress_0.Size.Height);
            if v17.arguments.Format ~= nil and typeof(v17.arguments.Format) == "string" then
                l_Value_1.Text = v17.arguments.Format;
            else
                l_Value_1.Text = string.format("%d%%", v21 * 100);
            end;
            v17.lastChangedTick = v1._cycleTick + 1;
        end, 
        Discard = function(v23) --[[ Line: 133 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v23.Instance:Destroy();
            v2.discardState(v23);
        end
    });
    local function _(v24, v25) --[[ Line: 139 ]] --[[ Name: createLine ]]
        -- upvalues: v1 (copy)
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Name = tostring(v25);
        l_Frame_2.AnchorPoint = Vector2.new(0.5, 0.5);
        l_Frame_2.BackgroundColor3 = v1._config.PlotLinesColor;
        l_Frame_2.BackgroundTransparency = v1._config.PlotLinesTransparency;
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.Parent = v24;
        return l_Frame_2;
    end;
    local function _(v28) --[[ Line: 152 ]] --[[ Name: clearLine ]]
        -- upvalues: v1 (copy)
        if v28.HoveredLine then
            v28.HoveredLine.BackgroundColor3 = v1._config.PlotLinesColor;
            v28.HoveredLine.BackgroundTransparency = v1._config.PlotLinesTransparency;
            v28.HoveredLine = false;
            v28.state.hovered:set(nil);
        end;
    end;
    local function v39(v30, v31) --[[ Line: 161 ]] --[[ Name: updateLine ]]
        -- upvalues: v2 (copy), v1 (copy)
        local l_Plot_0 = v30.Instance.Background.Plot;
        local v33 = v2.getMouseLocation();
        local v34 = l_Plot_0.AbsolutePosition - v2.GuiOffset;
        local v35 = math.ceil((v33.X - v34.X) / l_Plot_0.AbsoluteSize.X * #v30.Lines);
        local v36 = v30.Lines[v35];
        if v36 then
            if v36 ~= v30.HoveredLine and not v31 and v30.HoveredLine then
                v30.HoveredLine.BackgroundColor3 = v1._config.PlotLinesColor;
                v30.HoveredLine.BackgroundTransparency = v1._config.PlotLinesTransparency;
                v30.HoveredLine = false;
                v30.state.hovered:set(nil);
            end;
            local v37 = v30.state.values.value[v35];
            local v38 = v30.state.values.value[v35 + 1];
            if v37 and v38 then
                if math.floor(v37) == v37 and math.floor(v38) == v38 then
                    v30.Tooltip.Text = ("%d: %d\n%d: %d"):format(v35, v37, v35 + 1, v38);
                else
                    v30.Tooltip.Text = ("%d: %.3f\n%d: %.3f"):format(v35, v37, v35 + 1, v38);
                end;
            end;
            v30.HoveredLine = v36;
            v36.BackgroundColor3 = v1._config.PlotLinesHoveredColor;
            v36.BackgroundTransparency = v1._config.PlotLinesHoveredTransparency;
            if v31 then
                v30.state.hovered.value = {
                    v37, 
                    v38
                };
                return;
            else
                v30.state.hovered:set({
                    v37, 
                    v38
                });
            end;
        end;
    end;
    v1.WidgetConstructor("PlotLines", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Height = 2, 
            Min = 3, 
            Max = 4, 
            TextOverlay = 5
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v40) --[[ Line: 209 ]]
                return v40.Instance;
            end)
        }, 
        Generate = function(v41) --[[ Line: 213 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v39 (copy)
            local l_Frame_3 = Instance.new("Frame");
            l_Frame_3.Name = "Iris_PlotLines";
            l_Frame_3.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
            l_Frame_3.BackgroundTransparency = 1;
            l_Frame_3.BorderSizePixel = 0;
            l_Frame_3.ZIndex = v41.ZIndex;
            l_Frame_3.LayoutOrder = v41.ZIndex;
            v2.UIListLayout(l_Frame_3, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "Background";
            l_Frame_4.Size = UDim2.new(v1._config.ContentWidth, UDim.new(1, 0));
            l_Frame_4.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_4.BackgroundTransparency = v1._config.FrameBgTransparency;
            v2.applyFrameStyle(l_Frame_4);
            l_Frame_4.Parent = l_Frame_3;
            local l_Frame_5 = Instance.new("Frame");
            l_Frame_5.Name = "Plot";
            l_Frame_5.Size = UDim2.fromScale(1, 1);
            l_Frame_5.BackgroundTransparency = 1;
            l_Frame_5.BorderSizePixel = 0;
            l_Frame_5.ClipsDescendants = true;
            l_Frame_5:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 241 ]]
                -- upvalues: v41 (copy), v1 (ref)
                v41.state.values.lastChangeTick = v1._cycleTick;
                v1._widgets.PlotLines.UpdateState(v41);
            end);
            local l_TextLabel_4 = Instance.new("TextLabel");
            l_TextLabel_4.Name = "OverlayText";
            l_TextLabel_4.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_4.AnchorPoint = Vector2.new(0.5, 0);
            l_TextLabel_4.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_4.Position = UDim2.fromScale(0.5, 0);
            l_TextLabel_4.BackgroundTransparency = 1;
            l_TextLabel_4.BorderSizePixel = 0;
            l_TextLabel_4.ZIndex = 2;
            v2.applyTextStyle(l_TextLabel_4);
            l_TextLabel_4.Parent = l_Frame_5;
            local l_TextLabel_5 = Instance.new("TextLabel");
            l_TextLabel_5.Name = "Iris_Tooltip";
            l_TextLabel_5.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_5.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_5.BackgroundColor3 = v1._config.PopupBgColor;
            l_TextLabel_5.BackgroundTransparency = v1._config.PopupBgTransparency;
            l_TextLabel_5.BorderSizePixel = 0;
            l_TextLabel_5.Visible = false;
            v2.applyTextStyle(l_TextLabel_5);
            v2.UIStroke(l_TextLabel_5, v1._config.PopupBorderSize, v1._config.BorderActiveColor, v1._config.BorderActiveTransparency);
            v2.UIPadding(l_TextLabel_5, v1._config.WindowPadding);
            if v1._config.PopupRounding > 0 then
                v2.UICorner(l_TextLabel_5, v1._config.PopupRounding);
            end;
            local v47 = v1._rootInstance and v1._rootInstance:FindFirstChild("PopupScreenGui");
            l_TextLabel_5.Parent = v47 and v47:FindFirstChild("TooltipContainer");
            v41.Tooltip = l_TextLabel_5;
            v2.applyMouseMoved(l_Frame_5, function() --[[ Line: 281 ]]
                -- upvalues: v39 (ref), v41 (copy)
                v39(v41);
            end);
            v2.applyMouseLeave(l_Frame_5, function() --[[ Line: 285 ]]
                -- upvalues: v41 (copy), v1 (ref)
                local l_v41_0 = v41;
                if l_v41_0.HoveredLine then
                    l_v41_0.HoveredLine.BackgroundColor3 = v1._config.PlotLinesColor;
                    l_v41_0.HoveredLine.BackgroundTransparency = v1._config.PlotLinesTransparency;
                    l_v41_0.HoveredLine = false;
                    l_v41_0.state.hovered:set(nil);
                end;
            end);
            l_Frame_5.Parent = l_Frame_4;
            v41.Lines = {};
            v41.HoveredLine = false;
            local l_TextLabel_6 = Instance.new("TextLabel");
            l_TextLabel_6.Name = "TextLabel";
            l_TextLabel_6.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_6.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_6.BackgroundTransparency = 1;
            l_TextLabel_6.BorderSizePixel = 0;
            l_TextLabel_6.ZIndex = v41.ZIndex + 3;
            l_TextLabel_6.LayoutOrder = v41.ZIndex + 3;
            v2.applyTextStyle(l_TextLabel_6);
            l_TextLabel_6.Parent = l_Frame_3;
            return l_Frame_3;
        end, 
        GenerateState = function(v50) --[[ Line: 309 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v50.state.values == nil then
                v50.state.values = v1._widgetState(v50, "values", {
                    0, 
                    1
                });
            end;
            if v50.state.hovered == nil then
                v50.state.hovered = v1._widgetState(v50, "hovered", nil);
            end;
        end, 
        Update = function(v51) --[[ Line: 317 ]] --[[ Name: Update ]]
            local l_Instance_1 = v51.Instance;
            local l_TextLabel_7 = l_Instance_1.TextLabel;
            local l_OverlayText_0 = l_Instance_1.Background.Plot.OverlayText;
            l_TextLabel_7.Text = v51.arguments.Text or "Plot Lines";
            l_OverlayText_0.Text = v51.arguments.TextOverlay or "";
            l_Instance_1.Size = UDim2.new(1, 0, 0, v51.arguments.Height or 0);
        end, 
        UpdateState = function(v55) --[[ Line: 328 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v39 (copy)
            if v55.state.hovered.lastChangeTick == v1._cycleTick then
                if v55.state.hovered.value then
                    v55.Tooltip.Visible = true;
                else
                    v55.Tooltip.Visible = false;
                end;
            end;
            if v55.state.values.lastChangeTick == v1._cycleTick then
                local l_Plot_1 = v55.Instance.Background.Plot;
                local l_value_0 = v55.state.values.value;
                local v58 = #l_value_0 - 1;
                local v59 = #v55.Lines;
                local v60 = v55.arguments.Min or 1e999;
                local v61 = v55.arguments.Max or -1e999;
                if v60 == nil or v61 == nil then
                    for _, v63 in pairs(l_value_0) --[[ 2021 ]] do
                        v60 = math.min(v60, v63);
                        v61 = math.max(v61, v63);
                    end;
                end;
                if v59 < v58 then
                    for v64 = v59 + 1, v58 do
                        local l_Lines_0 = v55.Lines;
                        local l_Frame_6 = Instance.new("Frame");
                        l_Frame_6.Name = tostring(v64);
                        l_Frame_6.AnchorPoint = Vector2.new(0.5, 0.5);
                        l_Frame_6.BackgroundColor3 = v1._config.PlotLinesColor;
                        l_Frame_6.BackgroundTransparency = v1._config.PlotLinesTransparency;
                        l_Frame_6.BorderSizePixel = 0;
                        l_Frame_6.Parent = l_Plot_1;
                        table.insert(l_Lines_0, l_Frame_6);
                    end;
                elseif v58 < v59 then
                    for _ = v58 + 1, v59 do
                        local v68 = table.remove(v55.Lines);
                        if v68 then
                            v68:Destroy();
                        end;
                    end;
                end;
                local v69 = v61 - v60;
                local l_AbsoluteSize_0 = l_Plot_1.AbsoluteSize;
                for v71 = 1, v58 do
                    local v72 = l_value_0[v71];
                    local v73 = l_value_0[v71 + 1];
                    local v74 = l_AbsoluteSize_0 * Vector2.new((v71 - 1) / v58, (v61 - v72) / v69);
                    local v75 = l_AbsoluteSize_0 * Vector2.new(v71 / v58, (v61 - v73) / v69);
                    local v76 = (v74 + v75) / 2;
                    v55.Lines[v71].Size = UDim2.fromOffset((v75 - v74).Magnitude + 1, 1);
                    v55.Lines[v71].Position = UDim2.fromOffset(v76.X, v76.Y);
                    v55.Lines[v71].Rotation = math.atan2(v75.Y - v74.Y, v75.X - v74.X) * 57.29577951308232;
                end;
                if v55.HoveredLine then
                    v39(v55, true);
                end;
            end;
        end, 
        Discard = function(v77) --[[ Line: 391 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v77.Instance:Destroy();
            v77.Tooltip:Destroy();
            v2.discardState(v77);
        end
    });
    local function _(v78, v79) --[[ Line: 398 ]] --[[ Name: createBlock ]]
        -- upvalues: v1 (copy)
        local l_Frame_7 = Instance.new("Frame");
        l_Frame_7.Name = tostring(v79);
        l_Frame_7.BackgroundColor3 = v1._config.PlotHistogramColor;
        l_Frame_7.BackgroundTransparency = v1._config.PlotHistogramTransparency;
        l_Frame_7.BorderSizePixel = 0;
        l_Frame_7.Parent = v78;
        return l_Frame_7;
    end;
    local function _(v82) --[[ Line: 410 ]] --[[ Name: clearBlock ]]
        -- upvalues: v1 (copy)
        if v82.HoveredBlock then
            v82.HoveredBlock.BackgroundColor3 = v1._config.PlotHistogramColor;
            v82.HoveredBlock.BackgroundTransparency = v1._config.PlotHistogramTransparency;
            v82.HoveredBlock = false;
            v82.state.hovered:set(nil);
        end;
    end;
    local function v92(v84, v85) --[[ Line: 419 ]] --[[ Name: updateBlock ]]
        -- upvalues: v2 (copy), v1 (copy)
        local l_Plot_2 = v84.Instance.Background.Plot;
        local v87 = v2.getMouseLocation();
        local v88 = l_Plot_2.AbsolutePosition - v2.GuiOffset;
        local v89 = math.ceil((v87.X - v88.X) / l_Plot_2.AbsoluteSize.X * #v84.Blocks);
        local v90 = v84.Blocks[v89];
        if v90 then
            if v90 ~= v84.HoveredBlock and not v85 and v84.HoveredBlock then
                v84.HoveredBlock.BackgroundColor3 = v1._config.PlotHistogramColor;
                v84.HoveredBlock.BackgroundTransparency = v1._config.PlotHistogramTransparency;
                v84.HoveredBlock = false;
                v84.state.hovered:set(nil);
            end;
            local v91 = v84.state.values.value[v89];
            if v91 then
                v84.Tooltip.Text = __2021_if(function() return math.floor(v91) == v91 end, function() return ("%d: %d"):format(v89, v91) end, function() return ("%d: %.3f"):format(v89, v91) end);
            end;
            v84.HoveredBlock = v90;
            v90.BackgroundColor3 = v1._config.PlotHistogramHoveredColor;
            v90.BackgroundTransparency = v1._config.PlotHistogramHoveredTransparency;
            if v85 then
                v84.state.hovered.value = v91;
                return;
            else
                v84.state.hovered:set(v91);
            end;
        end;
    end;
    v1.WidgetConstructor("PlotHistogram", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            Height = 2, 
            Min = 3, 
            Max = 4, 
            TextOverlay = 5, 
            BaseLine = 6
        }, 
        Events = {
            hovered = v2.EVENTS.hover(function(v93) --[[ Line: 463 ]]
                return v93.Instance;
            end)
        }, 
        Generate = function(v94) --[[ Line: 467 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy), v92 (copy)
            local l_Frame_8 = Instance.new("Frame");
            l_Frame_8.Name = "Iris_PlotHistogram";
            l_Frame_8.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
            l_Frame_8.BackgroundTransparency = 1;
            l_Frame_8.BorderSizePixel = 0;
            l_Frame_8.ZIndex = v94.ZIndex;
            l_Frame_8.LayoutOrder = v94.ZIndex;
            v2.UIListLayout(l_Frame_8, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_Frame_9 = Instance.new("Frame");
            l_Frame_9.Name = "Background";
            l_Frame_9.Size = UDim2.new(v1._config.ContentWidth, UDim.new(1, 0));
            l_Frame_9.BackgroundColor3 = v1._config.FrameBgColor;
            l_Frame_9.BackgroundTransparency = v1._config.FrameBgTransparency;
            v2.applyFrameStyle(l_Frame_9);
            l_Frame_9.UIPadding.PaddingRight = UDim.new(0, v1._config.FramePadding.X - 1);
            l_Frame_9.Parent = l_Frame_8;
            local l_Frame_10 = Instance.new("Frame");
            l_Frame_10.Name = "Plot";
            l_Frame_10.Size = UDim2.fromScale(1, 1);
            l_Frame_10.BackgroundTransparency = 1;
            l_Frame_10.BorderSizePixel = 0;
            l_Frame_10.ClipsDescendants = true;
            local l_TextLabel_8 = Instance.new("TextLabel");
            l_TextLabel_8.Name = "OverlayText";
            l_TextLabel_8.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_8.AnchorPoint = Vector2.new(0.5, 0);
            l_TextLabel_8.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_8.Position = UDim2.fromScale(0.5, 0);
            l_TextLabel_8.BackgroundTransparency = 1;
            l_TextLabel_8.BorderSizePixel = 0;
            l_TextLabel_8.ZIndex = 2;
            v2.applyTextStyle(l_TextLabel_8);
            l_TextLabel_8.Parent = l_Frame_10;
            local l_TextLabel_9 = Instance.new("TextLabel");
            l_TextLabel_9.Name = "Iris_Tooltip";
            l_TextLabel_9.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_9.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_9.BackgroundColor3 = v1._config.PopupBgColor;
            l_TextLabel_9.BackgroundTransparency = v1._config.PopupBgTransparency;
            l_TextLabel_9.BorderSizePixel = 0;
            l_TextLabel_9.Visible = false;
            v2.applyTextStyle(l_TextLabel_9);
            v2.UIStroke(l_TextLabel_9, v1._config.PopupBorderSize, v1._config.BorderActiveColor, v1._config.BorderActiveTransparency);
            v2.UIPadding(l_TextLabel_9, v1._config.WindowPadding);
            if v1._config.PopupRounding > 0 then
                v2.UICorner(l_TextLabel_9, v1._config.PopupRounding);
            end;
            local v100 = v1._rootInstance and v1._rootInstance:FindFirstChild("PopupScreenGui");
            l_TextLabel_9.Parent = v100 and v100:FindFirstChild("TooltipContainer");
            v94.Tooltip = l_TextLabel_9;
            v2.applyMouseMoved(l_Frame_10, function() --[[ Line: 533 ]]
                -- upvalues: v92 (ref), v94 (copy)
                v92(v94);
            end);
            v2.applyMouseLeave(l_Frame_10, function() --[[ Line: 537 ]]
                -- upvalues: v94 (copy), v1 (ref)
                local l_v94_0 = v94;
                if l_v94_0.HoveredBlock then
                    l_v94_0.HoveredBlock.BackgroundColor3 = v1._config.PlotHistogramColor;
                    l_v94_0.HoveredBlock.BackgroundTransparency = v1._config.PlotHistogramTransparency;
                    l_v94_0.HoveredBlock = false;
                    l_v94_0.state.hovered:set(nil);
                end;
            end);
            l_Frame_10.Parent = l_Frame_9;
            v94.Blocks = {};
            v94.HoveredBlock = false;
            local l_TextLabel_10 = Instance.new("TextLabel");
            l_TextLabel_10.Name = "TextLabel";
            l_TextLabel_10.AutomaticSize = Enum.AutomaticSize.XY;
            l_TextLabel_10.Size = UDim2.fromOffset(0, 0);
            l_TextLabel_10.BackgroundTransparency = 1;
            l_TextLabel_10.BorderSizePixel = 0;
            l_TextLabel_10.ZIndex = v94.ZIndex + 3;
            l_TextLabel_10.LayoutOrder = v94.ZIndex + 3;
            v2.applyTextStyle(l_TextLabel_10);
            l_TextLabel_10.Parent = l_Frame_8;
            return l_Frame_8;
        end, 
        GenerateState = function(v103) --[[ Line: 561 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v103.state.values == nil then
                v103.state.values = v1._widgetState(v103, "values", {
                    1
                });
            end;
            if v103.state.hovered == nil then
                v103.state.hovered = v1._widgetState(v103, "hovered", nil);
            end;
        end, 
        Update = function(v104) --[[ Line: 569 ]] --[[ Name: Update ]]
            local l_Instance_2 = v104.Instance;
            local l_TextLabel_11 = l_Instance_2.TextLabel;
            local l_OverlayText_1 = l_Instance_2.Background.Plot.OverlayText;
            l_TextLabel_11.Text = v104.arguments.Text or "Plot Histogram";
            l_OverlayText_1.Text = v104.arguments.TextOverlay or "";
            l_Instance_2.Size = UDim2.new(1, 0, 0, v104.arguments.Height or 0);
        end, 
        UpdateState = function(v108) --[[ Line: 580 ]] --[[ Name: UpdateState ]]
            -- upvalues: v1 (copy), v92 (copy)
            if v108.state.hovered.lastChangeTick == v1._cycleTick then
                if v108.state.hovered.value then
                    v108.Tooltip.Visible = true;
                else
                    v108.Tooltip.Visible = false;
                end;
            end;
            if v108.state.values.lastChangeTick == v1._cycleTick then
                local l_Plot_3 = v108.Instance.Background.Plot;
                local l_value_1 = v108.state.values.value;
                local v111 = #l_value_1;
                local v112 = #v108.Blocks;
                local v113 = v108.arguments.Min or 1e999;
                local v114 = v108.arguments.Max or -1e999;
                local v115 = v108.arguments.BaseLine or 0;
                if v113 == nil or v114 == nil then
                    for _, v117 in pairs(l_value_1) --[[ 2021 ]] do
                        v113 = math.min(v113 or v117, v117);
                        v114 = math.max(v114 or v117, v117);
                    end;
                end;
                if v112 < v111 then
                    for v118 = v112 + 1, v111 do
                        local l_Blocks_0 = v108.Blocks;
                        local l_Frame_11 = Instance.new("Frame");
                        l_Frame_11.Name = tostring(v118);
                        l_Frame_11.BackgroundColor3 = v1._config.PlotHistogramColor;
                        l_Frame_11.BackgroundTransparency = v1._config.PlotHistogramTransparency;
                        l_Frame_11.BorderSizePixel = 0;
                        l_Frame_11.Parent = l_Plot_3;
                        table.insert(l_Blocks_0, l_Frame_11);
                    end;
                elseif v111 < v112 then
                    for _ = v111 + 1, v112 do
                        local v122 = table.remove(v108.Blocks);
                        if v122 then
                            v122:Destroy();
                        end;
                    end;
                end;
                local v123 = v114 - v113;
                local v124 = UDim.new(1 / v111, -1);
                for v125 = 1, v111 do
                    local v126 = l_value_1[v125];
                    if v126 >= 0 then
                        v108.Blocks[v125].Size = UDim2.new(v124, UDim.new((v126 - v115) / v123));
                        v108.Blocks[v125].Position = UDim2.fromScale((v125 - 1) / v111, (v114 - v126) / v123);
                    else
                        v108.Blocks[v125].Size = UDim2.new(v124, UDim.new((v115 - v126) / v123));
                        v108.Blocks[v125].Position = UDim2.fromScale((v125 - 1) / v111, (v114 - v115) / v123);
                    end;
                end;
                if v108.HoveredBlock then
                    v92(v108, true);
                end;
            end;
        end, 
        Discard = function(v127) --[[ Line: 642 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v127.Instance:Destroy();
            v127.Tooltip:Destroy();
            v2.discardState(v127);
        end
    });
end;