local l_Lighting_0 = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
print("introclient");
local function _(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v2, TweenInfo.new(v3), v4):Play();
end;
local l_Parent_0 = script.Parent.Parent;
local l_Icon_0 = l_Parent_0.Icon;
local l_Background_0 = l_Parent_0.Background;
local v9 = 0;
local v10 = 0;
local v11 = {
    "rbxassetid://14401902413", 
	"rbxassetid://14401902613",  -- 14401902613
    "rbxassetid://14401902808", 
    "rbxassetid://14401903005", 
    "rbxassetid://14401903264", 
    "rbxassetid://14401903461"
};
local v12 = 0;
local v13 = 9 * #v11 - 10;
l_Parent_0.Enabled = true;
for _, v15 in ipairs(v11) do
    local v16 = script.ImageLabel:Clone();
    v16.Parent = script.Parent.Parent;
    v16.Image = v15;
    repeat
        task.wait();
    until v16.IsLoaded;
    v16:Destroy();
end;
local v17 = tick();
l_Icon_0.ImageRectSize = Vector2.new(341, 341);
l_Icon_0.Image = v11[1];
local v18 = 1;
local v19 = 0;
local function v20() --[[ Line: 50 ]] --[[ Name: Run ]]
    if tick() - v17 >= 0.008333333333333333 then
        if v13 <= v12 then
            return;
        else
            v12 = v12 + 1;
            if v18 > #v11 then
                return;
            else
                v19 = v19 + 1;
                if v19 > 9 then
                    v18 = v18 % #v11 + 1;
                    l_Icon_0.Image = v11[v18];
                    v19 = 1;
                end;
                l_Icon_0.ImageRectOffset = Vector2.new(v9 * 341, v10 * 341);
                v9 = (v9 + 1) % 3;
                v10 = (v10 + (v9 == 0 and 1 or 0)) % 3;
                v17 = tick();
            end;
        end;
    end;
end;
local v21 = nil;
local function _() --[[ Line: 79 ]] --[[ Name: playAnimation ]]
    v12 = 0;
    v21 = game:GetService("RunService").RenderStepped:Connect(v20);
end;
(function() --[[ Line: 84 ]] --[[ Name: load ]]
    print("load");
    if not game:IsLoaded() then
        game.Loaded:Wait();
    end;
    local l_l_Icon_0_0 = l_Icon_0;
    local v24 = {
        ImageTransparency = 0
    };
    l_TweenService_0:Create(l_l_Icon_0_0, TweenInfo.new(0.25), v24):Play();
    script.StartUp:Play();
    v12 = 0;
    v21 = game:GetService("RunService").RenderStepped:Connect(v20);
    task.wait(1);
    l_l_Icon_0_0 = l_Icon_0;
    v24 = {
        ImageTransparency = 1
    };
    l_TweenService_0:Create(l_l_Icon_0_0, TweenInfo.new(0.25), v24):Play();
    task.wait(0.25);
    l_l_Icon_0_0 = l_Background_0;
    v24 = {
        GroupTransparency = 1
    };
    l_TweenService_0:Create(l_l_Icon_0_0, TweenInfo.new(0.5), v24):Play();
    l_Lighting_0.Blur.Size = 20;
    l_Lighting_0.ExposureCompensation = 2;
    l_l_Icon_0_0 = l_Lighting_0.Blur;
    v24 = {
        Size = 0
    };
    l_TweenService_0:Create(l_l_Icon_0_0, TweenInfo.new(2), v24):Play();
    l_l_Icon_0_0 = l_Lighting_0;
    v24 = {
        ExposureCompensation = 0
    };
    l_TweenService_0:Create(l_l_Icon_0_0, TweenInfo.new(1.5), v24):Play();
    task.wait(2);
    l_Parent_0.Enabled = false;
    v21:Disconnect();
end)();
game.ReplicatedFirst:RemoveDefaultLoadingScreen();