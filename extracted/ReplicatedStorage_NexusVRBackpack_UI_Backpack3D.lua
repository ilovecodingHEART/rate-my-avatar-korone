-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_ToolGrid_0 = require(script.Parent:WaitForChild("ToolGrid"));
local l_Inventory_0 = require(script.Parent.Parent:WaitForChild("State"):WaitForChild("Inventory"));
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_ToolGrid_0 (copy), l_Inventory_0 (copy)
    local v6 = setmetatable({
        Opened = false
    }, v3);
    local l_SurfaceGui_0 = Instance.new("SurfaceGui");
    l_SurfaceGui_0.Name = "NexusVRBackpack";
    l_SurfaceGui_0.AlwaysOnTop = true;
    l_SurfaceGui_0.Enabled = false;
    l_SurfaceGui_0.LightInfluence = 0;
    l_SurfaceGui_0.Face = Enum.NormalId.Back;
    l_SurfaceGui_0.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud;
    l_SurfaceGui_0.PixelsPerStud = 250;
    l_SurfaceGui_0.Parent = v4;
    v6.SurfaceGui = l_SurfaceGui_0;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(0, 0, 0, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Parent = l_SurfaceGui_0;
    l_SurfaceGui_0.Adornee = l_Part_0;
    v6.Part = l_Part_0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_0.Parent = l_SurfaceGui_0;
    v6.CenterFrame = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.BackgroundColor3 = Color3.new(1, 1, 1);
    l_Frame_1.Size = UDim2.new(0.1, 0, 0.1, 0);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.ZIndex = 10;
    l_Frame_1.Parent = l_Frame_0;
    v6.Cursor = l_Frame_1;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_1;
    local v12 = l_ToolGrid_0.new();
    v12.AdornFrame.Size = UDim2.new(0, 0, 0, 0);
    v12.AdornFrame.Parent = l_Frame_0;
    v6.ToolGrid = v12;
    local v13 = l_Inventory_0.new(v5);
    v6.Inventory = v13;
    v13.ToolsChanged:Connect(function() --[[ Line: 85 ]]
        -- upvalues: v6 (copy)
        v6:UpdateInventory();
    end);
    v6:UpdateInventory();
    return v6;
end;
v3.GetFocusedTool = function(v14) --[[ Line: 97 ]] --[[ Name: GetFocusedTool ]]
    return v14.ToolGrid.FocusedIcon and v14.ToolGrid.FocusedIcon.Tool;
end;
v3.UpdateInventory = function(v15) --[[ Line: 104 ]] --[[ Name: UpdateInventory ]]
    v15.ToolGrid:SetTools(v15.Inventory.Tools);
    local v16 = (#v15.ToolGrid.IconGroups * 2 + 1) * 0.8660254037844386;
    v15.Part.Size = Vector3.new(v16 * 0.5, v16 * 0.5, 0);
    v15.CenterFrame.Size = UDim2.new(1 / v16, 0, 1 / v16, 0);
end;
v3.UpdateFocusedToolLocalSpace = function(v17, v18, v19) --[[ Line: 118 ]] --[[ Name: UpdateFocusedToolLocalSpace ]]
    if not v17.Opened then
        return;
    else
        local v20 = v17.SurfaceGui.AbsoluteSize.X * v18;
        local v21 = v17.SurfaceGui.AbsoluteSize.Y * v19;
        local v22 = (v20 - v17.CenterFrame.AbsolutePosition.X) / v17.CenterFrame.AbsoluteSize.X;
        local v23 = (v21 - v17.CenterFrame.AbsolutePosition.Y) / v17.CenterFrame.AbsoluteSize.Y;
        v17.Cursor.Position = UDim2.new(v22, 0, v23, 0);
        v17.ToolGrid:UpdateFocusedIcon(v22, v23);
        return;
    end;
end;
v3.UpdateFocusedToolWorldSpace = function(v24, v25) --[[ Line: 130 ]] --[[ Name: UpdateFocusedToolWorldSpace ]]
    local v26 = v24.Part.CFrame:Inverse() * CFrame.new(v25);
    local l_Size_0 = v24.Part.Size;
    v24:UpdateFocusedToolLocalSpace(v26.X / l_Size_0.X + 0.5, 0.5 - v26.Y / l_Size_0.Y);
end;
v3.MoveTo = function(v28, v29) --[[ Line: 139 ]] --[[ Name: MoveTo ]]
    v28.Part.CFrame = v29;
end;
v3.Open = function(v30) --[[ Line: 146 ]] --[[ Name: Open ]]
    -- upvalues: l_TweenService_0 (copy)
    if v30.Opened then
        return;
    else
        v30.Opened = true;
        v30.SurfaceGui.Enabled = true;
        l_TweenService_0:Create(v30.ToolGrid.AdornFrame, TweenInfo.new(0.1), {
            Size = UDim2.new(1, 0, 1, 0)
        }):Play();
        return;
    end;
end;
v3.Close = function(v31) --[[ Line: 158 ]] --[[ Name: Close ]]
    -- upvalues: l_TweenService_0 (copy)
    if not v31.Opened then
        return;
    else
        v31:UpdateFocusedToolLocalSpace(1e999, 1e999);
        v31.Opened = false;
        l_TweenService_0:Create(v31.ToolGrid.AdornFrame, TweenInfo.new(0.1), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play();
        task.delay(0.1, function() --[[ Line: 165 ]]
            -- upvalues: v31 (copy)
            if v31.Opened then
                return;
            else
                v31.SurfaceGui.Enabled = false;
                return;
            end;
        end);
        return;
    end;
end;
v3.Destroy = function(v32) --[[ Line: 174 ]] --[[ Name: Destroy ]]
    v32.SurfaceGui:Destroy();
    v32.ToolGrid:Destroy();
    v32.Inventory:Destroy();
end;
return v3;