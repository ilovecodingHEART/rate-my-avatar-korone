-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local function _(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v6 = TweenInfo.new(v3, v5 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v2, v6, v4):Play();
end;
local function v14(v8) --[[ Line: 11 ]] --[[ Name: formatTime ]]
    local v9 = math.floor(v8 / 86400);
    local v10 = math.floor(v8 % 86400 / 3600);
    local v11 = math.floor(v8 % 3600 / 60);
    local v12 = v8 % 60;
    local v13 = {};
    if v9 > 0 then
        table.insert(v13, v9 .. "D");
    end;
    if v10 > 0 or v9 > 0 then
        table.insert(v13, v10 .. "H");
    end;
    if v11 > 0 or v10 > 0 or v9 > 0 then
        table.insert(v13, v11 .. "M");
    end;
    table.insert(v13, v12 .. "S");
    return table.concat(v13, " ");
end;
spawn(function() --[[ Line: 26 ]] --[[ Name: updateCountdown ]]
    -- upvalues: l_Parent_0 (copy), l_TweenService_0 (copy), v14 (copy)
    while true do
		local v15 = 1771427051 - os.time();
        if v15 > 0 then
            l_Parent_0.TextColor3 = Color3.fromRGB(255, 91, 15);
            local l_l_Parent_0_0 = l_Parent_0;
            local v17 = {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            };
            local v18 = TweenInfo.new(1, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_l_Parent_0_0, v18, v17):Play();
            l_Parent_0.Text = v14(v15);
            wait(1);
        else
            break;
        end;
    end;
    l_Parent_0.Text = "0s";
    script.Parent.Parent.Parent.Visible = false;
end);