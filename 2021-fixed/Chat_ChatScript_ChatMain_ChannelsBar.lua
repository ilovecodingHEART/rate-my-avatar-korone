-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local _ = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChannelsTab_0 = require(l_Parent_0:WaitForChild("ChannelsTab"));
local l_MessageSender_0 = require(l_Parent_0:WaitForChild("MessageSender"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v8 = {};
v8.__index = v8;
v8.CreateGuiObjects = function(v9, v10) --[[ Line: 24 ]] --[[ Name: CreateGuiObjects ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = v10;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "ScrollingBase";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "ScrollerSizer";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.Parent = l_Frame_1;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "ScrollerFrame";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_3.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Selectable = false;
    l_Frame_4.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_4.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_4.ClipsDescendants = true;
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_0;
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Selectable = false;
    l_Frame_5.Name = "LeaveConfirmationFrame";
    l_Frame_5.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_5.Position = UDim2.new(0, 0, 1, 0);
    l_Frame_5.BackgroundTransparency = 0.6;
    l_Frame_5.BorderSizePixel = 0;
    l_Frame_5.BackgroundColor3 = Color3.new(0, 0, 0);
    l_Frame_5.Parent = l_Frame_4;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Text = "";
    l_TextButton_0.Parent = l_Frame_5;
    local l_TextButton_1 = Instance.new("TextButton");
    l_TextButton_1.Selectable = false;
    l_TextButton_1.Size = UDim2.new(0.25, 0, 1, 0);
    l_TextButton_1.BackgroundTransparency = 1;
    l_TextButton_1.Font = l_ChatSettings_0.DefaultFont;
    l_TextButton_1.TextSize = 18;
    l_TextButton_1.TextStrokeTransparency = 0.75;
    l_TextButton_1.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_1.TextColor3 = Color3.new(0, 1, 0);
    l_TextButton_1.Text = "Confirm";
    l_TextButton_1.Parent = l_Frame_5;
    local v19 = l_TextButton_1:Clone();
    v19.Parent = l_Frame_5;
    v19.Position = UDim2.new(0.75, 0, 0, 0);
    v19.TextColor3 = Color3.new(1, 0, 0);
    v19.Text = "Cancel";
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.Size = UDim2.new(0.5, 0, 1, 0);
    l_TextLabel_0.Position = UDim2.new(0.25, 0, 0, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0.75;
    l_TextLabel_0.Text = "Leave channel <XX>?";
    l_TextLabel_0.Font = l_ChatSettings_0.DefaultFont;
    l_TextLabel_0.TextSize = 18;
    l_TextLabel_0.Parent = l_Frame_5;
    local l_StringValue_0 = Instance.new("StringValue");
    l_StringValue_0.Name = "LeaveTarget";
    l_StringValue_0.Parent = l_Frame_5;
    local l_Position_0 = l_Frame_5.Position;
    l_TextButton_1.MouseButton1Click:connect(function() --[[ Line: 116 ]]
        l_MessageSender_0:SendMessage(string.format("/leave %s", l_StringValue_0.Value), nil);
        l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    end);
    v19.MouseButton1Click:connect(function() --[[ Line: 120 ]]
        l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    end);
    local v23 = "rbxasset://textures/ui/Chat/TabArrowBackground.png";
    local v24 = "rbxasset://textures/ui/Chat/TabArrow.png";
    v23 = "rbxassetid://471630199";
    v24 = "rbxassetid://471630112";
    local v25 = Instance.new("ImageButton", l_Frame_0);
    v25.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    v25.Name = "PageLeftButton";
    v25.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v25.Size = UDim2.new(0.7, 0, 0.7, 0);
    v25.BackgroundTransparency = 1;
    v25.Position = UDim2.new(0, 4, 0.15000000000000002, 0);
    v25.Visible = false;
    v25.Image = v23;
    local v26 = Instance.new("ImageLabel", v25);
    v26.Name = "ArrowLabel";
    v26.BackgroundTransparency = 1;
    v26.Size = UDim2.new(0.4, 0, 0.4, 0);
    v26.Image = v24;
    local v27 = Instance.new("Frame", l_Frame_0);
    v27.Selectable = false;
    v27.BackgroundTransparency = 1;
    v27.Name = "PositionalHelper";
    v27.Size = v25.Size;
    v27.SizeConstraint = v25.SizeConstraint;
    v27.Position = UDim2.new(1, 0, 0.15000000000000002, 0);
    local v28 = v25:Clone();
    v28.Parent = v27;
    v28.Name = "PageRightButton";
    v28.Size = UDim2.new(1, 0, 1, 0);
    v28.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v28.Position = UDim2.new(-1, -4, 0, 0);
    local v29 = UDim2.new(0.05, 0, 0, 0);
    v28.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v29;
    v25.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v29;
    v25.ArrowLabel.Rotation = 180;
    v9.GuiObject = l_Frame_0;
    v9.GuiObjects.BaseFrame = l_Frame_0;
    v9.GuiObjects.ScrollerSizer = l_Frame_2;
    v9.GuiObjects.ScrollerFrame = l_Frame_3;
    v9.GuiObjects.PageLeftButton = v25;
    v9.GuiObjects.PageRightButton = v28;
    v9.GuiObjects.LeaveConfirmationFrame = l_Frame_5;
    v9.GuiObjects.LeaveConfirmationNotice = l_TextLabel_0;
    v9.GuiObjects.PageLeftButtonArrow = v25.ArrowLabel;
    v9.GuiObjects.PageRightButtonArrow = v28.ArrowLabel;
    v9:AnimGuiObjects();
    v25.MouseButton1Click:connect(function() --[[ Line: 188 ]]
        v9:ScrollChannelsFrame(-1);
    end);
    v28.MouseButton1Click:connect(function() --[[ Line: 189 ]]
        v9:ScrollChannelsFrame(1);
    end);
    v9:ScrollChannelsFrame(0);
end;
v8.UpdateMessagePostedInChannel = function(v30, v31) --[[ Line: 195 ]] --[[ Name: UpdateMessagePostedInChannel ]]
    local l_v30_ChannelTab_0 = v30:GetChannelTab(v31);
    if l_v30_ChannelTab_0 then
        l_v30_ChannelTab_0:UpdateMessagePostedInChannel();
        return;
    else
        warn("ChannelsTab '" .. v31 .. "' does not exist!");
        return;
    end;
end;
v8.AddChannelTab = function(v33, v34) --[[ Line: 204 ]] --[[ Name: AddChannelTab ]]
    if v33:GetChannelTab(v34) then
        error("Channel tab '" .. v34 .. "'already exists!");
    end;
    local v35 = l_ChannelsTab_0.new(v34);
    v35.GuiObject.Parent = v33.GuiObjects.ScrollerFrame;
    v33.ChannelTabs[v34:lower()] = v35;
    v33.NumTabs = v33.NumTabs + 1;
    v33:OrganizeChannelTabs();
    if l_ChatSettings_0.RightClickToLeaveChannelEnabled then
        v35.NameTag.MouseButton2Click:connect(function() --[[ Line: 217 ]]
            v33.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v35.ChannelName);
            v33.LeaveConfirmationFrame.LeaveTarget.Value = v35.ChannelName;
            v33.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true);
        end);
    end;
    return v35;
end;
v8.RemoveChannelTab = function(v36, v37) --[[ Line: 227 ]] --[[ Name: RemoveChannelTab ]]
    if not v36:GetChannelTab(v37) then
        error("Channel tab '" .. v37 .. "'does not exist!");
    end;
    local v38 = v37:lower();
    v36.ChannelTabs[v38]:Destroy();
    v36.ChannelTabs[v38] = nil;
    v36.NumTabs = v36.NumTabs - 1;
    v36:OrganizeChannelTabs();
end;
v8.GetChannelTab = function(v39, v40) --[[ Line: 240 ]] --[[ Name: GetChannelTab ]]
    return v39.ChannelTabs[v40:lower()];
end;
v8.OrganizeChannelTabs = function(v41) --[[ Line: 244 ]] --[[ Name: OrganizeChannelTabs ]]
    local v42 = {};
    table.insert(v42, v41:GetChannelTab(l_ChatSettings_0.GeneralChannelName));
    table.insert(v42, v41:GetChannelTab("System"));
    for _, v44 in pairs(v41.ChannelTabs) do
        if v44.ChannelName ~= l_ChatSettings_0.GeneralChannelName and v44.ChannelName ~= "System" then
            table.insert(v42, v44);
        end;
    end;
    for v45, v46 in pairs(v42) do
        v46.GuiObject.Position = UDim2.new(v45 - 1, 0, 0, 0);
    end;
    v41.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, (math.min(l_ChatSettings_0.ChannelsBarFullTabSize, v41.NumTabs))), 0, 1, 0);
    v41:ScrollChannelsFrame(0);
end;
v8.ResizeChannelTabText = function(v47, v48) --[[ Line: 266 ]] --[[ Name: ResizeChannelTabText ]]
    for _, v50 in pairs(v47.ChannelTabs) do
        v50:SetTextSize(v48);
    end;
end;
v8.ScrollChannelsFrame = function(v51, v52) --[[ Line: 272 ]] --[[ Name: ScrollChannelsFrame ]]
    if v51.ScrollChannelsFrameLock then
        return;
    else
        v51.ScrollChannelsFrameLock = true;
        local l_ChannelsBarFullTabSize_0 = l_ChatSettings_0.ChannelsBarFullTabSize;
        local v54 = v51.CurPageNum + v52;
        if v54 < 0 then
            v54 = 0;
        elseif v54 > 0 and v54 + l_ChannelsBarFullTabSize_0 > v51.NumTabs then
            v54 = v51.NumTabs - l_ChannelsBarFullTabSize_0;
        end;
        v51.CurPageNum = v54;
        local v55 = UDim2.new(-v51.CurPageNum, 0, 0, 0);
        v51.GuiObjects.PageLeftButton.Visible = v51.CurPageNum > 0;
        v51.GuiObjects.PageRightButton.Visible = v51.CurPageNum + l_ChannelsBarFullTabSize_0 < v51.NumTabs;
        if v52 == 0 then
            v51.ScrollChannelsFrameLock = false;
            return;
        else
            local function v56() --[[ Line: 298 ]] --[[ Name: UnlockFunc ]]
                v51.ScrollChannelsFrameLock = false;
            end;
            v51:WaitUntilParentedCorrectly();
            v51.GuiObjects.ScrollerFrame:TweenPosition(v55, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, v56);
            return;
        end;
    end;
end;
v8.FadeOutBackground = function(v57, v58) --[[ Line: 307 ]] --[[ Name: FadeOutBackground ]]
    for _, v60 in pairs(v57.ChannelTabs) do
        v60:FadeOutBackground(v58);
    end;
    v57.AnimParams.Background_TargetTransparency = 1;
    v57.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v58);
end;
v8.FadeInBackground = function(v61, v62) --[[ Line: 316 ]] --[[ Name: FadeInBackground ]]
    for _, v64 in pairs(v61.ChannelTabs) do
        v64:FadeInBackground(v62);
    end;
    v61.AnimParams.Background_TargetTransparency = 0.6;
    v61.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v62);
end;
v8.FadeOutText = function(v65, v66) --[[ Line: 325 ]] --[[ Name: FadeOutText ]]
    for _, v68 in pairs(v65.ChannelTabs) do
        v68:FadeOutText(v66);
    end;
end;
v8.FadeInText = function(v69, v70) --[[ Line: 331 ]] --[[ Name: FadeInText ]]
    for _, v72 in pairs(v69.ChannelTabs) do
        v72:FadeInText(v70);
    end;
end;
v8.AnimGuiObjects = function(v73) --[[ Line: 337 ]] --[[ Name: AnimGuiObjects ]]
    v73.GuiObjects.PageLeftButton.ImageTransparency = v73.AnimParams.Background_CurrentTransparency;
    v73.GuiObjects.PageRightButton.ImageTransparency = v73.AnimParams.Background_CurrentTransparency;
    v73.GuiObjects.PageLeftButtonArrow.ImageTransparency = v73.AnimParams.Background_CurrentTransparency;
    v73.GuiObjects.PageRightButtonArrow.ImageTransparency = v73.AnimParams.Background_CurrentTransparency;
end;
v8.InitializeAnimParams = function(v74) --[[ Line: 344 ]] --[[ Name: InitializeAnimParams ]]
    v74.AnimParams.Background_TargetTransparency = 0.6;
    v74.AnimParams.Background_CurrentTransparency = 0.6;
    v74.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v8.Update = function(v75, v76) --[[ Line: 350 ]] --[[ Name: Update ]]
    for _, v78 in pairs(v75.ChannelTabs) do
        v78:Update(v76);
    end;
    v75.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v75.AnimParams.Background_CurrentTransparency, v75.AnimParams.Background_TargetTransparency, v75.AnimParams.Background_NormalizedExptValue, v76);
    v75:AnimGuiObjects();
end;
v8.WaitUntilParentedCorrectly = function(v79) --[[ Line: 366 ]] --[[ Name: WaitUntilParentedCorrectly ]]
    while not v79.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v79.GuiObject.AncestryChanged:wait();
    end;
end;
v0.new = function() --[[ Line: 375 ]] --[[ Name: new ]]
    local v80 = setmetatable({}, v8);
    v80.GuiObject = nil;
    v80.GuiObjects = {};
    v80.ChannelTabs = {};
    v80.NumTabs = 0;
    v80.CurPageNum = 0;
    v80.ScrollChannelsFrameLock = false;
    v80.AnimParams = {};
    v80:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v81, v82) --[[ Line: 391 ]]
        if v81 == "ChatChannelsTabTextSize" then
            v80:ResizeChannelTabText(v82);
        end;
    end);
    return v80;
end;
return v0;