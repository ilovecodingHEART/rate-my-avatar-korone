-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Workspace_0 = game:GetService("Workspace");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), l_Workspace_0 (copy)
    setmetatable({}, v1);
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Transparency = 1;
    l_Part_0.Material = Enum.Material.Neon;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Size = Vector3.new(0.5, 0.5, 0.5, 0);
    l_Part_0.Shape = Enum.PartType.Ball;
    l_Part_0.Parent = l_Workspace_0.CurrentCamera;
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Size = Vector2.new(2, 2);
    l_ImageHandleAdornment_0.Image = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png";
    l_ImageHandleAdornment_0.Visible = false;
    l_ImageHandleAdornment_0.Parent = l_Part_0;
    local l_ImageHandleAdornment_1 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_1.Adornee = l_Part_0;
    l_ImageHandleAdornment_1.Size = Vector2.new(2, 2);
    l_ImageHandleAdornment_1.Image = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png";
    l_ImageHandleAdornment_1.Visible = false;
    l_ImageHandleAdornment_1.Parent = l_Part_0;
    return (setmetatable({
        Sphere = l_Part_0, 
        ConstantRing = l_ImageHandleAdornment_0, 
        MovingRing = l_ImageHandleAdornment_1
    }, v1));
end;
v1.Update = function(v5, v6, v7) --[[ Line: 63 ]] --[[ Name: Update ]]
    local v8 = -math.cos(tick() * 2 * 2) / 8 + 0.4;
    local v9 = 2 * (tick() * 2 % 3.141592653589793) / 3.141592653589793;
    v5.Sphere.CFrame = v6 * CFrame.new(0, v8, 0);
    v5.ConstantRing.CFrame = CFrame.new(0, -v8, 0) * CFrame.Angles(1.5707963267948966, 0, 0);
    v5.MovingRing.CFrame = CFrame.new(0, -v8, 0) * CFrame.Angles(1.5707963267948966, 0, 0);
    v5.MovingRing.Transparency = v9 / 2;
    v5.MovingRing.Size = Vector2.new(v9, v9);
    local v10 = Color3.fromRGB(0, 170, 0);
    if v7 then
        local l_VRBeaconColor_0 = v7:FindFirstChild("VRBeaconColor");
        if l_VRBeaconColor_0 then
            v10 = l_VRBeaconColor_0.Value;
        elseif (v7:IsA("Seat") or v7:IsA("VehicleSeat")) and not v7.Disabled then
            v10 = Color3.fromRGB(0, 170, 255);
        end;
    end;
    v5.Sphere.Color = v10;
    v5.Sphere.Transparency = 0;
    v5.ConstantRing.Visible = true;
    v5.MovingRing.Visible = true;
end;
v1.Hide = function(v12) --[[ Line: 96 ]] --[[ Name: Hide ]]
    v12.Sphere.Transparency = 1;
    v12.ConstantRing.Visible = false;
    v12.MovingRing.Visible = false;
end;
v1.Destroy = function(v13) --[[ Line: 106 ]] --[[ Name: Destroy ]]
    v13.Sphere:Destroy();
end;
return v1;