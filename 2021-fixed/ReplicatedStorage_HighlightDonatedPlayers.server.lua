-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Players_0 = game:GetService("Players");
local v1 = require(game.ReplicatedStorage.Remotes);
workspace:GetAttributeChangedSignal("HighlightDonated"):Connect(function() --[[ Line: 6 ]]
    for _, v3 in game:GetService("CollectionService"):GetTagged("DonationHighlight") do
        v3.Enabled = workspace:GetAttribute("HighlightDonated") == true;
    end;
end);
local v4 = {};
local function v8(v5) --[[ Line: 14 ]] --[[ Name: donationhighlight ]]
    if v5:FindFirstChild("DonationHighlight") then
        return;
    else
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.Name = "DonationHighlight";
        l_Highlight_0:AddTag("DonationHighlight");
        l_Highlight_0.FillTransparency = 0.8;
        l_Highlight_0.FillColor = Color3.fromRGB(42, 221, 69);
        l_Highlight_0.OutlineTransparency = 0.2;
        l_Highlight_0.OutlineColor = Color3.fromRGB(42, 221, 69);
        l_Highlight_0.Enabled = workspace:GetAttribute("HighlightDonated") == true;
        l_Highlight_0.Parent = v5.Character;
        v5.CharacterAdded:Connect(function(v7) --[[ Line: 27 ]]
            l_Highlight_0.Parent = v7;
        end);
        return;
    end;
end;
v1.OnClientEvent("NotifyDonationParticipants"):Connect(function(v9, v10, _) --[[ Line: 32 ]]
    if v9 == l_Players_0.LocalPlayer then
        v4[v10.UserId] = true;
        v8(v10);
    end;
end);
l_Players_0.PlayerAdded:Connect(function(v12) --[[ Line: 39 ]] --[[ Name: playeradded ]]
    if v4[v12.UserId] then
        v8(v12);
    end;
end);