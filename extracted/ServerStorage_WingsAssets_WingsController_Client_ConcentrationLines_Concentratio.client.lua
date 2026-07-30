-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local l_SpeedLines_0 = l_Parent_0:FindFirstChild("SpeedLines");
local l_Beam_0 = l_SpeedLines_0:FindFirstChild("Beam");
local function v14(v6) --[[ Line: 18 ]]
    -- upvalues: l_SpeedLines_0 (copy), l_Beam_0 (copy)
    local v7 = math.random(1, 4);
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    if v7 < 3 then
        v8 = v7 == 1 and 0 or 1;
        v9 = 1 / l_SpeedLines_0.AbsoluteSize.Y * math.random(0, l_SpeedLines_0.AbsoluteSize.Y);
        v10 = 1 / l_SpeedLines_0.AbsoluteSize.X * math.random(l_SpeedLines_0.AbsoluteSize.X * 0.666, l_SpeedLines_0.AbsoluteSize.X);
    elseif v7 >= 3 then
        v9 = v7 == 3 and 0 or 1;
        v8 = 1 / l_SpeedLines_0.AbsoluteSize.X * math.random(0, l_SpeedLines_0.AbsoluteSize.X);
        v10 = 1 / l_SpeedLines_0.AbsoluteSize.Y * math.random(l_SpeedLines_0.AbsoluteSize.Y * 0.666, l_SpeedLines_0.AbsoluteSize.Y);
    end;
    local v11 = Vector2.new(v8, v9) - Vector2.new(0.5, 0.5);
    local v12 = math.deg((math.atan2(v11.Y, v11.X)));
    local v13 = l_Beam_0:Clone();
    v13.Size = UDim2.new(math.random(1, 7) / 100 * v6 * 0.5, 0, v10 * v6 * 0.5, 0);
    v13.Rotation = v12 - 90;
    v13.Position = UDim2.new(v8, 0, v9, 0);
    v13.Parent = l_SpeedLines_0;
    v13.Visible = true;
    v13.Arrow.Position = UDim2.new(0.5, 0, 0, 0);
    v13.Arrow.ImageTransparency = math.random(0, 75) / 100;
    return v13;
end;
local function v20(_) --[[ Line: 56 ]]
    -- upvalues: l_Parent_0 (copy), v14 (copy), l_TweenService_0 (copy)
    if script:GetAttribute("IS_RUNNING") == false then
        return;
    else
        local v16 = l_Parent_0:GetAttribute("Scale") or 1;
        for _ = 1, math.clamp(script:GetAttribute("EFFECT_STRENGTH") * v16, 1, script:GetAttribute("EFFECT_STRENGTH")) do
            local v18 = v14(v16);
            local v19 = l_TweenService_0:Create(v18.Arrow, TweenInfo.new(0.2), {
                Position = UDim2.new(0.5, 0, 1, 0)
            });
            v19.Completed:Connect(function() --[[ Line: 65 ]]
                -- upvalues: v18 (copy)
                v18:Destroy();
            end);
            v19:Play();
        end;
        return;
    end;
end;
if (l_Parent_0:GetAttribute("Scale") or 1) > 0 then
    script:SetAttribute("IS_RUNNING", true);
    l_RunService_0:BindToRenderStep("ConcentrationLineRunner", Enum.RenderPriority.Camera.Value, v20);
end;
l_Parent_0:GetAttributeChangedSignal("Scale"):Connect(function() --[[ Line: 79 ]]
    -- upvalues: l_Parent_0 (copy), l_RunService_0 (copy), v20 (copy)
    if (l_Parent_0:GetAttribute("Scale") or 1) <= 0 then
        script:SetAttribute("IS_RUNNING", false);
        l_RunService_0:UnbindFromRenderStep("ConcentrationLineRunner");
        return;
    else
        if script:GetAttribute("IS_RUNNING") == false then
            script:SetAttribute("IS_RUNNING", true);
            l_RunService_0:BindToRenderStep("ConcentrationLineRunner", Enum.RenderPriority.Camera.Value, v20);
        end;
        return;
    end;
end);