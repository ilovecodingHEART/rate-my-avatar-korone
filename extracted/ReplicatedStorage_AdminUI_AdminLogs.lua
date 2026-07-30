-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserService_0 = game:GetService("UserService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Fusion);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.AdminUI.Theme);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
naturalTime = function(v7) --[[ Line: 17 ]] --[[ Name: naturalTime ]]
    local v8 = DateTime.now().UnixTimestamp - v7.UnixTimestamp;
    if v8 < 10 then
        return "Just now";
    elseif v8 < 60 then
        return string.format("%i seconds ago", v8);
    elseif v8 < 120 then
        return "a minute ago";
    elseif v8 < 3600 then
        return string.format("%i minutes ago", v8 / 60);
    elseif v8 < 7200 then
        return "an hour ago";
    elseif v8 < 86400 then
        return string.format("%i hours ago", v8 / 3600);
    else
        return v7:FormatLocalTime("LLL", l_LocalPlayer_0.LocaleId);
    end;
end;
local function v10(v9) --[[ Line: 39 ]] --[[ Name: BaseAdminLog ]]
    return v3.New("Frame")({
        Name = v9.Name, 
        BackgroundColor3 = v5.AdminLog, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        LayoutOrder = v9.LayoutOrder, 
        [v3.Children] = {
            v3.New("UICorner")({
                CornerRadius = UDim.new(0, 10)
            }), 
            v3.New("UIStroke")({
                Color = v5.AdminLogStroke
            }), 
            v3.New("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 24), 
                PaddingTop = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            v3.New("UIListLayout")({
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            v9[v3.Children]
        }
    });
end;
local function v12(v11) --[[ Line: 67 ]] --[[ Name: AdminLogLabel ]]
    return v3.New("TextLabel")({
        Name = v11.Name, 
        LayoutOrder = v11.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        RichText = true, 
        TextSize = v11.TextSize, 
        TextTransparency = v11.TextTransparency, 
        TextColor3 = v5.AdminLogText, 
        Text = v11.Text, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left
    });
end;
local function v14(v13) --[[ Line: 84 ]] --[[ Name: KickAdminLog ]]
    return v10({
        Name = "KickAdminLog", 
        LayoutOrder = v13.LayoutOrder, 
        [v3.Children] = {
            v12({
                Name = "Log", 
                TextSize = 18, 
                Text = v3.Computed(function() --[[ Line: 92 ]]
                    return string.format("<b>@%s</b> was kicked by <b>@%s</b>", tostring(v13.TargetUsername:get()), (tostring(v13.AdminUsername:get())));
                end)
            }), 
            v12({
                Name = "DateTime", 
                TextSize = 16, 
                TextTransparency = 0.45, 
                Text = naturalTime(v13.When)
            })
        }
    });
end;
local function v16(v15) --[[ Line: 110 ]] --[[ Name: UnbanAdminLog ]]
    return v10({
        Name = "UnbanAdminLog", 
        LayoutOrder = v15.LayoutOrder, 
        [v3.Children] = {
            v12({
                Name = "Log", 
                TextSize = 18, 
                Text = v3.Computed(function() --[[ Line: 118 ]]
                    return string.format("<b>@%s</b> was unbanned by <b>@%s</b>", tostring(v15.VictimUsername:get()), (tostring(v15.UnbannerUsername:get())));
                end)
            }), 
            v12({
                Name = "DateTime", 
                TextSize = 16, 
                TextTransparency = 0.45, 
                Text = naturalTime(v15.When)
            })
        }
    });
end;
local function v19(v17) --[[ Line: 136 ]] --[[ Name: BanAdminLog ]]
    return v10({
        Name = "BanAdminLog", 
        LayoutOrder = v17.LayoutOrder, 
        [v3.Children] = {
            v12({
                Name = "Log", 
                TextSize = 18, 
                Text = v3.Computed(function() --[[ Line: 144 ]]
                    local v18 = string.format("<b>@%s</b> was banned by <b>@%s</b>", tostring(v17.VictimUsername:get()), (tostring(v17.BannerUsername:get())));
                    if v17.BannedTil then
                        v18 = v18 .. (" until %*"):format((v17.BannedTil:FormatLocalTime("LL", l_LocalPlayer_0.LocaleId)));
                    end;
                    return v18;
                end)
            }), 
            v12({
                Name = "Reason", 
                TextSize = 16, 
                Text = v17.Reason == nil and "<i>No reason specified</i>" or string.format("Reason: <i>%s</i>", (tostring(v17.Reason)))
            }), 
            v12({
                Name = "DateTime", 
                TextSize = 16, 
                TextTransparency = 0.45, 
                Text = naturalTime(v17.When)
            })
        }
    });
end;
local function v21(v20) --[[ Line: 174 ]] --[[ Name: RemovedAdminLog ]]
    return v10({
        Name = "RemovedAdminLog", 
        LayoutOrder = v20.LayoutOrder, 
        [v3.Children] = {
            v12({
                Name = "Log", 
                TextSize = 18, 
                Text = v3.Computed(function() --[[ Line: 182 ]]
                    return string.format("<b>@%s</b> removed <b>@%s</b> from leaderboards", tostring(v20.AdminUsername:get()), (tostring(v20.TargetUsername:get())));
                end)
            }), 
            v12({
                Name = "Previous", 
                TextSize = 16, 
                Text = string.format("Old Donated = <i>%s</i>, Old Raised = <i>%s</i>", tostring(v20.OldDonated), (tostring(v20.OldRaised)))
            }), 
            v12({
                Name = "DateTime", 
                TextSize = 16, 
                TextTransparency = 0.45, 
                Text = naturalTime(v20.When)
            })
        }
    });
end;
local function v23(v22) --[[ Line: 209 ]] --[[ Name: IncrementAdminLog ]]
    return v10({
        Name = "IncrementAdminLog", 
        LayoutOrder = v22.LayoutOrder, 
        [v3.Children] = {
            v12({
                Name = "Log", 
                TextSize = 18, 
                Text = v3.Computed(function() --[[ Line: 217 ]]
                    return string.format("<b>@%s</b> incremented <b>@%s</b>'s %s by %s", tostring(v22.AdminUsername:get()), tostring(v22.TargetUsername:get()), tostring(v22.IncrementType), (tostring(v22.Amount)));
                end)
            }), 
            v12({
                Name = "DateTime", 
                TextSize = 16, 
                TextTransparency = 0.45, 
                Text = naturalTime(v22.When)
            })
        }
    });
end;
local function v28(v24) --[[ Line: 237 ]] --[[ Name: Button ]]
    local v25 = v3.State("None");
    return v3.New("TextButton")({
        Name = v24.Text, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = v3.Computed(function() --[[ Line: 242 ]]
            if v25:get() == "Pressing" then
                return v5.AdminLogButtonPressing;
            elseif v25:get() == "Hovering" then
                return v5.AdminLogButtonHovering;
            else
                return v5.AdminLogButtonBackground;
            end;
        end), 
        Text = v24.Text, 
        TextColor3 = Color3.new(1, 1, 1), 
        LayoutOrder = v24.LayoutOrder, 
        Font = Enum.Font.GothamBold, 
        Visible = v24.Visible, 
        [v3.OnEvent("InputBegan")] = function(v26) --[[ Line: 257 ]]
            if v26.UserInputType == Enum.UserInputType.MouseMovement and v26.UserInputState == Enum.UserInputState.Change then
                v25:set("Hovering");
            end;
            if v26.UserInputType == Enum.UserInputType.MouseButton1 and v26.UserInputState == Enum.UserInputState.Begin then
                v25:set("Pressing");
            end;
            if v26.UserInputType == Enum.UserInputType.Touch and v26.UserInputState == Enum.UserInputState.Begin then
                v25:set("Pressing");
            end;
        end, 
        [v3.OnEvent("InputEnded")] = function(v27) --[[ Line: 271 ]]
            if v27.UserInputType == Enum.UserInputType.MouseMovement and v27.UserInputState == Enum.UserInputState.Change then
                v25:set("None");
            end;
            if v27.UserInputType == Enum.UserInputType.MouseButton1 and v27.UserInputState == Enum.UserInputState.End and v25:get() == "Pressing" then
                v25:set("Hovering");
            end;
            if v27.UserInputType == Enum.UserInputType.Touch and v27.UserInputState == Enum.UserInputState.End then
                v25:set("None");
            end;
            if v27.UserInputType == Enum.UserInputType.Touch and v27.UserInputState == Enum.UserInputState.Change then
                v25:set("None");
            end;
        end, 
        [v3.OnEvent("Activated")] = v24.OnActivated, 
        [v3.Children] = {
            v3.New("UICorner")({
                CornerRadius = UDim.new(0, 5)
            }), 
            v3.New("UIPadding")({
                PaddingBottom = UDim.new(0, 11), 
                PaddingLeft = UDim.new(0, 18), 
                PaddingRight = UDim.new(0, 18), 
                PaddingTop = UDim.new(0, 11)
            })
        }
    });
end;
local function v39() --[[ Line: 307 ]] --[[ Name: deferredLoadUsernames ]]
    local v29 = {};
    local v32 = v4.delay(0.25):andThen(function() --[[ Line: 310 ]]
        local v30 = {};
        for v31 in pairs(v29) do
            table.insert(v30, v31);
        end;
        return l_UserService_0:GetUserInfosByUserIdsAsync(v30);
    end);
    return function(v33) --[[ Line: 317 ]]
        v29[v33] = true;
        local v34 = v3.State("Loading...");
        v32:andThen(function(v35) --[[ Line: 320 ]]
            for _, v37 in pairs(v35) do
                if v37.Id == v33 then
                    return v37;
                end;
            end;
        end):andThen(function(v38) --[[ Line: 326 ]]
            if v38 then
                v34:set(v38.Username);
                return;
            else
                v34:set("Couldn't load");
                return;
            end;
        end);
        return v34;
    end, function() --[[ Line: 334 ]]
        v32:cancel();
    end;
end;
return function(v40) --[[ Line: 339 ]] --[[ Name: AdminLogs ]]
    local v41 = nil;
    local v51 = v3.Computed(function() --[[ Line: 348 ]]
        if v41 then
            v41();
        end;
        local v42 = nil;
        local v43, v44 = v39();
        v41 = v44;
        v42 = v43;
        v43 = v40.Logs:get();
        v44 = {};
        for v45, v46 in pairs(v43) do
            local l_status_0, l_result_0 = pcall(DateTime.fromUnixTimestamp, v46.timestamp);
            if not l_status_0 then
                local l_status_1, l_result_1 = pcall(DateTime.fromUnixTimestamp, v46.timestamp / 1000 + 31536000);
                l_status_0 = l_status_1;
                l_result_0 = l_result_1;
                if not l_status_0 then
                    l_result_0 = DateTime.fromUnixTimestamp(0);
                end;
            end;
            if v46.data.type == "Ban" then
                v44[v45] = v19({
                    BannerUsername = v42(v46.data.bannerId), 
                    VictimUsername = v42(v46.data.victimId), 
                    Reason = v46.data.reason, 
                    When = l_result_0, 
                    BannedTil = if v46.data.bannedTil then DateTime.fromIsoDate(v46.data.bannedTil) else nil, 
                    LayoutOrder = v45
                });
            elseif v46.data.type == "Unban" then
                v44[v45] = v16({
                    UnbannerUsername = v42(v46.data.unbannerId), 
                    VictimUsername = v42(v46.data.victimId), 
                    When = l_result_0, 
                    LayoutOrder = v45
                });
            elseif v46.data.type == "Kick" then
                v44[v45] = v14({
                    AdminUsername = v42(v46.data.admin), 
                    TargetUsername = v42(v46.data.targetId), 
                    When = l_result_0, 
                    LayoutOrder = v45
                });
            elseif v46.data.type == "Removed" then
                v44[v45] = v21({
                    AdminUsername = v42(v46.data.admin), 
                    TargetUsername = v42(v46.data.targetId), 
                    OldDonated = v46.data.oldDonated, 
                    OldRaised = v46.data.oldRaised, 
                    When = l_result_0, 
                    LayoutOrder = v45
                });
            elseif v46.data.type == "IncrementDonated" then
                v44[v45] = v23({
                    IncrementType = "donated", 
                    AdminUsername = v42(v46.data.admin), 
                    TargetUsername = v42(v46.data.targetId), 
                    Amount = v46.data.amount, 
                    When = l_result_0, 
                    LayoutOrder = v45
                });
            elseif v46.data.type == "IncrementRaised" then
                v44[v45] = v23({
                    IncrementType = "raised", 
                    AdminUsername = v42(v46.data.admin), 
                    TargetUsername = v42(v46.data.targetId), 
                    Amount = v46.data.amount, 
                    When = l_result_0, 
                    LayoutOrder = v45
                });
            else
                warn("AdminLogs UI log type " .. v46.data.type .. " not implemented");
            end;
        end;
        return v44;
    end);
    local v52 = v3.New("Frame")({
        Name = "AdminLogs", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(0.95, 0, 0, 450), 
        Position = UDim2.fromScale(0.5, 0.45), 
        BackgroundColor3 = v5.Background, 
        Visible = v40.Visible, 
        [v3.Children] = {
            v3.New("UICorner")({
                CornerRadius = UDim.new(0, 10)
            }), 
            v3.New("UIPadding")({
                PaddingTop = UDim.new(0, 20), 
                PaddingBottom = UDim.new(0, 20), 
                PaddingLeft = UDim.new(0, 24)
            }), 
            v3.New("UISizeConstraint")({
                MaxSize = Vector2.new(450, 1e999)
            }), 
            v3.New("ScrollingFrame")({
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -1, 1, -48), 
                CanvasSize = UDim2.new(), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollBarThickness = v5.ScrollBarThickness, 
                ScrollBarImageColor3 = v5.ScrollBar, 
                [v3.Children] = {
                    v3.New("UIPadding")({
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    v3.New("UIListLayout")({
                        Padding = UDim.new(0, 15), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    v51
                }
            }), 
            v3.New("Frame")({
                Name = "Buttons", 
                AnchorPoint = Vector2.new(0, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Position = UDim2.fromScale(0, 1), 
                BackgroundTransparency = 1, 
                [v3.Children] = {
                    v3.New("UIListLayout")({
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, 15)
                    }), 
                    v28({
                        Text = "Previous", 
                        LayoutOrder = 1, 
                        OnActivated = v40.OnPrevious, 
                        Visible = v40.HasPrevious
                    }), 
                    v28({
                        Text = "Next", 
                        LayoutOrder = 1, 
                        OnActivated = v40.OnNext
                    }), 
                    v28({
                        Text = "Refresh", 
                        LayoutOrder = 2, 
                        OnActivated = v40.OnRefresh
                    })
                }
            })
        }
    });
    v52.AncestryChanged:Connect(function() --[[ Line: 492 ]]
        if v52.Parent == nil then
            v41();
        end;
    end);
    return v52;
end;