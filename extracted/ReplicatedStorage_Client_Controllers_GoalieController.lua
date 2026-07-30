-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local l_AnimationManager_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("AnimationManager"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local l_Animations_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Animations"));
local l_CameraShake_0 = require(script.Parent.Parent:WaitForChild("CameraShake"));
local l_emitParticles_0 = require(script.Parent.Parent:WaitForChild("emitParticles"));
tween = function(v8, v9, v10, v11) --[[ Line: 11 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    spawn(function() --[[ Line: 12 ]]
        -- upvalues: l_TweenService_0 (ref), v8 (copy), v9 (copy), v11 (copy), v10 (copy)
        l_TweenService_0:Create(v8, TweenInfo.new(v9, v11 or Enum.EasingStyle.Back), v10):Play();
    end);
end;
local v12 = {};
local v13 = nil;
local v14 = nil;
local v15 = l_AnimationManager_0.new();
v12.Init = function(_) --[[ Line: 28 ]] --[[ Name: Init ]]

end;
v12.Spawn = function() --[[ Line: 30 ]] --[[ Name: Spawn ]]
    -- upvalues: v13 (ref), v14 (ref), v15 (ref), l_AnimationManager_0 (copy), l_ReplicatedStorage_0 (copy), l_Util_0 (copy), v12 (copy), l_Animations_0 (copy)
    if v13 and v13.Parent then
        v13:Destroy();
        v13 = nil;
        v14 = nil;
        v15:Destroy();
        v15 = l_AnimationManager_0.new();
    end;
    local l_Assets_0 = l_ReplicatedStorage_0:FindFirstChild("Assets");
    if not l_Assets_0 or not l_Assets_0:FindFirstChild("GoalKeeper") then
        warn("Goalie asset not found in ReplicatedStorage.Assets.GoalKeeper");
        return nil;
    else
        v13 = l_Assets_0.GoalKeeper:Clone();
        v13.Parent = workspace;
        if workspace:FindFirstChild("MapItems") and workspace.MapItems:FindFirstChild("GoalkeeperSpawn") then
            v13:PivotTo(workspace.MapItems.GoalkeeperSpawn.CFrame);
        end;
        local l_BallTool_0 = v13:FindFirstChild("BallTool");
        if l_BallTool_0 then
            l_BallTool_0:Destroy();
        end;
        local v19, v20 = l_Util_0.getAnimatorFromModel(v13);
        v14 = v19;
        localAnimator = v20;
        if localAnimator then
            v15:SetAnimator(localAnimator);
        end;
        v12.SetAnimation(l_Animations_0.Idle, true);
        v12.PlayAnimation();
        v15.OnNonLoopFinished = function() --[[ Line: 64 ]]
            -- upvalues: v15 (ref), l_Animations_0 (ref)
            v15:SetAnimation(l_Animations_0.Idle, true);
            v15:Play();
        end;
        return v13;
    end;
end;
v12.Despawn = function() --[[ Line: 72 ]] --[[ Name: Despawn ]]
    -- upvalues: v13 (ref), v14 (ref), v15 (ref)
    if v13 then
        v13:Destroy();
        v13 = nil;
        v14 = nil;
    end;
    v15:Destroy();
end;
v12.SetAnimation = function(v21, v22) --[[ Line: 81 ]] --[[ Name: SetAnimation ]]
    -- upvalues: v15 (ref)
    v15:SetAnimation(v21, v22);
end;
v12.PlayAnimation = function() --[[ Line: 85 ]] --[[ Name: PlayAnimation ]]
    -- upvalues: v15 (ref)
    v15:Play();
end;
v12.StopAnimation = function() --[[ Line: 89 ]] --[[ Name: StopAnimation ]]
    -- upvalues: v15 (ref)
    v15:Stop();
end;
v12.GetModel = function() --[[ Line: 93 ]] --[[ Name: GetModel ]]
    -- upvalues: v13 (ref)
    return v13;
end;
v12.DestroyBall = function(_) --[[ Line: 97 ]] --[[ Name: DestroyBall ]]
    -- upvalues: v13 (ref)
    if not v13 then
        return;
    else
        local l_BallTool_1 = v13:FindFirstChild("BallTool");
        if l_BallTool_1 then
            l_BallTool_1:Destroy();
        end;
        return;
    end;
end;
v12.PivotTo = function(v25) --[[ Line: 105 ]] --[[ Name: PivotTo ]]
    -- upvalues: v13 (ref)
    if not v13 then
        return;
    else
        v13:PivotTo(v25);
        return;
    end;
end;
v12.HandleResult = function(v26, v27, v28) --[[ Line: 112 ]] --[[ Name: HandleResult ]]
    -- upvalues: v13 (ref), v12 (copy), l_Animations_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_emitParticles_0 (copy), l_CameraShake_0 (copy), l_ReplicatedStorage_0 (copy)
    if not v13 then
        return;
    else
        local l_PrimaryPart_0 = v13.PrimaryPart;
        local l_CFrame_0 = l_PrimaryPart_0.CFrame;
        local v31 = math.random(0, 1) == 0 and -1 or 1;
        if v27 == "Left" then
            v12.SetAnimation(l_Animations_0.DiveLeft, false);
        elseif v27 == "Right" then
            v12.SetAnimation(l_Animations_0.DiveRight, false);
        elseif v31 == -1 then
            v12.SetAnimation(l_Animations_0.WalkLeft, false);
        else
            v12.SetAnimation(l_Animations_0.WalkRight, false);
        end;
        v12.PlayAnimation();
        local v32 = nil;
        if not v26 then
            local v33 = math.random(6, 10);
            v32 = if v27 == "Right" then l_CFrame_0.Position - l_CFrame_0.RightVector * v33 else if v27 == "Left" then l_CFrame_0.Position + l_CFrame_0.RightVector * v33 else l_CFrame_0.Position + l_CFrame_0.RightVector * v31;
            print("Not Blocked");
        else
            v32 = Vector3.new(v28.X, l_CFrame_0.Position.Y, v28.Z);
            print("Blocked", v27);
        end;
        local v34, v35, v36 = l_CFrame_0:ToEulerAnglesXYZ();
        local v37 = CFrame.new(v32) * CFrame.fromEulerAnglesXYZ(v34, v35, v36);
        local v38 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v39 = l_TweenService_0:Create(l_PrimaryPart_0, v38, {
            CFrame = v37
        });
        v39:Play();
        v39.Completed:Connect(function(v40) --[[ Line: 161 ]]
            -- upvalues: v12 (ref), l_Animations_0 (ref), l_Lighting_0 (ref), v26 (copy), l_emitParticles_0 (ref), l_CameraShake_0 (ref)
            if v40 == Enum.PlaybackState.Completed then
                v12.SetAnimation(l_Animations_0.Idle);
                v12.PlayAnimation();
            end;
            local l_ResultColorCorrection_0 = l_Lighting_0:FindFirstChild("ResultColorCorrection");
            if not l_ResultColorCorrection_0 then
                l_ResultColorCorrection_0 = Instance.new("ColorCorrectionEffect");
                l_ResultColorCorrection_0.Name = "ResultColorCorrection";
                l_ResultColorCorrection_0.Parent = l_Lighting_0;
            end;
            l_ResultColorCorrection_0.Enabled = true;
            if not v26 then
                l_emitParticles_0(workspace:WaitForChild("Adidas", 1e999).Structures.Stadium.Model.Misc.Pitch.Goals.Goal1.Vfx, workspace:WaitForChild("Adidas", 1e999).Structures.Stadium.Model.Misc.Pitch.Goals.Goal1.Vfx.Position);
                game.SoundService.SFX.NotBlocked:Play();
                workspace.Camera.FieldOfView = 30;
                l_Lighting_0.ExposureCompensation = 3;
                l_ResultColorCorrection_0.TintColor = Color3.fromRGB(120, 255, 160);
                l_ResultColorCorrection_0.Brightness = 0.5;
                l_ResultColorCorrection_0.Saturation = 0.4;
                tween(workspace.Camera, 0.4, {
                    FieldOfView = 50
                }, Enum.EasingStyle.Quad);
                tween(l_Lighting_0, 0.5, {
                    ExposureCompensation = 0
                }, Enum.EasingStyle.Quad);
                l_CameraShake_0.new(1, 1, 2, Vector3.new(2, 2, 2, 0), Vector3.new(2, 2, 2, 0), 0.05);
            else
                game.SoundService.SFX.Blocked:Play();
                l_ResultColorCorrection_0.TintColor = Color3.fromRGB(255, 120, 120);
                l_ResultColorCorrection_0.Brightness = 0.4;
                l_ResultColorCorrection_0.Saturation = 0.3;
                l_CameraShake_0.new(1, 1, 2, Vector3.new(2, 2, 2, 0), Vector3.new(2, 2, 2, 0), 0.05);
            end;
            tween(l_ResultColorCorrection_0, 0.35, {
                Brightness = 0, 
                Saturation = 0
            }, Enum.EasingStyle.Quad);
            tween(l_ResultColorCorrection_0, 0.4, {
                TintColor = Color3.new(1, 1, 1)
            }, Enum.EasingStyle.Quad);
            task.delay(0.5, function() --[[ Line: 216 ]]
                -- upvalues: l_ResultColorCorrection_0 (ref)
                l_ResultColorCorrection_0.Enabled = false;
            end);
        end);
        if v26 then
            local l_Assets_1 = l_ReplicatedStorage_0:FindFirstChild("Assets");
            if l_Assets_1 and l_Assets_1:FindFirstChild("BallTool") then
                l_Assets_1.BallTool:Clone().Parent = v13;
            end;
        end;
        return;
    end;
end;
v12.Destroy = function() --[[ Line: 230 ]] --[[ Name: Destroy ]]
    -- upvalues: v15 (ref), l_AnimationManager_0 (copy), v13 (ref)
    v15:Destroy();
    v15 = l_AnimationManager_0.new();
    if v13 then
        v13:Destroy();
        v13 = nil;
    end;
end;
return v12;