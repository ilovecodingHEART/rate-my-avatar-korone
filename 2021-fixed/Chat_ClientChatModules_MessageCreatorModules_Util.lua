-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TextService_0 = game:GetService("TextService");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local v6 = {};
local v7 = {};
v7.__index = v7;
v7.GetStringTextBounds = function(_, v9, v10, v11, v12) --[[ Line: 56 ]] --[[ Name: GetStringTextBounds ]]
    local v13 = v12 or Vector2.new(10000, 10000);
    return l_TextService_0:GetTextSize(v9, v11, v10, v13);
end;
v7.GetMessageHeight = function(v14, v15, v16, v17) --[[ Line: 62 ]] --[[ Name: GetMessageHeight ]]
    local v18 = v17 or v16.AbsoluteSize.X;
    v18 = v14:GetStringTextBounds(v15.Text, v15.Font, v15.TextSize, Vector2.new(v18, 1000));
    if v18.Y ~= math.floor(v18.Y) then
        return v18.Y + 1;
    else
        return v18.Y;
    end;
end;
v7.GetNumberOfSpaces = function(v19, v20, v21, v22) --[[ Line: 73 ]] --[[ Name: GetNumberOfSpaces ]]
    local l_v19_StringTextBounds_0 = v19:GetStringTextBounds(v20, v21, v22);
    local l_v19_StringTextBounds_1 = v19:GetStringTextBounds(" ", v21, v22);
    return (math.ceil(l_v19_StringTextBounds_0.X / l_v19_StringTextBounds_1.X));
end;
v7.CreateBaseMessage = function(v25, v26, v27, v28, v29) --[[ Line: 79 ]] --[[ Name: CreateBaseMessage ]]
    local l_v25_FromObjectPool_0 = v25:GetFromObjectPool("Frame");
    l_v25_FromObjectPool_0.Selectable = false;
    l_v25_FromObjectPool_0.Size = UDim2.new(1, 0, 0, 18);
    l_v25_FromObjectPool_0.Visible = true;
    l_v25_FromObjectPool_0.BackgroundTransparency = 1;
    local l_v25_FromObjectPool_1 = v25:GetFromObjectPool("TextLabel");
    l_v25_FromObjectPool_1.Selectable = false;
    l_v25_FromObjectPool_1.Size = UDim2.new(1, -14, 1, 0);
    l_v25_FromObjectPool_1.Position = UDim2.new(0, 8, 0, 0);
    l_v25_FromObjectPool_1.BackgroundTransparency = 1;
    l_v25_FromObjectPool_1.Font = v27;
    l_v25_FromObjectPool_1.TextSize = v28;
    l_v25_FromObjectPool_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_v25_FromObjectPool_1.TextYAlignment = Enum.TextYAlignment.Top;
    l_v25_FromObjectPool_1.TextTransparency = 0;
    l_v25_FromObjectPool_1.TextStrokeTransparency = 0.75;
    l_v25_FromObjectPool_1.TextColor3 = v29;
    l_v25_FromObjectPool_1.TextWrapped = true;
    l_v25_FromObjectPool_1.ClipsDescendants = true;
    l_v25_FromObjectPool_1.Text = v26;
    l_v25_FromObjectPool_1.Visible = true;
    l_v25_FromObjectPool_1.Parent = l_v25_FromObjectPool_0;
    return l_v25_FromObjectPool_0, l_v25_FromObjectPool_1;
end;
v7.AddNameButtonToBaseMessage = function(v32, v33, v34, v35, v36) --[[ Line: 109 ]] --[[ Name: AddNameButtonToBaseMessage ]]
    local l_v32_StringTextBounds_0 = v32:GetStringTextBounds(v35, v33.Font, v33.TextSize);
    local l_v32_FromObjectPool_0 = v32:GetFromObjectPool("TextButton");
    l_v32_FromObjectPool_0.Selectable = false;
    l_v32_FromObjectPool_0.Size = UDim2.new(0, l_v32_StringTextBounds_0.X, 0, l_v32_StringTextBounds_0.Y);
    l_v32_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v32_FromObjectPool_0.BackgroundTransparency = 1;
    l_v32_FromObjectPool_0.Font = v33.Font;
    l_v32_FromObjectPool_0.TextSize = v33.TextSize;
    l_v32_FromObjectPool_0.TextXAlignment = v33.TextXAlignment;
    l_v32_FromObjectPool_0.TextYAlignment = v33.TextYAlignment;
    l_v32_FromObjectPool_0.TextTransparency = v33.TextTransparency;
    l_v32_FromObjectPool_0.TextStrokeTransparency = v33.TextStrokeTransparency;
    l_v32_FromObjectPool_0.TextColor3 = v34;
    l_v32_FromObjectPool_0.Text = v35;
    l_v32_FromObjectPool_0.Visible = true;
    l_v32_FromObjectPool_0.Parent = v33;
    local v39 = l_v32_FromObjectPool_0.MouseButton1Click:connect(function() --[[ Line: 127 ]]
        v32:NameButtonClicked(l_v32_FromObjectPool_0, v36);
    end);
    local v40 = nil;
    v40 = l_v32_FromObjectPool_0.Changed:connect(function(v41) --[[ Line: 132 ]]
        if v41 == "Parent" then
            v39:Disconnect();
            v40:Disconnect();
        end;
    end);
    return l_v32_FromObjectPool_0;
end;
v7.AddChannelButtonToBaseMessage = function(v42, v43, v44, v45, v46) --[[ Line: 142 ]] --[[ Name: AddChannelButtonToBaseMessage ]]
    local l_v42_StringTextBounds_0 = v42:GetStringTextBounds(v45, v43.Font, v43.TextSize);
    local l_v42_FromObjectPool_0 = v42:GetFromObjectPool("TextButton");
    l_v42_FromObjectPool_0.Selectable = false;
    l_v42_FromObjectPool_0.Size = UDim2.new(0, l_v42_StringTextBounds_0.X, 0, l_v42_StringTextBounds_0.Y);
    l_v42_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v42_FromObjectPool_0.BackgroundTransparency = 1;
    l_v42_FromObjectPool_0.Font = v43.Font;
    l_v42_FromObjectPool_0.TextSize = v43.TextSize;
    l_v42_FromObjectPool_0.TextXAlignment = v43.TextXAlignment;
    l_v42_FromObjectPool_0.TextYAlignment = v43.TextYAlignment;
    l_v42_FromObjectPool_0.TextTransparency = v43.TextTransparency;
    l_v42_FromObjectPool_0.TextStrokeTransparency = v43.TextStrokeTransparency;
    l_v42_FromObjectPool_0.TextColor3 = v44;
    l_v42_FromObjectPool_0.Text = v45;
    l_v42_FromObjectPool_0.Visible = true;
    l_v42_FromObjectPool_0.Parent = v43;
    local v49 = l_v42_FromObjectPool_0.MouseButton1Click:connect(function() --[[ Line: 160 ]]
        v42:ChannelButtonClicked(l_v42_FromObjectPool_0, v46);
    end);
    local v50 = nil;
    v50 = l_v42_FromObjectPool_0.Changed:connect(function(v51) --[[ Line: 165 ]]
        if v51 == "Parent" then
            v49:Disconnect();
            v50:Disconnect();
        end;
    end);
    return l_v42_FromObjectPool_0;
end;
v7.AddTagLabelToBaseMessage = function(v52, v53, v54, v55) --[[ Line: 175 ]] --[[ Name: AddTagLabelToBaseMessage ]]
    local l_v52_StringTextBounds_0 = v52:GetStringTextBounds(v55, v53.Font, v53.TextSize);
    local l_v52_FromObjectPool_0 = v52:GetFromObjectPool("TextLabel");
    l_v52_FromObjectPool_0.Selectable = false;
    l_v52_FromObjectPool_0.Size = UDim2.new(0, l_v52_StringTextBounds_0.X, 0, l_v52_StringTextBounds_0.Y);
    l_v52_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v52_FromObjectPool_0.BackgroundTransparency = 1;
    l_v52_FromObjectPool_0.Font = v53.Font;
    l_v52_FromObjectPool_0.TextSize = v53.TextSize;
    l_v52_FromObjectPool_0.TextXAlignment = v53.TextXAlignment;
    l_v52_FromObjectPool_0.TextYAlignment = v53.TextYAlignment;
    l_v52_FromObjectPool_0.TextTransparency = v53.TextTransparency;
    l_v52_FromObjectPool_0.TextStrokeTransparency = v53.TextStrokeTransparency;
    l_v52_FromObjectPool_0.TextColor3 = v54;
    l_v52_FromObjectPool_0.Text = v55;
    l_v52_FromObjectPool_0.Visible = true;
    l_v52_FromObjectPool_0.Parent = v53;
    return l_v52_FromObjectPool_0;
end;
GetWhisperChannelPrefix = function() --[[ Line: 196 ]] --[[ Name: GetWhisperChannelPrefix ]]
    if l_ChatConstants_0.WhisperChannelPrefix then
        return l_ChatConstants_0.WhisperChannelPrefix;
    else
        return "To ";
    end;
end;
v7.NameButtonClicked = function(v58, _, v60) --[[ Line: 203 ]] --[[ Name: NameButtonClicked ]]
    if not v58.ChatWindow then
        return;
    else
        if l_ChatSettings_0.ClickOnPlayerNameToWhisper then
            local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v60);
            if l_l_Players_0_FirstChild_0 and l_l_Players_0_FirstChild_0 ~= l_LocalPlayer_0 then
                local v62 = GetWhisperChannelPrefix() .. v60;
                if v58.ChatWindow:GetChannel(v62) then
                    v58.ChatBar:ResetCustomState();
                    if v58.ChatWindow:GetTargetMessageChannel() ~= v62 then
                        v58.ChatWindow:SwitchCurrentChannel(v62);
                    end;
                    local v63 = "/w " .. v60;
                    v58.ChatBar:SetText(v63);
                    v58.ChatBar:CaptureFocus();
                    return;
                elseif not v58.ChatBar:IsInCustomState() then
                    local v64 = "/w " .. v60;
                    v58.ChatBar:SetText(v64);
                    v58.ChatBar:CaptureFocus();
                end;
            end;
        end;
        return;
    end;
end;
v7.ChannelButtonClicked = function(v65, _, v67) --[[ Line: 233 ]] --[[ Name: ChannelButtonClicked ]]
    if not v65.ChatWindow then
        return;
    else
        if l_ChatSettings_0.ClickOnChannelNameToSetMainChannel and v65.ChatWindow:GetChannel(v67) then
            v65.ChatBar:ResetCustomState();
            if v65.ChatWindow:GetTargetMessageChannel() ~= v67 then
                v65.ChatWindow:SwitchCurrentChannel(v67);
            end;
            v65.ChatBar:ResetText();
            v65.ChatBar:CaptureFocus();
        end;
        return;
    end;
end;
v7.RegisterChatWindow = function(v68, v69) --[[ Line: 251 ]] --[[ Name: RegisterChatWindow ]]
    v68.ChatWindow = v69;
    v68.ChatBar = v69:GetChatBar();
end;
v7.GetFromObjectPool = function(v70, v71) --[[ Line: 256 ]] --[[ Name: GetFromObjectPool ]]
    if v70.ObjectPool == nil then
        return Instance.new(v71);
    else
        return v70.ObjectPool:GetInstance(v71);
    end;
end;
v7.RegisterObjectPool = function(v72, v73) --[[ Line: 263 ]] --[[ Name: RegisterObjectPool ]]
    v72.ObjectPool = v73;
end;
v7.CreateFadeFunctions = function(_, v75) --[[ Line: 283 ]] --[[ Name: CreateFadeFunctions ]]
    local v76 = {};
    for v77, v78 in pairs(v75) do
        v76[v77] = {};
        for v79, v80 in pairs(v78) do
            v76[v77][v79] = {
                Target = v80.FadedIn, 
                Current = v77[v79], 
                NormalizedExptValue = 1
            };
        end;
    end;
    local function v87(v81, v82) --[[ Line: 296 ]] --[[ Name: FadeInFunction ]]
        for v83, v84 in pairs(v76) do
            for v85, v86 in pairs(v84) do
                v86.Target = v75[v83][v85].FadedIn;
                v86.NormalizedExptValue = v82:NormalizedDefaultExptValueInSeconds(v81);
            end;
        end;
    end;
    local function v94(v88, v89) --[[ Line: 305 ]] --[[ Name: FadeOutFunction ]]
        for v90, v91 in pairs(v76) do
            for v92, v93 in pairs(v91) do
                v93.Target = v75[v90][v92].FadedOut;
                v93.NormalizedExptValue = v89:NormalizedDefaultExptValueInSeconds(v88);
            end;
        end;
    end;
    local function v99() --[[ Line: 314 ]] --[[ Name: AnimGuiObjects ]]
        for v95, v96 in pairs(v76) do
            for v97, v98 in pairs(v96) do
                v95[v97] = v98.Current;
            end;
        end;
    end;
    return v87, v94, function(v100, v101) --[[ Line: 322 ]] --[[ Name: UpdateAnimFunction ]]
        for _, v103 in pairs(v76) do
            for _, v105 in pairs(v103) do
                v105.Current = v101:Expt(v105.Current, v105.Target, v105.NormalizedExptValue, v100);
            end;
        end;
        v99();
    end;
end;
v7.NewBindableEvent = function(_, v107) --[[ Line: 340 ]] --[[ Name: NewBindableEvent ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = v107;
    return l_BindableEvent_0;
end;
v7.RegisterGuiRoot = function(_) --[[ Line: 347 ]] --[[ Name: RegisterGuiRoot ]]

end;
v6.new = function() --[[ Line: 352 ]] --[[ Name: new ]]
    local v110 = setmetatable({}, v7);
    v110.ObjectPool = nil;
    v110.ChatWindow = nil;
    v110.DEFAULT_MESSAGE_CREATOR = "UnknownMessage";
    v110.MESSAGE_CREATOR_MODULES_VERSION = 1;
    v110.KEY_MESSAGE_TYPE = "MessageType";
    v110.KEY_CREATOR_FUNCTION = "MessageCreatorFunc";
    v110.KEY_BASE_FRAME = "BaseFrame";
    v110.KEY_BASE_MESSAGE = "BaseMessage";
    v110.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction";
    v110.KEY_GET_HEIGHT = "GetHeightFunction";
    v110.KEY_FADE_IN = "FadeInFunction";
    v110.KEY_FADE_OUT = "FadeOutFunction";
    v110.KEY_UPDATE_ANIMATION = "UpdateAnimFunction";
    return v110;
end;
return v6.new();