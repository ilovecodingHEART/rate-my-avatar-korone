-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = {
    ScrollBarThickness = 4
};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_MessageLabelCreator_0 = require(l_Parent_0:WaitForChild("MessageLabelCreator"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v8 = l_MessageLabelCreator_0.new();
local v9 = {};
v9.__index = v9;
local function v13() --[[ Line: 33 ]] --[[ Name: CreateGuiObjects ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_ScrollingFrame_0.Name = "Scroller";
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 3);
    l_ScrollingFrame_0.Size = UDim2.new(1, -4, 1, -6);
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ScrollBarThickness = l_status_0.ScrollBarThickness;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    return l_Frame_0, l_ScrollingFrame_0, l_UIListLayout_0;
end;
v9.Destroy = function(v14) --[[ Line: 58 ]] --[[ Name: Destroy ]]
    v14.GuiObject:Destroy();
    v14.Destroyed = true;
end;
v9.SetActive = function(v15, v16) --[[ Line: 63 ]] --[[ Name: SetActive ]]
    v15.GuiObject.Visible = v16;
end;
v9.UpdateMessageFiltered = function(v17, v18) --[[ Line: 67 ]] --[[ Name: UpdateMessageFiltered ]]
    local v19 = nil;
    local v20 = 1;
    local l_MessageObjectLog_0 = v17.MessageObjectLog;
    while v20 <= #l_MessageObjectLog_0 do
        local v22 = l_MessageObjectLog_0[v20];
        if v22.ID == v18.ID then
            v19 = v22;
            break;
        else
            v20 = v20 + 1;
        end;
    end;
    if v19 then
        if v0 then
            if v18.Message == "" then
                v17:RemoveMessageAtIndex(v20);
                return;
            else
                v19.UpdateTextFunction(v18);
                v17:PositionMessageLabelInWindow(v19, v20);
                return;
            end;
        else
            v19.UpdateTextFunction(v18);
            v17:PositionMessageLabelInWindow(v19, v20);
        end;
    end;
end;
v9.AddMessage = function(v23, v24) --[[ Line: 98 ]] --[[ Name: AddMessage ]]
    v23:WaitUntilParentedCorrectly();
    local l_v8_MessageLabel_0 = v8:CreateMessageLabel(v24, v23.CurrentChannelName);
    if l_v8_MessageLabel_0 == nil then
        return;
    else
        table.insert(v23.MessageObjectLog, l_v8_MessageLabel_0);
        v23:PositionMessageLabelInWindow(l_v8_MessageLabel_0, #v23.MessageObjectLog);
        return;
    end;
end;
v9.RemoveMessageAtIndex = function(v26, v27) --[[ Line: 110 ]] --[[ Name: RemoveMessageAtIndex ]]
    v26:WaitUntilParentedCorrectly();
    local v28 = v26.MessageObjectLog[v27];
    if v28 then
        v28:Destroy();
        table.remove(v26.MessageObjectLog, v27);
    end;
end;
v9.AddMessageAtIndex = function(v29, v30, v31) --[[ Line: 121 ]] --[[ Name: AddMessageAtIndex ]]
    local l_v8_MessageLabel_1 = v8:CreateMessageLabel(v30, v29.CurrentChannelName);
    if l_v8_MessageLabel_1 == nil then
        return;
    else
        table.insert(v29.MessageObjectLog, v31, l_v8_MessageLabel_1);
        v29:PositionMessageLabelInWindow(l_v8_MessageLabel_1, v31);
        return;
    end;
end;
v9.RemoveLastMessage = function(v33) --[[ Line: 132 ]] --[[ Name: RemoveLastMessage ]]
    v33:WaitUntilParentedCorrectly();
    v33.MessageObjectLog[1]:Destroy();
    table.remove(v33.MessageObjectLog, 1);
end;
v9.IsScrolledDown = function(v34) --[[ Line: 141 ]] --[[ Name: IsScrolledDown ]]
    local l_Offset_0 = v34.Scroller.CanvasSize.Y.Offset;
    local l_Y_0 = v34.Scroller.AbsoluteWindowSize.Y;
    local l_Y_1 = v34.Scroller.CanvasPosition.Y;
    local v38 = true;
    if l_Offset_0 >= l_Y_0 then
        v38 = l_Offset_0 - l_Y_1 <= l_Y_0 + 5;
    end;
    return v38;
end;
v9.UpdateMessageTextHeight = function(v39, v40) --[[ Line: 150 ]] --[[ Name: UpdateMessageTextHeight ]]
    local l_BaseFrame_0 = v40.BaseFrame;
    for v42 = 1, 10 do
        if not v40.BaseMessage.TextFits then
            local v43 = v39.Scroller.AbsoluteSize.X - v42;
            l_BaseFrame_0.Size = UDim2.new(1, 0, 0, v40.GetHeightFunction(v43));
        else
            break;
        end;
    end;
end;
v9.PositionMessageLabelInWindow = function(v44, v45, v46) --[[ Line: 162 ]] --[[ Name: PositionMessageLabelInWindow ]]
    v44:WaitUntilParentedCorrectly();
    local v47 = v44:IsScrolledDown();
    local l_BaseFrame_1 = v45.BaseFrame;
    local v49 = 1;
    if v44.MessageObjectLog[v46 - 1] then
        v49 = if v46 == #v44.MessageObjectLog then v44.MessageObjectLog[v46 - 1].BaseFrame.LayoutOrder + 1 else v44.MessageObjectLog[v46 - 1].BaseFrame.LayoutOrder;
    end;
    l_BaseFrame_1.LayoutOrder = v49;
    l_BaseFrame_1.Size = UDim2.new(1, 0, 0, v45.GetHeightFunction(v44.Scroller.AbsoluteSize.X));
    l_BaseFrame_1.Parent = v44.Scroller;
    if v45.BaseMessage then
        v44:UpdateMessageTextHeight(v45);
    end;
    if v47 then
        v44.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v44.Scroller.CanvasSize.Y.Offset - v44.Scroller.AbsoluteSize.Y)));
    end;
end;
v9.ReorderAllMessages = function(v50) --[[ Line: 192 ]] --[[ Name: ReorderAllMessages ]]
    v50:WaitUntilParentedCorrectly();
    if v50.GuiObject.AbsoluteSize.Y < 1 then
        return;
    else
        local l_CanvasPosition_0 = v50.Scroller.CanvasPosition;
        local v52 = v50:IsScrolledDown();
        for _, v54 in pairs(v50.MessageObjectLog) do
            v50:UpdateMessageTextHeight(v54);
        end;
        if not v52 then
            v50.Scroller.CanvasPosition = l_CanvasPosition_0;
            return;
        else
            v50.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v50.Scroller.CanvasSize.Y.Offset - v50.Scroller.AbsoluteSize.Y)));
            return;
        end;
    end;
end;
v9.Clear = function(v55) --[[ Line: 214 ]] --[[ Name: Clear ]]
    for _, v57 in pairs(v55.MessageObjectLog) do
        v57:Destroy();
    end;
    v55.MessageObjectLog = {};
end;
v9.SetCurrentChannelName = function(v58, v59) --[[ Line: 221 ]] --[[ Name: SetCurrentChannelName ]]
    v58.CurrentChannelName = v59;
end;
v9.FadeOutBackground = function(_, _) --[[ Line: 225 ]] --[[ Name: FadeOutBackground ]]

end;
v9.FadeInBackground = function(_, _) --[[ Line: 229 ]] --[[ Name: FadeInBackground ]]

end;
v9.FadeOutText = function(v64, v65) --[[ Line: 233 ]] --[[ Name: FadeOutText ]]
    for v66 = 1, #v64.MessageObjectLog do
        if v64.MessageObjectLog[v66].FadeOutFunction then
            v64.MessageObjectLog[v66].FadeOutFunction(v65, l_CurveUtil_0);
        end;
    end;
end;
v9.FadeInText = function(v67, v68) --[[ Line: 241 ]] --[[ Name: FadeInText ]]
    for v69 = 1, #v67.MessageObjectLog do
        if v67.MessageObjectLog[v69].FadeInFunction then
            v67.MessageObjectLog[v69].FadeInFunction(v68, l_CurveUtil_0);
        end;
    end;
end;
v9.Update = function(v70, v71) --[[ Line: 249 ]] --[[ Name: Update ]]
    for v72 = 1, #v70.MessageObjectLog do
        if v70.MessageObjectLog[v72].UpdateAnimFunction then
            v70.MessageObjectLog[v72].UpdateAnimFunction(v71, l_CurveUtil_0);
        end;
    end;
end;
v9.WaitUntilParentedCorrectly = function(v73) --[[ Line: 258 ]] --[[ Name: WaitUntilParentedCorrectly ]]
    while not v73.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v73.GuiObject.AncestryChanged:wait();
    end;
end;
l_status_0.new = function() --[[ Line: 267 ]] --[[ Name: new ]]
    local v74 = setmetatable({}, v9);
    v74.Destroyed = false;
    local v75, v76, v77 = v13();
    v74.GuiObject = v75;
    v74.Scroller = v76;
    v74.Layout = v77;
    v74.MessageObjectLog = {};
    v74.Name = "MessageLogDisplay";
    v74.GuiObject.Name = "Frame_" .. v74.Name;
    v74.CurrentChannelName = "";
    v74.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 283 ]]
        spawn(function() --[[ Line: 284 ]]
            v74:ReorderAllMessages();
        end);
    end);
    local v78 = true;
    v74.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 289 ]]
        local l_AbsoluteContentSize_0 = v74.Layout.AbsoluteContentSize;
        v74.Scroller.CanvasSize = UDim2.new(0, 0, 0, l_AbsoluteContentSize_0.Y);
        if v78 then
            local l_AbsoluteWindowSize_0 = v74.Scroller.AbsoluteWindowSize;
            v74.Scroller.CanvasPosition = Vector2.new(0, l_AbsoluteContentSize_0.Y - l_AbsoluteWindowSize_0.Y);
        end;
    end);
    v74.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 298 ]]
        v78 = v74:IsScrolledDown();
    end);
    return v74;
end;
return l_status_0;