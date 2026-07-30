-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("SoundService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local _ = game:GetService("TextService");
local _ = game:GetService("UserInputService");
local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("MarketplaceService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("GuiService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RoBot_0 = l_ReplicatedStorage_0.Templates.RoBot;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v14 = false;
local v15 = 0;
tween = function(v16, v17, v18) --[[ Line: 24 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    l_TweenService_0:Create(v16, TweenInfo.new(v17), v18):Play();
end;
local function _(v19, v20) --[[ Line: 30 ]] --[[ Name: compare ]]
    if v19:lower() == v20:lower() then
        return true;
    else
        return false;
    end;
end;
spin = function(v22, v23) --[[ Line: 39 ]] --[[ Name: spin ]]
    spawn(function() --[[ Line: 40 ]]
        -- upvalues: v22 (copy), v23 (copy)
        while true do
            tween(v22, v23, {
                Rotation = v22.Rotation + 5
            });
            wait(v23 / 3);
            if v22.Rotation >= 360 then
                v22.Rotation = 0;
            end;
        end;
    end);
end;
local v24 = nil;
setup = function(v25) --[[ Line: 54 ]] --[[ Name: setup ]]
    -- upvalues: l_PlayerGui_0 (copy), v14 (ref), l_RoBot_0 (copy), l_LocalPlayer_0 (copy), v24 (ref), l_ReplicatedStorage_0 (copy), v15 (ref)
    local v26 = script.ScreenGui:Clone();
    v26.Parent = l_PlayerGui_0;
    v26.Adornee = v25:WaitForChild("Screen");
    local l_Background_0 = v26.MainFrame.Background;
    local l_Messages_0 = l_Background_0.Messages;
    local l_TextBox_0 = l_Background_0.TextBox;
    spin(l_Background_0.UIGradient, 2);
    spin(l_Messages_0.LoadingFrame.Loading, 0);
    spin(l_TextBox_0.UIStroke.UIGradient, 2);
    l_TextBox_0.Focused:Connect(function() --[[ Line: 80 ]]
        -- upvalues: l_TextBox_0 (copy)
        tween(l_TextBox_0, 0.5, {
            PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        });
        tween(l_TextBox_0.UIStroke, 0.2, {
            Transparency = 0.2
        });
    end);
    l_TextBox_0.FocusLost:Connect(function() --[[ Line: 85 ]]
        -- upvalues: l_TextBox_0 (copy), v14 (ref), l_RoBot_0 (ref), l_LocalPlayer_0 (ref), l_Messages_0 (copy), v24 (ref), l_ReplicatedStorage_0 (ref), v15 (ref)
        l_TextBox_0.PlaceholderColor3 = Color3.fromRGB(66, 220, 255);
        tween(l_TextBox_0, 0.5, {
            PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
        });
        tween(l_TextBox_0.UIStroke, 0.2, {
            Transparency = 0.6
        });
        if l_TextBox_0.Text == "" then
            return;
        elseif v14 then
            return;
        else
            local v30 = l_RoBot_0.UserMessage:Clone();
            v30.Display.Text = l_LocalPlayer_0.DisplayName;
            v30.Message.Text = l_TextBox_0.Text;
            v30.Display.TextTransparency = 1;
            v30.Message.TextTransparency = 1;
            v30.Size = UDim2.new(1, -20, 0, 0);
            v30.Parent = l_Messages_0;
            v24 = l_Messages_0;
            tween(v30.Display, 0.5, {
                TextTransparency = 0
            });
            tween(v30.Message, 1, {
                TextTransparency = 0
            });
            tween(v30.Message, 0.2, {
                TextSize = 22
            });
            tween(v30, 0.25, {
                Size = UDim2.new(1, 0, 0, 0)
            });
            tween(l_Messages_0.LoadingFrame.Loading, 0.2, {
                Size = UDim2.new(0, 30, 0, 30)
            });
            l_ReplicatedStorage_0.FetchAnswer:FireServer(l_TextBox_0.Text);
            v14 = true;
            repeat
                v15 = v15 + 1;
                if v15 >= 15 then
                    v14 = false;
                    tween(l_Messages_0.LoadingFrame.Loading, 0.2, {
                        Size = UDim2.new(0, 0, 0, 0)
                    });
                end;
                wait(1);
            until v14 == false;
            v15 = 0;
            return;
        end;
    end);
end;
l_ReplicatedStorage_0.FetchAnswer.OnClientEvent:Connect(function(_, v32) --[[ Line: 130 ]]
    -- upvalues: l_RoBot_0 (copy), v24 (ref), v14 (ref)
    local v33 = l_RoBot_0.BotMessage:Clone();
    v33.Message.Text = v32;
    v33.Display.Badge.TextTransparency = 1;
    v33.Display.TextTransparency = 1;
    v33.Message.TextTransparency = 1;
    v33.Size = UDim2.new(1, -20, 0, 0);
    v33.Parent = v24;
    tween(v33.Display.Badge, 0.3, {
        TextTransparency = 0
    });
    tween(v33.Display, 0.5, {
        TextTransparency = 0
    });
    tween(v33.Display, 0.5, {
        TextTransparency = 0
    });
    tween(v33.Message, 1, {
        TextTransparency = 0
    });
    tween(v33.Message, 0.2, {
        TextSize = 22
    });
    tween(v33, 0.25, {
        Size = UDim2.new(1, 0, 0, 0)
    });
    tween(v24.LoadingFrame.Loading, 0.2, {
        Size = UDim2.new(0, 0, 0, 0)
    });
    v14 = false;
end);
l_CollectionService_0:GetInstanceAddedSignal("RoBotBooth"):Connect(function(v34) --[[ Line: 151 ]]
    setup(v34);
end);
for _, v36 in pairs(l_CollectionService_0:GetTagged("RoBotBooth")) do
    setup(v36);
end;