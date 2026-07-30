-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_ConfettiTypes_0 = script:WaitForChild("ConfettiTypes");
local v4 = Random.new();
local function _(v5, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: tween ]]
    local v9 = TweenInfo.new(v6, v8 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v5, v9, v7):Play();
end;
CreateOne = function(v11, _, v13, v14) --[[ Line: 18 ]] --[[ Name: CreateOne ]]
    local l_l_ConfettiTypes_0_Children_0 = l_ConfettiTypes_0:GetChildren();
    local v16 = l_l_ConfettiTypes_0_Children_0[v4:NextInteger(1, #l_l_ConfettiTypes_0_Children_0)]:Clone();
    v16.Position = v11;
    local v17 = v4:NextInteger(v13, v14) * (l_Parent_0.AbsoluteSize.X / 1920);
    local v18 = v17 / l_Parent_0.AbsoluteSize.X;
    local v19 = v17 / l_Parent_0.AbsoluteSize.Y;
    v16.Size = UDim2.new(v18, 0, v19, 0);
    v16.Parent = l_Parent_0;
    game:GetService("Debris"):AddItem(v16, 0.7);
    return v16;
end;
MoveOne = function(v20, v21, v22, v23, v24) --[[ Line: 47 ]] --[[ Name: MoveOne ]]
    local v25 = Vector2.new(v20.AbsolutePosition.X, v20.AbsolutePosition.Y);
    local v26 = 0;
    local v27 = 0;
    local v28 = -v21;
    local v29 = 0;
    local function _() --[[ Line: 61 ]] --[[ Name: GetS_Y ]]
        return v28 * v29 + 0.5 * (v23 * v29) ^ 2;
    end;
    local v31 = tick();
    while v20 and v20.Parent == l_Parent_0 do
        v29 = tick() - v31;
        v26 = v26 + v22;
        v27 = v28 * v29 + 0.5 * (v23 * v29) ^ 2;
        local v32 = v25.X + v26;
        local v33 = v25.Y + v27;
        local v34 = UDim2.new(v32 / l_Parent_0.AbsoluteSize.X, 0, v33 / l_Parent_0.AbsoluteSize.Y, 0);
        local v35 = v20.Rotation + v24;
        v20.Position = v34;
        v20.Rotation = v35;
        if v20.Position.X.Scale < -1 or v20.Position.X.Scale > 2 or v20.Position.Y.Scale > 2 then
            spawn(function() --[[ Line: 87 ]]
                local l_v20_0 = v20;
                local v37 = {
                    ImageTransparency = 1
                };
                local v38 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
                l_TweenService_0:Create(l_v20_0, v38, v37):Play();
                wait(0.5);
                v20:Destroy();
            end);
        end;
        l_RunService_0.Heartbeat:Wait();
    end;
end;
CreateConfetti = function(v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51) --[[ Line: 99 ]] --[[ Name: CreateConfetti ]]
    v39 = v39 or UDim2.new(0.5, 0, 0.5, 0);
    v40 = v40 or 10;
    v41 = v41 or {
        Color3.fromRGB(255, 0, 0), 
        Color3.fromRGB(255, 119, 0), 
        Color3.fromRGB(255, 234, 0), 
        Color3.fromRGB(47, 255, 0), 
        Color3.fromRGB(0, 255, 247), 
        Color3.fromRGB(0, 4, 255), 
        Color3.fromRGB(140, 0, 255), 
        Color3.fromRGB(255, 0, 212)
    };
    v42 = v42 or 20;
    v43 = v43 or 40;
    v44 = v44 or 300;
    v45 = v45 or 1500;
    v46 = v46 or 0;
    v47 = v47 or 30;
    v48 = v48 or 50;
    v49 = v49 or 100;
    v50 = v50 or 0;
    v51 = v51 or 20;
    for _ = 1, v40 do
        l_RunService_0.Heartbeat:Wait();
        local v53 = CreateOne(v39, v41, v42, v43);
        local v54 = v4:NextNumber(v44, v45);
        local v55 = v4:NextNumber(v46, v47);
        if v4:NextNumber() > 0.5 then
            v55 = -v55;
        end;
        local v56 = v4:NextNumber(v48, v49);
        local v57 = v4:NextNumber(v50, v51);
        if v55 == 0 then
            v57 = 0;
        elseif v55 < 0 then
            v57 = -v57;
        end;
        v54 = v54 * (l_Parent_0.AbsoluteSize.Y / 1080);
        v56 = v56 * (l_Parent_0.AbsoluteSize.Y / 1080);
        v55 = v55 * (l_Parent_0.AbsoluteSize.X / 1920);
        task.spawn(MoveOne, v53, v54, v55, v56, v57);
    end;
end;
return CreateConfetti;