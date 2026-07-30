-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v2 = require(l_ReplicatedStorage_0.AdminUI.Theme);
return function(v3) --[[ Line: 8 ]]
    local v4 = " " .. v3.DisplayName;
    local v5 = "@" .. v3.Username;
    local v6 = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v3.UserId)));
    local v7 = v1.State("None");
    return v1.New("ImageButton")({
        Name = "InlineUser", 
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundColor3 = v1.Computed(function() --[[ Line: 25 ]]
            if v7:get() == "Pressing" then
                return v2.InlineUserPressing;
            elseif v7:get() == "Hovering" then
                return v2.InlineUserHovering;
            else
                return v2.InlineUserBackground;
            end;
        end), 
        LayoutOrder = -1, 
        Visible = v3.Visible, 
        [v1.OnEvent("InputBegan")] = function(v8) --[[ Line: 37 ]]
            if v8.UserInputType == Enum.UserInputType.MouseMovement and v8.UserInputState == Enum.UserInputState.Change then
                v7:set("Hovering");
            end;
            if v8.UserInputType == Enum.UserInputType.MouseButton1 and v8.UserInputState == Enum.UserInputState.Begin then
                v7:set("Pressing");
            end;
            if v8.UserInputType == Enum.UserInputType.Touch and v8.UserInputState == Enum.UserInputState.Begin then
                v7:set("Pressing");
            end;
        end, 
        [v1.OnEvent("InputEnded")] = function(v9) --[[ Line: 51 ]]
            if v9.UserInputType == Enum.UserInputType.MouseMovement and v9.UserInputState == Enum.UserInputState.Change then
                v7:set("None");
            end;
            if v9.UserInputType == Enum.UserInputType.MouseButton1 and v9.UserInputState == Enum.UserInputState.End and v7:get() == "Pressing" then
                v7:set("Hovering");
            end;
            if v9.UserInputType == Enum.UserInputType.Touch and v9.UserInputState == Enum.UserInputState.End then
                v7:set("None");
            end;
            if v9.UserInputType == Enum.UserInputType.Touch and v9.UserInputState == Enum.UserInputState.Change then
                v7:set("None");
            end;
        end, 
        [v1.OnEvent("Activated")] = v3.OnActivated, 
        [v1.Children] = {
            v1.New("UICorner")({
                CornerRadius = UDim.new(0, 5)
            }), 
            v1.Computed(function() --[[ Line: 77 ]]
                if v7:get() == "Hovering" then
                    return v1.New("UIStroke")({
                        Thickness = 1, 
                        Color = v2.InlineUserHoveringStroke
                    });
                else
                    return;
                end;
            end), 
            v1.New("UIPadding")({
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8), 
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            v1.New("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            v1.New("ImageLabel")({
                Name = "Avatar", 
                BackgroundTransparency = 1, 
                Image = v6, 
                Size = UDim2.fromScale(0, 1), 
                [v1.Children] = {
                    v1.New("UIAspectRatioConstraint")({
                        AspectType = Enum.AspectType.ScaleWithParentSize, 
                        DominantAxis = Enum.DominantAxis.Height
                    }), 
                    v1.New("UICorner")({
                        CornerRadius = UDim.new(0, 6)
                    })
                }
            }), 
            v1.New("TextLabel")({
                Name = "DisplayName", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = v4, 
                TextSize = 16, 
                TextColor3 = v2.InlineUserDisplayName, 
                Font = Enum.Font.GothamBold
            }), 
            v1.New("TextLabel")({
                Name = "Username", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = v5, 
                TextSize = 16, 
                TextColor3 = v2.InlineUserUsername, 
                Font = Enum.Font.GothamSemibold
            })
        }
    });
end;