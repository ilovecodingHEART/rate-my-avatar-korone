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
    local v4 = v1.State("None");
    return v1.New("ImageButton")({
        Name = "PlayerGridItem" .. v3.DisplayName, 
        Active = v1.Computed(function() --[[ Line: 18 ]]
            return not v3.IsSelected:get();
        end), 
        BackgroundColor3 = v1.Computed(function() --[[ Line: 21 ]]
            if v3.IsSelected:get() then
                return v2.PlayerSelected;
            elseif v4:get() == "Pressing" then
                return v2.PlayerPressing;
            elseif v4:get() == "Hovering" then
                return v2.PlayerHovering;
            else
                return v2.PlayerBackground;
            end;
        end), 
        [v1.OnEvent("InputBegan")] = function(v5) --[[ Line: 35 ]]
            if v5.UserInputType == Enum.UserInputType.MouseMovement and v5.UserInputState == Enum.UserInputState.Change then
                v4:set("Hovering");
            end;
            if v5.UserInputType == Enum.UserInputType.MouseButton1 and v5.UserInputState == Enum.UserInputState.Begin then
                v4:set("Pressing");
            end;
            if v5.UserInputType == Enum.UserInputType.Touch and v5.UserInputState == Enum.UserInputState.Begin then
                v4:set("Pressing");
            end;
        end, 
        [v1.OnEvent("InputEnded")] = function(v6) --[[ Line: 49 ]]
            if v6.UserInputType == Enum.UserInputType.MouseMovement and v6.UserInputState == Enum.UserInputState.Change then
                v4:set("None");
            end;
            if v6.UserInputType == Enum.UserInputType.MouseButton1 and v6.UserInputState == Enum.UserInputState.End and v4:get() == "Pressing" then
                v4:set("Hovering");
            end;
            if v6.UserInputType == Enum.UserInputType.Touch and v6.UserInputState == Enum.UserInputState.End then
                v4:set("None");
            end;
            if v6.UserInputType == Enum.UserInputType.Touch and v6.UserInputState == Enum.UserInputState.Change then
                v4:set("None");
            end;
        end, 
        [v1.OnEvent("Activated")] = v3.OnActivated, 
        [v1.Children] = {
            v1.New("UICorner")({
                CornerRadius = UDim.new(0, 8)
            }), 
            v1.New("UIStroke")({
                Color = v2.PlayerStroke
            }), 
            v1.New("UIPadding")({
                PaddingBottom = UDim.new(0, 8), 
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 8)
            }), 
            v1.New("ImageLabel")({
                Name = "Avatar", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(34, 34), 
                Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v3.UserId))), 
                [v1.Children] = v1.New("UICorner")({
                    CornerRadius = UDim.new(0, 8)
                })
            }), 
            v1.New("Frame")({
                Name = "UserInfo", 
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(42, 0), 
                Size = UDim2.new(1, -42, 1, 0), 
                [v1.Children] = {
                    v1.New("UIListLayout")({
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 2)
                    }), 
                    v1.New("TextLabel")({
                        Name = "DisplayName", 
                        BackgroundTransparency = 1, 
                        Text = v3.DisplayName, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextSize = 14, 
                        TextColor3 = v2.PlayerDisplayName, 
                        Font = Enum.Font.GothamBold
                    }), 
                    v1.New("TextLabel")({
                        Name = "Username", 
                        BackgroundTransparency = 1, 
                        Text = "@" .. v3.Username, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextSize = 12, 
                        TextColor3 = v2.PlayerUsername, 
                        Font = Enum.Font.GothamSemibold
                    })
                }
            })
        }
    });
end;