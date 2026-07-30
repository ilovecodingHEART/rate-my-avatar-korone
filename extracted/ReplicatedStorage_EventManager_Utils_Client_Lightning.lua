-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_TweenService_0 = game:GetService("TweenService");
local l_Assets_0 = script:WaitForChild("Assets");
local v2 = Random.new();
local v3 = {
    Init = false, 
    Debris = nil, 
    Cache = nil
};
v3.Init = function(_) --[[ Line: 14 ]] --[[ Name: Init ]]
    -- upvalues: v3 (copy)
    v3.Debris = Instance.new("Folder");
    v3.Debris.Name = "LightningDebris";
    v3.Debris.Parent = workspace;
    v3.Cache = Instance.new("Folder");
    v3.Cache.Name = "Cache";
    v3.Cache.Parent = script;
    v3.Init = true;
end;
v3.CreatePoints = function(_, v6, v7, v8, v9) --[[ Line: 26 ]] --[[ Name: CreatePoints ]]
    -- upvalues: v2 (copy)
    local v10 = (v7 - v6) / v9;
    local v11 = {};
    for v12 = 1, v9 do
        table.insert(v11, v6 + v10 * v12 + Vector3.new(v2:NextNumber(-v8, v8), v2:NextNumber(-v8, v8), v2:NextNumber(-v8, v8)));
    end;
    table.insert(v11, v7);
    return v11;
end;
v3.AddDebris = function(_, v14, v15) --[[ Line: 45 ]] --[[ Name: AddDebris ]]
    task.delay(v15, function() --[[ Line: 46 ]]
        -- upvalues: v14 (copy)
        v14:Destroy();
    end);
end;
v3.GetFromCache = function(_) --[[ Line: 49 ]] --[[ Name: GetFromCache ]]
    -- upvalues: v3 (copy), l_Assets_0 (copy)
    return v3.Cache:GetChildren()[1] or l_Assets_0:WaitForChild("Lightning"):Clone();
end;
v3.StoreToCache = function(_, v18) --[[ Line: 53 ]] --[[ Name: StoreToCache ]]
    -- upvalues: v3 (copy)
    v18.Parent = v3.Cache;
end;
v3.CreateArc = function(_, v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 57 ]] --[[ Name: CreateArc ]]
    -- upvalues: v3 (copy), l_TweenService_0 (copy)
    if not v3.Init then
        v3:Init();
    end;
    local l_v3_FromCache_0 = v3:GetFromCache();
    l_v3_FromCache_0.Parent = v3.Debris;
    l_v3_FromCache_0:PivotTo(CFrame.new(v20));
    l_v3_FromCache_0:ScaleTo(v22 or 1);
    l_v3_FromCache_0.PrimaryPart.Trail.Color = ColorSequence.new(v26);
    l_v3_FromCache_0.PrimaryPart.Trail.Lifetime = v27;
    l_v3_FromCache_0.PrimaryPart.Trail.Enabled = true;
    local l_v3_Points_0 = v3:CreatePoints(v20, v21, v24 or 1, v23 or math.clamp((math.floor((v21 - v20).Magnitude / 3))), 2, 45);
    task.spawn(function() --[[ Line: 73 ]]
        -- upvalues: l_v3_Points_0 (copy), l_TweenService_0 (ref), l_v3_FromCache_0 (copy), v25 (copy), v23 (copy), v3 (ref)
        local v30 = nil;
        for _, v32 in ipairs(l_v3_Points_0) do
            v30 = l_TweenService_0:Create(l_v3_FromCache_0.PrimaryPart, TweenInfo.new(v25 / v23, Enum.EasingStyle.Linear), {
                Position = v32
            });
            v30:Play();
            v30.Completed:Wait();
            v30:Destroy();
        end;
        l_v3_FromCache_0.PrimaryPart.Trail.Enabled = false;
        task.delay(l_v3_FromCache_0.PrimaryPart.Trail.Lifetime, function() --[[ Line: 88 ]]
            -- upvalues: v3 (ref), l_v3_FromCache_0 (ref)
            v3:StoreToCache(l_v3_FromCache_0);
        end);
    end);
end;
return v3;