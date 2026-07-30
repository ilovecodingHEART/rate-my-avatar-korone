-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 5 ]]
    local v5 = {
        Init = function(_) --[[ Line: 7 ]]

        end, 
        Get = function(v4) --[[ Line: 8 ]]
            -- upvalues: v1 (copy)
            return v4.lastNumberChangedTick == v1._cycleTick;
        end
    };
    local function v11(v6, v7, v8) --[[ Line: 13 ]] --[[ Name: getValueByIndex ]]
        local v9 = typeof(v6);
        if v9 == "number" then
            return v6;
        else
            if v9 == "Vector2" then
                if v7 == 1 then
                    return v6.X;
                elseif v7 == 2 then
                    return v6.Y;
                end;
            elseif v9 == "Vector3" then
                if v7 == 1 then
                    return v6.X;
                elseif v7 == 2 then
                    return v6.Y;
                elseif v7 == 3 then
                    return v6.Z;
                end;
            elseif v9 == "UDim" then
                if v7 == 1 then
                    return v6.Scale;
                elseif v7 == 2 then
                    return v6.Offset;
                end;
            elseif v9 == "UDim2" then
                if v7 == 1 then
                    return v6.X.Scale;
                elseif v7 == 2 then
                    return v6.X.Offset;
                elseif v7 == 3 then
                    return v6.Y.Scale;
                elseif v7 == 4 then
                    return v6.Y.Offset;
                end;
            elseif v9 == "Color3" then
                local v10 = v8.UseHSV and {
                    v6:ToHSV()
                } or {
                    v6.R, 
                    v6.G, 
                    v6.B
                };
                if v7 == 1 then
                    return v10[1];
                elseif v7 == 2 then
                    return v10[2];
                elseif v7 == 3 then
                    return v10[3];
                end;
            elseif v9 == "Rect" then
                if v7 == 1 then
                    return v6.Min.X;
                elseif v7 == 2 then
                    return v6.Min.Y;
                elseif v7 == 3 then
                    return v6.Max.X;
                elseif v7 == 4 then
                    return v6.Max.Y;
                end;
            elseif v9 == "table" then
                return v6[v7];
            end;
            error((("Incorrect datatype or value: %* %* %*."):format(v6, typeof(v6), v7)));
            return;
        end;
    end;
    local function v19(v12, v13, v14, v15) --[[ Line: 74 ]] --[[ Name: updateValueByIndex ]]
        if typeof(v12) == "number" then
            return v14;
        else
            if typeof(v12) == "Vector2" then
                if v13 == 1 then
                    return (Vector2.new(v14, v12.Y));
                elseif v13 == 2 then
                    return (Vector2.new(v12.X, v14));
                end;
            elseif typeof(v12) == "Vector3" then
                if v13 == 1 then
                    return (Vector3.new(v14, v12.Y, v12.Z));
                elseif v13 == 2 then
                    return (Vector3.new(v12.X, v14, v12.Z));
                elseif v13 == 3 then
                    return (Vector3.new(v12.X, v12.Y, v14));
                end;
            elseif typeof(v12) == "UDim" then
                if v13 == 1 then
                    return (UDim.new(v14, v12.Offset));
                elseif v13 == 2 then
                    return (UDim.new(v12.Scale, v14));
                end;
            elseif typeof(v12) == "UDim2" then
                if v13 == 1 then
                    return (UDim2.new(UDim.new(v14, v12.X.Offset), v12.Y));
                elseif v13 == 2 then
                    return (UDim2.new(UDim.new(v12.X.Scale, v14), v12.Y));
                elseif v13 == 3 then
                    return (UDim2.new(v12.X, UDim.new(v14, v12.Y.Offset)));
                elseif v13 == 4 then
                    return (UDim2.new(v12.X, UDim.new(v12.Y.Scale, v14)));
                end;
            elseif typeof(v12) == "Rect" then
                if v13 == 1 then
                    return (Rect.new(Vector2.new(v14, v12.Min.Y), v12.Max));
                elseif v13 == 2 then
                    return (Rect.new(Vector2.new(v12.Min.X, v14), v12.Max));
                elseif v13 == 3 then
                    return (Rect.new(v12.Min, Vector2.new(v14, v12.Max.Y)));
                elseif v13 == 4 then
                    return (Rect.new(v12.Min, Vector2.new(v12.Max.X, v14)));
                end;
            elseif typeof(v12) == "Color3" then
                if v15.UseHSV then
                    local v16, v17, v18 = v12:ToHSV();
                    if v13 == 1 then
                        return (Color3.fromHSV(v14, v17, v18));
                    elseif v13 == 2 then
                        return (Color3.fromHSV(v16, v14, v18));
                    elseif v13 == 3 then
                        return (Color3.fromHSV(v16, v17, v14));
                    end;
                end;
                if v13 == 1 then
                    return (Color3.new(v14, v12.G, v12.B));
                elseif v13 == 2 then
                    return (Color3.new(v12.R, v14, v12.B));
                elseif v13 == 3 then
                    return (Color3.new(v12.R, v12.G, v14));
                end;
            end;
            error((("Incorrect datatype or value %* %* %*."):format(v12, typeof(v12), v13)));
            return;
        end;
    end;
    local v20 = {
        Num = {
            1
        }, 
        Vector2 = {
            1, 
            1
        }, 
        Vector3 = {
            1, 
            1, 
            1
        }, 
        UDim = {
            0.01, 
            1
        }, 
        UDim2 = {
            0.01, 
            1, 
            0.01, 
            1
        }, 
        Color3 = {
            1, 
            1, 
            1
        }, 
        Color4 = {
            1, 
            1, 
            1, 
            1
        }, 
        Rect = {
            1, 
            1, 
            1, 
            1
        }
    };
    local v21 = {
        Num = {
            0
        }, 
        Vector2 = {
            0, 
            0
        }, 
        Vector3 = {
            0, 
            0, 
            0
        }, 
        UDim = {
            0, 
            0
        }, 
        UDim2 = {
            0, 
            0, 
            0, 
            0
        }, 
        Rect = {
            0, 
            0, 
            0, 
            0
        }
    };
    local v22 = {
        Num = {
            100
        }, 
        Vector2 = {
            100, 
            100
        }, 
        Vector3 = {
            100, 
            100, 
            100
        }, 
        UDim = {
            1, 
            960
        }, 
        UDim2 = {
            1, 
            960, 
            1, 
            960
        }, 
        Rect = {
            960, 
            960, 
            960, 
            960
        }
    };
    local v23 = {
        Num = {
            ""
        }, 
        Vector2 = {
            "X: ", 
            "Y: "
        }, 
        Vector3 = {
            "X: ", 
            "Y: ", 
            "Z: "
        }, 
        UDim = {
            "", 
            ""
        }, 
        UDim2 = {
            "", 
            "", 
            "", 
            ""
        }, 
        Color3_RGB = {
            "R: ", 
            "G: ", 
            "B: "
        }, 
        Color3_HSV = {
            "H: ", 
            "S: ", 
            "V: "
        }, 
        Color4_RGB = {
            "R: ", 
            "G: ", 
            "B: ", 
            "T: "
        }, 
        Color4_HSV = {
            "H: ", 
            "S: ", 
            "V: ", 
            "T: "
        }, 
        Rect = {
            "X: ", 
            "Y: ", 
            "X: ", 
            "Y: "
        }
    };
    local v24 = {
        Num = {
            0
        }, 
        Vector2 = {
            0, 
            0
        }, 
        Vector3 = {
            0, 
            0, 
            0
        }, 
        UDim = {
            3, 
            0
        }, 
        UDim2 = {
            3, 
            0, 
            3, 
            0
        }, 
        Color3 = {
            0, 
            0, 
            0
        }, 
        Color4 = {
            0, 
            0, 
            0, 
            0
        }, 
        Rect = {
            0, 
            0, 
            0, 
            0
        }
    };
    local v25 = nil;
    local function v37(v26, v27, v28) --[[ Line: 198 ]] --[[ Name: generateButtons ]]
        -- upvalues: v2 (copy), v1 (copy), v11 (copy)
        local v29 = v2.abstractButton.Generate(v26);
        v29.Name = "SubButton";
        v29.ZIndex = 5;
        v29.LayoutOrder = 5;
        v29.TextXAlignment = Enum.TextXAlignment.Center;
        v29.Text = "-";
        v29.Size = UDim2.fromOffset(v1._config.TextSize + 2 * v1._config.FramePadding.Y, v1._config.TextSize);
        v29.Parent = v27;
        v2.applyButtonClick(v29, function() --[[ Line: 208 ]]
            -- upvalues: v2 (ref), v26 (copy), v11 (ref), v1 (ref)
            local v30 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            local v31 = (v26.arguments.Increment and v11(v26.arguments.Increment, 1, v26.arguments) or 1) * (v30 and 100 or 1);
            local v32 = v26.state.number.value - v31;
            if v26.arguments.Min ~= nil then
                v32 = math.max(v32, v11(v26.arguments.Min, 1, v26.arguments));
            end;
            if v26.arguments.Max ~= nil then
                v32 = math.min(v32, v11(v26.arguments.Max, 1, v26.arguments));
            end;
            v26.state.number:set(v32);
            v26.lastNumberChangedTick = v1._cycleTick + 1;
        end);
        local v33 = v2.abstractButton.Generate(v26);
        v33.Name = "AddButton";
        v33.ZIndex = 6;
        v33.LayoutOrder = 6;
        v33.TextXAlignment = Enum.TextXAlignment.Center;
        v33.Text = "+";
        v33.Size = UDim2.fromOffset(v1._config.TextSize + 2 * v1._config.FramePadding.Y, v1._config.TextSize);
        v33.Parent = v27;
        v2.applyButtonClick(v33, function() --[[ Line: 231 ]]
            -- upvalues: v2 (ref), v26 (copy), v11 (ref), v1 (ref)
            local v34 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            local v35 = (v26.arguments.Increment and v11(v26.arguments.Increment, 1, v26.arguments) or 1) * (v34 and 100 or 1);
            local v36 = v26.state.number.value + v35;
            if v26.arguments.Min ~= nil then
                v36 = math.max(v36, v11(v26.arguments.Min, 1, v26.arguments));
            end;
            if v26.arguments.Max ~= nil then
                v36 = math.min(v36, v11(v26.arguments.Max, 1, v26.arguments));
            end;
            v26.state.number:set(v36);
            v26.lastNumberChangedTick = v1._cycleTick + 1;
        end);
        return 2 * v1._config.ItemInnerSpacing.X + v28 * 2;
    end;
    local l_v37_0 = v37 --[[ copy: 11 -> 21 ]];
    v25 = function(v39, v40, v41) --[[ Line: 248 ]] --[[ Name: generateInputScalar ]]
        -- upvalues: v5 (copy), v2 (copy), v1 (copy), l_v37_0 (copy), v11 (copy), v19 (copy), v24 (copy), v23 (copy)
        return {
            hasState = true, 
            hasChildren = false, 
            Args = {
                Text = 1, 
                Increment = 2, 
                Min = 3, 
                Max = 4, 
                Format = 5
            }, 
            Events = {
                numberChanged = v5, 
                hovered = v2.EVENTS.hover(function(v42) --[[ Line: 261 ]]
                    return v42.Instance;
                end)
            }, 
            Generate = function(v43) --[[ Line: 265 ]] --[[ Name: Generate ]]
                -- upvalues: v39 (copy), v1 (ref), v2 (ref), v40 (copy), l_v37_0 (ref), v11 (ref), v19 (ref)
                local l_Frame_0 = Instance.new("Frame");
                l_Frame_0.Name = "Iris_Input" .. v39;
                l_Frame_0.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
                l_Frame_0.BackgroundTransparency = 1;
                l_Frame_0.BorderSizePixel = 0;
                l_Frame_0.LayoutOrder = v43.ZIndex;
                l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
                v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
                local v45 = 0;
                local v46 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                if v40 == 1 then
                    v45 = l_v37_0(v43, l_Frame_0, v46);
                end;
                local v47 = UDim.new(v1._config.ContentWidth.Scale / v40, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v40 - 1) - v45) / v40);
                local v48 = UDim.new(v47.Scale * (v40 - 1), v47.Offset * (v40 - 1) + v1._config.ItemInnerSpacing.X * (v40 - 1) + v45);
                local v49 = v1._config.ContentWidth - v48;
                for v50 = 1, v40 do
                    local l_TextBox_0 = Instance.new("TextBox");
                    l_TextBox_0.Name = "InputField" .. tostring(v50);
                    l_TextBox_0.LayoutOrder = v50;
                    if v50 == v40 then
                        l_TextBox_0.Size = UDim2.new(v49, v1._config.ContentHeight);
                    else
                        l_TextBox_0.Size = UDim2.new(v47, v1._config.ContentHeight);
                    end;
                    l_TextBox_0.AutomaticSize = Enum.AutomaticSize.Y;
                    l_TextBox_0.BackgroundColor3 = v1._config.FrameBgColor;
                    l_TextBox_0.BackgroundTransparency = v1._config.FrameBgTransparency;
                    l_TextBox_0.ClearTextOnFocus = false;
                    l_TextBox_0.TextTruncate = Enum.TextTruncate.AtEnd;
                    l_TextBox_0.ClipsDescendants = true;
                    v2.applyFrameStyle(l_TextBox_0);
                    v2.applyTextStyle(l_TextBox_0);
                    v2.UISizeConstraint(l_TextBox_0, Vector2.xAxis);
                    l_TextBox_0.Parent = l_Frame_0;
                    l_TextBox_0.FocusLost:Connect(function() --[[ Line: 314 ]]
                        -- upvalues: l_TextBox_0 (copy), v43 (copy), v11 (ref), v50 (copy), v19 (ref), v1 (ref)
                        local v52 = tonumber(l_TextBox_0.Text:match("-?%d*%.?%d*"));
                        if v52 ~= nil then
                            if v43.arguments.Min ~= nil then
                                v52 = math.max(v52, v11(v43.arguments.Min, v50, v43.arguments));
                            end;
                            if v43.arguments.Max ~= nil then
                                v52 = math.min(v52, v11(v43.arguments.Max, v50, v43.arguments));
                            end;
                            if v43.arguments.Increment then
                                v52 = math.round(v52 / v11(v43.arguments.Increment, v50, v43.arguments)) * v11(v43.arguments.Increment, v50, v43.arguments);
                            end;
                            v43.state.number:set(v19(v43.state.number.value, v50, v52, v43.arguments));
                            v43.lastNumberChangedTick = v1._cycleTick + 1;
                        end;
                        local v53 = v43.arguments.Format[v50] or v43.arguments.Format[1];
                        if v43.arguments.Prefix then
                            v53 = v43.arguments.Prefix[v50] .. v53;
                        end;
                        l_TextBox_0.Text = string.format(v53, v11(v43.state.number.value, v50, v43.arguments));
                        v43.state.editingText:set(0);
                    end);
                    l_TextBox_0.Focused:Connect(function() --[[ Line: 340 ]]
                        -- upvalues: l_TextBox_0 (copy), v43 (copy), v50 (copy)
                        l_TextBox_0.CursorPosition = #l_TextBox_0.Text + 1;
                        l_TextBox_0.SelectionStart = 1;
                        v43.state.editingText:set(v50);
                    end);
                end;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Name = "TextLabel";
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.BorderSizePixel = 0;
                l_TextLabel_0.LayoutOrder = 7;
                l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.XY;
                v2.applyTextStyle(l_TextLabel_0);
                l_TextLabel_0.Parent = l_Frame_0;
                return l_Frame_0;
            end, 
            Update = function(v55) --[[ Line: 362 ]] --[[ Name: Update ]]
                -- upvalues: v39 (copy), v40 (copy), v1 (ref), v24 (ref), v11 (ref), v23 (ref)
                local l_Instance_0 = v55.Instance;
                l_Instance_0.TextLabel.Text = v55.arguments.Text or ("Input %*"):format(v39);
                if v40 == 1 then
                    l_Instance_0.SubButton.Visible = not v55.arguments.NoButtons;
                    l_Instance_0.AddButton.Visible = not v55.arguments.NoButtons;
                    local v57 = v55.arguments.NoButtons and 0 or 2 * v1._config.ItemInnerSpacing.X + 2 * (v1._config.TextSize + 2 * v1._config.FramePadding.Y);
                    l_Instance_0.InputField1.Size = UDim2.new(UDim.new(v1._config.ContentWidth.Scale, v1._config.ContentWidth.Offset - v57), v1._config.ContentHeight);
                end;
                if v55.arguments.Format and typeof(v55.arguments.Format) ~= "table" then
                    v55.arguments.Format = {
                        v55.arguments.Format
                    };
                    return;
                else
                    if not v55.arguments.Format then
                        local v58 = {};
                        for v59 = 1, v40 do
                            local v60 = v24[v39][v59];
                            if v55.arguments.Increment then
                                local v61 = v11(v55.arguments.Increment, v59, v55.arguments);
                                v60 = math.max(v60, math.ceil(-math.log10(v61 == 0 and 1 or v61)), v60);
                            end;
                            if v55.arguments.Max then
                                local v62 = v11(v55.arguments.Max, v59, v55.arguments);
                                v60 = math.max(v60, math.ceil(-math.log10(v62 == 0 and 1 or v62)), v60);
                            end;
                            if v55.arguments.Min then
                                local v63 = v11(v55.arguments.Min, v59, v55.arguments);
                                v60 = math.max(v60, math.ceil(-math.log10(v63 == 0 and 1 or v63)), v60);
                            end;
                            if v60 > 0 then
                                v58[v59] = ("%%.%*f"):format(v60);
                            else
                                v58[v59] = "%d";
                            end;
                        end;
                        v55.arguments.Format = v58;
                        v55.arguments.Prefix = v23[v39];
                    end;
                    return;
                end;
            end, 
            Discard = function(v64) --[[ Line: 410 ]] --[[ Name: Discard ]]
                -- upvalues: v2 (ref)
                v64.Instance:Destroy();
                v2.discardState(v64);
            end, 
            GenerateState = function(v65) --[[ Line: 414 ]] --[[ Name: GenerateState ]]
                -- upvalues: v1 (ref), v41 (copy)
                if v65.state.number == nil then
                    v65.state.number = v1._widgetState(v65, "number", v41);
                end;
                if v65.state.editingText == nil then
                    v65.state.editingText = v1._widgetState(v65, "editingText", 0);
                end;
            end, 
            UpdateState = function(v66) --[[ Line: 422 ]] --[[ Name: UpdateState ]]
                -- upvalues: v40 (copy), v11 (ref)
                local l_Instance_1 = v66.Instance;
                for v68 = 1, v40 do
                    local l_l_Instance_1_FirstChild_0 = l_Instance_1:FindFirstChild("InputField" .. tostring(v68));
                    local v70 = v66.arguments.Format[v68] or v66.arguments.Format[1];
                    if v66.arguments.Prefix then
                        v70 = v66.arguments.Prefix[v68] .. v70;
                    end;
                    l_l_Instance_1_FirstChild_0.Text = string.format(v70, v11(v66.state.number.value, v68, v66.arguments));
                end;
            end
        };
    end;
    v37 = nil;
    local v71 = nil;
    local v72 = 0;
    local v73 = false;
    local v74 = nil;
    local v75 = 0;
    local v76 = "";
    do
        local l_v72_0, l_v73_0, l_v74_0, l_v75_0, l_v76_0 = v72, v73, v74, v75, v76;
        local function v88() --[[ Line: 450 ]] --[[ Name: updateActiveDrag ]]
            -- upvalues: v2 (copy), l_v72_0 (ref), l_v73_0 (ref), l_v74_0 (ref), l_v76_0 (ref), l_v75_0 (ref), v11 (copy), v20 (copy), v19 (copy), v1 (copy)
            local l_X_0 = v2.getMouseLocation().X;
            local v83 = l_X_0 - l_v72_0;
            l_v72_0 = l_X_0;
            if l_v73_0 == false then
                return;
            elseif l_v74_0 == nil then
                return;
            else
                local l_number_0 = l_v74_0.state.number;
                if l_v76_0 == "Color3" or l_v76_0 == "Color4" then
                    local l_l_v74_0_0 = l_v74_0;
                    l_number_0 = l_l_v74_0_0.state.color;
                    if l_v75_0 == 4 then
                        l_number_0 = l_l_v74_0_0.state.transparency;
                    end;
                end;
                local v86 = (l_v74_0.arguments.Increment and v11(l_v74_0.arguments.Increment, l_v75_0, l_v74_0.arguments) or v20[l_v76_0][l_v75_0]) * ((not not v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) and 10 or 1) * ((not not v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightAlt)) and 0.1 or 1) * ((not (l_v76_0 ~= "Color3") or l_v76_0 == "Color4") and 5 or 1);
                local v87 = v11(l_number_0.value, l_v75_0, l_v74_0.arguments) + v83 * v86;
                if l_v74_0.arguments.Min ~= nil then
                    v87 = math.max(v87, v11(l_v74_0.arguments.Min, l_v75_0, l_v74_0.arguments));
                end;
                if l_v74_0.arguments.Max ~= nil then
                    v87 = math.min(v87, v11(l_v74_0.arguments.Max, l_v75_0, l_v74_0.arguments));
                end;
                l_number_0:set(v19(l_number_0.value, l_v75_0, v87, l_v74_0.arguments));
                l_v74_0.lastNumberChangedTick = v1._cycleTick + 1;
                return;
            end;
        end;
        local l_v88_0 = v88 --[[ copy: 18 -> 22 ]];
        local function v98(v90, v91, v92, v93, v94) --[[ Line: 490 ]] --[[ Name: DragMouseDown ]]
            -- upvalues: v2 (copy), v1 (copy), l_v73_0 (ref), l_v74_0 (ref), l_v75_0 (ref), l_v76_0 (ref), l_v88_0 (copy)
            local v95 = v2.getTime();
            local v96 = v95 - v90.lastClickedTime < v1._config.MouseDoubleClickTime;
            local v97 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            if v96 and (Vector2.new(v93, v94) - v90.lastClickedPosition).Magnitude < v1._config.MouseDoubleClickMaxDist or v97 then
                v90.state.editingText:set(v92);
                return;
            else
                v90.lastClickedTime = v95;
                v90.lastClickedPosition = Vector2.new(v93, v94);
                l_v73_0 = true;
                l_v74_0 = v90;
                l_v75_0 = v92;
                l_v76_0 = v91;
                l_v88_0();
                return;
            end;
        end;
        v2.registerEvent("InputChanged", function() --[[ Line: 508 ]]
            -- upvalues: v1 (copy), l_v88_0 (copy)
            if not v1._started then
                return;
            else
                l_v88_0();
                return;
            end;
        end);
        v2.registerEvent("InputEnded", function(v99) --[[ Line: 515 ]]
            -- upvalues: v1 (copy), l_v73_0 (ref), l_v74_0 (ref), l_v75_0 (ref)
            if not v1._started then
                return;
            else
                if v99.UserInputType == Enum.UserInputType.MouseButton1 and l_v73_0 then
                    l_v73_0 = false;
                    l_v74_0 = nil;
                    l_v75_0 = 0;
                end;
                return;
            end;
        end);
        local l_v98_0 = v98 --[[ copy: 19 -> 23 ]];
        v37 = function(v101, v102, v103) --[[ Line: 526 ]] --[[ Name: generateDragScalar ]]
            -- upvalues: v5 (copy), v2 (copy), v1 (copy), v11 (copy), v19 (copy), l_v98_0 (copy), v24 (copy), v23 (copy)
            return {
                hasState = true, 
                hasChildren = false, 
                Args = {
                    Text = 1, 
                    Increment = 2, 
                    Min = 3, 
                    Max = 4, 
                    Format = 5
                }, 
                Events = {
                    numberChanged = v5, 
                    hovered = v2.EVENTS.hover(function(v104) --[[ Line: 539 ]]
                        return v104.Instance;
                    end)
                }, 
                Generate = function(v105) --[[ Line: 543 ]] --[[ Name: Generate ]]
                    -- upvalues: v101 (copy), v1 (ref), v2 (ref), v102 (copy), v11 (ref), v19 (ref), l_v98_0 (ref)
                    v105.lastClickedTime = -1;
                    v105.lastClickedPosition = Vector2.zero;
                    local l_Frame_1 = Instance.new("Frame");
                    l_Frame_1.Name = "Iris_Drag" .. v101;
                    l_Frame_1.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
                    l_Frame_1.BackgroundTransparency = 1;
                    l_Frame_1.BorderSizePixel = 0;
                    l_Frame_1.LayoutOrder = v105.ZIndex;
                    l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
                    v2.UIListLayout(l_Frame_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
                    local v107 = 0;
                    local v108 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                    if v101 == "Color3" or v101 == "Color4" then
                        v107 = v107 + (v1._config.ItemInnerSpacing.X + v108);
                        local l_ImageLabel_0 = Instance.new("ImageLabel");
                        l_ImageLabel_0.Name = "ColorBox";
                        l_ImageLabel_0.BorderSizePixel = 0;
                        l_ImageLabel_0.Size = UDim2.fromOffset(v108, v108);
                        l_ImageLabel_0.LayoutOrder = 5;
                        l_ImageLabel_0.Image = v2.ICONS.ALPHA_BACKGROUND_TEXTURE;
                        l_ImageLabel_0.ImageTransparency = 1;
                        v2.applyFrameStyle(l_ImageLabel_0, true);
                        l_ImageLabel_0.Parent = l_Frame_1;
                    end;
                    local v110 = UDim.new(v1._config.ContentWidth.Scale / v102, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v102 - 1) - v107) / v102);
                    local v111 = UDim.new(v110.Scale * (v102 - 1), v110.Offset * (v102 - 1) + v1._config.ItemInnerSpacing.X * (v102 - 1) + v107);
                    local v112 = v1._config.ContentWidth - v111;
                    for v113 = 1, v102 do
                        local l_TextButton_0 = Instance.new("TextButton");
                        l_TextButton_0.Name = "DragField" .. tostring(v113);
                        l_TextButton_0.LayoutOrder = v113;
                        if v113 == v102 then
                            l_TextButton_0.Size = UDim2.new(v112, v1._config.ContentHeight);
                        else
                            l_TextButton_0.Size = UDim2.new(v110, v1._config.ContentHeight);
                        end;
                        l_TextButton_0.AutomaticSize = Enum.AutomaticSize.Y;
                        l_TextButton_0.BackgroundColor3 = v1._config.FrameBgColor;
                        l_TextButton_0.BackgroundTransparency = v1._config.FrameBgTransparency;
                        l_TextButton_0.AutoButtonColor = false;
                        l_TextButton_0.Text = "";
                        l_TextButton_0.ClipsDescendants = true;
                        v2.applyFrameStyle(l_TextButton_0);
                        v2.applyTextStyle(l_TextButton_0);
                        v2.UISizeConstraint(l_TextButton_0, Vector2.xAxis);
                        l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Center;
                        l_TextButton_0.Parent = l_Frame_1;
                        v2.applyInteractionHighlights("Background", l_TextButton_0, l_TextButton_0, {
                            Color = v1._config.FrameBgColor, 
                            Transparency = v1._config.FrameBgTransparency, 
                            HoveredColor = v1._config.FrameBgHoveredColor, 
                            HoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                            ActiveColor = v1._config.FrameBgActiveColor, 
                            ActiveTransparency = v1._config.FrameBgActiveTransparency
                        });
                        local l_TextBox_1 = Instance.new("TextBox");
                        l_TextBox_1.Name = "InputField";
                        l_TextBox_1.Size = UDim2.new(1, 0, 1, 0);
                        l_TextBox_1.BackgroundTransparency = 1;
                        l_TextBox_1.ClearTextOnFocus = false;
                        l_TextBox_1.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_TextBox_1.ClipsDescendants = true;
                        l_TextBox_1.Visible = false;
                        v2.applyFrameStyle(l_TextBox_1, true);
                        v2.applyTextStyle(l_TextBox_1);
                        l_TextBox_1.Parent = l_TextButton_0;
                        l_TextBox_1.FocusLost:Connect(function() --[[ Line: 631 ]]
                            -- upvalues: l_TextBox_1 (copy), v105 (copy), v101 (ref), v113 (copy), v11 (ref), v19 (ref), v1 (ref)
                            local v116 = tonumber(l_TextBox_1.Text:match("-?%d*%.?%d*"));
                            local l_number_1 = v105.state.number;
                            local l_v105_0 = v105;
                            if v101 == "Color4" and v113 == 4 then
                                l_number_1 = l_v105_0.state.transparency;
                            elseif v101 == "Color3" or v101 == "Color4" then
                                l_number_1 = l_v105_0.state.color;
                            end;
                            if v116 ~= nil then
                                if v101 == "Color3" or v101 == "Color4" and not l_v105_0.arguments.UseFloats then
                                    v116 = v116 / 255;
                                end;
                                if v105.arguments.Min ~= nil then
                                    v116 = math.max(v116, v11(v105.arguments.Min, v113, v105.arguments));
                                end;
                                if v105.arguments.Max ~= nil then
                                    v116 = math.min(v116, v11(v105.arguments.Max, v113, v105.arguments));
                                end;
                                if v105.arguments.Increment then
                                    v116 = math.round(v116 / v11(v105.arguments.Increment, v113, v105.arguments)) * v11(v105.arguments.Increment, v113, v105.arguments);
                                end;
                                l_number_1:set(v19(l_number_1.value, v113, v116, v105.arguments));
                                v105.lastNumberChangedTick = v1._cycleTick + 1;
                            end;
                            local v119 = v11(l_number_1.value, v113, v105.arguments);
                            if v101 == "Color3" or v101 == "Color4" and not l_v105_0.arguments.UseFloats then
                                v119 = math.round(v119 * 255);
                            end;
                            local v120 = v105.arguments.Format[v113] or v105.arguments.Format[1];
                            if v105.arguments.Prefix then
                                v120 = v105.arguments.Prefix[v113] .. v120;
                            end;
                            l_TextBox_1.Text = string.format(v120, v119);
                            v105.state.editingText:set(0);
                            l_TextBox_1:ReleaseFocus(true);
                        end);
                        l_TextBox_1.Focused:Connect(function() --[[ Line: 674 ]]
                            -- upvalues: l_TextBox_1 (copy), v105 (copy), v113 (copy)
                            l_TextBox_1.CursorPosition = #l_TextBox_1.Text + 1;
                            l_TextBox_1.SelectionStart = 1;
                            v105.state.editingText:set(v113);
                        end);
                        v2.applyButtonDown(l_TextButton_0, function(v121, v122) --[[ Line: 682 ]]
                            -- upvalues: l_v98_0 (ref), v105 (copy), v101 (ref), v113 (copy)
                            l_v98_0(v105, v101, v113, v121, v122);
                        end);
                    end;
                    local l_TextLabel_1 = Instance.new("TextLabel");
                    l_TextLabel_1.Name = "TextLabel";
                    l_TextLabel_1.BackgroundTransparency = 1;
                    l_TextLabel_1.BorderSizePixel = 0;
                    l_TextLabel_1.LayoutOrder = 6;
                    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.XY;
                    v2.applyTextStyle(l_TextLabel_1);
                    l_TextLabel_1.Parent = l_Frame_1;
                    return l_Frame_1;
                end, 
                Update = function(v124) --[[ Line: 700 ]] --[[ Name: Update ]]
                    -- upvalues: v101 (copy), v102 (copy), v24 (ref), v11 (ref), v23 (ref)
                    v124.Instance.TextLabel.Text = v124.arguments.Text or ("Drag %*"):format(v101);
                    if v124.arguments.Format and typeof(v124.arguments.Format) ~= "table" then
                        v124.arguments.Format = {
                            v124.arguments.Format
                        };
                        return;
                    else
                        if not v124.arguments.Format then
                            local v125 = {};
                            for v126 = 1, v102 do
                                local v127 = v24[v101][v126];
                                if v124.arguments.Increment then
                                    local v128 = v11(v124.arguments.Increment, v126, v124.arguments);
                                    v127 = math.max(v127, math.ceil(-math.log10(v128 == 0 and 1 or v128)), v127);
                                end;
                                if v124.arguments.Max then
                                    local v129 = v11(v124.arguments.Max, v126, v124.arguments);
                                    v127 = math.max(v127, math.ceil(-math.log10(v129 == 0 and 1 or v129)), v127);
                                end;
                                if v124.arguments.Min then
                                    local v130 = v11(v124.arguments.Min, v126, v124.arguments);
                                    v127 = math.max(v127, math.ceil(-math.log10(v130 == 0 and 1 or v130)), v127);
                                end;
                                if v127 > 0 then
                                    v125[v126] = ("%%.%*f"):format(v127);
                                else
                                    v125[v126] = "%d";
                                end;
                            end;
                            v124.arguments.Format = v125;
                            v124.arguments.Prefix = v23[v101];
                        end;
                        return;
                    end;
                end, 
                Discard = function(v131) --[[ Line: 740 ]] --[[ Name: Discard ]]
                    -- upvalues: v2 (ref)
                    v131.Instance:Destroy();
                    v2.discardState(v131);
                end, 
                GenerateState = function(v132) --[[ Line: 744 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v103 (copy)
                    if v132.state.number == nil then
                        v132.state.number = v1._widgetState(v132, "number", v103);
                    end;
                    if v132.state.editingText == nil then
                        v132.state.editingText = v1._widgetState(v132, "editingText", false);
                    end;
                end, 
                UpdateState = function(v133) --[[ Line: 752 ]] --[[ Name: UpdateState ]]
                    -- upvalues: v102 (copy), v101 (copy), v11 (ref), v1 (ref)
                    local l_Instance_2 = v133.Instance;
                    for v135 = 1, v102 do
                        local l_number_2 = v133.state.number;
                        if v101 == "Color3" or v101 == "Color4" then
                            l_number_2 = v133.state.color;
                            if v135 == 4 then
                                l_number_2 = v133.state.transparency;
                            end;
                        end;
                        local l_l_Instance_2_FirstChild_0 = l_Instance_2:FindFirstChild("DragField" .. tostring(v135));
                        local l_InputField_0 = l_l_Instance_2_FirstChild_0.InputField;
                        local v139 = v11(l_number_2.value, v135, v133.arguments);
                        if (v101 == "Color3" or v101 == "Color4") and not v133.arguments.UseFloats then
                            v139 = math.round(v139 * 255);
                        end;
                        local v140 = v133.arguments.Format[v135] or v133.arguments.Format[1];
                        if v133.arguments.Prefix then
                            v140 = v133.arguments.Prefix[v135] .. v140;
                        end;
                        l_l_Instance_2_FirstChild_0.Text = string.format(v140, v139);
                        l_InputField_0.Text = tostring(v139);
                        if v133.state.editingText.value == v135 then
                            l_InputField_0.Visible = true;
                            l_InputField_0:CaptureFocus();
                            l_l_Instance_2_FirstChild_0.TextTransparency = 1;
                        else
                            l_InputField_0.Visible = false;
                            l_l_Instance_2_FirstChild_0.TextTransparency = v1._config.TextTransparency;
                        end;
                    end;
                    if v101 == "Color3" or v101 == "Color4" then
                        local l_ColorBox_0 = l_Instance_2.ColorBox;
                        l_ColorBox_0.BackgroundColor3 = v133.state.color.value;
                        if v101 == "Color4" then
                            l_ColorBox_0.ImageTransparency = 1 - v133.state.transparency.value;
                        end;
                    end;
                end
            };
        end;
        v71 = function(v142, ...) --[[ Line: 801 ]] --[[ Name: generateColorDragScalar ]]
            -- upvalues: v37 (ref), v2 (copy), v23 (copy), v1 (copy)
            local v143 = {
                ...
            };
            local v144 = v37(v142, v142 == "Color4" and 4 or 3, v143[1]);
            return v2.extend(v144, {
                Args = {
                    Text = 1, 
                    UseFloats = 2, 
                    UseHSV = 3, 
                    Format = 4
                }, 
                Update = function(v145) --[[ Line: 812 ]] --[[ Name: Update ]]
                    -- upvalues: v142 (copy), v23 (ref), v1 (ref)
                    v145.Instance.TextLabel.Text = v145.arguments.Text or ("Drag %*"):format(v142);
                    if v145.arguments.Format and typeof(v145.arguments.Format) ~= "table" then
                        v145.arguments.Format = {
                            v145.arguments.Format
                        };
                    elseif not v145.arguments.Format then
                        if v145.arguments.UseFloats then
                            v145.arguments.Format = {
                                "%.3f"
                            };
                        else
                            v145.arguments.Format = {
                                "%d"
                            };
                        end;
                        v145.arguments.Prefix = v23[v142 .. (v145.arguments.UseHSV and "_HSV" or "_RGB")];
                    end;
                    v145.arguments.Min = {
                        0, 
                        0, 
                        0, 
                        0
                    };
                    v145.arguments.Max = {
                        1, 
                        1, 
                        1, 
                        1
                    };
                    v145.arguments.Increment = {
                        0.001, 
                        0.001, 
                        0.001, 
                        0.001
                    };
                    if v145.state then
                        v145.state.color.lastChangeTick = v1._cycleTick;
                        if v142 == "Color4" then
                            v145.state.transparency.lastChangeTick = v1._cycleTick;
                        end;
                        v1._widgets[v145.type].UpdateState(v145);
                    end;
                end, 
                GenerateState = function(v146) --[[ Line: 843 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v143 (copy), v142 (copy)
                    if v146.state.color == nil then
                        v146.state.color = v1._widgetState(v146, "color", v143[1]);
                    end;
                    if v142 == "Color4" and v146.state.transparency == nil then
                        v146.state.transparency = v1._widgetState(v146, "transparency", v143[2]);
                    end;
                    if v146.state.editingText == nil then
                        v146.state.editingText = v1._widgetState(v146, "editingText", false);
                    end;
                end
            });
        end;
    end;
    v72 = nil;
    v73 = nil;
    v74 = false;
    v75 = nil;
    v76 = 0;
    local v147 = "";
    do
        local l_v74_1, l_v75_1, l_v76_1, l_v147_0 = v74, v75, v76, v147;
        local function v159() --[[ Line: 871 ]] --[[ Name: updateActiveSlider ]]
            -- upvalues: l_v74_1 (ref), l_v75_1 (ref), l_v76_1 (ref), v11 (copy), v20 (copy), l_v147_0 (ref), v21 (copy), v22 (copy), v2 (copy), v19 (copy), v1 (copy)
            if l_v74_1 == false then
                return;
            elseif l_v75_1 == nil then
                return;
            else
                local l_FirstChild_0 = l_v75_1.Instance:FindFirstChild("SliderField" .. tostring(l_v76_1));
                local l_GrabBar_0 = l_FirstChild_0.GrabBar;
                local v154 = l_v75_1.arguments.Increment and v11(l_v75_1.arguments.Increment, l_v76_1, l_v75_1.arguments) or v20[l_v147_0][l_v76_1];
                local v155 = l_v75_1.arguments.Min and v11(l_v75_1.arguments.Min, l_v76_1, l_v75_1.arguments) or v21[l_v147_0][l_v76_1];
                local v156 = l_v75_1.arguments.Max and v11(l_v75_1.arguments.Max, l_v76_1, l_v75_1.arguments) or v22[l_v147_0][l_v76_1];
                local l_X_1 = l_GrabBar_0.AbsoluteSize.X;
                local v158 = math.clamp(math.round((v2.getMouseLocation().X - (l_FirstChild_0.AbsolutePosition.X - v2.GuiOffset.X + l_X_1 / 2)) / (l_FirstChild_0.AbsoluteSize.X - l_X_1) * math.floor((v156 - v155) / v154)) * v154 + v155, v155, v156);
                l_v75_1.state.number:set(v19(l_v75_1.state.number.value, l_v76_1, v158, l_v75_1.arguments));
                l_v75_1.lastNumberChangedTick = v1._cycleTick + 1;
                return;
            end;
        end;
        local function v163(v160, v161, v162) --[[ Line: 897 ]] --[[ Name: SliderMouseDown ]]
            -- upvalues: v2 (copy), l_v74_1 (ref), l_v75_1 (ref), l_v76_1 (ref), l_v147_0 (ref), v159 (copy)
            if v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                v160.state.editingText:set(v162);
                return;
            else
                l_v74_1 = true;
                l_v75_1 = v160;
                l_v76_1 = v162;
                l_v147_0 = v161;
                v159();
                return;
            end;
        end;
        v2.registerEvent("InputChanged", function() --[[ Line: 910 ]]
            -- upvalues: v1 (copy), v159 (copy)
            if not v1._started then
                return;
            else
                v159();
                return;
            end;
        end);
        v2.registerEvent("InputEnded", function(v164) --[[ Line: 917 ]]
            -- upvalues: v1 (copy), l_v74_1 (ref), l_v75_1 (ref), l_v76_1 (ref), l_v147_0 (ref)
            if not v1._started then
                return;
            else
                if v164.UserInputType == Enum.UserInputType.MouseButton1 and l_v74_1 then
                    l_v74_1 = false;
                    l_v75_1 = nil;
                    l_v76_1 = 0;
                    l_v147_0 = "";
                end;
                return;
            end;
        end);
        v72 = function(v165, v166, v167) --[[ Line: 929 ]] --[[ Name: generateSliderScalar ]]
            -- upvalues: v5 (copy), v2 (copy), v1 (copy), v11 (copy), v19 (copy), v163 (copy), v24 (copy), v23 (copy), v20 (copy), v21 (copy), v22 (copy)
            return {
                hasState = true, 
                hasChildren = false, 
                Args = {
                    Text = 1, 
                    Increment = 2, 
                    Min = 3, 
                    Max = 4, 
                    Format = 5
                }, 
                Events = {
                    numberChanged = v5, 
                    hovered = v2.EVENTS.hover(function(v168) --[[ Line: 942 ]]
                        return v168.Instance;
                    end)
                }, 
                Generate = function(v169) --[[ Line: 946 ]] --[[ Name: Generate ]]
                    -- upvalues: v165 (copy), v1 (ref), v2 (ref), v166 (copy), v11 (ref), v19 (ref), v163 (ref)
                    local l_Frame_2 = Instance.new("Frame");
                    l_Frame_2.Name = "Iris_Slider" .. v165;
                    l_Frame_2.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
                    l_Frame_2.BackgroundTransparency = 1;
                    l_Frame_2.BorderSizePixel = 0;
                    l_Frame_2.LayoutOrder = v169.ZIndex;
                    l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
                    v2.UIListLayout(l_Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
                    local v171 = UDim.new(v1._config.ContentWidth.Scale / v166, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v166 - 1)) / v166);
                    local v172 = UDim.new(v171.Scale * (v166 - 1), v171.Offset * (v166 - 1) + v1._config.ItemInnerSpacing.X * (v166 - 1));
                    local v173 = v1._config.ContentWidth - v172;
                    for v174 = 1, v166 do
                        local l_TextButton_1 = Instance.new("TextButton");
                        l_TextButton_1.Name = "SliderField" .. tostring(v174);
                        l_TextButton_1.LayoutOrder = v174;
                        if v174 == v166 then
                            l_TextButton_1.Size = UDim2.new(v173, v1._config.ContentHeight);
                        else
                            l_TextButton_1.Size = UDim2.new(v171, v1._config.ContentHeight);
                        end;
                        l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
                        l_TextButton_1.BackgroundColor3 = v1._config.FrameBgColor;
                        l_TextButton_1.BackgroundTransparency = v1._config.FrameBgTransparency;
                        l_TextButton_1.AutoButtonColor = false;
                        l_TextButton_1.Text = "";
                        l_TextButton_1.ClipsDescendants = true;
                        v2.applyFrameStyle(l_TextButton_1);
                        v2.applyTextStyle(l_TextButton_1);
                        v2.UISizeConstraint(l_TextButton_1, Vector2.xAxis);
                        l_TextButton_1.Parent = l_Frame_2;
                        local l_TextLabel_2 = Instance.new("TextLabel");
                        l_TextLabel_2.Name = "OverlayText";
                        l_TextLabel_2.Size = UDim2.fromScale(1, 1);
                        l_TextLabel_2.BackgroundTransparency = 1;
                        l_TextLabel_2.BorderSizePixel = 0;
                        l_TextLabel_2.ZIndex = 10;
                        l_TextLabel_2.ClipsDescendants = true;
                        v2.applyTextStyle(l_TextLabel_2);
                        l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
                        l_TextLabel_2.Parent = l_TextButton_1;
                        v2.applyInteractionHighlights("Background", l_TextButton_1, l_TextButton_1, {
                            Color = v1._config.FrameBgColor, 
                            Transparency = v1._config.FrameBgTransparency, 
                            HoveredColor = v1._config.FrameBgHoveredColor, 
                            HoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                            ActiveColor = v1._config.FrameBgActiveColor, 
                            ActiveTransparency = v1._config.FrameBgActiveTransparency
                        });
                        local l_TextBox_2 = Instance.new("TextBox");
                        l_TextBox_2.Name = "InputField";
                        l_TextBox_2.Size = UDim2.new(1, 0, 1, 0);
                        l_TextBox_2.BackgroundTransparency = 1;
                        l_TextBox_2.ClearTextOnFocus = false;
                        l_TextBox_2.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_TextBox_2.ClipsDescendants = true;
                        l_TextBox_2.Visible = false;
                        v2.applyFrameStyle(l_TextBox_2, true);
                        v2.applyTextStyle(l_TextBox_2);
                        l_TextBox_2.Parent = l_TextButton_1;
                        l_TextBox_2.FocusLost:Connect(function() --[[ Line: 1023 ]]
                            -- upvalues: l_TextBox_2 (copy), v169 (copy), v11 (ref), v174 (copy), v19 (ref), v1 (ref)
                            local v178 = tonumber(l_TextBox_2.Text:match("-?%d*%.?%d*"));
                            if v178 ~= nil then
                                if v169.arguments.Min ~= nil then
                                    v178 = math.max(v178, v11(v169.arguments.Min, v174, v169.arguments));
                                end;
                                if v169.arguments.Max ~= nil then
                                    v178 = math.min(v178, v11(v169.arguments.Max, v174, v169.arguments));
                                end;
                                if v169.arguments.Increment then
                                    v178 = math.round(v178 / v11(v169.arguments.Increment, v174, v169.arguments)) * v11(v169.arguments.Increment, v174, v169.arguments);
                                end;
                                v169.state.number:set(v19(v169.state.number.value, v174, v178, v169.arguments));
                                v169.lastNumberChangedTick = v1._cycleTick + 1;
                            end;
                            local v179 = v169.arguments.Format[v174] or v169.arguments.Format[1];
                            if v169.arguments.Prefix then
                                v179 = v169.arguments.Prefix[v174] .. v179;
                            end;
                            l_TextBox_2.Text = string.format(v179, v11(v169.state.number.value, v174, v169.arguments));
                            v169.state.editingText:set(0);
                            l_TextBox_2:ReleaseFocus(true);
                        end);
                        l_TextBox_2.Focused:Connect(function() --[[ Line: 1052 ]]
                            -- upvalues: l_TextBox_2 (copy), v169 (copy), v174 (copy)
                            l_TextBox_2.CursorPosition = #l_TextBox_2.Text + 1;
                            l_TextBox_2.SelectionStart = 1;
                            v169.state.editingText:set(v174);
                        end);
                        v2.applyButtonDown(l_TextButton_1, function() --[[ Line: 1060 ]]
                            -- upvalues: v163 (ref), v169 (copy), v165 (ref), v174 (copy)
                            v163(v169, v165, v174);
                        end);
                        local l_Frame_3 = Instance.new("Frame");
                        l_Frame_3.Name = "GrabBar";
                        l_Frame_3.ZIndex = 5;
                        l_Frame_3.AnchorPoint = Vector2.new(0.5, 0.5);
                        l_Frame_3.Position = UDim2.new(0, 0, 0.5, 0);
                        l_Frame_3.BorderSizePixel = 0;
                        l_Frame_3.BackgroundColor3 = v1._config.SliderGrabColor;
                        l_Frame_3.Transparency = v1._config.SliderGrabTransparency;
                        if v1._config.GrabRounding > 0 then
                            v2.UICorner(l_Frame_3, v1._config.GrabRounding);
                        end;
                        v2.UISizeConstraint(l_Frame_3, Vector2.new(v1._config.GrabMinSize, 0));
                        l_Frame_3.Parent = l_TextButton_1;
                    end;
                    local l_TextLabel_3 = Instance.new("TextLabel");
                    l_TextLabel_3.Name = "TextLabel";
                    l_TextLabel_3.BackgroundTransparency = 1;
                    l_TextLabel_3.BorderSizePixel = 0;
                    l_TextLabel_3.LayoutOrder = 5;
                    l_TextLabel_3.AutomaticSize = Enum.AutomaticSize.XY;
                    v2.applyTextStyle(l_TextLabel_3);
                    l_TextLabel_3.Parent = l_Frame_2;
                    return l_Frame_2;
                end, 
                Update = function(v182) --[[ Line: 1094 ]] --[[ Name: Update ]]
                    -- upvalues: v165 (copy), v166 (copy), v24 (ref), v11 (ref), v23 (ref), v20 (ref), v21 (ref), v22 (ref), v1 (ref)
                    local l_Instance_3 = v182.Instance;
                    l_Instance_3.TextLabel.Text = v182.arguments.Text or ("Slider %*"):format(v165);
                    if v182.arguments.Format and typeof(v182.arguments.Format) ~= "table" then
                        v182.arguments.Format = {
                            v182.arguments.Format
                        };
                    elseif not v182.arguments.Format then
                        local v184 = {};
                        for v185 = 1, v166 do
                            local v186 = v24[v165][v185];
                            if v182.arguments.Increment then
                                local v187 = v11(v182.arguments.Increment, v185, v182.arguments);
                                v186 = math.max(v186, math.ceil(-math.log10(v187 == 0 and 1 or v187)), v186);
                            end;
                            if v182.arguments.Max then
                                local v188 = v11(v182.arguments.Max, v185, v182.arguments);
                                v186 = math.max(v186, math.ceil(-math.log10(v188 == 0 and 1 or v188)), v186);
                            end;
                            if v182.arguments.Min then
                                local v189 = v11(v182.arguments.Min, v185, v182.arguments);
                                v186 = math.max(v186, math.ceil(-math.log10(v189 == 0 and 1 or v189)), v186);
                            end;
                            if v186 > 0 then
                                v184[v185] = ("%%.%*f"):format(v186);
                            else
                                v184[v185] = "%d";
                            end;
                        end;
                        v182.arguments.Format = v184;
                        v182.arguments.Prefix = v23[v165];
                    end;
                    for v190 = 1, v166 do
                        local l_GrabBar_1 = l_Instance_3:FindFirstChild("SliderField" .. tostring(v190)).GrabBar;
                        local v192 = v182.arguments.Increment and v11(v182.arguments.Increment, v190, v182.arguments) or v20[v165][v190];
                        local v193 = v182.arguments.Min and v11(v182.arguments.Min, v190, v182.arguments) or v21[v165][v190];
                        local v194 = 1 / math.floor(((v182.arguments.Max and v11(v182.arguments.Max, v190, v182.arguments) or v22[v165][v190]) + 1 - v193) / v192);
                        l_GrabBar_1.Size = UDim2.new(v194, 0, 1, 0);
                    end;
                    local v195 = #v1._postCycleCallbacks + 1;
                    local v196 = v1._cycleTick + 1;
                    v1._postCycleCallbacks[v195] = function() --[[ Line: 1149 ]]
                        -- upvalues: v1 (ref), v196 (copy), v182 (copy), v165 (ref), v195 (copy)
                        if v1._cycleTick >= v196 then
                            if v182.lastCycleTick ~= -1 then
                                v182.state.number.lastChangeTick = v1._cycleTick;
                                v1._widgets[("Slider%*"):format(v165)].UpdateState(v182);
                            end;
                            v1._postCycleCallbacks[v195] = nil;
                        end;
                    end;
                end, 
                Discard = function(v197) --[[ Line: 1159 ]] --[[ Name: Discard ]]
                    -- upvalues: v2 (ref)
                    v197.Instance:Destroy();
                    v2.discardState(v197);
                end, 
                GenerateState = function(v198) --[[ Line: 1163 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v167 (copy)
                    if v198.state.number == nil then
                        v198.state.number = v1._widgetState(v198, "number", v167);
                    end;
                    if v198.state.editingText == nil then
                        v198.state.editingText = v1._widgetState(v198, "editingText", false);
                    end;
                end, 
                UpdateState = function(v199) --[[ Line: 1171 ]] --[[ Name: UpdateState ]]
                    -- upvalues: v166 (copy), v11 (ref), v20 (ref), v165 (copy), v21 (ref), v22 (ref)
                    local l_Instance_4 = v199.Instance;
                    for v201 = 1, v166 do
                        local l_l_Instance_4_FirstChild_0 = l_Instance_4:FindFirstChild("SliderField" .. tostring(v201));
                        local l_InputField_1 = l_l_Instance_4_FirstChild_0.InputField;
                        local l_OverlayText_0 = l_l_Instance_4_FirstChild_0.OverlayText;
                        local l_GrabBar_2 = l_l_Instance_4_FirstChild_0.GrabBar;
                        local v206 = v11(v199.state.number.value, v201, v199.arguments);
                        local v207 = v199.arguments.Format[v201] or v199.arguments.Format[1];
                        if v199.arguments.Prefix then
                            v207 = v199.arguments.Prefix[v201] .. v207;
                        end;
                        l_OverlayText_0.Text = string.format(v207, v206);
                        l_InputField_1.Text = tostring(v206);
                        local v208 = v199.arguments.Increment and v11(v199.arguments.Increment, v201, v199.arguments) or v20[v165][v201];
                        local v209 = v199.arguments.Min and v11(v199.arguments.Min, v201, v199.arguments) or v21[v165][v201];
                        local v210 = v199.arguments.Max and v11(v199.arguments.Max, v201, v199.arguments) or v22[v165][v201];
                        local l_X_2 = l_l_Instance_4_FirstChild_0.AbsoluteSize.X;
                        local v212 = l_X_2 - l_GrabBar_2.AbsoluteSize.X;
                        local v213 = (v206 - v209) / (v210 - v209);
                        local v214 = math.floor((v210 - v209) / v208);
                        local v215 = math.clamp(math.floor(v213 * v214) / v214, 0, 1);
                        local v216 = v212 / l_X_2 * v215 + (1 - v212 / l_X_2) / 2;
                        l_GrabBar_2.Position = UDim2.new(v216, 0, 0.5, 0);
                        if v199.state.editingText.value == v201 then
                            l_InputField_1.Visible = true;
                            l_OverlayText_0.Visible = false;
                            l_GrabBar_2.Visible = false;
                            l_InputField_1:CaptureFocus();
                        else
                            l_InputField_1.Visible = false;
                            l_OverlayText_0.Visible = true;
                            l_GrabBar_2.Visible = true;
                        end;
                    end;
                end
            };
        end;
        v73 = function(v217, v218) --[[ Line: 1217 ]] --[[ Name: generateEnumSliderScalar ]]
            -- upvalues: v72 (ref), v2 (copy), v1 (copy)
            local v219 = v72("Enum", 1, v218.Value);
            local v220 = {
                string
            };
            for _, v222 in v217:GetEnumItems() do
                v220[v222.Value] = v222.Name;
            end;
            return v2.extend(v219, {
                Args = {
                    Text = 1
                }, 
                Update = function(v223) --[[ Line: 1229 ]] --[[ Name: Update ]]
                    -- upvalues: v217 (copy)
                    local l_Instance_5 = v223.Instance;
                    l_Instance_5.TextLabel.Text = v223.arguments.Text or "Input Enum";
                    v223.arguments.Increment = 1;
                    v223.arguments.Min = 0;
                    v223.arguments.Max = #v217:GetEnumItems() - 1;
                    local l_GrabBar_3 = l_Instance_5:FindFirstChild("SliderField1").GrabBar;
                    local v226 = 1 / math.floor(#v217:GetEnumItems());
                    l_GrabBar_3.Size = UDim2.new(v226, 0, 1, 0);
                end, 
                GenerateState = function(v227) --[[ Line: 1245 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v218 (copy)
                    if v227.state.number == nil then
                        v227.state.number = v1._widgetState(v227, "number", v218.Value);
                    end;
                    if v227.state.enumItem == nil then
                        v227.state.enumItem = v1._widgetState(v227, "enumItem", v218);
                    end;
                    if v227.state.editingText == nil then
                        v227.state.editingText = v1._widgetState(v227, "editingText", false);
                    end;
                end
            });
        end;
    end;
    v74 = v25("Num", 1, 0);
    v74.Args.NoButtons = 6;
    v1.WidgetConstructor("InputNum", v74);
    v1.WidgetConstructor("InputVector2", v25("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("InputVector3", v25("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("InputUDim", v25("UDim", 2, UDim.new()));
    v1.WidgetConstructor("InputUDim2", v25("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("InputRect", v25("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("DragNum", v37("Num", 1, 0));
    v1.WidgetConstructor("DragVector2", v37("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("DragVector3", v37("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("DragUDim", v37("UDim", 2, UDim.new()));
    v1.WidgetConstructor("DragUDim2", v37("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("DragRect", v37("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("InputColor3", v71("Color3", Color3.fromRGB(0, 0, 0)));
    v1.WidgetConstructor("InputColor4", v71("Color4", Color3.fromRGB(0, 0, 0), 0));
    v1.WidgetConstructor("SliderNum", v72("Num", 1, 0));
    v1.WidgetConstructor("SliderVector2", v72("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("SliderVector3", v72("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("SliderUDim", v72("UDim", 2, UDim.new()));
    v1.WidgetConstructor("SliderUDim2", v72("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("SliderRect", v72("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("InputText", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            TextHint = 2, 
            ReadOnly = 3, 
            MultiLine = 4
        }, 
        Events = {
            textChanged = {
                Init = function(v228) --[[ Line: 1301 ]]
                    v228.lastTextChangedTick = 0;
                end, 
                Get = function(v229) --[[ Line: 1304 ]]
                    -- upvalues: v1 (copy)
                    return v229.lastTextChangedTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v230) --[[ Line: 1308 ]]
                return v230.Instance;
            end)
        }, 
        Generate = function(v231) --[[ Line: 1312 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "Iris_InputText";
            l_Frame_4.AutomaticSize = Enum.AutomaticSize.Y;
            l_Frame_4.Size = UDim2.new(v1._config.ItemWidth, UDim.new());
            l_Frame_4.BackgroundTransparency = 1;
            l_Frame_4.BorderSizePixel = 0;
            l_Frame_4.ZIndex = v231.ZIndex;
            l_Frame_4.LayoutOrder = v231.ZIndex;
            v2.UIListLayout(l_Frame_4, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X)).VerticalAlignment = Enum.VerticalAlignment.Center;
            local l_TextBox_3 = Instance.new("TextBox");
            l_TextBox_3.Name = "InputField";
            l_TextBox_3.Size = UDim2.new(v1._config.ContentWidth, v1._config.ContentHeight);
            l_TextBox_3.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextBox_3.BackgroundColor3 = v1._config.FrameBgColor;
            l_TextBox_3.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_TextBox_3.Text = "";
            l_TextBox_3.TextYAlignment = Enum.TextYAlignment.Top;
            l_TextBox_3.PlaceholderColor3 = v1._config.TextDisabledColor;
            l_TextBox_3.ClearTextOnFocus = false;
            l_TextBox_3.ClipsDescendants = true;
            v2.applyFrameStyle(l_TextBox_3);
            v2.applyTextStyle(l_TextBox_3);
            v2.UISizeConstraint(l_TextBox_3, Vector2.xAxis);
            l_TextBox_3.Parent = l_Frame_4;
            l_TextBox_3.FocusLost:Connect(function() --[[ Line: 1343 ]]
                -- upvalues: v231 (copy), l_TextBox_3 (copy), v1 (ref)
                v231.state.text:set(l_TextBox_3.Text);
                v231.lastTextChangedTick = v1._cycleTick + 1;
            end);
            local v234 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
            local l_TextLabel_4 = Instance.new("TextLabel");
            l_TextLabel_4.Name = "TextLabel";
            l_TextLabel_4.Size = UDim2.fromOffset(0, v234);
            l_TextLabel_4.AutomaticSize = Enum.AutomaticSize.X;
            l_TextLabel_4.BackgroundTransparency = 1;
            l_TextLabel_4.BorderSizePixel = 0;
            l_TextLabel_4.LayoutOrder = 1;
            v2.applyTextStyle(l_TextLabel_4);
            l_TextLabel_4.Parent = l_Frame_4;
            return l_Frame_4;
        end, 
        Update = function(v236) --[[ Line: 1364 ]] --[[ Name: Update ]]
            local l_Instance_6 = v236.Instance;
            local l_TextLabel_5 = l_Instance_6.TextLabel;
            local l_InputField_2 = l_Instance_6.InputField;
            l_TextLabel_5.Text = v236.arguments.Text or "Input Text";
            l_InputField_2.PlaceholderText = v236.arguments.TextHint or "";
            l_InputField_2.TextEditable = not v236.arguments.ReadOnly;
            l_InputField_2.MultiLine = v236.arguments.MultiLine or false;
        end, 
        Discard = function(v240) --[[ Line: 1374 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v240.Instance:Destroy();
            v2.discardState(v240);
        end, 
        GenerateState = function(v241) --[[ Line: 1378 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v241.state.text == nil then
                v241.state.text = v1._widgetState(v241, "text", "");
            end;
        end, 
        UpdateState = function(v242) --[[ Line: 1383 ]] --[[ Name: UpdateState ]]
            v242.Instance.InputField.Text = v242.state.text.value;
        end
    });
end;