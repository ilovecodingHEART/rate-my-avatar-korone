-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v4 = TweenInfo.new(1.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v5 = {};
v5.__index = v5;
v5.LookTowards = function(v6, v7) --[[ Line: 16 ]] --[[ Name: LookTowards ]]
    -- upvalues: l_TweenService_0 (copy), v4 (copy)
    local v8 = CFrame.fromOrientation(math.asin(v7.Y) * 1.1, -math.asin(v7.X) * 1.1, 0) + Vector3.new(-0, 0.9760000109672546, 0.061000000685453415, 0);
    if v6._tween then
        v6._tween:Cancel();
        v6._tween:Destroy();
    end;
    local v9 = l_TweenService_0:Create(v6._neck, v4, {
        C0 = v8
    });
    v9:Play();
    v6._tween = v9;
    v6.direction = v7;
end;
v5._IdleLoop = function(v10) --[[ Line: 31 ]] --[[ Name: _IdleLoop ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local l_direction_0 = v10.direction;
    while v10.active do
        local l_LookVector_0 = v10._root.CFrame:ToObjectSpace(l_CurrentCamera_0.CFrame).LookVector;
        if (l_LookVector_0 - l_direction_0).Magnitude > 0.05 then
            l_direction_0 = l_LookVector_0;
            v10.idle = false;
            v10:LookTowards(l_LookVector_0);
        else
            v10.idle = true;
        end;
        task.wait(0.08333333333333333);
    end;
end;
v0.new = function(v13) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_Players_0 (copy)
    local v14 = setmetatable({}, v5);
    v14._root = v13:WaitForChild("HumanoidRootPart");
    v14._neck = v13:WaitForChild("Head").Neck;
    v14.direction = Vector3.new(0, 0, 0, 0);
    v14.isLocal = l_Players_0:GetPlayerFromCharacter(v13) == l_Players_0.LocalPlayer;
    v14.active = true;
    task.defer(function() --[[ Line: 59 ]]
        -- upvalues: v14 (copy)
        v14:LookTowards((Vector3.new(0, 0, 0, 0)));
        if v14.isLocal then
            v14:_IdleLoop();
        end;
    end);
    return v14;
end;
v5.Destroy = function(v15) --[[ Line: 70 ]] --[[ Name: Destroy ]]
    table.clear(v15);
    setmetatable(v15, nil);
end;
return v0;