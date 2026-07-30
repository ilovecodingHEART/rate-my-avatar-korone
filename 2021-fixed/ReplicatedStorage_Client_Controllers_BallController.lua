-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Debris");
local l_atoms_0 = require(script.Parent.Parent:WaitForChild("atoms"));
local l_emitParticles_0 = require(script.Parent.Parent:WaitForChild("emitParticles"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local v8 = l_ReplicatedStorage_0.Assets:WaitForChild("Ball", 5):Clone();
tween = function(v9, v10, v11, v12) --[[ Line: 14 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    spawn(function() --[[ Line: 15 ]]
        -- upvalues: l_TweenService_0 (ref), v9 (copy), v10 (copy), v12 (copy), v11 (copy)
        l_TweenService_0:Create(v9, TweenInfo.new(v10, v12 or Enum.EasingStyle.Back), v11):Play();
    end);
end;
local v16 = {
    Init = function(_) --[[ Line: 27 ]] --[[ Name: Init ]]

    end, 
    SetCFrame = function(_, v15) --[[ Line: 29 ]] --[[ Name: SetCFrame ]]
        -- upvalues: v8 (copy)
        v8.CFrame = v15;
    end
};
v16.ShootBall = function(_) --[[ Line: 33 ]] --[[ Name: ShootBall ]]
    -- upvalues: v8 (copy), l_atoms_0 (copy), l_emitParticles_0 (copy), l_ReplicatedStorage_0 (copy), l_Util_0 (copy), l_RunService_0 (copy), v16 (copy)
    local l_Position_0 = v8.Position;
    local v19 = l_atoms_0.penaltyShootLocation();
    l_emitParticles_0(l_ReplicatedStorage_0.Assets.VFX.Kick, l_Position_0);
    workspace.Camera.FieldOfView = 45;
    tween(workspace.Camera, 0.25, {
        FieldOfView = 50
    });
    local v20 = l_Util_0.makeControlPoint(l_Position_0, v19, 10);
    local v21 = 0;
    local v22 = nil;
    v22 = l_RunService_0.Heartbeat:Connect(function(v23) --[[ Line: 48 ]]
        -- upvalues: v21 (ref), v8 (ref), v19 (copy), v22 (ref), v16 (ref), l_emitParticles_0 (ref), l_ReplicatedStorage_0 (ref), l_Util_0 (ref), l_Position_0 (copy), v20 (copy)
        v21 = v21 + v23 / 0.5;
        if v21 >= 1 then
            v8.Position = v19;
            v22:Disconnect();
            v16:Hide();
            l_emitParticles_0(l_ReplicatedStorage_0.Assets.VFX.BallVanish, v19);
            return;
        else
            v8.Position = l_Util_0.quadraticBezier(v21, l_Position_0, v20, v19);
            return;
        end;
    end);
end;
v16.Hide = function(_) --[[ Line: 63 ]] --[[ Name: Hide ]]
    -- upvalues: v8 (copy), l_Lighting_0 (copy)
    v8.Parent = l_Lighting_0;
end;
v16.Show = function(_) --[[ Line: 67 ]] --[[ Name: Show ]]
    -- upvalues: v8 (copy)
    v8.Parent = workspace;
end;
v16.Freeze = function(_) --[[ Line: 71 ]] --[[ Name: Freeze ]]
    -- upvalues: v8 (copy)
    v8.Anchored = true;
end;
return v16;