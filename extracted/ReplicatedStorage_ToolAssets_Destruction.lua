-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local v1 = Random.new();
local v2 = {
    didInit = false
};
v2.init = function(_) --[[ Line: 8 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v2.Debris = Instance.new("Folder");
    v2.Debris.Name = "destructionDebris";
    v2.Debris.Parent = workspace;
    v2.Cache = Instance.new("Folder");
    v2.Cache.Name = "Cache";
    v2.Cache.Parent = script;
    v2.didInit = true;
end;
v2.getFromCache = function(_) --[[ Line: 20 ]] --[[ Name: getFromCache ]]
    -- upvalues: v2 (copy)
    return v2.Cache:GetChildren()[1] or script.Part:Clone();
end;
v2.storeToCache = function(_, v6) --[[ Line: 24 ]] --[[ Name: storeToCache ]]
    -- upvalues: v2 (copy)
    v6.Parent = v2.Cache;
end;
v2.flyDebris = function(_, v8, v9, v10, v11, v12) --[[ Line: 28 ]] --[[ Name: flyDebris ]]
    -- upvalues: v2 (copy), v1 (copy), l_TweenService_0 (copy)
    if not v2.didInit then
        v2:init();
    end;
    for _ = 1, v8 do
        local v14 = v2:getFromCache();
        v14.Size = Vector3.new(v1:NextNumber(0, v11), v1:NextNumber(0, v11), v1:NextNumber(0, v11));
        if v9.Instance.BrickColor ~= BrickColor.Gray() then
            v14.Color = v9.Instance.Color;
        else
            v14.Color = Color3.fromRGB(135, 94, 71);
        end;
        v14.Material = v9.Instance.Material;
        v14.Transparency = v9.Instance.Transparency;
        v14.CanCollide = false;
        v14.CanQuery = false;
        if v14:FindFirstChild("VectorForce") then
            local l_Attachment_0 = Instance.new("Attachment");
            l_Attachment_0.Name = "att0";
            l_Attachment_0.Parent = v14;
            local l_VectorForce_0 = Instance.new("VectorForce");
            l_VectorForce_0.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_VectorForce_0.ApplyAtCenterOfMass = true;
            l_VectorForce_0.Attachment0 = l_Attachment_0;
            l_VectorForce_0.Force = Vector3.new(0, 1000, 0, 0);
            l_VectorForce_0.Parent = v14;
        end;
        local l_Normal_0 = v9.Normal;
        v14.CFrame = CFrame.lookAt(v9.Position, v9.Position + l_Normal_0) * CFrame.new(v1:NextNumber(-v10, v10), v1:NextNumber(-v10, v10), 0) * CFrame.Angles(math.rad((v1:NextNumber(-360, 360))), math.rad((v1:NextNumber(-360, 360))), (math.rad((v1:NextNumber(-360, 360)))));
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.Parent = v14;
        l_BodyVelocity_0.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
        l_BodyVelocity_0.Velocity = Vector3.new(v1:NextNumber(-v10, v10), v1:NextNumber(1.25 * v10, 5.5 * v10), v1:NextNumber(-v10, v10));
        local v19 = v1:NextNumber(0.3, 0.95) * 2.5;
        l_TweenService_0:Create(v14, TweenInfo.new(v19, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Size = Vector3.new(0, 0, 0, 0)
        }):Play();
        task.delay(0.25, function() --[[ Line: 78 ]]
            -- upvalues: l_BodyVelocity_0 (copy)
            l_BodyVelocity_0:Destroy();
        end);
        task.delay(v19, function() --[[ Line: 82 ]]
            -- upvalues: v2 (ref), v14 (copy)
            v2:storeToCache(v14);
        end);
        if v12 then
            v12(v14, v19);
        end;
        v14.Parent = v2.Debris;
    end;
end;
return v2;