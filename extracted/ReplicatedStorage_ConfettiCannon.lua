-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
return {
    Fire = function(v1) --[[ Line: 8 ]] --[[ Name: Fire ]]
        -- upvalues: l_RunService_0 (copy)
        local l_Parent_0 = v1.Parent;
        local l_Template_0 = v1.Template;
        local v4 = v1.Count or 25;
        local v5 = v1.RandomColors or false;
        local v6 = v1.Colors or {};
        local v7 = v1.Speed or {
            1300, 
            1600
        };
        local v8 = v1.Spread or 240;
        local v9 = v1.Gravity or 1600;
        assert(l_Parent_0 and l_Template_0, "ConfettiCannon: Parent and Template are required");
        for _ = 1, v4 do
            local v11 = l_Template_0:Clone();
            v11.Visible = true;
            v11.AnchorPoint = Vector2.new(0.5, 0.5);
            v11.Position = UDim2.new(0.5, 0, 1, 0);
            v11.Size = UDim2.fromOffset(math.random(8, 12), math.random(14, 20));
            v11.Rotation = math.random(0, 360);
            v11.ZIndex = 10;
            v11.Parent = l_Parent_0;
            if v5 and #v6 > 0 then
                v11.ImageColor3 = v6[math.random(1, #v6)];
            end;
            local v12 = Vector2.new(0, 0);
            local v13 = Vector2.new(math.random(-v8, v8), -math.random(v7[1], v7[2]));
            local v14 = math.random(-180, 180);
            local v15 = nil;
            do
                local l_v12_0, l_v13_0, l_v15_0 = v12, v13, v15;
                l_v15_0 = l_RunService_0.RenderStepped:Connect(function(v19) --[[ Line: 39 ]]
                    -- upvalues: l_v13_0 (ref), v9 (copy), l_v12_0 (ref), v11 (copy), v14 (copy), l_Parent_0 (copy), l_v15_0 (ref)
                    l_v13_0 = l_v13_0 + Vector2.new(0, v9) * v19;
                    l_v12_0 = l_v12_0 + l_v13_0 * v19;
                    v11.Position = UDim2.new(0.5, l_v12_0.X, 1, l_v12_0.Y);
                    local l_v11_0 = v11;
                    l_v11_0.Rotation = l_v11_0.Rotation + v14 * v19;
                    if v11.AbsolutePosition.Y > l_Parent_0.AbsoluteSize.Y + 100 then
                        l_v15_0:Disconnect();
                        v11:Destroy();
                    end;
                end);
            end;
        end;
    end
};