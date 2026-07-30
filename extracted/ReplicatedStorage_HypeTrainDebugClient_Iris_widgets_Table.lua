-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 32 ]]
    local v3 = {};
    local v4 = {};
    local v5 = false;
    local v6 = nil;
    local v7 = 0;
    local v8 = -1;
    local v9 = -1;
    local v10 = 0;
    local function v18(v11, v12) --[[ Line: 42 ]] --[[ Name: CalculateMinColumnWidth ]]
        -- upvalues: v1 (copy)
        local v13 = 0;
        for _, v15 in v11._cellInstances do
            for _, v17 in v15[v12]:GetChildren() do
                if v17:IsA("GuiObject") then
                    v13 = math.max(v13, v17.AbsoluteSize.X);
                end;
            end;
        end;
        v11._minWidths[v12] = v13 + 2 * v1._config.CellPadding.X;
    end;
    table.insert(v1._postCycleCallbacks, function() --[[ Line: 56 ]]
        -- upvalues: v3 (copy), v1 (copy), v4 (copy), v18 (copy)
        for _, v20 in v3 do
            for v21, v22 in v20._rowCycles do
                if v22 < v1._cycleTick - 1 then
                    local v23 = v20._rowInstances[v21];
                    local v24 = v20._rowBorders[v21 - 1];
                    if v23 ~= nil then
                        v23:Destroy();
                    end;
                    if v24 ~= nil then
                        v24:Destroy();
                    end;
                    v20._rowInstances[v21] = nil;
                    v20._rowBorders[v21 - 1] = nil;
                    v20._cellInstances[v21] = nil;
                    v20._rowCycles[v21] = nil;
                end;
            end;
            v20._rowIndex = 1;
            v20._columnIndex = 1;
            v20.Instance.BorderContainer.Size = UDim2.new(1, 0, 0, v20._rowContainer.AbsoluteSize.Y);
            v20._columnBorders[0].Size = UDim2.new(0, 5, 0, v20._rowContainer.AbsoluteSize.Y);
        end;
        for v25, v26 in v4 do
            local v27 = false;
            for v28, _ in v26 do
                v18(v25, v28);
                v27 = true;
            end;
            if v27 then
                table.clear(v26);
                v1._widgets.Table.UpdateState(v25);
            end;
        end;
    end);
    local function v44() --[[ Line: 98 ]] --[[ Name: UpdateActiveColumn ]]
        -- upvalues: v5 (ref), v6 (ref), v1 (copy), v8 (ref), v7 (ref), v9 (ref), v2 (copy), v10 (ref)
        if v5 == false or v6 == nil then
            return;
        else
            local l_widths_0 = v6.state.widths;
            local l_NumColumns_0 = v6.arguments.NumColumns;
            local l_Instance_0 = v6.Instance;
            local l_BorderContainer_0 = l_Instance_0.BorderContainer;
            local l_FixedWidth_0 = v6.arguments.FixedWidth;
            local v35 = 2 * v1._config.CellPadding.X;
            if v8 == -1 then
                v8 = l_widths_0.value[v7];
                if v8 == 0 then
                    v8 = v35 / l_Instance_0.AbsoluteSize.X;
                end;
                v9 = l_widths_0.value[v7 + 1] or -1;
                if v9 == 0 then
                    v9 = v35 / l_Instance_0.AbsoluteSize.X;
                end;
            end;
            local l_X_0 = l_Instance_0.AbsolutePosition.X;
            local v37 = nil;
            local v38 = nil;
            v37 = v7 == 1 and 0 or math.floor(l_BorderContainer_0:FindFirstChild((("Border_%*"):format(v7 - 1))).AbsolutePosition.X + 3 - l_X_0);
            v38 = if v7 >= l_NumColumns_0 - 1 then l_Instance_0.AbsoluteSize.X else math.floor(l_BorderContainer_0:FindFirstChild((("Border_%*"):format(v7 + 1))).AbsolutePosition.X + 3 - l_X_0);
            local v39 = l_X_0 - v2.GuiOffset.X;
            local v40 = math.clamp(v2.getMouseLocation().X, v37 + v39 + v35, v38 + v39 - v35) - v10;
            local v41 = v10 - v39 - v37;
            local v42 = v8 / v41;
            if l_FixedWidth_0 then
                l_widths_0.value[v7] = math.clamp(math.round(v8 + v40), v35, l_Instance_0.AbsoluteSize.X - v37);
            else
                local v43 = v42 * v40;
                l_widths_0.value[v7] = math.clamp(v8 + v43, 0, (v38 - v37 - v35) / l_Instance_0.AbsoluteSize.X);
                if v7 < l_NumColumns_0 then
                    l_widths_0.value[v7 + 1] = math.clamp(v9 - v43, 0, 1);
                end;
            end;
            l_widths_0:set(l_widths_0.value, true);
            return;
        end;
    end;
    local function _(v45, v46) --[[ Line: 154 ]] --[[ Name: ColumnMouseDown ]]
        -- upvalues: v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref), v2 (copy)
        v5 = true;
        v6 = v45;
        v7 = v46;
        v8 = -1;
        v9 = -1;
        v10 = v2.getMouseLocation().X;
    end;
    v2.registerEvent("InputChanged", function() --[[ Line: 163 ]]
        -- upvalues: v1 (copy), v44 (copy)
        if not v1._started then
            return;
        else
            v44();
            return;
        end;
    end);
    v2.registerEvent("InputEnded", function(v48) --[[ Line: 170 ]]
        -- upvalues: v1 (copy), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
        if not v1._started then
            return;
        else
            if v48.UserInputType == Enum.UserInputType.MouseButton1 and v5 then
                v5 = false;
                v6 = nil;
                v7 = 0;
                v8 = -1;
                v9 = -1;
                v10 = 0;
            end;
            return;
        end;
    end);
    local function v54(_, v50, v51, v52) --[[ Line: 184 ]] --[[ Name: GenerateCell ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v53 = nil;
        if v52 then
            v53 = Instance.new("TextButton");
            v53.Text = "";
            v53.AutoButtonColor = false;
        else
            v53 = Instance.new("Frame");
        end;
        v53.Name = ("Cell_%*"):format(v50);
        v53.AutomaticSize = Enum.AutomaticSize.Y;
        v53.Size = UDim2.new(v51, UDim.new());
        v53.BackgroundTransparency = 1;
        v53.ZIndex = v50;
        v53.LayoutOrder = v50;
        v53.ClipsDescendants = true;
        if v52 then
            v2.applyInteractionHighlights("Background", v53, v53, {
                Color = v1._config.HeaderColor, 
                Transparency = 1, 
                HoveredColor = v1._config.HeaderHoveredColor, 
                HoveredTransparency = v1._config.HeaderHoveredTransparency, 
                ActiveColor = v1._config.HeaderActiveColor, 
                ActiveTransparency = v1._config.HeaderActiveTransparency
            });
        end;
        v2.UIPadding(v53, v1._config.CellPadding);
        v2.UIListLayout(v53, Enum.FillDirection.Vertical, UDim.new());
        v2.UISizeConstraint(v53, Vector2.new(2 * v1._config.CellPadding.X, 0));
        return v53;
    end;
    local function v64(v55, v56, v57) --[[ Line: 219 ]] --[[ Name: GenerateColumnBorder ]]
        -- upvalues: v1 (copy), v2 (copy), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref)
        local l_ImageButton_0 = Instance.new("ImageButton");
        l_ImageButton_0.Name = ("Border_%*"):format(v56);
        l_ImageButton_0.Size = UDim2.new(0, 5, 1, 0);
        l_ImageButton_0.BackgroundTransparency = 1;
        l_ImageButton_0.AutoButtonColor = false;
        l_ImageButton_0.Image = "";
        l_ImageButton_0.ImageTransparency = 1;
        l_ImageButton_0.ZIndex = v56;
        l_ImageButton_0.LayoutOrder = v56 * 2;
        local v59 = v56 == v55.arguments.NumColumns and 3 or 2;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "Line";
        l_Frame_0.Size = UDim2.new(0, 1, 1, 0);
        l_Frame_0.Position = UDim2.fromOffset(v59, 0);
        l_Frame_0.BackgroundColor3 = v1._config[("TableBorder%*Color"):format(v57)];
        l_Frame_0.BackgroundTransparency = v1._config[("TableBorder%*Transparency"):format(v57)];
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Parent = l_ImageButton_0;
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "Hover";
        l_Frame_1.Size = UDim2.new(0, 1, 1, 0);
        l_Frame_1.Position = UDim2.fromOffset(v59, 0);
        l_Frame_1.BackgroundColor3 = v1._config[("TableBorder%*Color"):format(v57)];
        l_Frame_1.BackgroundTransparency = v1._config[("TableBorder%*Transparency"):format(v57)];
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Visible = v55.arguments.Resizable;
        l_Frame_1.Parent = l_ImageButton_0;
        v2.applyInteractionHighlights("Background", l_ImageButton_0, l_Frame_1, {
            Color = v1._config.ResizeGripColor, 
            Transparency = 1, 
            HoveredColor = v1._config.ResizeGripHoveredColor, 
            HoveredTransparency = v1._config.ResizeGripHoveredTransparency, 
            ActiveColor = v1._config.ResizeGripActiveColor, 
            ActiveTransparency = v1._config.ResizeGripActiveTransparency
        });
        v2.applyButtonDown(l_ImageButton_0, function() --[[ Line: 263 ]]
            -- upvalues: v55 (copy), v56 (copy), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref), v2 (ref)
            if v55.arguments.Resizable then
                local l_v55_0 = v55;
                local l_v56_0 = v56;
                v5 = true;
                v6 = l_v55_0;
                v7 = l_v56_0;
                v8 = -1;
                v9 = -1;
                v10 = v2.getMouseLocation().X;
            end;
        end);
        return l_ImageButton_0;
    end;
    local function v70(v65, v66) --[[ Line: 273 ]] --[[ Name: GenerateRow ]]
        -- upvalues: v1 (copy), v2 (copy), v54 (copy)
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Name = ("Row_%*"):format(v66);
        l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
        l_Frame_2.Size = UDim2.fromScale(1, 0);
        if v66 == 0 then
            l_Frame_2.BackgroundColor3 = v1._config.TableHeaderColor;
            l_Frame_2.BackgroundTransparency = v1._config.TableHeaderTransparency;
        elseif v65.arguments.RowBackground == true then
            if v66 % 2 == 0 then
                l_Frame_2.BackgroundColor3 = v1._config.TableRowBgAltColor;
                l_Frame_2.BackgroundTransparency = v1._config.TableRowBgAltTransparency;
            else
                l_Frame_2.BackgroundColor3 = v1._config.TableRowBgColor;
                l_Frame_2.BackgroundTransparency = v1._config.TableRowBgTransparency;
            end;
        else
            l_Frame_2.BackgroundTransparency = 1;
        end;
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.ZIndex = v66 * 2 - 1;
        l_Frame_2.LayoutOrder = v66 * 2 - 1;
        l_Frame_2.ClipsDescendants = true;
        v2.UIListLayout(l_Frame_2, Enum.FillDirection.Horizontal, UDim.new());
        v65._cellInstances[v66] = table.create(v65.arguments.NumColumns);
        for v68 = 1, v65.arguments.NumColumns do
            local v69 = v54(v65, v68, v65._widths[v68], v66 == 0);
            v69.Parent = l_Frame_2;
            v65._cellInstances[v66][v68] = v69;
        end;
        v65._rowInstances[v66] = l_Frame_2;
        return l_Frame_2;
    end;
    local function v76(_, v72, v73) --[[ Line: 311 ]] --[[ Name: GenerateRowBorder ]]
        -- upvalues: v1 (copy)
        local l_Frame_3 = Instance.new("Frame");
        l_Frame_3.Name = ("Border_%*"):format(v72);
        l_Frame_3.Size = UDim2.new(1, 0, 0, 0);
        l_Frame_3.BackgroundTransparency = 1;
        l_Frame_3.ZIndex = v72 * 2;
        l_Frame_3.LayoutOrder = v72 * 2;
        local l_Frame_4 = Instance.new("Frame");
        l_Frame_4.Name = "Line";
        l_Frame_4.AnchorPoint = Vector2.new(0, 0.5);
        l_Frame_4.Size = UDim2.new(1, 0, 0, 1);
        l_Frame_4.BackgroundColor3 = v1._config[("TableBorder%*Color"):format(v73)];
        l_Frame_4.BackgroundTransparency = v1._config[("TableBorder%*Transparency"):format(v73)];
        l_Frame_4.BorderSizePixel = 0;
        l_Frame_4.Parent = l_Frame_3;
        return l_Frame_3;
    end;
    v1.WidgetConstructor("Table", {
        hasState = true, 
        hasChildren = true, 
        Args = {
            NumColumns = 1, 
            Header = 2, 
            RowBackground = 3, 
            OuterBorders = 4, 
            InnerBorders = 5, 
            Resizable = 6, 
            FixedWidth = 7, 
            ProportionalWidth = 8, 
            LimitTableWidth = 9
        }, 
        Events = {}, 
        Generate = function(v77) --[[ Line: 348 ]] --[[ Name: Generate ]]
            -- upvalues: v3 (copy), v4 (copy), v2 (copy), v1 (copy)
            v3[v77.ID] = v77;
            v4[v77] = {};
            local l_Frame_5 = Instance.new("Frame");
            l_Frame_5.Name = "Iris_Table";
            l_Frame_5.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_5.Size = UDim2.fromScale(1, 0);
            l_Frame_5.BackgroundTransparency = 1;
            l_Frame_5.ZIndex = v77.ZIndex;
            l_Frame_5.LayoutOrder = v77.ZIndex;
            local l_Frame_6 = Instance.new("Frame");
            l_Frame_6.Name = "RowContainer";
            l_Frame_6.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_6.Size = UDim2.fromScale(1, 0);
            l_Frame_6.BackgroundTransparency = 1;
            l_Frame_6.ZIndex = 1;
            v2.UISizeConstraint(l_Frame_6);
            v2.UIListLayout(l_Frame_6, Enum.FillDirection.Vertical, UDim.new());
            l_Frame_6.Parent = l_Frame_5;
            v77._rowContainer = l_Frame_6;
            local l_Frame_7 = Instance.new("Frame");
            l_Frame_7.Name = "BorderContainer";
            l_Frame_7.Size = UDim2.fromScale(1, 1);
            l_Frame_7.BackgroundTransparency = 1;
            l_Frame_7.ZIndex = 2;
            l_Frame_7.ClipsDescendants = true;
            v2.UISizeConstraint(l_Frame_7);
            v2.UIListLayout(l_Frame_7, Enum.FillDirection.Horizontal, UDim.new());
            v2.UIStroke(l_Frame_7, 1, v1._config.TableBorderStrongColor, v1._config.TableBorderStrongTransparency);
            l_Frame_7.Parent = l_Frame_5;
            v77._columnIndex = 1;
            v77._rowIndex = 1;
            v77._rowInstances = {};
            v77._cellInstances = {};
            v77._rowBorders = {};
            v77._columnBorders = {};
            v77._rowCycles = {};
            local v81 = #v1._postCycleCallbacks + 1;
            local v82 = v1._cycleTick + 1;
            v1._postCycleCallbacks[v81] = function() --[[ Line: 396 ]]
                -- upvalues: v1 (ref), v82 (copy), v77 (copy), v81 (copy)
                if v1._cycleTick >= v82 then
                    if v77.lastCycleTick ~= -1 then
                        v77.state.widths.lastChangeTick = v1._cycleTick;
                        v1._widgets.Table.UpdateState(v77);
                    end;
                    v1._postCycleCallbacks[v81] = nil;
                end;
            end;
            return l_Frame_5;
        end, 
        GenerateState = function(v83) --[[ Line: 408 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy), v64 (copy), v54 (copy)
            local l_NumColumns_1 = v83.arguments.NumColumns;
            if v83.state.widths == nil then
                local v85 = table.create(l_NumColumns_1, 1 / l_NumColumns_1);
                v83.state.widths = v1._widgetState(v83, "widths", v85);
            end;
            v83._widths = table.create(l_NumColumns_1, UDim.new());
            v83._minWidths = table.create(l_NumColumns_1, 0);
            local l_Instance_1 = v83.Instance;
            local l_BorderContainer_1 = l_Instance_1.BorderContainer;
            v83._cellInstances[-1] = table.create(l_NumColumns_1);
            for v88 = 1, l_NumColumns_1 do
                local v89 = v64(v83, v88, "Light");
                v89.Visible = v83.arguments.InnerBorders;
                v83._columnBorders[v88] = v89;
                v89.Parent = l_BorderContainer_1;
                local v90 = v54(v83, v88, v83._widths[v88], false);
                v90:FindFirstChild("UISizeConstraint").MinSize = Vector2.new(2 * v1._config.CellPadding.X + (v88 > 1 and -2 or 0) + (v88 < l_NumColumns_1 and -3 or 0), 0);
                v90.LayoutOrder = 2 * v88 - 1;
                v83._cellInstances[-1][v88] = v90;
                v90.Parent = l_BorderContainer_1;
            end;
            local v91 = v64(v83, l_NumColumns_1, "Strong");
            v83._columnBorders[0] = v91;
            v91.Parent = l_Instance_1;
        end, 
        Update = function(v92) --[[ Line: 442 ]] --[[ Name: Update ]]
            -- upvalues: v1 (copy), v4 (copy)
            local l_NumColumns_2 = v92.arguments.NumColumns;
            assert(l_NumColumns_2 >= 1, "Iris.Table must have at least one column.");
            if v92._widths ~= nil and #v92._widths ~= l_NumColumns_2 then
                v92.arguments.NumColumns = #v92._widths;
                warn("NumColumns cannot change once set. See documentation.");
            end;
            for v94, v95 in v92._rowInstances do
                if v94 == 0 then
                    v95.BackgroundColor3 = v1._config.TableHeaderColor;
                    v95.BackgroundTransparency = v1._config.TableHeaderTransparency;
                elseif v92.arguments.RowBackground == true then
                    if v94 % 2 == 0 then
                        v95.BackgroundColor3 = v1._config.TableRowBgAltColor;
                        v95.BackgroundTransparency = v1._config.TableRowBgAltTransparency;
                    else
                        v95.BackgroundColor3 = v1._config.TableRowBgColor;
                        v95.BackgroundTransparency = v1._config.TableRowBgTransparency;
                    end;
                else
                    v95.BackgroundTransparency = 1;
                end;
            end;
            for _, v97 in v92._rowBorders do
                v97.Visible = v92.arguments.InnerBorders;
            end;
            for _, v99 in v92._columnBorders do
                v99.Visible = v92.arguments.InnerBorders or v92.arguments.Resizable;
            end;
            for _, v101 in v92._columnBorders do
                local l_Hover_0 = v101:FindFirstChild("Hover");
                if l_Hover_0 then
                    l_Hover_0.Visible = v92.arguments.Resizable;
                end;
            end;
            if v92._columnBorders[l_NumColumns_2] ~= nil then
                v92._columnBorders[l_NumColumns_2].Visible = not v92.arguments.LimitTableWidth and (v92.arguments.Resizable or v92.arguments.InnerBorders);
                v92._columnBorders[0].Visible = v92.arguments.LimitTableWidth and (v92.arguments.Resizable or v92.arguments.OuterBorders);
            end;
            local v103 = v92._rowInstances[0];
            local v104 = v92._rowBorders[0];
            if v103 ~= nil then
                v103.Visible = v92.arguments.Header;
            end;
            if v104 ~= nil then
                v104.Visible = v92.arguments.Header and v92.arguments.InnerBorders;
            end;
            v92.Instance.BorderContainer.UIStroke.Enabled = v92.arguments.OuterBorders;
            for v105 = 1, v92.arguments.NumColumns do
                v4[v92][v105] = true;
            end;
            if v92._widths ~= nil then
                v1._widgets.Table.UpdateState(v92);
            end;
        end, 
        UpdateState = function(v106) --[[ Line: 514 ]] --[[ Name: UpdateState ]]
            local l_Instance_2 = v106.Instance;
            local l_BorderContainer_2 = l_Instance_2.BorderContainer;
            local l_RowContainer_0 = l_Instance_2.RowContainer;
            local l_NumColumns_3 = v106.arguments.NumColumns;
            local l_value_0 = v106.state.widths.value;
            local l__minWidths_0 = v106._minWidths;
            local l_FixedWidth_1 = v106.arguments.FixedWidth;
            local l_ProportionalWidth_0 = v106.arguments.ProportionalWidth;
            if not v106.arguments.Resizable then
                if l_FixedWidth_1 then
                    if l_ProportionalWidth_0 then
                        for v115 = 1, l_NumColumns_3 do
                            l_value_0[v115] = l__minWidths_0[v115];
                        end;
                    else
                        local v116 = 0;
                        for _, v118 in l__minWidths_0 do
                            v116 = math.max(v116, v118);
                        end;
                        for v119 = 1, l_NumColumns_3 do
                            l_value_0[v119] = v116;
                        end;
                    end;
                elseif l_ProportionalWidth_0 then
                    local v120 = 0;
                    for _, v122 in l__minWidths_0 do
                        v120 = v120 + v122;
                    end;
                    local v123 = 1 / v120;
                    for v124 = 1, l_NumColumns_3 do
                        l_value_0[v124] = v123 * l__minWidths_0[v124];
                    end;
                else
                    local v125 = 1 / l_NumColumns_3;
                    for v126 = 1, l_NumColumns_3 do
                        l_value_0[v126] = v125;
                    end;
                end;
            end;
            local v127 = UDim.new();
            for v128 = 1, l_NumColumns_3 do
                local v129 = l_value_0[v128];
                local v130 = UDim.new(l_FixedWidth_1 and 0 or math.clamp(v129, 0, 1), if l_FixedWidth_1 then math.max(v129, 0) else 0);
                v106._widths[v128] = v130;
                v127 = v127 + v130;
                for _, v132 in v106._cellInstances do
                    v132[v128].Size = UDim2.new(v130, UDim.new());
                end;
                v106._cellInstances[-1][v128].Size = UDim2.new(v130 + UDim.new(0, (v128 > 1 and -2 or 0) - 3), UDim.new());
            end;
            local l_Offset_0 = v127.Offset;
            if not v106.arguments.FixedWidth or not v106.arguments.LimitTableWidth then
                l_Offset_0 = 1e999;
            end;
            l_BorderContainer_2.UISizeConstraint.MaxSize = Vector2.new(l_Offset_0, 1e999);
            l_RowContainer_0.UISizeConstraint.MaxSize = Vector2.new(l_Offset_0, 1e999);
            v106._columnBorders[0].Position = UDim2.new(0, l_Offset_0 - 3, 0, 0);
        end, 
        ChildAdded = function(v134, _) --[[ Line: 589 ]] --[[ Name: ChildAdded ]]
            -- upvalues: v1 (copy), v4 (copy), v70 (copy), v76 (copy)
            local l__rowIndex_0 = v134._rowIndex;
            local l__columnIndex_0 = v134._columnIndex;
            local v138 = v134._rowInstances[l__rowIndex_0];
            v134._rowCycles[l__rowIndex_0] = v1._cycleTick;
            v4[v134][l__columnIndex_0] = true;
            if v138 ~= nil then
                return v134._cellInstances[l__rowIndex_0][l__columnIndex_0];
            else
                v138 = v70(v134, l__rowIndex_0);
                if l__rowIndex_0 == 0 then
                    v138.Visible = v134.arguments.Header;
                end;
                v138.Parent = v134._rowContainer;
                if l__rowIndex_0 > 0 then
                    local v139 = v76(v134, l__rowIndex_0 - 1, l__rowIndex_0 == 1 and "Strong" or "Light");
                    v139.Visible = v134.arguments.InnerBorders and (l__rowIndex_0 ~= 1 or v134.arguments.Header and v134.arguments.InnerBorders and v134._rowInstances[0] ~= nil);
                    v134._rowBorders[l__rowIndex_0 - 1] = v139;
                    v139.Parent = v134._rowContainer;
                end;
                return v134._cellInstances[l__rowIndex_0][l__columnIndex_0];
            end;
        end, 
        ChildDiscarded = function(v140, v141) --[[ Line: 616 ]] --[[ Name: ChildDiscarded ]]
            -- upvalues: v4 (copy)
            local l_Parent_0 = v141.Instance.Parent;
            if l_Parent_0 ~= nil then
                local v143 = tonumber(l_Parent_0.Name:sub(6));
                if v143 then
                    v4[v140][v143] = true;
                end;
            end;
        end, 
        Discard = function(v144) --[[ Line: 627 ]] --[[ Name: Discard ]]
            -- upvalues: v3 (copy), v4 (copy), v2 (copy)
            v3[v144.ID] = nil;
            v4[v144] = nil;
            v144.Instance:Destroy();
            v2.discardState(v144);
        end
    });
end;