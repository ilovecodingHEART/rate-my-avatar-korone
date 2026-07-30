-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x6, if-expr -> __2021_if x4, compound-assign x0, shims: __2021_clone
-- WARNING: 1 Font.from*/Font.new/.FontFace line(s) remain (2022 Font value type); rewrite to Enum.Font by hand where it errors.
-- !! MANUAL FIX REQUIRED: 1 site(s) use if-expressions or `continue`,
-- !! which DO NOT COMPILE on 2021. See 2021-fixed/MANUAL-FIXES.md for the lines
-- !! and REPORT-2021.md for rewrite recipes. They are marked below.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- [2021] no table.clone on this client (2022 API); shallow clone + metatable, like the real one
local function __2021_clone(vt)
	local vn = setmetatable({}, getmetatable(vt));
	for k, v in pairs(vt) do vn[k] = v end
	return vn
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Types);
local v1 = {};
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.GuiService = game:GetService("GuiService");
    v1.RunService = game:GetService("RunService");
    v1.UserInputService = game:GetService("UserInputService");
    v1.ContextActionService = game:GetService("ContextActionService");
    v1.TextService = game:GetService("TextService");
    v1.ICONS = {
        BLANK_SQUARE = "rbxasset://textures/SurfacesDefault.png", 
        RIGHT_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_right.png", 
        DOWN_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_down.png", 
        MULTIPLICATION_SIGN = "rbxasset://textures/AnimationEditor/icon_close.png", 
        BOTTOM_RIGHT_CORNER = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png", 
        CHECK_MARK = "rbxasset://textures/AnimationEditor/icon_checkmark.png", 
        BORDER = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png", 
        ALPHA_BACKGROUND_TEXTURE = "rbxasset://textures/meshPartFallback.png", 
        UNKNOWN_TEXTURE = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    };
    v1.IS_STUDIO = v1.RunService:IsStudio();
    v1.getTime = function() --[[ Line: 25 ]] --[[ Name: getTime ]]
        -- upvalues: v1 (ref)
        if v1.IS_STUDIO then
            return os.clock();
        else
            return time();
        end;
    end;
    v1.GuiOffset = __2021_if(function() return v2._config.IgnoreGuiInset end, function() return -v1.GuiService:GetGuiInset() end, function() return Vector2.zero end);
    v1.MouseOffset = __2021_if(function() return v2._config.IgnoreGuiInset end, function() return Vector2.zero end, function() return v1.GuiService:GetGuiInset() end);
    local v3 = nil;
    v3 = v1.GuiService:GetPropertyChangedSignal("TopbarInset"):Once(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v2 (copy), v3 (ref)
        v1.MouseOffset = __2021_if(function() return v2._config.IgnoreGuiInset end, function() return Vector2.zero end, function() return v1.GuiService:GetGuiInset() end);
        v1.GuiOffset = __2021_if(function() return v2._config.IgnoreGuiInset end, function() return -v1.GuiService:GetGuiInset() end, function() return Vector2.zero end);
        v3:Disconnect();
    end);
    task.delay(5, function() --[[ Line: 47 ]]
        -- upvalues: v3 (ref)
        v3:Disconnect();
    end);
    v1.getMouseLocation = function() --[[ Line: 51 ]] --[[ Name: getMouseLocation ]]
        -- upvalues: v1 (ref)
        return v1.UserInputService:GetMouseLocation() - v1.MouseOffset;
    end;
    v1.isPosInsideRect = function(v4, v5, v6) --[[ Line: 55 ]] --[[ Name: isPosInsideRect ]]
        local v7 = false;
        if v4.X >= v5.X then
            v7 = false;
            if v4.X <= v6.X then
                v7 = false;
                if v4.Y >= v5.Y then
                    v7 = v4.Y <= v6.Y;
                end;
            end;
        end;
        return v7;
    end;
    v1.findBestWindowPosForPopup = function(v8, v9, v10, v11) --[[ Line: 59 ]] --[[ Name: findBestWindowPosForPopup ]]
        v8 = if v8.X + v9.X + 20 > v11.X then if v8.Y + v9.Y + 20 > v11.Y then v8 + Vector2.new(0, -(20 + v9.Y)) else v8 + Vector2.new(0, 20) else v8 + Vector2.new(20); -- << MANUAL FIX: if-expr (could not auto-convert) (2021 cannot compile this) >>
        return (Vector2.new(math.max(math.min(v8.X + v9.X, v11.X) - v9.X, v10.X), (math.max(math.min(v8.Y + v9.Y, v11.Y) - v9.Y, v10.Y))));
    end;
    v1.getScreenSizeForWindow = function(v12) --[[ Line: 79 ]] --[[ Name: getScreenSizeForWindow ]]
        if v12.Instance:IsA("GuiBase2d") then
            return v12.Instance.AbsoluteSize;
        else
            local l_Parent_0 = v12.Instance.Parent;
            if l_Parent_0:IsA("GuiBase2d") then
                return l_Parent_0.AbsoluteSize;
            elseif l_Parent_0.Parent:IsA("GuiBase2d") then
                return l_Parent_0.AbsoluteSize;
            else
                return workspace.CurrentCamera.ViewportSize;
            end;
        end;
    end;
    v1.extend = function(v14, v15) --[[ Line: 96 ]] --[[ Name: extend ]]
        local v16 = __2021_clone(v14);
        for v17, v18 in pairs(v15) --[[ 2021 ]] do
            v16[v17] = v18;
        end;
        return v16;
    end;
    v1.UIPadding = function(v19, v20) --[[ Line: 104 ]] --[[ Name: UIPadding ]]
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingLeft = UDim.new(0, v20.X);
        l_UIPadding_0.PaddingRight = UDim.new(0, v20.X);
        l_UIPadding_0.PaddingTop = UDim.new(0, v20.Y);
        l_UIPadding_0.PaddingBottom = UDim.new(0, v20.Y);
        l_UIPadding_0.Parent = v19;
        return l_UIPadding_0;
    end;
    v1.UIListLayout = function(v22, v23, v24) --[[ Line: 114 ]] --[[ Name: UIListLayout ]]
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = v24;
        l_UIListLayout_0.FillDirection = v23;
        l_UIListLayout_0.Parent = v22;
        return l_UIListLayout_0;
    end;
    v1.UIStroke = function(v26, v27, v28, v29) --[[ Line: 123 ]] --[[ Name: UIStroke ]]
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Thickness = v27;
        l_UIStroke_0.Color = v28;
        l_UIStroke_0.Transparency = v29;
        l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        l_UIStroke_0.LineJoinMode = Enum.LineJoinMode.Round;
        l_UIStroke_0.Parent = v26;
        return l_UIStroke_0;
    end;
    v1.UICorner = function(v31, v32) --[[ Line: 134 ]] --[[ Name: UICorner ]]
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(v32 and 0 or 1, v32 or 0);
        l_UICorner_0.Parent = v31;
        return l_UICorner_0;
    end;
    v1.UISizeConstraint = function(v34, v35, v36) --[[ Line: 141 ]] --[[ Name: UISizeConstraint ]]
        local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
        l_UISizeConstraint_0.MinSize = v35 or l_UISizeConstraint_0.MinSize;
        l_UISizeConstraint_0.MaxSize = v36 or l_UISizeConstraint_0.MaxSize;
        l_UISizeConstraint_0.Parent = v34;
        return l_UISizeConstraint_0;
    end;
    v1.applyTextStyle = function(v38) --[[ Line: 151 ]] --[[ Name: applyTextStyle ]]
        -- upvalues: v2 (copy)
        v38.FontFace = v2._config.TextFont;
        v38.TextSize = v2._config.TextSize;
        v38.TextColor3 = v2._config.TextColor;
        v38.TextTransparency = v2._config.TextTransparency;
        v38.TextXAlignment = Enum.TextXAlignment.Left;
        v38.TextYAlignment = Enum.TextYAlignment.Center;
        v38.RichText = v2._config.RichText;
        v38.TextWrapped = v2._config.TextWrapped;
        v38.AutoLocalize = false;
    end;
    v1.applyInteractionHighlights = function(v39, v40, v41, v42) --[[ Line: 164 ]] --[[ Name: applyInteractionHighlights ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v43 = false;
        v1.applyMouseEnter(v40, function() --[[ Line: 166 ]]
            -- upvalues: v41 (copy), v39 (copy), v42 (copy), v43 (ref)
            v41[v39 .. "Color3"] = v42.HoveredColor;
            v41[v39 .. "Transparency"] = v42.HoveredTransparency;
            v43 = false;
        end);
        v1.applyMouseLeave(v40, function() --[[ Line: 173 ]]
            -- upvalues: v41 (copy), v39 (copy), v42 (copy), v43 (ref)
            v41[v39 .. "Color3"] = v42.Color;
            v41[v39 .. "Transparency"] = v42.Transparency;
            v43 = true;
        end);
        v1.applyInputBegan(v40, function(v44) --[[ Line: 180 ]]
            -- upvalues: v41 (copy), v39 (copy), v42 (copy)
            if v44.UserInputType ~= Enum.UserInputType.MouseButton1 and v44.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                v41[v39 .. "Color3"] = v42.ActiveColor;
                v41[v39 .. "Transparency"] = v42.ActiveTransparency;
                return;
            end;
        end);
        v1.applyInputEnded(v40, function(v45) --[[ Line: 188 ]]
            -- upvalues: v43 (ref), v41 (copy), v39 (copy), v42 (copy)
            if v45.UserInputType ~= Enum.UserInputType.MouseButton1 and v45.UserInputType ~= Enum.UserInputType.Gamepad1 or v43 then
                return;
            else
                if v45.UserInputType == Enum.UserInputType.MouseButton1 then
                    v41[v39 .. "Color3"] = v42.HoveredColor;
                    v41[v39 .. "Transparency"] = v42.HoveredTransparency;
                end;
                if v45.UserInputType == Enum.UserInputType.Gamepad1 then
                    v41[v39 .. "Color3"] = v42.Color;
                    v41[v39 .. "Transparency"] = v42.Transparency;
                end;
                return;
            end;
        end);
        v40.SelectionImageObject = v2.SelectionImageObject;
    end;
    v1.applyInteractionHighlightsWithMultiHighlightee = function(v46, v47, v48) --[[ Line: 205 ]] --[[ Name: applyInteractionHighlightsWithMultiHighlightee ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v49 = false;
        v1.applyMouseEnter(v47, function() --[[ Line: 207 ]]
            -- upvalues: v48 (copy), v46 (copy), v49 (ref)
            for _, v51 in pairs(v48) --[[ 2021 ]] do
                v51[1][v46 .. "Color3"] = v51[2].HoveredColor;
                v51[1][v46 .. "Transparency"] = v51[2].HoveredTransparency;
                v49 = false;
            end;
        end);
        v1.applyMouseLeave(v47, function() --[[ Line: 216 ]]
            -- upvalues: v48 (copy), v46 (copy), v49 (ref)
            for _, v53 in pairs(v48) --[[ 2021 ]] do
                v53[1][v46 .. "Color3"] = v53[2].Color;
                v53[1][v46 .. "Transparency"] = v53[2].Transparency;
                v49 = true;
            end;
        end);
        v1.applyInputBegan(v47, function(v54) --[[ Line: 225 ]]
            -- upvalues: v48 (copy), v46 (copy)
            if v54.UserInputType ~= Enum.UserInputType.MouseButton1 and v54.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                for _, v56 in pairs(v48) --[[ 2021 ]] do
                    v56[1][v46 .. "Color3"] = v56[2].ActiveColor;
                    v56[1][v46 .. "Transparency"] = v56[2].ActiveTransparency;
                end;
                return;
            end;
        end);
        v1.applyInputEnded(v47, function(v57) --[[ Line: 235 ]]
            -- upvalues: v49 (ref), v48 (copy), v46 (copy)
            if v57.UserInputType ~= Enum.UserInputType.MouseButton1 and v57.UserInputType ~= Enum.UserInputType.Gamepad1 or v49 then
                return;
            else
                for _, v59 in pairs(v48) --[[ 2021 ]] do
                    if v57.UserInputType == Enum.UserInputType.MouseButton1 then
                        v59[1][v46 .. "Color3"] = v59[2].HoveredColor;
                        v59[1][v46 .. "Transparency"] = v59[2].HoveredTransparency;
                    end;
                    if v57.UserInputType == Enum.UserInputType.Gamepad1 then
                        v59[1][v46 .. "Color3"] = v59[2].Color;
                        v59[1][v46 .. "Transparency"] = v59[2].Transparency;
                    end;
                end;
                return;
            end;
        end);
        v47.SelectionImageObject = v2.SelectionImageObject;
    end;
    v1.applyFrameStyle = function(v60, v61, v62) --[[ Line: 254 ]] --[[ Name: applyFrameStyle ]]
        -- upvalues: v2 (copy), v1 (ref)
        local l_FrameBorderSize_0 = v2._config.FrameBorderSize;
        local l_FrameRounding_0 = v2._config.FrameRounding;
        v60.BorderSizePixel = 0;
        if l_FrameBorderSize_0 > 0 then
            v1.UIStroke(v60, l_FrameBorderSize_0, v2._config.BorderColor, v2._config.BorderTransparency);
        end;
        if l_FrameRounding_0 > 0 and not v62 then
            v1.UICorner(v60, l_FrameRounding_0);
        end;
        if not v61 then
            v1.UIPadding(v60, v2._config.FramePadding);
        end;
    end;
    v1.applyButtonClick = function(v65, v66) --[[ Line: 272 ]] --[[ Name: applyButtonClick ]]
        v65.MouseButton1Click:Connect(function() --[[ Line: 273 ]]
            -- upvalues: v66 (copy)
            v66();
        end);
    end;
    v1.applyButtonDown = function(v67, v68) --[[ Line: 278 ]] --[[ Name: applyButtonDown ]]
        -- upvalues: v1 (ref)
        v67.MouseButton1Down:Connect(function(v69, v70) --[[ Line: 279 ]]
            -- upvalues: v1 (ref), v68 (copy)
            local v71 = Vector2.new(v69, v70) - v1.MouseOffset;
            v68(v71.X, v71.Y);
        end);
    end;
    v1.applyMouseEnter = function(v72, v73) --[[ Line: 285 ]] --[[ Name: applyMouseEnter ]]
        -- upvalues: v1 (ref)
        v72.MouseEnter:Connect(function(v74, v75) --[[ Line: 286 ]]
            -- upvalues: v1 (ref), v73 (copy)
            local v76 = Vector2.new(v74, v75) - v1.MouseOffset;
            v73(v76.X, v76.Y);
        end);
    end;
    v1.applyMouseMoved = function(v77, v78) --[[ Line: 292 ]] --[[ Name: applyMouseMoved ]]
        -- upvalues: v1 (ref)
        v77.MouseMoved:Connect(function(v79, v80) --[[ Line: 293 ]]
            -- upvalues: v1 (ref), v78 (copy)
            local v81 = Vector2.new(v79, v80) - v1.MouseOffset;
            v78(v81.X, v81.Y);
        end);
    end;
    v1.applyMouseLeave = function(v82, v83) --[[ Line: 299 ]] --[[ Name: applyMouseLeave ]]
        -- upvalues: v1 (ref)
        v82.MouseLeave:Connect(function(v84, v85) --[[ Line: 300 ]]
            -- upvalues: v1 (ref), v83 (copy)
            local v86 = Vector2.new(v84, v85) - v1.MouseOffset;
            v83(v86.X, v86.Y);
        end);
    end;
    v1.applyInputBegan = function(v87, v88) --[[ Line: 306 ]] --[[ Name: applyInputBegan ]]
        v87.InputBegan:Connect(function(...) --[[ Line: 307 ]]
            -- upvalues: v88 (copy)
            v88(...);
        end);
    end;
    v1.applyInputEnded = function(v89, v90) --[[ Line: 312 ]] --[[ Name: applyInputEnded ]]
        v89.InputEnded:Connect(function(...) --[[ Line: 313 ]]
            -- upvalues: v90 (copy)
            v90(...);
        end);
    end;
    v1.discardState = function(v91) --[[ Line: 318 ]] --[[ Name: discardState ]]
        for _, v93 in pairs(v91.state) --[[ 2021 ]] do
            v93.ConnectedWidgets[v91.ID] = nil;
        end;
    end;
    v1.registerEvent = function(v94, v95) --[[ Line: 324 ]] --[[ Name: registerEvent ]]
        -- upvalues: v2 (copy), v1 (ref)
        table.insert(v2._initFunctions, function() --[[ Line: 325 ]]
            -- upvalues: v2 (ref), v1 (ref), v94 (copy), v95 (copy)
            table.insert(v2._connections, v1.UserInputService[v94]:Connect(v95));
        end);
    end;
    v1.EVENTS = {
        hover = function(v96) --[[ Line: 331 ]] --[[ Name: hover ]]
            -- upvalues: v1 (ref)
            return {
                Init = function(v97) --[[ Line: 333 ]]
                    -- upvalues: v96 (copy), v1 (ref)
                    local v98 = v96(v97);
                    v1.applyMouseEnter(v98, function() --[[ Line: 335 ]]
                        -- upvalues: v97 (copy)
                        v97.isHoveredEvent = true;
                    end);
                    v1.applyMouseLeave(v98, function() --[[ Line: 338 ]]
                        -- upvalues: v97 (copy)
                        v97.isHoveredEvent = false;
                    end);
                    v97.isHoveredEvent = false;
                end, 
                Get = function(v99) --[[ Line: 343 ]]
                    return v99.isHoveredEvent;
                end
            };
        end, 
        click = function(v100) --[[ Line: 349 ]] --[[ Name: click ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v101) --[[ Line: 351 ]]
                    -- upvalues: v100 (copy), v1 (ref), v2 (ref)
                    local v102 = v100(v101);
                    v101.lastClickedTick = -1;
                    v1.applyButtonClick(v102, function() --[[ Line: 355 ]]
                        -- upvalues: v101 (copy), v2 (ref)
                        v101.lastClickedTick = v2._cycleTick + 1;
                    end);
                end, 
                Get = function(v103) --[[ Line: 359 ]]
                    -- upvalues: v2 (ref)
                    return v103.lastClickedTick == v2._cycleTick;
                end
            };
        end, 
        rightClick = function(v104) --[[ Line: 365 ]] --[[ Name: rightClick ]]
            -- upvalues: v2 (copy)
            return {
                Init = function(v105) --[[ Line: 367 ]]
                    -- upvalues: v104 (copy), v2 (ref)
                    local v106 = v104(v105);
                    v105.lastRightClickedTick = -1;
                    v106.MouseButton2Click:Connect(function() --[[ Line: 371 ]]
                        -- upvalues: v105 (copy), v2 (ref)
                        v105.lastRightClickedTick = v2._cycleTick + 1;
                    end);
                end, 
                Get = function(v107) --[[ Line: 375 ]]
                    -- upvalues: v2 (ref)
                    return v107.lastRightClickedTick == v2._cycleTick;
                end
            };
        end, 
        doubleClick = function(v108) --[[ Line: 381 ]] --[[ Name: doubleClick ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v109) --[[ Line: 383 ]]
                    -- upvalues: v108 (copy), v1 (ref), v2 (ref)
                    local v110 = v108(v109);
                    v109.lastClickedTime = -1;
                    v109.lastClickedPosition = Vector2.zero;
                    v109.lastDoubleClickedTick = -1;
                    v1.applyButtonDown(v110, function(v111, v112) --[[ Line: 389 ]]
                        -- upvalues: v1 (ref), v109 (copy), v2 (ref)
                        local v113 = v1.getTime();
                        if v113 - v109.lastClickedTime < v2._config.MouseDoubleClickTime and (Vector2.new(v111, v112) - v109.lastClickedPosition).Magnitude < v2._config.MouseDoubleClickMaxDist then
                            v109.lastDoubleClickedTick = v2._cycleTick + 1;
                            return;
                        else
                            v109.lastClickedTime = v113;
                            v109.lastClickedPosition = Vector2.new(v111, v112);
                            return;
                        end;
                    end);
                end, 
                Get = function(v114) --[[ Line: 400 ]]
                    -- upvalues: v2 (ref)
                    return v114.lastDoubleClickedTick == v2._cycleTick;
                end
            };
        end, 
        ctrlClick = function(v115) --[[ Line: 406 ]] --[[ Name: ctrlClick ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v116) --[[ Line: 408 ]]
                    -- upvalues: v115 (copy), v1 (ref), v2 (ref)
                    local v117 = v115(v116);
                    v116.lastCtrlClickedTick = -1;
                    v1.applyButtonClick(v117, function() --[[ Line: 412 ]]
                        -- upvalues: v1 (ref), v116 (copy), v2 (ref)
                        if v1.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v1.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                            v116.lastCtrlClickedTick = v2._cycleTick + 1;
                        end;
                    end);
                end, 
                Get = function(v118) --[[ Line: 418 ]]
                    -- upvalues: v2 (ref)
                    return v118.lastCtrlClickedTick == v2._cycleTick;
                end
            };
        end
    };
    v2._utility = v1;
    require(script.Root)(v2, v1);
    require(script.Window)(v2, v1);
    require(script.Menu)(v2, v1);
    require(script.Format)(v2, v1);
    require(script.Text)(v2, v1);
    require(script.Button)(v2, v1);
    require(script.Checkbox)(v2, v1);
    require(script.RadioButton)(v2, v1);
    require(script.Image)(v2, v1);
    require(script.Tree)(v2, v1);
    require(script.Tab)(v2, v1);
    require(script.Input)(v2, v1);
    require(script.Combo)(v2, v1);
    require(script.Plot)(v2, v1);
    require(script.Table)(v2, v1);
end;