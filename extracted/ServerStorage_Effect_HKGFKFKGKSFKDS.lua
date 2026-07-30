-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local function _(v3, v4, v5) --[[ Line: 29 ]] --[[ Name: Tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v6 = l_TweenService_0:Create(v3, v4, v5);
    v6:Play();
    v6:Destroy();
end;
local l_Part_0 = Instance.new("Part");
l_Part_0.Name = "Bolt";
l_Part_0.Anchored = true;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
l_Part_0.CanCollide = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.CanQuery = false;
l_Part_0.Material = Enum.Material.Neon;
l_Part_0.Size = Vector3.new(4, 1, 2, 0);
l_Part_0.CanTouch = false;
v0.SummonLightning = function(v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 49 ]] --[[ Name: SummonLightning ]]
    -- upvalues: l_Part_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    v14 = math.abs(v14);
    if v14 < 2 then
        error("Segment count is too small, must be above 2");
    end;
    if v12.X > v12.Y then
        error("Spread.X cannot be greater than EndSpread");
    end;
    local v17 = {};
    local v18 = {};
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "LightningBolt";
    l_Model_0.Parent = workspace;
    for v20 = 0, v14 do
        local v21 = l_Part_0:Clone();
        v21.Name = "Sphere_" .. v20 + 1;
        if v20 == 0 or v20 == v14 then
            v21:SetAttribute("SpreadDistance", 0);
        else
            v21:SetAttribute("SpreadDistance", math.random(v12.X * 100, v12.Y * 100) / 100);
        end;
        v21.Color = v11;
        v21.Shape = Enum.PartType.Ball;
        v21.Size = Vector3.new(v13, v13, v13);
        v21.Parent = l_Model_0;
        v21.CFrame = CFrame.new(v9:Lerp(v10, v20 / v14), v10);
        v21.CFrame = v21.CFrame:ToWorldSpace(CFrame.Angles(0, 0, (math.rad(math.random(-18000, 18000) / 100))));
        v21.Position = v21.Position + v21.CFrame.UpVector * v21:GetAttribute("SpreadDistance");
        table.insert(v17, v21);
    end;
    for v22, v23 in pairs(v17) do
        local v24 = v17[v22 - 1];
        if v24 ~= nil then
            local l_Magnitude_0 = (v23.Position - v24.Position).Magnitude;
            local v26 = l_Part_0:Clone();
            v26.Name = "Cylinder_" .. v22;
            v26.Color = v11;
            v26.Shape = Enum.PartType.Cylinder;
            v26.Size = Vector3.new(l_Magnitude_0, v13, v13);
            v26.Parent = l_Model_0;
            v26.CFrame = CFrame.new(v23.Position:Lerp(v24.Position, 0.5), v24.Position):ToWorldSpace(CFrame.Angles(0, 1.5707963267948966, 0));
            table.insert(v18, v26);
        end;
    end;
    for _, v28 in pairs(v17) do
        local v29 = TweenInfo.new(v15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
        local v30 = {
            Size = Vector3.new(0, 0, 0, 0), 
            Position = v28.Position + v28.CFrame.UpVector * (v28:GetAttribute("SpreadDistance") * v16)
        };
        local v31 = l_TweenService_0:Create(v28, v29, v30);
        v31:Play();
        v31:Destroy();
    end;
    for v32, v33 in pairs(v18) do
        local v34 = v17[v32];
        local v35 = v17[v32 + 1];
        local v36 = Vector3.new(0, 0, 0, 0);
        local v37 = v35.Position + v35.CFrame.UpVector * (v35:GetAttribute("SpreadDistance") * v16);
        v36 = if v34 ~= nil then v34.Position + v34.CFrame.UpVector * (v34:GetAttribute("SpreadDistance") * v16) else v10;
        local l_Magnitude_1 = (v36 - v37).Magnitude;
        local v39 = CFrame.new(v37:Lerp(v36, 0.5), v36):ToWorldSpace(CFrame.Angles(0, 1.5707963267948966, 0));
        local v40 = TweenInfo.new(v15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
        local v41 = {
            Size = Vector3.new(l_Magnitude_1, 0, 0), 
            CFrame = v39
        };
        local v42 = l_TweenService_0:Create(v33, v40, v41);
        v42:Play();
        v42:Destroy();
    end;
    l_Debris_0:AddItem(l_Model_0, v15);
end;
return v0;