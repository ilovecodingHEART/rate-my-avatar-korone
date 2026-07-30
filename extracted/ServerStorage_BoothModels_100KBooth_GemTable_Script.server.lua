local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CollectionService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = l_Players_0.LocalPlayer;
tween = function(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: tween ]]
    l_TweenService_0:Create(v4, TweenInfo.new(v5), v6):Play();
end;
local l_Parent_0 = script.Parent;
spawn(function() --[[ Line: 16 ]]
    local v8 = {
        Color3.fromRGB(180, 65, 186), 
        Color3.fromRGB(186, 88, 176), 
        Color3.fromRGB(167, 92, 186)
    };
    local v9 = 1;
    local function _() --[[ Line: 25 ]] --[[ Name: updateColor ]]
        local v10 = v9 % #v8 + 1;
        local v11 = v8[v10];
        tween(l_Parent_0, 2, {
            Color = v11
        });
        v9 = v10;
    end;
    while true do
        local v13 = #v8;
        local v14 = v9 % v13 + 1;
        local v15 = v8[v14];
        tween(l_Parent_0, 2, {
            Color = v15
        });
        v9 = v14;
        wait(1.8);
    end;
end);