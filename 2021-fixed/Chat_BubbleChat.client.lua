-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x2, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
    return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble");
end);
local v8 = l_status_0 and l_result_0;
local v9 = nil;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 28 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText");
end);
v9 = l_status_1 and l_result_1;
l_status_1 = nil;
local v12;
l_result_1, v12 = pcall(function() --[[ Line: 35 ]]
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
l_status_1 = l_result_1 and v12;
l_result_1 = nil;
local v13;
v12, v13 = pcall(function() --[[ Line: 42 ]]
    return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap");
end);
l_result_1 = v12 and v13;
v12 = function(v14) --[[ Line: 48 ]] --[[ Name: getMessageLength ]]
    return utf8.len(utf8.nfcnormalize(v14));
end;
v13 = Enum.Font.SourceSans;
local l_Size24_0 = Enum.FontSize.Size24;
local v16 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1;
local v17 = {
    WHITE = "dub", 
    BLUE = "blu", 
    GREEN = "gre", 
    RED = "red"
};
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "BubbleChat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Parent = l_PlayerGui_0;
local function _(v19, v20, v21) --[[ Line: 91 ]] --[[ Name: lerpLength ]]
    return v20 + (v21 - v20) * math.min(utf8.len(utf8.nfcnormalize(v19)) / 75, 1);
end;
local function v34() --[[ Line: 95 ]] --[[ Name: createFifo ]]
    local v23 = {
        data = {}
    };
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v23.Emptied = l_BindableEvent_0.Event;
    v23.Size = function(_) --[[ Line: 102 ]] --[[ Name: Size ]]
        return #v23.data;
    end;
    v23.Empty = function(_) --[[ Line: 106 ]] --[[ Name: Empty ]]
        return v23:Size() <= 0;
    end;
    v23.PopFront = function(_) --[[ Line: 110 ]] --[[ Name: PopFront ]]
        table.remove(v23.data, 1);
        if v23:Empty() then
            l_BindableEvent_0:Fire();
        end;
    end;
    v23.Front = function(_) --[[ Line: 115 ]] --[[ Name: Front ]]
        return v23.data[1];
    end;
    v23.Get = function(_, v30) --[[ Line: 119 ]] --[[ Name: Get ]]
        return v23.data[v30];
    end;
    v23.PushBack = function(_, v32) --[[ Line: 123 ]] --[[ Name: PushBack ]]
        table.insert(v23.data, v32);
    end;
    v23.GetData = function(_) --[[ Line: 127 ]] --[[ Name: GetData ]]
        return v23.data;
    end;
    return v23;
end;
local function _() --[[ Line: 134 ]] --[[ Name: createCharacterChats ]]
    return {
        Fifo = v34(), 
        BillboardGui = nil
    };
end;
local function v49() --[[ Line: 143 ]] --[[ Name: createMap ]]
    local v36 = {
        data = {}
    };
    local v37 = 0;
    v36.Size = function(_) --[[ Line: 148 ]] --[[ Name: Size ]]
        return v37;
    end;
    v36.Erase = function(_, v40) --[[ Line: 152 ]] --[[ Name: Erase ]]
        if v36.data[v40] then
            v37 = v37 - 1;
        end;
        v36.data[v40] = nil;
    end;
    v36.Set = function(_, v42, v43) --[[ Line: 157 ]] --[[ Name: Set ]]
        v36.data[v42] = v43;
        if v43 then
            v37 = v37 + 1;
        end;
    end;
    v36.Get = function(_, v45) --[[ Line: 162 ]] --[[ Name: Get ]]
        if not v45 then
            return;
        else
            if not v36.data[v45] then
                v36.data[v45] = {
                    Fifo = v34(), 
                    BillboardGui = nil
                };
                local v46 = nil;
                do
                    local l_v46_0 = v46;
                    l_v46_0 = v36.data[v45].Fifo.Emptied:connect(function() --[[ Line: 167 ]]
                        l_v46_0:disconnect();
                        v36:Erase(v45);
                    end);
                end;
            end;
            return v36.data[v45];
        end;
    end;
    v36.GetData = function(_) --[[ Line: 175 ]] --[[ Name: GetData ]]
        return v36.data;
    end;
    return v36;
end;
local function v57(v50, v51, v52) --[[ Line: 182 ]] --[[ Name: createChatLine ]]
    local v56 = {
        ComputeBubbleLifetime = function(_, v54, v55) --[[ Line: 185 ]] --[[ Name: ComputeBubbleLifetime ]]
            if v55 then
                return 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(v54)) / 75, 1);
            else
                return 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(v54)) / 75, 1);
            end;
        end, 
        Origin = nil, 
        RenderBubble = nil, 
        Message = v50
    };
    v56.BubbleDieDelay = v56:ComputeBubbleLifetime(v50, v52);
    v56.BubbleColor = v51;
    v56.IsLocalPlayer = v52;
    return v56;
end;
local function _(v58, v59, v60) --[[ Line: 203 ]] --[[ Name: createPlayerChatLine ]]
    local v61 = v57(v59, v17.WHITE, v60);
    if v58 then
        v61.User = v58.Name;
        v61.Origin = v58.Character;
    end;
    return v61;
end;
local function _(v63, v64, v65, v66) --[[ Line: 214 ]] --[[ Name: createGameChatLine ]]
    local v67 = v57(v64, v66, v65);
    v67.Origin = v63;
    return v67;
end;
createChatBubbleMain = function(v69, v70) --[[ Line: 221 ]] --[[ Name: createChatBubbleMain ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ChatBubble";
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = v70;
    l_ImageLabel_0.Image = "rbxasset://textures/" .. tostring(v69) .. ".png";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    return l_ImageLabel_0;
end;
createChatBubbleTail = function(v72, v73) --[[ Line: 235 ]] --[[ Name: createChatBubbleTail ]]
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ChatBubbleTail";
    l_ImageLabel_1.Image = "rbxasset://textures/ui/dialog_tail.png";
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.BorderSizePixel = 0;
    l_ImageLabel_1.Position = v72;
    l_ImageLabel_1.Size = v73;
    return l_ImageLabel_1;
end;
createChatBubbleWithTail = function(v75, v76, v77, v78) --[[ Line: 247 ]] --[[ Name: createChatBubbleWithTail ]]
    local v79 = createChatBubbleMain(v75, v78);
    createChatBubbleTail(v76, v77).Parent = v79;
    return v79;
end;
createScaledChatBubbleWithTail = function(v80, v81, v82, v83) --[[ Line: 256 ]] --[[ Name: createScaledChatBubbleWithTail ]]
    local v84 = createChatBubbleMain(v80, v83);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "ChatBubbleTailFrame";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.SizeConstraint = Enum.SizeConstraint.RelativeXX;
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Size = UDim2.new(v81, 0, v81, 0);
    l_Frame_0.Parent = v84;
    createChatBubbleTail(v82, UDim2.new(1, 0, 0.5, 0)).Parent = l_Frame_0;
    return v84;
end;
createChatImposter = function(v86, v87, v88) --[[ Line: 273 ]] --[[ Name: createChatImposter ]]
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "DialogPlaceholder";
    l_ImageLabel_2.Image = "rbxasset://textures/" .. tostring(v86) .. ".png";
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.BorderSizePixel = 0;
    l_ImageLabel_2.Position = UDim2.new(0, 0, -1.25, 0);
    l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
    local l_ImageLabel_3 = Instance.new("ImageLabel");
    l_ImageLabel_3.Name = "DotDotDot";
    l_ImageLabel_3.Image = "rbxasset://textures/" .. tostring(v87) .. ".png";
    l_ImageLabel_3.BackgroundTransparency = 1;
    l_ImageLabel_3.BorderSizePixel = 0;
    l_ImageLabel_3.Position = UDim2.new(0.001, 0, v88, 0);
    l_ImageLabel_3.Size = UDim2.new(1, 0, 0.7, 0);
    l_ImageLabel_3.Parent = l_ImageLabel_2;
    return l_ImageLabel_2;
end;
local v91 = {
    ChatBubble = {}, 
    ChatBubbleWithTail = {}, 
    ScalingChatBubbleWithTail = {}, 
    CharacterSortedMsg = v49()
};
local function v97(v92, v93, _, v95, v96) --[[ Line: 302 ]] --[[ Name: initChatBubbleType ]]
    v91.ChatBubble[v92] = createChatBubbleMain(v93, v96);
    v91.ChatBubbleWithTail[v92] = createChatBubbleWithTail(v93, UDim2.new(0.5, -14, 1, v95 and -1 or 0), UDim2.new(0, 30, 0, 14), v96);
    v91.ScalingChatBubbleWithTail[v92] = createScaledChatBubbleWithTail(v93, 0.5, UDim2.new(-0.5, 0, 0, v95 and -1 or 0), v96);
end;
v97(v17.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15));
v97(v17.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33));
v97(v17.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33));
v97(v17.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33));
v91.SanitizeChatLine = function(_, v99) --[[ Line: 313 ]] --[[ Name: SanitizeChatLine ]]
    if utf8.len(utf8.nfcnormalize(v99)) > v16 then
        return (string.sub(v99, 1, utf8.offset(v99, v16 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1));
    else
        return v99;
    end;
end;
local function v104(v100) --[[ Line: 322 ]] --[[ Name: createBillboardInstance ]]
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Adornee = v100;
    l_BillboardGui_0.Size = UDim2.new(0, 400, 0, 250);
    l_BillboardGui_0.StudsOffset = Vector3.new(0, 1.5, 2, 0);
    l_BillboardGui_0.Parent = l_ScreenGui_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "BillboardFrame";
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, -0.5, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_BillboardGui_0;
    local v103 = nil;
    v103 = l_Frame_1.ChildRemoved:connect(function() --[[ Line: 337 ]]
        if #l_Frame_1:GetChildren() <= 1 then
            v103:disconnect();
            l_BillboardGui_0:Destroy();
        end;
    end);
    v91:CreateSmallTalkBubble(v17.WHITE).Parent = l_Frame_1;
    return l_BillboardGui_0;
end;
v91.CreateBillboardGuiHelper = function(_, v106, v107) --[[ Line: 349 ]] --[[ Name: CreateBillboardGuiHelper ]]
    if v106 and not v91.CharacterSortedMsg:Get(v106).BillboardGui then
        if not v107 and v106:IsA("BasePart") then
            local v108 = v104(v106);
            v91.CharacterSortedMsg:Get(v106).BillboardGui = v108;
            return;
        elseif v106:IsA("Model") then
            local l_Head_0 = v106:FindFirstChild("Head");
            if l_Head_0 and l_Head_0:IsA("BasePart") then
                local v110 = v104(l_Head_0);
                v91.CharacterSortedMsg:Get(v106).BillboardGui = v110;
            end;
        end;
    end;
end;
local function _(v111) --[[ Line: 371 ]] --[[ Name: distanceToBubbleOrigin ]]
    if not v111 then
        return 100000;
    else
        return (v111.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude;
    end;
end;
local function _(v113) --[[ Line: 377 ]] --[[ Name: isPartOfLocalPlayer ]]
    if v113 and l_Players_0.LocalPlayer.Character then
        return v113:IsDescendantOf(l_Players_0.LocalPlayer.Character);
    else
        return;
    end;
end;
v91.SetBillboardLODNear = function(_, v116) --[[ Line: 383 ]] --[[ Name: SetBillboardLODNear ]]
    local l_Adornee_0 = v116.Adornee;
    local v118 = __2021_if(function() return l_Adornee_0 and l_Players_0.LocalPlayer.Character end, function() return l_Adornee_0:IsDescendantOf(l_Players_0.LocalPlayer.Character) end, function() return nil end);
    v116.Size = UDim2.new(0, 400, 0, 250);
    v116.StudsOffset = Vector3.new(0, v118 and 1.5 or 2.5, v118 and 2 or 0.1);
    v116.Enabled = true;
    l_Adornee_0 = v116.BillboardFrame:GetChildren();
    for v119 = 1, #l_Adornee_0 do
        l_Adornee_0[v119].Visible = true;
    end;
    v116.BillboardFrame.SmallTalkBubble.Visible = false;
end;
v91.SetBillboardLODDistant = function(_, v121) --[[ Line: 395 ]] --[[ Name: SetBillboardLODDistant ]]
    local l_Adornee_1 = v121.Adornee;
    local v123 = __2021_if(function() return l_Adornee_1 and l_Players_0.LocalPlayer.Character end, function() return l_Adornee_1:IsDescendantOf(l_Players_0.LocalPlayer.Character) end, function() return nil end);
    v121.Size = UDim2.new(4, 0, 3, 0);
    v121.StudsOffset = Vector3.new(0, 3, v123 and 2 or 0.1);
    v121.Enabled = true;
    l_Adornee_1 = v121.BillboardFrame:GetChildren();
    for v124 = 1, #l_Adornee_1 do
        l_Adornee_1[v124].Visible = false;
    end;
    v121.BillboardFrame.SmallTalkBubble.Visible = true;
end;
v91.SetBillboardLODVeryFar = function(_, v126) --[[ Line: 407 ]] --[[ Name: SetBillboardLODVeryFar ]]
    v126.Enabled = false;
end;
v91.SetBillboardGuiLOD = function(_, v128, v129) --[[ Line: 411 ]] --[[ Name: SetBillboardGuiLOD ]]
    if not v129 then
        return;
    else
        if v129:IsA("Model") then
            v129 = v129:FindFirstChild("Head") or v129.PrimaryPart;
        end;
        local l_v129_0 = v129;
        local v131 = not l_v129_0 and 100000 or (l_v129_0.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude;
        if v131 < 65 then
            v91:SetBillboardLODNear(v128);
            return;
        elseif v131 >= 65 and v131 < 100 then
            v91:SetBillboardLODDistant(v128);
            return;
        else
            v91:SetBillboardLODVeryFar(v128);
            return;
        end;
    end;
end;
v91.CameraCFrameChanged = function(_) --[[ Line: 431 ]] --[[ Name: CameraCFrameChanged ]]
    for v133, v134 in pairs(v91.CharacterSortedMsg:GetData()) do
        local l_BillboardGui_1 = v134.BillboardGui;
        if l_BillboardGui_1 then
            v91:SetBillboardGuiLOD(l_BillboardGui_1, v133);
        end;
    end;
end;
v91.CreateBubbleText = function(_, v137, v138) --[[ Line: 438 ]] --[[ Name: CreateBubbleText ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "BubbleText";
    l_TextLabel_0.BackgroundTransparency = 1;
    if v9 then
        l_TextLabel_0.Size = UDim2.fromScale(1, 1);
    else
        l_TextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        l_TextLabel_0.Size = UDim2.new(1, -30, 1, 0);
    end;
    l_TextLabel_0.Font = v13;
    l_TextLabel_0.ClipsDescendants = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.FontSize = l_Size24_0;
    l_TextLabel_0.Text = v137;
    l_TextLabel_0.Visible = false;
    l_TextLabel_0.AutoLocalize = v138;
    if v9 then
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingTop = UDim.new(0, 12);
        l_UIPadding_0.PaddingRight = UDim.new(0, 12);
        l_UIPadding_0.PaddingBottom = UDim.new(0, 12);
        l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
        l_UIPadding_0.Parent = l_TextLabel_0;
    end;
    return l_TextLabel_0;
end;
v91.CreateSmallTalkBubble = function(_, v142) --[[ Line: 470 ]] --[[ Name: CreateSmallTalkBubble ]]
    local v143 = v91.ScalingChatBubbleWithTail[v142]:Clone();
    v143.Name = "SmallTalkBubble";
    v143.AnchorPoint = Vector2.new(0, 0.5);
    v143.Position = UDim2.new(0, 0, 0.5, 0);
    v143.Visible = false;
    local l_v91_BubbleText_0 = v91:CreateBubbleText("...");
    l_v91_BubbleText_0.TextScaled = true;
    l_v91_BubbleText_0.TextWrapped = false;
    l_v91_BubbleText_0.Visible = true;
    l_v91_BubbleText_0.Parent = v143;
    return v143;
end;
v91.UpdateChatLinesForOrigin = function(_, v146, v147) --[[ Line: 485 ]] --[[ Name: UpdateChatLinesForOrigin ]]
    local l_Fifo_0 = v91.CharacterSortedMsg:Get(v146).Fifo;
    local v149 = l_Fifo_0:Size();
    local l_l_Fifo_0_Data_0 = l_Fifo_0:GetData();
    if #l_l_Fifo_0_Data_0 <= 1 then
        return;
    else
        for v151 = #l_l_Fifo_0_Data_0 - 1, 1, -1 do
            local l_RenderBubble_0 = l_l_Fifo_0_Data_0[v151].RenderBubble;
            if not l_RenderBubble_0 then
                return;
            else
                if v149 - v151 + 1 > 1 then
                    local l_ChatBubbleTail_0 = l_RenderBubble_0:FindFirstChild("ChatBubbleTail");
                    if l_ChatBubbleTail_0 then
                        l_ChatBubbleTail_0:Destroy();
                    end;
                    local l_BubbleText_0 = l_RenderBubble_0:FindFirstChild("BubbleText");
                    if l_BubbleText_0 then
                        l_BubbleText_0.TextTransparency = 0.5;
                    end;
                end;
                l_RenderBubble_0:TweenPosition(UDim2.new(l_RenderBubble_0.Position.X.Scale, l_RenderBubble_0.Position.X.Offset, 1, v147 - l_RenderBubble_0.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
                v147 = v147 - l_RenderBubble_0.Size.Y.Offset - 14;
            end;
        end;
        return;
    end;
end;
v91.DestroyBubble = function(_, v156, v157) --[[ Line: 511 ]] --[[ Name: DestroyBubble ]]
    if not v156 then
        return;
    elseif v156:Empty() then
        return;
    else
        local l_RenderBubble_1 = v156:Front().RenderBubble;
        if not l_RenderBubble_1 then
            v156:PopFront();
            return;
        else
            spawn(function() --[[ Line: 521 ]]
                while v156:Front().RenderBubble ~= v157 do
                    wait();
                end;
                l_RenderBubble_1 = v156:Front().RenderBubble;
                local v159 = 0;
                local l_BubbleText_1 = l_RenderBubble_1:FindFirstChild("BubbleText");
                local l_ChatBubbleTail_1 = l_RenderBubble_1:FindFirstChild("ChatBubbleTail");
                while l_RenderBubble_1 and l_RenderBubble_1.ImageTransparency < 1 do
                    v159 = wait();
                    if l_RenderBubble_1 then
                        local v162 = v159 * 1.5;
                        l_RenderBubble_1.ImageTransparency = l_RenderBubble_1.ImageTransparency + v162;
                        if l_BubbleText_1 then
                            l_BubbleText_1.TextTransparency = l_BubbleText_1.TextTransparency + v162;
                        end;
                        if l_ChatBubbleTail_1 then
                            l_ChatBubbleTail_1.ImageTransparency = l_ChatBubbleTail_1.ImageTransparency + v162;
                        end;
                    end;
                end;
                if l_RenderBubble_1 then
                    l_RenderBubble_1:Destroy();
                    v156:PopFront();
                end;
            end);
            return;
        end;
    end;
end;
v91.CreateChatLineRender = function(_, v164, v165, v166, v167, v168) --[[ Line: 549 ]] --[[ Name: CreateChatLineRender ]]
    if not v164 then
        return;
    else
        if not v91.CharacterSortedMsg:Get(v164).BillboardGui then
            v91:CreateBillboardGuiHelper(v164, v166);
        end;
        local l_BillboardGui_2 = v91.CharacterSortedMsg:Get(v164).BillboardGui;
        if l_BillboardGui_2 then
            local v170 = v91.ChatBubbleWithTail[v165.BubbleColor]:Clone();
            v170.Visible = false;
            local l_v91_BubbleText_1 = v91:CreateBubbleText(v165.Message, v168);
            l_v91_BubbleText_1.Parent = v170;
            v170.Parent = l_BillboardGui_2.BillboardFrame;
            v165.RenderBubble = v170;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_v91_BubbleText_1.Text, 24, v13, Vector2.new(400, 250));
            local v173 = l_l_TextService_0_TextSize_0.Y / 24;
            if v9 then
                local v174 = math.ceil(l_l_TextService_0_TextSize_0.X + 24);
                local v175 = v173 * 34;
                v170.Size = UDim2.fromOffset(0, 0);
                v170.Position = UDim2.fromScale(0.5, 1);
                v170:TweenSizeAndPosition(UDim2.fromOffset(v174, v175), UDim2.new(0.5, -v174 / 2, 1, -v175), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 588 ]]
                    l_v91_BubbleText_1.Visible = true;
                end);
                v91:SetBillboardGuiLOD(l_BillboardGui_2, v165.Origin);
                v91:UpdateChatLinesForOrigin(v165.Origin, -v175);
            else
                local v176 = math.max((l_l_TextService_0_TextSize_0.X + 30) / 400, 0.1);
                v170.Size = UDim2.new(0, 0, 0, 0);
                v170.Position = UDim2.new(0.5, 0, 1, 0);
                local v177 = v173 * 34;
                v170:TweenSizeAndPosition(UDim2.new(v176, 0, 0, v177), UDim2.new((1 - v176) / 2, 0, 1, -v177), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 608 ]]
                    l_v91_BubbleText_1.Visible = true;
                end);
                v91:SetBillboardGuiLOD(l_BillboardGui_2, v165.Origin);
                v91:UpdateChatLinesForOrigin(v165.Origin, -v177);
            end;
            delay(v165.BubbleDieDelay, function() --[[ Line: 615 ]]
                v91:DestroyBubble(v167, v170);
            end);
        end;
        return;
    end;
end;
v91.OnPlayerChatMessage = function(_, v179, v180, _) --[[ Line: 621 ]] --[[ Name: OnPlayerChatMessage ]]
    if not v91:BubbleChatEnabled() then
        return;
    else
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        local v183 = false;
        if l_LocalPlayer_1 ~= nil then
            v183 = v179 ~= l_LocalPlayer_1;
        end;
        local v184 = v91:SanitizeChatLine(v180);
        local v185 = not v183;
        local v186 = v57(v184, v17.WHITE, v185);
        if v179 then
            v186.User = v179.Name;
            v186.Origin = v179.Character;
        end;
        local l_v186_0 = v186;
        if v179 and l_v186_0.Origin then
            v185 = v91.CharacterSortedMsg:Get(l_v186_0.Origin).Fifo;
            v185:PushBack(l_v186_0);
            v91:CreateChatLineRender(v179.Character, l_v186_0, true, v185, false);
        end;
        return;
    end;
end;
v91.OnGameChatMessage = function(_, v189, v190, v191) --[[ Line: 640 ]] --[[ Name: OnGameChatMessage ]]
    if l_status_1 or l_result_1 and l_Chat_0.BubbleChatEnabled then
        return;
    else
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        local v193 = false;
        if l_LocalPlayer_2 ~= nil then
            v193 = l_LocalPlayer_2.Character ~= v189;
        end;
        local l_WHITE_0 = v17.WHITE;
        if v191 == Enum.ChatColor.Blue then
            l_WHITE_0 = v17.BLUE;
        elseif v191 == Enum.ChatColor.Green then
            l_WHITE_0 = v17.GREEN;
        elseif v191 == Enum.ChatColor.Red then
            l_WHITE_0 = v17.RED;
        end;
        local v195 = v91:SanitizeChatLine(v190);
        local v196 = not v193;
        local v197 = v57(v195, l_WHITE_0, v196);
        v197.Origin = v189;
        local l_v197_0 = v197;
        v91.CharacterSortedMsg:Get(l_v197_0.Origin).Fifo:PushBack(l_v197_0);
        if v8 then
            v91:CreateChatLineRender(v189, l_v197_0, false, v91.CharacterSortedMsg:Get(l_v197_0.Origin).Fifo, true);
            return;
        else
            v91:CreateChatLineRender(v189, l_v197_0, false, v91.CharacterSortedMsg:Get(l_v197_0.Origin).Fifo, false);
            return;
        end;
    end;
end;
v91.BubbleChatEnabled = function(_) --[[ Line: 666 ]] --[[ Name: BubbleChatEnabled ]]
    if l_status_1 or l_result_1 and l_Chat_0.BubbleChatEnabled then
        return false;
    else
        local l_ClientChatModules_0 = l_Chat_0:FindFirstChild("ClientChatModules");
        if l_ClientChatModules_0 then
            local l_ChatSettings_0 = l_ClientChatModules_0:FindFirstChild("ChatSettings");
            if l_ChatSettings_0 then
                l_ChatSettings_0 = require(l_ChatSettings_0);
                if l_ChatSettings_0.BubbleChatEnabled ~= nil then
                    return l_ChatSettings_0.BubbleChatEnabled;
                end;
            end;
        end;
        return l_Players_0.BubbleChat;
    end;
end;
v91.ShowOwnFilteredMessage = function(_) --[[ Line: 683 ]] --[[ Name: ShowOwnFilteredMessage ]]
    local l_ClientChatModules_1 = l_Chat_0:FindFirstChild("ClientChatModules");
    if l_ClientChatModules_1 then
        local l_ChatSettings_1 = l_ClientChatModules_1:FindFirstChild("ChatSettings");
        if l_ChatSettings_1 then
            return require(l_ChatSettings_1).ShowUserOwnFilteredMessage;
        end;
    end;
    return false;
end;
findPlayer = function(v205) --[[ Line: 695 ]] --[[ Name: findPlayer ]]
    for _, v207 in pairs(l_Players_0:GetPlayers()) do
        if v207.Name == v205 then
            return v207;
        end;
    end;
end;
l_Chat_0.Chatted:connect(function(v208, v209, v210) --[[ Line: 703 ]]
    v91:OnGameChatMessage(v208, v209, v210);
end);
local v211 = nil;
if game.Workspace.CurrentCamera then
    v211 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):connect(function(_) --[[ Line: 707 ]]
        v91:CameraCFrameChanged();
    end);
end;
game.Workspace.Changed:connect(function(v213) --[[ Line: 710 ]]
    if v213 == "CurrentCamera" then
        if v211 then
            v211:disconnect();
        end;
        if game.Workspace.CurrentCamera then
            v211 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):connect(function(_) --[[ Line: 714 ]]
                v91:CameraCFrameChanged();
            end);
        end;
    end;
end);
local v215 = nil;
getAllowedMessageTypes = function() --[[ Line: 722 ]] --[[ Name: getAllowedMessageTypes ]]
    if v215 then
        return v215;
    else
        local l_ClientChatModules_2 = l_Chat_0:FindFirstChild("ClientChatModules");
        if l_ClientChatModules_2 then
            local l_ChatSettings_2 = l_ClientChatModules_2:FindFirstChild("ChatSettings");
            if l_ChatSettings_2 then
                l_ChatSettings_2 = require(l_ChatSettings_2);
                if l_ChatSettings_2.BubbleChatMessageTypes then
                    v215 = l_ChatSettings_2.BubbleChatMessageTypes;
                    return v215;
                end;
            end;
            local l_ChatConstants_0 = l_ClientChatModules_2:FindFirstChild("ChatConstants");
            if l_ChatConstants_0 then
                l_ChatConstants_0 = require(l_ChatConstants_0);
                v215 = {
                    l_ChatConstants_0.MessageTypeDefault, 
                    l_ChatConstants_0.MessageTypeWhisper
                };
            end;
            return v215;
        else
            return {
                "Message", 
                "Whisper"
            };
        end;
    end;
end;
checkAllowedMessageType = function(v219) --[[ Line: 746 ]] --[[ Name: checkAllowedMessageType ]]
    local v220 = getAllowedMessageTypes();
    for v221 = 1, #v220 do
        if v220[v221] == v219.MessageType then
            return true;
        end;
    end;
    return false;
end;
local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents");
local l_OnMessageDoneFiltering_0 = l_DefaultChatSystemChatEvents_0:WaitForChild("OnMessageDoneFiltering");
l_DefaultChatSystemChatEvents_0:WaitForChild("OnNewMessage").OnClientEvent:connect(function(v224, _) --[[ Line: 760 ]]
    if not checkAllowedMessageType(v224) then
        return;
    else
        local v226 = findPlayer(v224.FromSpeaker);
        if not v226 then
            return;
        elseif (not v224.IsFiltered or v224.FromSpeaker == l_LocalPlayer_0.Name) and (v224.FromSpeaker ~= l_LocalPlayer_0.Name or v91:ShowOwnFilteredMessage()) then
            return;
        else
            v91:OnPlayerChatMessage(v226, v224.Message, nil);
            return;
        end;
    end;
end);
l_OnMessageDoneFiltering_0.OnClientEvent:connect(function(v227, _) --[[ Line: 779 ]]
    if not checkAllowedMessageType(v227) then
        return;
    else
        local v229 = findPlayer(v227.FromSpeaker);
        if not v229 then
            return;
        elseif v227.FromSpeaker == l_LocalPlayer_0.Name and not v91:ShowOwnFilteredMessage() then
            return;
        else
            v91:OnPlayerChatMessage(v229, v227.Message, nil);
            return;
        end;
    end;
end);