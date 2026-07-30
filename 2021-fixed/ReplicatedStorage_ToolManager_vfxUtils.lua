-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_find
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] table.find only exists on very late 2021 builds; safe local exact equivalent
local function __2021_find(vt, vv, vi)
	for i = vi or 1, #vt do
		if vt[i] == vv then return i end
	end
	return nil
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local _ = l_Parent_0:WaitForChild("Tools");
local l_assetCache_0 = require(l_Parent_0:WaitForChild("assetCache"));
local v6 = Random.new();
local v7 = {
    server = {}, 
    client = {}, 
    shared = {}, 
    scr = script
};
local l_assets_0 = v7.scr:WaitForChild("assets");
local function _(v9) --[[ Line: 23 ]] --[[ Name: tweenCleanUp ]]
    v9.Completed:Once(function() --[[ Line: 24 ]]
        -- upvalues: v9 (copy)
        v9:Destroy();
    end);
    return v9;
end;
v7.client.createScreenDrop = function(_, v12) --[[ Line: 31 ]] --[[ Name: createScreenDrop ]]
    -- upvalues: v7 (copy), l_assetCache_0 (copy), l_assets_0 (copy), l_TweenService_0 (copy), v6 (copy), l_RunService_0 (copy)
    if not v7.client.screenDropCache then
        v7.client.screenDropCache = l_assetCache_0:cache();
        v7.client.isRenderingDrops = {};
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v14 = v7.client.screenDropCache.getFromCache() or l_assets_0.rain:Clone();
    v14.Parent = workspace;
    v14.Transparency = 1;
    v14.Size = Vector3.new(0, 0, 0, 0);
    local v15 = v12 / 4;
    local v16 = l_TweenService_0:Create(v14, TweenInfo.new(v15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = Vector3.new(v6:NextNumber(0.2, 0.4), v6:NextNumber(0.6, 1.6), 0.2) * 0.9, 
        Transparency = 0.7
    });
    local l_v16_0 = v16 --[[ copy: 6 -> 7 ]];
    v16.Completed:Once(function() --[[ Line: 24 ]]
        -- upvalues: l_v16_0 (copy)
        l_v16_0:Destroy();
    end);
    v16:Play();
    task.delay(v15, function() --[[ Line: 52 ]]
        -- upvalues: l_TweenService_0 (ref), v14 (copy), v15 (copy)
        local v18 = l_TweenService_0:Create(v14, TweenInfo.new(v15 * 3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Size = v14.Size * 0.7, 
            Transparency = 1
        });
        v18.Completed:Once(function() --[[ Line: 24 ]]
            -- upvalues: v18 (copy)
            v18:Destroy();
        end);
        v18:Play();
    end);
    local v19 = {
        object = v14, 
        startOffset = CFrame.new(Vector3.new(v6:NextNumber(-5, 5), v6:NextNumber(-5, 5), -4) * 1.5), 
        fallDistance = -(v6:NextNumber(3, 8) * 1.1), 
        age = 0
    };
    v14.CFrame = l_CurrentCamera_0.CFrame * v19.startOffset;
    table.insert(v7.client.isRenderingDrops, v19);
    task.delay(v12 + v15, function() --[[ Line: 71 ]]
        -- upvalues: v7 (ref), v19 (copy), v14 (copy)
        table.remove(v7.client.isRenderingDrops, __2021_find(v7.client.isRenderingDrops, v19));
        v7.client.screenDropCache.addToCache(v14);
    end);
    if not v7.client.isRendering then
        v16 = nil;
        do
            local l_v16_1 = v16;
            l_v16_1 = l_RunService_0.RenderStepped:Connect(function(v21) --[[ Line: 80 ]]
                -- upvalues: v7 (ref), v12 (copy), l_CurrentCamera_0 (copy), l_v16_1 (ref)
                for _, v23 in pairs(v7.client.isRenderingDrops) do
                    local l_object_0 = v23.object;
                    local _ = v23.start;
                    local _ = v23.goal;
                    v23.age = v23.age + v21;
                    local v27 = math.clamp(v23.age / v12, 0, 1);
                    local v28 = v23.startOffset * CFrame.new(0, v23.fallDistance * v27, 0);
                    l_object_0.CFrame = l_CurrentCamera_0.CFrame * v28;
                end;
                if #v7.client.isRenderingDrops <= 0 then
                    l_v16_1:Disconnect();
                    v7.client.isRendering = false;
                end;
            end);
            v7.client.isRendering = true;
        end;
    end;
end;
return v7;