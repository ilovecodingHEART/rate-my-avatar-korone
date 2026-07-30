-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_RunService_0 = game:GetService("RunService");
v0.new = function(v2, v3, v4, v5, v6, v7, v8) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    local v9 = v8 or workspace.CurrentCamera;
    if not v9 then
        warn("[CameraShake] No camera found");
        return;
    else
        local l_v2_0 = v2;
        local v11 = os.clock();
        local l_CFrame_0 = v9.CFrame;
        repeat
            local v13 = v0._RandomizeOffset(l_v2_0, v5, v6);
            local v14 = v3 / 100;
            local v15 = os.clock();
            repeat
                local _ = math.clamp((os.clock() - v15) / v14, 0, 1);
                local v17 = l_CFrame_0 * v13;
                v9.CFrame = v9.CFrame:Lerp(v17, 0.5);
                l_RunService_0.RenderStepped:Wait();
            until v14 <= os.clock() - v15 or v4 <= os.clock() - v11;
            l_v2_0 = math.clamp(l_v2_0 - v7, 0, v2);
        until v4 <= os.clock() - v11 or l_v2_0 <= 0;
        if v9 then
            v9.CFrame = l_CFrame_0;
        end;
        return;
    end;
end;
v0._RandomizeOffset = function(v18, v19, v20) --[[ Line: 55 ]] --[[ Name: _RandomizeOffset ]]
    local v21 = Vector3.new(math.random(-1, 1) * v18, math.random(-1, 1) * v18, math.random(-1, 1) * v18) * v19;
    local v22 = Vector3.new(math.random(-1, 1) * v18, math.random(-1, 1) * v18, math.random(-1, 1) * v18) * v20;
    return CFrame.new(v21) * CFrame.Angles(math.rad(v22.X), math.rad(v22.Y), (math.rad(v22.Z)));
end;
return v0;