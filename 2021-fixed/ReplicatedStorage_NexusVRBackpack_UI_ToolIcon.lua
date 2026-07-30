-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x2, if-expr -> __2021_if x1, compound-assign x0
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

local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4 = setmetatable({
        Focused = false, 
        Players = game:GetService("Players"), 
        TweenService = game:GetService("TweenService"), 
        RelativePositionX = v2 * 0.8660254037844386 + 0.5, 
        RelativePositionY = v3 * 0.75 + 0.5, 
        ToolEvents = {}
    }, v0);
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.Size = UDim2.new(0.9, 0, 0.9, 0);
    l_ImageLabel_0.Position = UDim2.new(v4.RelativePositionX, 0, v4.RelativePositionY, 0);
    l_ImageLabel_0.Image = "http://www.roblox.com/asset/?id=10708006436";
    l_ImageLabel_0.ImageColor3 = Color3.new(0.1, 0.1, 0.1);
    l_ImageLabel_0.ImageTransparency = 0.8;
    l_ImageLabel_0.Parent = v1;
    v4.Background = l_ImageLabel_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_TextLabel_0.Size = UDim2.new(0.625, 0, 0.625, 0);
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Text = "";
    l_TextLabel_0.TextSize = l_ImageLabel_0.AbsoluteSize.Y * 0.625 / 4;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Visible = false;
    l_TextLabel_0.Parent = l_ImageLabel_0;
    v4.ToolText = l_TextLabel_0;
    l_ImageLabel_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 61 ]]
        -- upvalues: l_TextLabel_0 (copy), l_ImageLabel_0 (copy)
        l_TextLabel_0.TextSize = l_ImageLabel_0.AbsoluteSize.Y * 0.625 / 4;
    end);
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_1.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_ImageLabel_1.Size = UDim2.new(0.625, 0, 0.625, 0);
    l_ImageLabel_1.Visible = false;
    l_ImageLabel_1.Parent = l_ImageLabel_0;
    v4.ToolImage = l_ImageLabel_1;
    return v4;
end;
v0.UpdateColor = function(v8) --[[ Line: 81 ]] --[[ Name: UpdateColor ]]
    if v8.Tool then
        if v8.Tool.TextureId == "" then
            v8.ToolText.Visible = true;
            v8.ToolImage.Visible = false;
            v8.ToolText.Text = v8.Tool.Name;
        else
            v8.ToolText.Visible = false;
            v8.ToolImage.Visible = true;
            v8.ToolImage.Image = v8.Tool.TextureId;
        end;
    else
        v8.ToolText.Visible = false;
        v8.ToolImage.Visible = false;
    end;
    local v9 = Color3.new(0.1, 0.1, 0.1);
    local v10 = v8.Tool and 0.5 or 0.8;
    local v11 = v8.Tool and v8.Focused and UDim2.new(1.05, 0, 1.05, 0) or UDim2.new(0.9, 0, 0.9, 0);
    if v8.Tool then
        local l_LocalPlayer_0 = v8.Players.LocalPlayer;
        if l_LocalPlayer_0.Character and l_LocalPlayer_0.Character == v8.Tool.Parent then
            v9 = __2021_if(function() return v8.Focused end, function() return Color3.new(0.2, 1, 0.2) end, function() return Color3.new(0, 0.7, 0) end);
        elseif v8.Focused then
            v9 = Color3.new(0.2, 0.2, 0.2);
        end;
    end;
    v8.TweenService:Create(v8.Background, TweenInfo.new(0.1), {
        Size = v11, 
        ImageColor3 = v9, 
        ImageTransparency = v10
    }):Play();
end;
v0.SetTool = function(v13, v14) --[[ Line: 128 ]] --[[ Name: SetTool ]]
    if v14 == v13.Tool then
        return;
    else
        v13.Tool = v14;
        for _, v16 in pairs(v13.ToolEvents) --[[ 2021 ]] do
            v16:Disconnect();
        end;
        v13.ToolEvents = {};
        v13:UpdateColor();
        if not v14 then
            return;
        else
            table.insert(v13.ToolEvents, v14.Changed:Connect(function(v17) --[[ Line: 141 ]]
                -- upvalues: v13 (copy)
                if v17 ~= "Name" and v17 ~= "TextureId" and v17 ~= "Parent" then
                    return;
                else
                    v13:UpdateColor();
                    return;
                end;
            end));
            return;
        end;
    end;
end;
v0.SetFocused = function(v18, v19) --[[ Line: 150 ]] --[[ Name: SetFocused ]]
    v18.Focused = v19;
    v18:UpdateColor();
end;
v0.Destroy = function(v20) --[[ Line: 158 ]] --[[ Name: Destroy ]]
    v20.Background:Destroy();
    for _, v22 in pairs(v20.ToolEvents) --[[ 2021 ]] do
        v22:Disconnect();
    end;
    v20.ToolEvents = {};
end;
return v0;