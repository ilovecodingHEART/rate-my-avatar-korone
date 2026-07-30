-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v16 = {
    createParticle = function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: createParticle ]]
        local v5 = {
            EmitterPosition = v2, 
            Position = Vector2.new(0, 0), 
            Power = v3
        };
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Shape = Enum.PartType.Ball;
        l_Part_0.Size = Vector3.new(10, 10, 10, 0);
        l_Part_0.BrickColor = BrickColor.Random();
        l_Part_0.Position = Vector3.new(0, 100, 0, 0);
        l_Part_0.Parent = v4;
        v5.Label = l_Part_0;
        return v5;
    end, 
    Update = function(v7, _) --[[ Line: 25 ]] --[[ Name: Update ]]
        local l_EmitterPosition_0 = v7.EmitterPosition;
        local l_Position_0 = v7.Position;
        local l_Power_0 = v7.Power;
        local l_Label_0 = v7.Label;
        if l_Label_0 then
            local v13 = Vector2.new(l_Position_0.X - l_Power_0.X, l_Position_0.Y - l_Power_0.Y);
            local v14 = Vector2.new(l_Power_0.X / 1.09, l_Power_0.Y / 1.1 + 1);
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            l_Label_0.Position = UDim2.new(l_EmitterPosition_0.X, v13.X, l_EmitterPosition_0.Y, v13.Y);
            v7.Position = v13;
            v7.Power = v14;
            if l_Label_0.AbsolutePosition.Y > l_ViewportSize_0.Y + 100 then
                l_Label_0:Destroy();
                return;
            end;
        end;
    end
};
local v17 = {};
v16.Fire = function(v18, v19) --[[ Line: 47 ]] --[[ Name: Fire ]]
    local v20 = true;
    local v21 = {};
    for _ = 1, v18 or 50 do
        table.insert(v21, (v16.createParticle(Vector2.new(0.5, 1), Vector2.new(math.random(90) - 45, math.random(70, 100)), script.Parent.Parent)));
    end;
    local v23 = tick();
    l_RunService_0.RenderStepped:Connect(function() --[[ Line: 62 ]]
        if not v20 then
            for _, v25 in ipairs(v21) do
                v25.Label:Destroy();
            end;
            v17[v17] = nil;
            return;
        else
            for _, v27 in ipairs(v21) do
                v27.Enabled = v20;
                v27:Update();
            end;
            if tick() - v23 < v19 then

            end;
            v20 = false;
            return;
        end;
    end);
    table.insert(v17, v21);
end;
return v16;