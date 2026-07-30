-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x3, pairs() wrap x1, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Packages.Fusion);
local v5 = require(l_ReplicatedStorage_0.NumberHelpers);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function _(v7, v8, v9, v10) --[[ Line: 12 ]] --[[ Name: tween ]]
    local v11 = TweenInfo.new(v8, v10 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v7, v11, v9):Play();
end;
local v13 = Color3.fromRGB(255, 255, 255);
local v14 = {
	{
		robux = 100000, 
		color = Color3.fromRGB(255, 16, 60)
	}, 
    {
        robux = 10000, 
        color = Color3.fromRGB(255, 20, 100)
    }, 
    {
        robux = 1000, 
        color = Color3.fromRGB(255, 0, 115)
    }, 
    {
        robux = 100, 
        color = Color3.fromRGB(255, 0, 230)
    }, 
    {
        robux = 10, 
        color = Color3.fromRGB(0, 179, 255)
    }, 
    {
        robux = 5, 
        color = Color3.fromRGB(255, 140, 0)
    }, 
    {
        robux = 1, 
        color = Color3.fromRGB(0, 218, 18)
    }
};
naturalTime = function(v15) --[[ Line: 35 ]] --[[ Name: naturalTime ]]
    local v16 = DateTime.now().UnixTimestamp - v15.UnixTimestamp;
    if v16 < 10 then
        return "Just now";
    elseif v16 < 60 then
        return string.format("%i seconds ago", v16);
    elseif v16 < 120 then
        return "a minute ago";
    elseif v16 < 3600 then
        return string.format("%i minutes ago", v16 / 60);
    elseif v16 < 7200 then
        return "an hour ago";
    elseif v16 < 86400 then
        return string.format("%i hours ago", v16 / 3600);
    else
        return v15:FormatLocalTime("LLL", l_LocalPlayer_0.LocaleId);
    end;
end;
local function _(v17, v18, v19, v20) --[[ Line: 57 ]] --[[ Name: countUp ]]
    spawn(function() --[[ Line: 58 ]]
        local v21 = 1.2;
        local v22 = 120 * v20;
        local v23 = (v19 - v18) / v22;
        for v24 = 0, v22 do
            v17.Text = string.format("\238\128\130%s", v5.formatCommas((tostring((math.floor(v18 + v23 * v24))))));
            v21 = v21 + 0.005;
            wait(v20 / v22);
        end;
        v17.UIScale.Scale = 1.2;
        local l_UIScale_0 = v17.UIScale;
        local v26 = {
            Scale = 1
        };
        local l_Back_0 = Enum.EasingStyle.Back;
        local v28 = TweenInfo.new(0.5, l_Back_0 or Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_0, v28, v26):Play();
        v17.Text = string.format("\238\128\130%s", v5.formatCommas(v19));
    end);
end;
return function(v30) --[[ Line: 81 ]] --[[ Name: Gift ]]
    local v31 = nil;
    for _, v33 in pairs(v14) --[[ 2021 ]] do
        if v30.robux >= v33.robux then
            v31 = v33.color;
            break;
        end;
    end;
    local v34 = v13:Lerp(v31, 1.2);
    local v35 = "rbxthumb://type=AvatarHeadShot&id=" .. v30.donor.Id .. "&w=420&h=420";
    local v36 = ("<b>%s</b> @%s"):format(v30.donor.DisplayName, v30.donor.Username);
    local l_message_0 = v30.message;
    local v38 = naturalTime(v30.whenDonated);
    local v39 = ("\238\128\130%s"):format((v5.formatCommas(v30.robux)));
    local v40 = string.match(l_message_0, "(.*)nJHGnbjsda43$");
    local v41 = false;
    if v40 then
        v41 = true;
        l_message_0 = v40;
    end;
    local v42 = game.StarterGui.UITemplates.Gift:Clone();
    v42.Main.Claim.BackgroundColor3 = v31;
    v42.Main.Amount.TextColor3 = v31;
    v42.Main.Info.Avatar.Image = v35;
    v42.Main.Info.Avatar.DisplayName.Text = v36;
    v42.Main.Amount.Text = v39;
    v42.Main.Message.Text = l_message_0;
    if l_message_0 == "" then
        v42.Main.Message.Text = " ";
    end;
    v42.Main.Info.Date.Text = v38;
    v42.Main.Claim.Activated:Connect(function() --[[ Line: 121 ]]
        v42.Visible = false;
        v30.onClaimed();
    end);
    v42.Main.Claim.MouseEnter:Connect(function() --[[ Line: 125 ]]
        game.SoundService.SFX.Hover:Play();
        v42.Main.Claim.BackgroundColor3 = v34;
        local l_UIScale_1 = v42.Main.Claim.UIScale;
        local v44 = {
            Scale = 1.03
        };
        local v45 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_1, v45, v44):Play();
    end);
    v42.Main.Claim.MouseLeave:Connect(function() --[[ Line: 130 ]]
        v42.Main.Claim.BackgroundColor3 = v31;
        local l_UIScale_2 = v42.Main.Claim.UIScale;
        local v47 = {
            Scale = 1
        };
        local v48 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_2, v48, v47):Play();
    end);
    local function v66() --[[ Line: 135 ]] --[[ Name: surpriseActivated ]]
        local l_AbsoluteSize_0 = v42.Surprise.AbsoluteSize;
        local l_AbsolutePosition_0 = v42.Surprise.AbsolutePosition;
        game.SoundService.SFX.GiftOpen:Play();
        game.SoundService.SFX.StickyNote:Play();
        local l_UIScale_3 = v42.UIScale;
        local v52 = {
            Scale = 1
        };
        local l_Back_1 = Enum.EasingStyle.Back;
        local v54 = TweenInfo.new(0.25, l_Back_1 or Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_3, v54, v52):Play();
        l_UIScale_3 = v42.Surprise:Clone();
        v42.Surprise:Destroy();
        l_UIScale_3.ZIndex = 99999999;
        l_UIScale_3.Parent = l_LocalPlayer_0.PlayerGui.CustomCoreGui;
        l_UIScale_3.Position = UDim2.new(0.5, 0, 0, l_AbsolutePosition_0.Y + 85);
        l_UIScale_3.Size = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        v52 = {
            Rotation = math.random(-40, 40)
        };
        l_Back_1 = TweenInfo.new(4, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_3, l_Back_1, v52):Play();
        v52 = {
            Position = UDim2.new(0.5, 0, 1.5, l_AbsolutePosition_0.Y)
        };
        l_Back_1 = Enum.EasingStyle.Back;
        v54 = TweenInfo.new(6, l_Back_1 or Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_UIScale_3, v54, v52):Play();
        v52 = v42.Main.Info.Avatar.DisplayName;
        l_Back_1 = {
            MaxVisibleGraphemes = #v36
        };
        v54 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(v52, v54, l_Back_1):Play();
        v52 = v42.Main.Message;
        l_Back_1 = {
            MaxVisibleGraphemes = #l_message_0
        };
        v54 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(v52, v54, l_Back_1):Play();
        v52 = 1;
        v52 = v30.robux >= 1000000 and 4 or v30.robux >= 100000 and 3 or v30.robux >= 10000 and 2 or v30.robux >= 1000 and 1 or 0.01;
        l_Back_1 = v42.Main.Amount;
        v54 = v30.robux;
        local l_v52_0 = v52;
        local l_spawn_0 = spawn;
        local v57 = 0;
        l_spawn_0(function() --[[ Line: 58 ]]
            local v58 = 1.2;
            local v59 = 120 * l_v52_0;
            local v60 = (v54 - v57) / v59;
            for v61 = 0, v59 do
                l_Back_1.Text = string.format("\238\128\130%s", v5.formatCommas((tostring((math.floor(v57 + v60 * v61))))));
                v58 = v58 + 0.005;
                wait(l_v52_0 / v59);
            end;
            l_Back_1.UIScale.Scale = 1.2;
            local l_UIScale_4 = l_Back_1.UIScale;
            local v63 = {
                Scale = 1
            };
            local l_Back_2 = Enum.EasingStyle.Back;
            local v65 = TweenInfo.new(0.5, l_Back_2 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_4, v65, v63):Play();
            l_Back_1.Text = string.format("\238\128\130%s", v5.formatCommas(v54));
        end);
        wait(6);
        l_UIScale_3:Destroy();
    end;
    if v41 then
        v42.Surprise.Surprise.Player.Text = v30.donor.Username;
        v42.Surprise.Visible = true;
        v42.Surprise.MouseEnter:Connect(function() --[[ Line: 175 ]]
            game.SoundService.SFX.GiftHover:Play();
            local l_UIScale_5 = v42.UIScale;
            local v68 = {
                Scale = 1.05
            };
            local l_Back_3 = Enum.EasingStyle.Back;
            local v70 = TweenInfo.new(0.25, l_Back_3 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_5, v70, v68):Play();
            l_UIScale_5 = v42.Surprise.Glow;
            v68 = {
                ImageColor3 = Color3.fromRGB(255, 0, 166)
            };
            l_Back_3 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_5, l_Back_3, v68):Play();
            l_UIScale_5 = v42.Surprise.Ribbon.UIScale;
            v68 = {
                Scale = 1.1
            };
            l_Back_3 = Enum.EasingStyle.Back;
            v70 = TweenInfo.new(0.2, l_Back_3 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_5, v70, v68):Play();
            l_UIScale_5 = v42.Surprise.Ribbon;
            v68 = {
                Rotation = math.random(-10, 10)
            };
            l_Back_3 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_5, l_Back_3, v68):Play();
        end);
        v42.Surprise.MouseLeave:Connect(function() --[[ Line: 183 ]]
            local l_UIScale_6 = v42.UIScale;
            local v72 = {
                Scale = 1
            };
            local l_Back_4 = Enum.EasingStyle.Back;
            local v74 = TweenInfo.new(0.25, l_Back_4 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_6, v74, v72):Play();
            l_UIScale_6 = v42.Surprise.Glow;
            v72 = {
                ImageColor3 = Color3.fromRGB(0, 0, 0)
            };
            l_Back_4 = TweenInfo.new(0.2, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_6, l_Back_4, v72):Play();
            l_UIScale_6 = v42.Surprise.Ribbon.UIScale;
            v72 = {
                Scale = 1
            };
            l_Back_4 = Enum.EasingStyle.Back;
            v74 = TweenInfo.new(0.2, l_Back_4 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_6, v74, v72):Play();
        end);
        v42.Surprise.MouseButton1Down:Connect(function() --[[ Line: 189 ]]
            local l_UIScale_7 = v42.UIScale;
            local v76 = {
                Scale = 1.1
            };
            local l_Back_5 = Enum.EasingStyle.Back;
            local v78 = TweenInfo.new(0.25, l_Back_5 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_7, v78, v76):Play();
            l_UIScale_7 = v42.Surprise.Ribbon.UIScale;
            v76 = {
                Scale = 1.2
            };
            l_Back_5 = Enum.EasingStyle.Back;
            v78 = TweenInfo.new(0.2, l_Back_5 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_7, v78, v76):Play();
        end);
        v42.Surprise.MouseButton1Up:Connect(function() --[[ Line: 194 ]]
            local l_UIScale_8 = v42.UIScale;
            local v80 = {
                Scale = 1.05
            };
            local l_Back_6 = Enum.EasingStyle.Back;
            local v82 = TweenInfo.new(0.25, l_Back_6 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_8, v82, v80):Play();
            l_UIScale_8 = v42.Surprise.Ribbon.UIScale;
            v80 = {
                Scale = 1.1
            };
            l_Back_6 = Enum.EasingStyle.Back;
            v82 = TweenInfo.new(0.2, l_Back_6 or Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_UIScale_8, v82, v80):Play();
            if l_UserInputService_0.TouchEnabled and not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.MouseEnabled then
                v66();
            end;
        end);
        v42.Surprise.Activated:Connect(function() --[[ Line: 202 ]]
            v66();
        end);
    end;
    return v42;
end;