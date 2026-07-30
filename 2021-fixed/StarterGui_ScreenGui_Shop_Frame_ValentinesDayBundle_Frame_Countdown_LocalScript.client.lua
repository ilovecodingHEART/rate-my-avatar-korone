-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Parent_0 = script.Parent;
local l_TweenService_0 = game:GetService("TweenService");
local function _(v2, v3, v4, v5) --[[ Line: 6 ]] --[[ Name: tween ]]
    -- upvalues: l_TweenService_0 (copy)
    local v6 = TweenInfo.new(v3, v5 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v2, v6, v4):Play();
end;
local function v13(v8) --[[ Line: 11 ]] --[[ Name: formatTime ]]
    local v9 = math.floor(v8 / 3600);
    local v10 = math.floor(v8 % 3600 / 60);
    local v11 = v8 % 60;
    local v12 = {};
    if v9 > 0 then
        table.insert(v12, v9 .. "H");
    end;
    if v10 > 0 or v9 > 0 then
        table.insert(v12, v10 .. "M");
    end;
    table.insert(v12, v11 .. "S");
    return table.concat(v12, " ");
end;
spawn(function() --[[ Line: 24 ]] --[[ Name: updateCountdown ]]
    -- upvalues: l_Parent_0 (copy), l_TweenService_0 (copy), v13 (copy)
    while true do
		local v14 = (1771427051 + 432000) - os.time();
        if v14 > 0 then
            l_Parent_0.TextColor3 = Color3.fromRGB(255, 171, 224);
            local l_l_Parent_0_0 = l_Parent_0;
            local v16 = {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            };
            local v17 = TweenInfo.new(1, Enum.EasingStyle.Quint);
            l_TweenService_0:Create(l_l_Parent_0_0, v17, v16):Play();
            l_Parent_0.Text = v13(v14);
            wait(1);
        else
            break;
        end;
    end;
    l_Parent_0.Text = "0s";
    script.Parent.Parent.Parent.Visible = false;
end);