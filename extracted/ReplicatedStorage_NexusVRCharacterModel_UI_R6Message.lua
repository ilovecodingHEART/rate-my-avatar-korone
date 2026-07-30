-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_NexusButton_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusButton"));
local l_NexusVRCore_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusVRCore"));
local v5 = l_NexusButton_0.TextButtonFactory.CreateDefault(Color3.fromRGB(0, 170, 255));
v5:SetDefault("Theme", "RoundedCorners");
local l_ScreenGui3D_0 = l_NexusVRCore_0.ScreenGui3D;
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: l_ScreenGui3D_0 (copy), v7 (copy), v5 (copy), l_Players_0 (copy)
    local v8 = l_ScreenGui3D_0.new();
    v8.ResetOnSpawn = false;
    v8.Enabled = false;
    v8.CanvasSize = Vector2.new(500, 500);
    v8.FieldOfView = 0;
    v8.Easing = 0.25;
    local v9 = setmetatable({
        ScreenGui = v8
    }, v7);
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(0.4, 0, 0.4, 0);
    l_ImageLabel_0.Position = UDim2.new(0.3, 0, -0.1, 0);
    l_ImageLabel_0.Image = "http://www.roblox.com/asset/?id=1499731139";
    l_ImageLabel_0.Parent = v8:GetContainer();
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0.8, 0, 0.1, 0);
    l_TextLabel_0.Position = UDim2.new(0.1, 0, 0.25, 0);
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.Text = "R6 Not Supported";
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.Parent = v8:GetContainer();
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Size = UDim2.new(0.8, 0, 0.25, 0);
    l_TextLabel_1.Position = UDim2.new(0.1, 0, 0.4, 0);
    l_TextLabel_1.Font = Enum.Font.SourceSansBold;
    l_TextLabel_1.Text = "Nexus VR Character Model does not support using R6. Use R15 instead.";
    l_TextLabel_1.TextScaled = true;
    l_TextLabel_1.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_1.TextStrokeTransparency = 0;
    l_TextLabel_1.Parent = v8:GetContainer();
    local v13, v14 = v5:Create();
    v13.Size = UDim2.new(0.3, 0, 0.1, 0);
    v13.Position = UDim2.new(0.35, 0, 0.7, 0);
    v13.Parent = v8:GetContainer();
    v14.Text = "Ok";
    v13.MouseButton1Down:Connect(function() --[[ Line: 82 ]]
        -- upvalues: v9 (copy), v8 (copy)
        v9:SetOpen(false);
        v8:Destroy();
    end);
    v8.Parent = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
    return v9;
end;
v7.SetOpen = function(v15, v16) --[[ Line: 95 ]] --[[ Name: SetOpen ]]
    -- upvalues: l_RunService_0 (copy)
    local v17 = v16 and 0 or 0.6981317007977318;
    local v18 = v16 and 0.6981317007977318 or 0;
    if v16 then
        v15.ScreenGui.Enabled = true;
    end;
    local v19 = tick();
    while tick() - v19 < 0.25 do
        local v20 = math.sin(((tick() - v19) / 0.25 - 0.5) * 3.141592653589793) / 2 + 0.5;
        v15.ScreenGui.FieldOfView = v17 + (v18 - v17) * v20;
        l_RunService_0.RenderStepped:Wait();
    end;
    if v18 == 0 then
        v15.ScreenGui.Enabled = false;
    end;
end;
v7.Open = function(v21) --[[ Line: 122 ]] --[[ Name: Open ]]
    v21:SetOpen(true);
end;
return v7;