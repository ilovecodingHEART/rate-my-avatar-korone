-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = l_LocalPlayer_0:IsInGroup(125814458);
local v8 = require(l_ReplicatedStorage_0.Remotes);
local function _(v9, v10, v11, v12) --[[ Line: 13 ]] --[[ Name: tween ]]
    local v13 = TweenInfo.new(v10, v12 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v9, v13, v11):Play();
end;
local function _(v15, v16, v17) --[[ Line: 18 ]] --[[ Name: popup ]]
    local l_Parent_0 = script.Parent.Parent;
    local l_UITemplates_0 = l_Parent_0.Parent.UITemplates;
    spawn(function() --[[ Line: 22 ]]
        if l_Parent_0.Popups:GetAttribute("Enabled") or v15 == "announcement" then
            l_SoundService_0.SFX.BellRing:Play();
            local v20 = l_UITemplates_0[v15 .. "Popup"];
            if not v20 then
                print("NOPE");
                return;
            else
                local v21 = v20:Clone();
                v21.Message.Text = v16;
                v21.Transparency = 1;
                v21.UIScale.Scale = 0;
                v21.Parent = l_Parent_0.Popups;
                local v22 = {
                    Transparency = 0
                };
                local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v21, v23, v22):Play();
                v22 = v21.UIScale;
                v23 = {
                    Scale = 1
                };
                local l_Back_0 = Enum.EasingStyle.Back;
                local v25 = TweenInfo.new(0.3, l_Back_0 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v22, v25, v23):Play();
                v22 = v21.Message;
                v23 = {
                    MaxVisibleGraphemes = #v16
                };
                l_Back_0 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v22, l_Back_0, v23):Play();
                wait(v17 or 4);
                v22 = {
                    Transparency = 1
                };
                v23 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v21, v23, v22):Play();
                v22 = v21.UIScale;
                v23 = {
                    Scale = 0
                };
                l_Back_0 = Enum.EasingStyle.Back;
                v25 = TweenInfo.new(0.5, l_Back_0 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v22, v25, v23):Play();
                wait(0.5);
                v21:Destroy();
            end;
        end;
    end);
end;
local function _(v27) --[[ Line: 49 ]] --[[ Name: getPastelColor ]]
    return Color3.new(math.min(v27.R + 0.4, 1), math.min(v27.G + 0.4, 1), (math.min(v27.B + 0.4, 1)));
end;
local l_Parent_1 = script.Parent;
spawn(function() --[[ Line: 62 ]]
    task.wait(2);
    if workspace.Map:FindFirstChild("Festive") then
        workspace.Map.Festive.CalendarArea.CalendarPresents.Model.Rug.RugPart.ProximityPrompt.Triggered:Connect(function() --[[ Line: 65 ]]
            l_Parent_1.Visible = true;
        end);
    end;
end);
if not v7 then
    l_Parent_1.GroupExclusive.Visible = true;
end;
local v30 = {
	[1] = {
		giftType = "Giftbux", 
		giftId = 50, 
		giftRelease = os.time({
			year = 2024, 
			month = 12, 
			day = 25, 
			hour = 16
		}), 
		availability = "Everyone"
	}, 
    [2] = {
        giftType = "Giftbux", 
        giftId = 100, 
        giftRelease = os.time({
            year = 2024, 
            month = 12, 
            day = 25, 
            hour = 16
        }), 
        availability = "Everyone"
    }, 
    [3] = {
        giftType = "Giftbux", 
        giftId = 150, 
        giftRelease = os.time({
            year = 2024, 
            month = 12, 
            day = 26, 
            hour = 16
        }), 
        availability = "Everyone"
    },
    [4] = {
        giftType = "Booth", 
        giftId = "MushroomBooth", 
        giftRelease = os.time({
            year = 2024, 
            month = 12, 
            day = 27, 
            hour = 16
        }), 
        availability = "Everyone"
    }, 
	[5] = {
		giftType = "Giftbux", 
		giftId = 250, 
		giftRelease = os.time({
			year = 2024, 
			month = 12, 
			day = 28, 
			hour = 16
		}), 
		availability = "Everyone"
	},
	[6] = {
		giftType = "Hammer", 
		giftId = "DarkBlueHammer", 
		giftRelease = os.time({
			year = 2024, 
			month = 12, 
			day = 29, 
			hour = 16
		}), 
		availability = "Everyone"
	},
	[7] = {
		giftType = "Giftbux", 
		giftId = 350, 
		giftRelease = os.time({
			year = 2024, 
			month = 12, 
			day = 30, 
			hour = 16
		}), 
		availability = "Everyone"
	},
	[8] = {
		giftType = "Giftbux", 
		giftId = 400, 
		giftRelease = os.time({
			year = 2024, 
			month = 12, 
			day = 30, 
			hour = 20
		}), 
		availability = "Everyone"
	},
    [9] = {
        giftType = "Booth", 
        giftId = "ToasterBooth", 
        giftRelease = os.time({
            year = 2024, 
            month = 12, 
            day = 30, 
            hour = 24
        }), 
        availability = "Everyone"
    }, 
    [10] = {
        giftType = "Booth", 
        giftId = "CakeBooth", 
        giftRelease = os.time({
            year = 2025, 
            month = 1, 
            day = 1, 
            hour = 1
        }), 
        availability = "Everyone"
    }
};
formatTime = function(v31) --[[ Line: 151 ]] --[[ Name: formatTime ]]
    local v32 = math.floor(v31 / 86400);
    v31 = v31 % 86400;
    local v33 = math.floor(v31 / 3600);
    v31 = v31 % 3600;
    local v34 = math.floor(v31 / 60);
    v31 = v31 % 60;
    local v35 = {};
    if v32 > 0 then
        table.insert(v35, v32 .. "d");
    end;
    if v33 > 0 then
        table.insert(v35, v33 .. "h");
    end;
    if v34 > 0 then
        table.insert(v35, v34 .. "m");
    end;
    if v31 > 0 then
        table.insert(v35, v31 .. "s");
    end;
    return table.concat(v35, " ");
end;
getTimeUntilGift = function(v36) --[[ Line: 176 ]] --[[ Name: getTimeUntilGift ]]
    local v37 = v30[v36];
    local v38 = os.time();
    local v39 = v37.giftRelease - v38;
    if v39 > 0 then
        return formatTime(v39);
    else
        return "Released";
    end;
end;
for v40, _ in pairs(v30) --[[ 2021 ]] do
    local l_FirstChild_0 = l_Parent_1.Frame:FindFirstChild(v40);
    if l_FirstChild_0:IsA("Frame") then
        print("number", v40);
        local v43 = v30[v40];
        local l_BackgroundColor3_0 = l_FirstChild_0.Surprise.Surprise.BackgroundColor3;
        local v45 = false;
        l_FirstChild_0.Gift.BackColor.ImageColor3 = l_BackgroundColor3_0;
        l_FirstChild_0.BackgroundColor3 = Color3.new(math.min(l_BackgroundColor3_0.R + 0.4, 1), math.min(l_BackgroundColor3_0.G + 0.4, 1), (math.min(l_BackgroundColor3_0.B + 0.4, 1)));
        l_FirstChild_0.LayoutOrder = v40;
        if v43 then
            if v43.giftType == "UGC" then
                local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(v43.giftId);
                if l_l_MarketplaceService_0_ProductInfo_0.Remaining == 0 then
                    v45 = true;
                    l_FirstChild_0.SoldOut.Visible = true;
                    if l_FirstChild_0:FindFirstChild("Surprise") then
                        l_FirstChild_0.Surprise:Destroy();
                    end;
                    l_FirstChild_0.Gift.BackSpin.ImageTransparency = 1;
                    local l_BackSpin_0 = l_FirstChild_0.Gift.BackSpin;
                    local v48 = {
                        ImageTransparency = 0
                    };
                    l_TweenService_0:Create(l_BackSpin_0, TweenInfo.new(0.25, Enum.EasingStyle.Quint), v48):Play();
                    l_FirstChild_0:SetAttribute("GiftOpened", true);
                else
                    l_FirstChild_0.SoldOut.Visible = false;
                end;
                print(l_l_MarketplaceService_0_ProductInfo_0);
                l_FirstChild_0.Gift.GiftButton.Image = ("https://www.roblox.com/asset-thumbnail/image?assetId=%s&width=420&height=420&format=png"):format(v43.giftId);
            elseif v43.giftType == "Giftbux" then
				l_FirstChild_0.Gift.GiftButton.Image = "rbxassetid://91693002822877";
            elseif v43.giftId == "CakeBooth" then
                l_FirstChild_0.Gift.GiftButton.Image = "rbxassetid://140670017577276";
                Instance.new("UICorner", l_FirstChild_0.Gift.GiftButton);
            elseif v43.giftId == "ToasterBooth" then
                l_FirstChild_0.Gift.GiftButton.Image = "rbxassetid://70940816075543";
                Instance.new("UICorner", l_FirstChild_0.Gift.GiftButton);
            elseif v43.giftId == "MushroomBooth" then
                l_FirstChild_0.Gift.GiftButton.Image = "rbxassetid://110133449253837";
				Instance.new("UICorner", l_FirstChild_0.Gift.GiftButton);
			elseif v43.giftId == "Hammer" then
				l_FirstChild_0.Gift.GiftButton.Image = "rbxassetid://103459123410471";
				Instance.new("UICorner", l_FirstChild_0.Gift.GiftButton);
            end;
        end;
        local function _() --[[ Line: 231 ]] --[[ Name: surpriseActivated ]]
            spawn(function() --[[ Line: 232 ]]
                local l_AbsoluteSize_0 = l_FirstChild_0.Surprise.AbsoluteSize;
                local l_AbsolutePosition_0 = l_FirstChild_0.Surprise.AbsolutePosition;
                l_SoundService_0.SFX.GiftOpen:Play();
                l_SoundService_0.SFX.StickyNote:Play();
                local l_UIScale_0 = l_FirstChild_0.UIScale;
                local v52 = {
                    Scale = 1
                };
                local l_Back_1 = Enum.EasingStyle.Back;
                local v54 = TweenInfo.new(0.25, l_Back_1 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_UIScale_0, v54, v52):Play();
                l_UIScale_0 = l_FirstChild_0.Surprise:Clone();
                l_FirstChild_0.Surprise:Destroy();
                l_UIScale_0.ZIndex = 99999999;
                l_UIScale_0.Parent = l_LocalPlayer_0.PlayerGui.CustomCoreGui;
                l_UIScale_0.Position = UDim2.new(0, l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, 0, l_AbsolutePosition_0.Y + 85);
                l_UIScale_0.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
                v52 = {
                    Rotation = math.random(-40, 40)
                };
                l_Back_1 = TweenInfo.new(4, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_UIScale_0, l_Back_1, v52):Play();
                v52 = {
                    Position = UDim2.new(0, l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, 1.5, l_AbsolutePosition_0.Y)
                };
                l_Back_1 = Enum.EasingStyle.Back;
                v54 = TweenInfo.new(6, l_Back_1 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_UIScale_0, v54, v52):Play();
                wait(6);
                l_UIScale_0:Destroy();
            end);
        end;
        do
            local l_v45_0 = v45;
            if l_FirstChild_0:FindFirstChild("Surprise") then
                l_FirstChild_0.Surprise.MouseEnter:Connect(function() --[[ Line: 254 ]]
                    if l_FirstChild_0.Countdown.Visible then
                        return;
                    else
                        l_SoundService_0.SFX.GiftHover:Play();
                        local l_UIScale_1 = l_FirstChild_0.UIScale;
                        local v58 = {
                            Scale = 1
                        };
                        local l_Back_2 = Enum.EasingStyle.Back;
                        local v60 = TweenInfo.new(0.25, l_Back_2 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_1, v60, v58):Play();
                        l_UIScale_1 = l_FirstChild_0.Surprise.Ribbon.UIScale;
                        v58 = {
                            Scale = 1.1
                        };
                        l_Back_2 = Enum.EasingStyle.Back;
                        v60 = TweenInfo.new(0.2, l_Back_2 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_1, v60, v58):Play();
                        l_UIScale_1 = l_FirstChild_0.Surprise.Ribbon;
                        v58 = {
                            Rotation = math.random(-13, 13)
                        };
                        l_Back_2 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_1, l_Back_2, v58):Play();
                        return;
                    end;
                end);
                l_FirstChild_0.Surprise.MouseLeave:Connect(function() --[[ Line: 262 ]]
                    local l_UIScale_2 = l_FirstChild_0.UIScale;
                    local v62 = {
                        Scale = 1
                    };
                    local l_Back_3 = Enum.EasingStyle.Back;
                    local v64 = TweenInfo.new(0.25, l_Back_3 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_2, v64, v62):Play();
                    l_UIScale_2 = l_FirstChild_0.Surprise.Ribbon;
                    v62 = {
                        Rotation = 0
                    };
                    l_Back_3 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_2, l_Back_3, v62):Play();
                    l_UIScale_2 = l_FirstChild_0.Surprise.Ribbon.UIScale;
                    v62 = {
                        Scale = 1
                    };
                    l_Back_3 = Enum.EasingStyle.Back;
                    v64 = TweenInfo.new(0.2, l_Back_3 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_2, v64, v62):Play();
                end);
                l_FirstChild_0.Surprise.MouseButton1Down:Connect(function() --[[ Line: 268 ]]
                    if l_FirstChild_0.Countdown.Visible then
                        return;
                    else
                        local l_UIScale_3 = l_FirstChild_0.UIScale;
                        local v66 = {
                            Scale = 1
                        };
                        local l_Back_4 = Enum.EasingStyle.Back;
                        local v68 = TweenInfo.new(0.25, l_Back_4 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_3, v68, v66):Play();
                        l_UIScale_3 = l_FirstChild_0.Surprise.Ribbon.UIScale;
                        v66 = {
                            Scale = 1.2
                        };
                        l_Back_4 = Enum.EasingStyle.Back;
                        v68 = TweenInfo.new(0.2, l_Back_4 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_3, v68, v66):Play();
                        return;
                    end;
                end);
                l_FirstChild_0.Surprise.MouseButton1Up:Connect(function() --[[ Line: 274 ]]
                    if l_FirstChild_0.Countdown.Visible then
                        return;
                    else
                        local l_UIScale_4 = l_FirstChild_0.UIScale;
                        local v70 = {
                            Scale = 1
                        };
                        local l_Back_5 = Enum.EasingStyle.Back;
                        local v72 = TweenInfo.new(0.25, l_Back_5 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_4, v72, v70):Play();
                        l_UIScale_4 = l_FirstChild_0.Surprise.Ribbon.UIScale;
                        v70 = {
                            Scale = 1.1
                        };
                        l_Back_5 = Enum.EasingStyle.Back;
                        v72 = TweenInfo.new(0.2, l_Back_5 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_4, v72, v70):Play();
                        if l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.MouseEnabled then
                            spawn(function() --[[ Line: 232 ]]
                                local l_AbsoluteSize_1 = l_FirstChild_0.Surprise.AbsoluteSize;
                                local l_AbsolutePosition_1 = l_FirstChild_0.Surprise.AbsolutePosition;
                                l_SoundService_0.SFX.GiftOpen:Play();
                                l_SoundService_0.SFX.StickyNote:Play();
                                local l_UIScale_5 = l_FirstChild_0.UIScale;
                                local v76 = {
                                    Scale = 1
                                };
                                local l_Back_6 = Enum.EasingStyle.Back;
                                local v78 = TweenInfo.new(0.25, l_Back_6 or Enum.EasingStyle.Quint);
                                l_TweenService_0:Create(l_UIScale_5, v78, v76):Play();
                                l_UIScale_5 = l_FirstChild_0.Surprise:Clone();
                                l_FirstChild_0.Surprise:Destroy();
                                l_UIScale_5.ZIndex = 99999999;
                                l_UIScale_5.Parent = l_LocalPlayer_0.PlayerGui.CustomCoreGui;
                                l_UIScale_5.Position = UDim2.new(0, l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2, 0, l_AbsolutePosition_1.Y + 85);
                                l_UIScale_5.Size = UDim2.new(0, l_AbsoluteSize_1.X, 0, l_AbsoluteSize_1.Y);
                                v76 = {
                                    Rotation = math.random(-40, 40)
                                };
                                l_Back_6 = TweenInfo.new(4, Enum.EasingStyle.Quint);
                                l_TweenService_0:Create(l_UIScale_5, l_Back_6, v76):Play();
                                v76 = {
                                    Position = UDim2.new(0, l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2, 1.5, l_AbsolutePosition_1.Y)
                                };
                                l_Back_6 = Enum.EasingStyle.Back;
                                v78 = TweenInfo.new(6, l_Back_6 or Enum.EasingStyle.Quint);
                                l_TweenService_0:Create(l_UIScale_5, v78, v76):Play();
                                wait(6);
                                l_UIScale_5:Destroy();
                            end);
                        end;
                        return;
                    end;
                end);
                l_FirstChild_0.Surprise.Activated:Connect(function() --[[ Line: 283 ]]
                    if not v7 then
                        local l_Parent_2 = script.Parent.Parent;
                        local l_UITemplates_1 = l_Parent_2.Parent.UITemplates;
                        local l_spawn_0 = spawn;
                        local v82 = "danger";
                        local v83 = "you must join the Quataun group to unlock this!";
                        local v84 = nil;
                        l_spawn_0(function() --[[ Line: 22 ]]
                            if l_Parent_2.Popups:GetAttribute("Enabled") or v82 == "announcement" then
                                l_SoundService_0.SFX.BellRing:Play();
                                local v85 = l_UITemplates_1[v82 .. "Popup"];
                                if not v85 then
                                    print("NOPE");
                                    return;
                                else
                                    local v86 = v85:Clone();
                                    v86.Message.Text = v83;
                                    v86.Transparency = 1;
                                    v86.UIScale.Scale = 0;
                                    v86.Parent = l_Parent_2.Popups;
                                    local v87 = {
                                        Transparency = 0
                                    };
                                    local v88 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v86, v88, v87):Play();
                                    v87 = v86.UIScale;
                                    v88 = {
                                        Scale = 1
                                    };
                                    local l_Back_7 = Enum.EasingStyle.Back;
                                    local v90 = TweenInfo.new(0.3, l_Back_7 or Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v87, v90, v88):Play();
                                    v87 = v86.Message;
                                    v88 = {
                                        MaxVisibleGraphemes = #v83
                                    };
                                    l_Back_7 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v87, l_Back_7, v88):Play();
                                    wait(v84 or 4);
                                    v87 = {
                                        Transparency = 1
                                    };
                                    v88 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v86, v88, v87):Play();
                                    v87 = v86.UIScale;
                                    v88 = {
                                        Scale = 0
                                    };
                                    l_Back_7 = Enum.EasingStyle.Back;
                                    v90 = TweenInfo.new(0.5, l_Back_7 or Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v87, v90, v88):Play();
                                    wait(0.5);
                                    v86:Destroy();
                                end;
                            end;
                        end);
                        l_SoundService_0.SFX.ItemDelete:Play();
                        return;
                    elseif l_FirstChild_0.Countdown.Visible then
                        local l_Parent_3 = script.Parent.Parent;
                        local l_UITemplates_2 = l_Parent_3.Parent.UITemplates;
                        local l_spawn_1 = spawn;
                        local v94 = "danger";
                        local v95 = "you can't view this gift at this time!";
                        local v96 = nil;
                        local l_l_Parent_3_0 = l_Parent_3 --[[ copy: 0 -> 9 ]];
                        local l_l_UITemplates_2_0 = l_UITemplates_2 --[[ copy: 1 -> 10 ]];
                        l_spawn_1(function() --[[ Line: 22 ]]
                            if l_l_Parent_3_0.Popups:GetAttribute("Enabled") or v94 == "announcement" then
                                l_SoundService_0.SFX.BellRing:Play();
                                local v99 = l_l_UITemplates_2_0[v94 .. "Popup"];
                                if not v99 then
                                    print("NOPE");
                                    return;
                                else
                                    local v100 = v99:Clone();
                                    v100.Message.Text = v95;
                                    v100.Transparency = 1;
                                    v100.UIScale.Scale = 0;
                                    v100.Parent = l_l_Parent_3_0.Popups;
                                    local v101 = {
                                        Transparency = 0
                                    };
                                    local v102 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v100, v102, v101):Play();
                                    v101 = v100.UIScale;
                                    v102 = {
                                        Scale = 1
                                    };
                                    local l_Back_8 = Enum.EasingStyle.Back;
                                    local v104 = TweenInfo.new(0.3, l_Back_8 or Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v101, v104, v102):Play();
                                    v101 = v100.Message;
                                    v102 = {
                                        MaxVisibleGraphemes = #v95
                                    };
                                    l_Back_8 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v101, l_Back_8, v102):Play();
                                    wait(v96 or 4);
                                    v101 = {
                                        Transparency = 1
                                    };
                                    v102 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v100, v102, v101):Play();
                                    v101 = v100.UIScale;
                                    v102 = {
                                        Scale = 0
                                    };
                                    l_Back_8 = Enum.EasingStyle.Back;
                                    v104 = TweenInfo.new(0.5, l_Back_8 or Enum.EasingStyle.Quint);
                                    l_TweenService_0:Create(v101, v104, v102):Play();
                                    wait(0.5);
                                    v100:Destroy();
                                end;
                            end;
                        end);
                        l_FirstChild_0.Countdown.Day.TextColor3 = Color3.fromRGB(255, 0, 0);
                        l_FirstChild_0.Countdown.TimeLeft.TextColor3 = Color3.fromRGB(255, 0, 0);
                        l_Parent_3 = l_FirstChild_0.Countdown.Day;
                        l_UITemplates_2 = {
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        };
                        l_spawn_1 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_Parent_3, l_spawn_1, l_UITemplates_2):Play();
                        l_Parent_3 = l_FirstChild_0.Countdown.TimeLeft;
                        l_UITemplates_2 = {
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        };
                        l_spawn_1 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_Parent_3, l_spawn_1, l_UITemplates_2):Play();
                        l_SoundService_0.SFX.ItemDelete:Play();
                        return;
                    else
                        if l_v45_0 then
                            local l_Parent_4 = script.Parent.Parent;
                            local l_UITemplates_3 = l_Parent_4.Parent.UITemplates;
                            local l_spawn_2 = spawn;
                            local v108 = "info";
                            local v109 = "This gift is out of stock! Come early next UGC drop to have a better chance.";
                            local v110 = 5;
                            local l_l_Parent_4_0 = l_Parent_4 --[[ copy: 0 -> 7 ]];
                            local l_l_UITemplates_3_0 = l_UITemplates_3 --[[ copy: 1 -> 8 ]];
                            l_spawn_2(function() --[[ Line: 22 ]]
                                if l_l_Parent_4_0.Popups:GetAttribute("Enabled") or v108 == "announcement" then
                                    l_SoundService_0.SFX.BellRing:Play();
                                    local v113 = l_l_UITemplates_3_0[v108 .. "Popup"];
                                    if not v113 then
                                        print("NOPE");
                                        return;
                                    else
                                        local v114 = v113:Clone();
                                        v114.Message.Text = v109;
                                        v114.Transparency = 1;
                                        v114.UIScale.Scale = 0;
                                        v114.Parent = l_l_Parent_4_0.Popups;
                                        local v115 = {
                                            Transparency = 0
                                        };
                                        local v116 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                                        l_TweenService_0:Create(v114, v116, v115):Play();
                                        v115 = v114.UIScale;
                                        v116 = {
                                            Scale = 1
                                        };
                                        local l_Back_9 = Enum.EasingStyle.Back;
                                        local v118 = TweenInfo.new(0.3, l_Back_9 or Enum.EasingStyle.Quint);
                                        l_TweenService_0:Create(v115, v118, v116):Play();
                                        v115 = v114.Message;
                                        v116 = {
                                            MaxVisibleGraphemes = #v109
                                        };
                                        l_Back_9 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                                        l_TweenService_0:Create(v115, l_Back_9, v116):Play();
                                        wait(v110 or 4);
                                        v115 = {
                                            Transparency = 1
                                        };
                                        v116 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                                        l_TweenService_0:Create(v114, v116, v115):Play();
                                        v115 = v114.UIScale;
                                        v116 = {
                                            Scale = 0
                                        };
                                        l_Back_9 = Enum.EasingStyle.Back;
                                        v118 = TweenInfo.new(0.5, l_Back_9 or Enum.EasingStyle.Quint);
                                        l_TweenService_0:Create(v115, v118, v116):Play();
                                        wait(0.5);
                                        v114:Destroy();
                                    end;
                                end;
                            end);
                        end;
                        spawn(function() --[[ Line: 232 ]]
                            local l_AbsoluteSize_2 = l_FirstChild_0.Surprise.AbsoluteSize;
                            local l_AbsolutePosition_2 = l_FirstChild_0.Surprise.AbsolutePosition;
                            l_SoundService_0.SFX.GiftOpen:Play();
                            l_SoundService_0.SFX.StickyNote:Play();
                            local l_UIScale_6 = l_FirstChild_0.UIScale;
                            local v122 = {
                                Scale = 1
                            };
                            local l_Back_10 = Enum.EasingStyle.Back;
                            local v124 = TweenInfo.new(0.25, l_Back_10 or Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(l_UIScale_6, v124, v122):Play();
                            l_UIScale_6 = l_FirstChild_0.Surprise:Clone();
                            l_FirstChild_0.Surprise:Destroy();
                            l_UIScale_6.ZIndex = 99999999;
                            l_UIScale_6.Parent = l_LocalPlayer_0.PlayerGui.CustomCoreGui;
                            l_UIScale_6.Position = UDim2.new(0, l_AbsolutePosition_2.X + l_AbsoluteSize_2.X / 2, 0, l_AbsolutePosition_2.Y + 85);
                            l_UIScale_6.Size = UDim2.new(0, l_AbsoluteSize_2.X, 0, l_AbsoluteSize_2.Y);
                            v122 = {
                                Rotation = math.random(-40, 40)
                            };
                            l_Back_10 = TweenInfo.new(4, Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(l_UIScale_6, l_Back_10, v122):Play();
                            v122 = {
                                Position = UDim2.new(0, l_AbsolutePosition_2.X + l_AbsoluteSize_2.X / 2, 1.5, l_AbsolutePosition_2.Y)
                            };
                            l_Back_10 = Enum.EasingStyle.Back;
                            v124 = TweenInfo.new(6, l_Back_10 or Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(l_UIScale_6, v124, v122):Play();
                            wait(6);
                            l_UIScale_6:Destroy();
                        end);
                        l_FirstChild_0.Surprise.Active = false;
                        l_FirstChild_0.Gift.BackSpin.ImageTransparency = 1;
                        l_FirstChild_0.Gift.GiftButton.ImageColor3 = Color3.fromRGB(0, 0, 0);
                        local l_UIScale_7 = l_FirstChild_0.Gift.GiftButton.UIScale;
                        local v126 = {
                            Scale = 1.5
                        };
                        local l_Sine_0 = Enum.EasingStyle.Sine;
                        local v128 = TweenInfo.new(1, l_Sine_0 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_7, v128, v126):Play();
                        task.wait(1);
                        l_UIScale_7 = l_FirstChild_0.Gift.GiftButton.UIScale;
                        v126 = {
                            Scale = 1
                        };
                        l_Sine_0 = Enum.EasingStyle.Back;
                        v128 = TweenInfo.new(0.25, l_Sine_0 or Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_7, v128, v126):Play();
                        l_UIScale_7 = l_FirstChild_0.Gift.GiftButton;
                        v126 = {
                            ImageColor3 = Color3.fromRGB(255, 255, 255)
                        };
                        l_Sine_0 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_7, l_Sine_0, v126):Play();
                        l_UIScale_7 = l_FirstChild_0.Gift.BackSpin;
                        v126 = {
                            ImageTransparency = 0
                        };
                        l_Sine_0 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                        l_TweenService_0:Create(l_UIScale_7, l_Sine_0, v126):Play();
                        spawn(function() --[[ Line: 312 ]]
                            local v129 = Instance.new("UIStroke", l_FirstChild_0);
                            v129.Color = l_BackgroundColor3_0;
                            v129.Thickness = 0;
                            v129.Transparency = 0.5;
                            local v130 = {
                                Thickness = 20
                            };
                            local v131 = TweenInfo.new(2, Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(v129, v131, v130):Play();
                            v130 = {
                                Transparency = 1
                            };
                            v131 = TweenInfo.new(2, Enum.EasingStyle.Quint);
                            l_TweenService_0:Create(v129, v131, v130):Play();
                            task.wait(2);
                            v129:Destroy();
                        end);
                        l_SoundService_0.SFX.GiftReveal:Play();
                        l_FirstChild_0:SetAttribute("GiftOpened", true);
                        return;
                    end;
                end);
            end;
            local function _() --[[ Line: 328 ]] --[[ Name: openGift ]]
                l_SoundService_0.SFX.Click:Play();
                v8.Event("OpenCalendarGift"):FireServer(l_FirstChild_0.LayoutOrder);
            end;
            l_FirstChild_0.Gift.GiftButton.MouseEnter:Connect(function() --[[ Line: 333 ]]
                if not l_FirstChild_0:GetAttribute("GiftOpened") then
                    return;
                else
                    l_SoundService_0.SFX.GiftHover:Play();
                    local l_UIScale_8 = l_FirstChild_0.Gift.GiftButton.UIScale;
                    local v134 = {
                        Scale = 1.2
                    };
                    local l_Back_11 = Enum.EasingStyle.Back;
                    local v136 = TweenInfo.new(0.25, l_Back_11 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_8, v136, v134):Play();
                    l_UIScale_8 = l_FirstChild_0.Gift.GiftButton;
                    v134 = {
                        Rotation = math.random(-13, 13)
                    };
                    l_Back_11 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_8, l_Back_11, v134):Play();
                    return;
                end;
            end);
            l_FirstChild_0.Gift.GiftButton.MouseLeave:Connect(function() --[[ Line: 340 ]]
                if not l_FirstChild_0:GetAttribute("GiftOpened") then
                    return;
                else
                    local l_UIScale_9 = l_FirstChild_0.Gift.GiftButton.UIScale;
                    local v138 = {
                        Scale = 1
                    };
                    local l_Back_12 = Enum.EasingStyle.Back;
                    local v140 = TweenInfo.new(0.25, l_Back_12 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_9, v140, v138):Play();
                    l_UIScale_9 = l_FirstChild_0.Gift.GiftButton;
                    v138 = {
                        Rotation = 0
                    };
                    l_Back_12 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_9, l_Back_12, v138):Play();
                    return;
                end;
            end);
            l_FirstChild_0.Gift.GiftButton.MouseButton1Down:Connect(function() --[[ Line: 346 ]]
                if not l_FirstChild_0:GetAttribute("GiftOpened") then
                    return;
                else
                    local l_UIScale_10 = l_FirstChild_0.Gift.GiftButton.UIScale;
                    local v142 = {
                        Scale = 1.4
                    };
                    local l_Back_13 = Enum.EasingStyle.Back;
                    local v144 = TweenInfo.new(0.25, l_Back_13 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_10, v144, v142):Play();
                    return;
                end;
            end);
            l_FirstChild_0.Gift.GiftButton.MouseButton1Up:Connect(function() --[[ Line: 351 ]]
                if not l_FirstChild_0:GetAttribute("GiftOpened") then
                    return;
                else
                    local l_UIScale_11 = l_FirstChild_0.Gift.GiftButton.UIScale;
                    local v146 = {
                        Scale = 1
                    };
                    local l_Back_14 = Enum.EasingStyle.Back;
                    local v148 = TweenInfo.new(0.25, l_Back_14 or Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(l_UIScale_11, v148, v146):Play();
                    if l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.MouseEnabled then
                        l_SoundService_0.SFX.Click:Play();
                        v8.Event("OpenCalendarGift"):FireServer(l_FirstChild_0.LayoutOrder);
                    end;
                    return;
                end;
            end);
            l_FirstChild_0.Gift.GiftButton.Activated:Connect(function() --[[ Line: 359 ]]
                l_SoundService_0.SFX.Click:Play();
                v8.Event("OpenCalendarGift"):FireServer(l_FirstChild_0.LayoutOrder);
            end);
        end;
    end;
end;
v8.OnClientEvent("OpenCalendarGift"):Connect(function(v150, v151) --[[ Line: 365 ]]
    local l_Parent_5 = script.Parent.Parent;
    local l_UITemplates_4 = l_Parent_5.Parent.UITemplates;
    local l_spawn_3 = spawn;
    local v155 = nil;
    l_spawn_3(function() --[[ Line: 22 ]]
        if l_Parent_5.Popups:GetAttribute("Enabled") or v150 == "announcement" then
            l_SoundService_0.SFX.BellRing:Play();
            local v156 = l_UITemplates_4[v150 .. "Popup"];
            if not v156 then
                print("NOPE");
                return;
            else
                local v157 = v156:Clone();
                v157.Message.Text = v151;
                v157.Transparency = 1;
                v157.UIScale.Scale = 0;
                v157.Parent = l_Parent_5.Popups;
                local v158 = {
                    Transparency = 0
                };
                local v159 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v157, v159, v158):Play();
                v158 = v157.UIScale;
                v159 = {
                    Scale = 1
                };
                local l_Back_15 = Enum.EasingStyle.Back;
                local v161 = TweenInfo.new(0.3, l_Back_15 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v158, v161, v159):Play();
                v158 = v157.Message;
                v159 = {
                    MaxVisibleGraphemes = #v151
                };
                l_Back_15 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v158, l_Back_15, v159):Play();
                wait(v155 or 4);
                v158 = {
                    Transparency = 1
                };
                v159 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v157, v159, v158):Play();
                v158 = v157.UIScale;
                v159 = {
                    Scale = 0
                };
                l_Back_15 = Enum.EasingStyle.Back;
                v161 = TweenInfo.new(0.5, l_Back_15 or Enum.EasingStyle.Quint);
                l_TweenService_0:Create(v158, v161, v159):Play();
                wait(0.5);
                v157:Destroy();
            end;
        end;
    end);
end);
spawn(function() --[[ Line: 369 ]]
    for _, v163 in (v8.Function("GetOpenedCalendarGifts"):InvokeServer()) do
        local l_FirstChild_1 = l_Parent_1.Frame:FindFirstChild(v163);
        if l_FirstChild_1:FindFirstChild("Surprise") then
            l_FirstChild_1.Surprise:Destroy();
        end;
        l_FirstChild_1.Gift.BackSpin.ImageTransparency = 1;
        local l_BackSpin_1 = l_FirstChild_1.Gift.BackSpin;
        local v166 = {
            ImageTransparency = 0
        };
        local v167 = TweenInfo.new(0.25, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_BackSpin_1, v167, v166):Play();
        l_FirstChild_1:SetAttribute("GiftOpened", true);
    end;
end);
while true do
    for _, v169 in l_Parent_1.Frame:GetChildren() do
        if v169:IsA("Frame") then
            local v170 = getTimeUntilGift(v169.LayoutOrder);
            if v170 == "Released" then
                v169.Countdown.Visible = false;
            else
                v169.Countdown.Visible = true;
                v169.Countdown.Day.Text = ("Day %s"):format(v169.LayoutOrder);
                v169.Countdown.TimeLeft.Text = v170;
            end;
        end;
    end;
    task.wait(1);
end;