-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x1, compound-assign x0
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

local v0 = {
    Sliders = {}
};
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
assert(l_RunService_0:IsClient(), "Slider module can only be used on the Client!");
local l_Utils_0 = script.Utils;
local v5 = require(l_Utils_0.Signal);
local v6 = require(l_Utils_0.SliderFuncs);
v0.__index = function(v7, v8) --[[ Line: 28 ]]
    local v9 = {
        {
            ".OnChange", 
            ".Changed", 
            (rawget(v7, "Changed"))
        }
    };
    for _, v11 in ipairs(v9) do
        if string.sub(v11[1], 2) == v8 then
            warn(string.format("%s is deprecated, please use %s instead", v11[1], v11[2]));
            return v11[3];
        end;
    end;
    return v0[v8];
end;
v0.new = function(v12, v13) --[[ Line: 54 ]] --[[ Name: new ]]
    assert(pcall(function() --[[ Line: 55 ]]
        return v12.AbsoluteSize, v12.AbsolutePosition;
    end), "Holder argument does not have an AbsoluteSize/AbsolutePosition");
    local v14 = false;
    for _, v16 in ipairs(v0.Sliders) do
        if v16._holder == v12 then
            v14 = true;
            break;
        end;
    end;
    assert(not v14, "Cannot set two sliders with same frame!");
    assert(v13.SliderData.Increment ~= nil, "Failed to find Increment in SliderData table");
    assert(v13.SliderData.Start ~= nil, "Failed to find Start in SliderData table");
    assert(v13.SliderData.End ~= nil, "Failed to find End in SliderData table");
    assert(v13.SliderData.Increment > 0, "SliderData.Increment must be greater than 0");
    assert(v13.SliderData.End > v13.SliderData.Start, string.format("Slider end value must be greater than its start value! (%.1f <= %.1f)", v13.SliderData.End, v13.SliderData.Start));
    local v17 = setmetatable({}, v0);
    v17._holder = v12;
    v17._data = {
        Button = nil, 
        HolderButton = nil, 
        _clickOverride = false, 
        _mainConnection = nil, 
        _clickConnections = {}, 
        _otherConnections = {}, 
        _inputPos = nil, 
        _percent = 0, 
        _value = 0, 
        _scaleIncrement = 0, 
        _currentTween = nil, 
        _allowBackgroundClick = v13.AllowBackgroundClick ~= false
    };
    v17._config = v13;
    v17._config.Axis = string.upper(v13.Axis or "X");
    v17._config.Padding = v13.Padding or 5;
    v17._config.MoveInfo = v13.MoveInfo or TweenInfo.new(0.2);
    v17._config.MoveType = v13.MoveType or "Tween";
    v17.IsHeld = false;
    local l_Slider_0 = v12:FindFirstChild("Slider");
    assert(l_Slider_0 ~= nil, "Failed to find slider button.");
    assert(l_Slider_0:IsA("GuiButton"), "Slider is not a GuiButton");
    v17._data.Button = l_Slider_0;
    if v17._data._allowBackgroundClick then
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.BackgroundTransparency = 1;
        l_TextButton_0.Text = "";
        l_TextButton_0.Name = "HolderClickButton";
        l_TextButton_0.Size = UDim2.fromScale(1, 1);
        l_TextButton_0.ZIndex = -1;
        l_TextButton_0.Parent = v17._holder;
        v17._data.HolderButton = l_TextButton_0;
    end;
    v17._data._percent = 0;
    if v13.SliderData.DefaultValue then
        v13.SliderData.DefaultValue = math.clamp(v13.SliderData.DefaultValue, v13.SliderData.Start, v13.SliderData.End);
        v17._data._percent = v6.getAlphaBetween(v13.SliderData.Start, v13.SliderData.End, v13.SliderData.DefaultValue);
    end;
    v17._data._percent = math.clamp(v17._data._percent, 0, 1);
    v17._data._value = v6.getNewValue(v17);
    v17._data._increment = v13.SliderData.Increment;
    v17._data._scaleIncrement = v6.getScaleIncrement(v17);
    v17.Changed = v5.new();
    v17.Dragged = v5.new();
    v17.Released = v5.new();
    v17._data._percent = v6.snapToScale(v17._data._percent, v17._data._scaleIncrement);
    v17:Move();
    table.insert(v17._data._otherConnections, l_Slider_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 144 ]]
        v17:Move("Instant");
    end));
    table.insert(v0.Sliders, v17);
    return v17;
end;
v0.Track = function(v20) --[[ Line: 153 ]] --[[ Name: Track ]]
    for _, v22 in ipairs(v20._data._clickConnections) do
        v22:Disconnect();
    end;
    table.insert(v20._data._clickConnections, v20._data.Button.MouseButton1Down:Connect(function() --[[ Line: 158 ]]
        v20.IsHeld = true;
    end));
    table.insert(v20._data._clickConnections, v20._data.Button.MouseButton1Up:Connect(function() --[[ Line: 162 ]]
        if v20.IsHeld then
            v20.Released:Fire(v20._data._value);
        end;
        v20.IsHeld = false;
    end));
    if v20._data._allowBackgroundClick then
        table.insert(v20._data._clickConnections, v20._data.HolderButton.Activated:Connect(function(v23) --[[ Line: 170 ]]
            if v23.UserInputType == Enum.UserInputType.MouseButton1 or v23.UserInputType == Enum.UserInputType.Touch then
                v20._data._inputPos = v23.Position;
                v20._data._clickOverride = true;
                v20:Update();
                v20._data._clickOverride = false;
            end;
        end));
    end;
    if v20.Changed then
        v20.Changed:Fire(v20._data._value);
    end;
    if v20._data._mainConnection then
        v20._data._mainConnection:Disconnect();
    end;
    v20._data._mainConnection = l_UserInputService_0.InputChanged:Connect(function(v24, _) --[[ Line: 188 ]]
        if v24.UserInputType == Enum.UserInputType.MouseMovement or v24.UserInputType == Enum.UserInputType.Touch then
            v20._data._inputPos = v24.Position;
            v20:Update();
        end;
    end);
end;
v0.Update = function(v26) --[[ Line: 196 ]] --[[ Name: Update ]]
    if (v26.IsHeld or v26._data._clickOverride) and v26._data._inputPos then
        local v27 = v26._holder.AbsoluteSize[v26._config.Axis];
        local v28 = v26._holder.AbsolutePosition[v26._config.Axis];
        local v29 = v26._data._inputPos[v26._config.Axis];
        if v29 then
            local v30 = v29 - v28;
            local v31 = math.clamp(v6.snapToScale(v30 / v27, v26._data._scaleIncrement), 0, 1);
            v26._data._percent = v31;
            v26.Dragged:Fire(v26._data._value);
            v26:Move();
        end;
    end;
end;
v0.Untrack = function(v32) --[[ Line: 215 ]] --[[ Name: Untrack ]]
    for _, v34 in ipairs(v32._data._clickConnections) do
        v34:Disconnect();
    end;
    if v32._data._mainConnection then
        v32._data._mainConnection:Disconnect();
    end;
    v32.IsHeld = false;
end;
v0.Reset = function(v35) --[[ Line: 225 ]] --[[ Name: Reset ]]
    for _, v37 in ipairs(v35._data._clickConnections) do
        v37:Disconnect();
    end;
    if v35._data._mainConnection then
        v35._data._mainConnection:Disconnect();
    end;
    v35.IsHeld = false;
    v35._data._percent = 0;
    if v35._config.SliderData.DefaultValue then
        v35._data._percent = v6.getAlphaBetween(v35._config.SliderData.Start, v35._config.SliderData.End, v35._config.SliderData.DefaultValue);
    end;
    v35._data._percent = math.clamp(v35._data._percent, 0, 1);
    v35:Move();
end;
v0.OverrideValue = function(v38, v39) --[[ Line: 243 ]] --[[ Name: OverrideValue ]]
    v38.IsHeld = false;
    v38._data._percent = v6.getAlphaBetween(v38._config.SliderData.Start, v38._config.SliderData.End, v39);
    v38._data._percent = math.clamp(v38._data._percent, 0, 1);
    v38._data._percent = v6.snapToScale(v38._data._percent, v38._data._scaleIncrement);
    v38:Move();
end;
v0.Move = function(v40, v41) --[[ Line: 251 ]] --[[ Name: Move ]]
    v40._data._value = v6.getNewValue(v40);
    local v42 = __2021_if(function() return v41 ~= nil end, function() return v41 end, function() return v40._config.MoveType end);
    if v42 == "Tween" or v42 == nil then
        if v40._data._currentTween then
            v40._data._currentTween:Cancel();
        end;
        v40._data._currentTween = l_TweenService_0:Create(v40._data.Button, v40._config.MoveInfo, {
            Position = v6.getNewPosition(v40)
        });
        v40._data._currentTween:Play();
    elseif v42 == "Instant" then
        v40._data.Button.Position = v6.getNewPosition(v40);
    end;
    v40.Changed:Fire(v40._data._value);
end;
v0.OverrideIncrement = function(v43, v44) --[[ Line: 269 ]] --[[ Name: OverrideIncrement ]]
    v43._config.SliderData.Increment = v44;
    v43._data._increment = v44;
    v43._data._scaleIncrement = v6.getScaleIncrement(v43);
    v43._data._percent = math.clamp(v43._data._percent, 0, 1);
    v43._data._percent = v6.snapToScale(v43._data._percent, v43._data._scaleIncrement);
    v43:Move();
end;
v0.GetValue = function(v45) --[[ Line: 278 ]] --[[ Name: GetValue ]]
    return v45._data._value;
end;
v0.GetIncrement = function(v46) --[[ Line: 282 ]] --[[ Name: GetIncrement ]]
    return v46._data._increment;
end;
v0.Destroy = function(v47) --[[ Line: 286 ]] --[[ Name: Destroy ]]
    for _, v49 in ipairs(v47._data._clickConnections) do
        v49:Disconnect();
    end;
    for _, v51 in ipairs(v47._data._otherConnections) do
        v51:Disconnect();
    end;
    if v47._data._mainConnection then
        v47._data._mainConnection:Disconnect();
    end;
    if v47._data.HolderButton then
        v47._data.HolderButton:Destroy();
        v47._data.HolderButton = nil;
    end;
    v47.Changed:Destroy();
    v47.Dragged:Destroy();
    v47.Released:Destroy();
    for v52 = 1, #v0.Sliders do
        if v0.Sliders[v52] == v47 then
            table.remove(v0.Sliders, v52);
        end;
    end;
    setmetatable(v47, nil);
    v47 = nil;
end;
l_UserInputService_0.InputEnded:Connect(function(v53, _) --[[ Line: 317 ]]
    if v53.UserInputType == Enum.UserInputType.MouseButton1 or v53.UserInputType == Enum.UserInputType.Touch then
        for _, v56 in ipairs(v0.Sliders) do
            if v56.IsHeld then
                v56.Released:Fire(v56._data._value);
            end;
            v56.IsHeld = false;
        end;
    end;
end);
return v0;