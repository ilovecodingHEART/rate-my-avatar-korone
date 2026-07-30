-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local v0 = require(game.ReplicatedStorage.NumberHelpers);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v2 = utf8.char(57346);
parseNumber = function(v3) --[[ Line: 6 ]] --[[ Name: parseNumber ]]
    v3 = v3:gsub(",", ""):gsub("%s+", "");
    if v3:find("K") then
        return tonumber(v3:sub(1, -2)) * 1000;
    elseif v3:find("M") then
        return tonumber(v3:sub(1, -2)) * 1000000;
    elseif v3:find("B") then
        return tonumber(v3:sub(1, -2)) * 1000000000;
    else
        return (tonumber(v3));
    end;
end;
local function _(v4, v5) --[[ Line: 23 ]] --[[ Name: round ]]
    local v6 = 10 ^ (v5 or 0);
    return math.floor(v4 * v6 + 0.5) / v6;
end;
robuxToUSD = function(v8) --[[ Line: 28 ]] --[[ Name: robuxToUSD ]]
    return math.floor(v8 * 0.0034999999999999996 * 100 + 0.5) / 100;
end;
updateText = function(v9, v10) --[[ Line: 33 ]] --[[ Name: updateText ]]
    if v9:IsA("TextLabel") or v9:IsA("TextButton") or v9:IsA("TextBox") then
        if v10 == true then
            if v9.Text:find(v2) or v9.Name == "MiddleText" or v9.Name == "Amount" then
                v9:SetAttribute("OriginalText", v9.Text);
                --v9.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
                v9.Text = v9.Text:gsub(v2 .. "([%d,%.%a]+)", function(v11) --[[ Line: 42 ]]
                    local v12 = parseNumber(v11);
                    if v12 then
                        return "$" .. v0.formatCommas(robuxToUSD(v12));
                    else
                        return v2 .. v11;
                    end;
                end);
                return;
            end;
        elseif v9:GetAttribute("OriginalText") then
            v9.Text = v9:GetAttribute("OriginalText");
        end;
    end;
end;
updateAllText = function(v13) --[[ Line: 61 ]] --[[ Name: updateAllText ]]
    for _, v15 in workspace:GetDescendants() do
        updateText(v15, v13);
    end;
    for _, v17 in l_LocalPlayer_0.PlayerGui:GetDescendants() do
        updateText(v17, v13);
    end;
end;
workspace:GetAttributeChangedSignal("ConvertUSD"):Connect(function() --[[ Line: 71 ]]
    updateAllText(workspace:GetAttribute("ConvertUSD"));
end);
workspace.DescendantAdded:Connect(function(v18) --[[ Line: 75 ]]
    updateText(v18, workspace:GetAttribute("ConvertUSD"));
end);
l_LocalPlayer_0.PlayerGui.DescendantAdded:Connect(function(v19) --[[ Line: 85 ]]
    updateText(v19, workspace:GetAttribute("ConvertUSD"));
end);