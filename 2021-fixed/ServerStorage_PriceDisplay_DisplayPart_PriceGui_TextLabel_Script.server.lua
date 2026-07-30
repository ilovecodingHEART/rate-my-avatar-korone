-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

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
        Color3.fromRGB(255, 70, 70), 
        Color3.fromRGB(255, 127, 0), 
        Color3.fromRGB(255, 230, 0), 
        Color3.fromRGB(50, 255, 50), 
        Color3.fromRGB(10, 150, 255), 
        Color3.fromRGB(220, 0, 255)
    };
    local v9 = 1;
    local function _() --[[ Line: 28 ]] --[[ Name: updateColor ]]
        local v10 = v9 % #v8 + 1;
        local v11 = v8[v10];
        tween(l_Parent_0, 1, {
            TextColor3 = v11
        });
        v9 = v10;
    end;
    while true do
        local v13 = #v8;
        local v14 = v9 % v13 + 1;
        local v15 = v8[v14];
        tween(l_Parent_0, 1, {
            TextColor3 = v15
        });
        v9 = v14;
        wait(0.5);
    end;
end);