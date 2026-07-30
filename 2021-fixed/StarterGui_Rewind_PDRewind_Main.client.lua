-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x38, pairs() wrap x7, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
local l_PDRewind_0 = l_PlayerGui_0.Rewind.PDRewind;
local l_RewindButton_0 = l_PDRewind_0.Parent.RewindButton;
local v6 = require(script.TextHandler);
local v7 = false;
local function _(v8, v9, v10, v11) --[[ Line: 13 ]] --[[ Name: tween ]]
    local v12 = TweenInfo.new(v9, v11 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(v8, v12, v10):Play();
end;
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 18 ]]
    local v14 = 50;
    for _, v16 in l_PDRewind_0:GetDescendants() do
        if v16:IsA("TextLabel") and v16.Name == "Word" and v16.Parent:IsA("Frame") then
            v16.TextSize = v16.Parent.AbsoluteSize.X / 13;
            v14 = v16.TextSize;
        end;
    end;
end);
local v17 = require(game.ReplicatedStorage.Remotes);
local _ = l_Players_0.LocalPlayer;
local v19 = v17.Function("PDRewind"):InvokeServer();
userid = v19.userid;
l_RewindButton_0.Visible = true;
getPlayerData = function(v20) --[[ Line: 38 ]] --[[ Name: getPlayerData ]]
    return {
        Username = l_Players_0:GetNameFromUserIdAsync(v20)
    };
end;
getProductInfo = function(v21) --[[ Line: 44 ]] --[[ Name: getProductInfo ]]
    return (l_MarketplaceService_0:GetProductInfo(v21, Enum.InfoType.GamePass));
end;
rewind = function() --[[ Line: 49 ]] --[[ Name: rewind ]]
    l_RewindButton_0.Visible = false;
    v7 = true;
    local v22 = math.floor(v19.percent * 1000000) / 10000;
    v6.display(-1, ("You donated \238\128\130%s Robux this year. That's more than %s%% of all donors (#%s of #%s). Making waves in the community."):format(v19.thisyeardonated, v22, v19.rank + 1, v19.count), "none");
    local v23 = nil;
    for _, v25 in pairs(v19.donations) --[[ 2021 ]] do
        if v25.donatorUserId == userid and (v23 == nil or v25.donatedRobux > v23.donatedRobux) then
            v23 = v25;
        end;
    end;
    if v23 then
        v6.display(-1, ("Your biggest flex this year? Dropping \238\128\130%s Robux on @%s back on %s. Absolutely iconic."):format(v23.donatedRobux, v23.boothOwnerUsername, (v23.whenDonated:FormatLocalTime("LL", "en-us"))), "none");
    end;
    local v26 = nil;
    for _, v28 in pairs(v19.donations) --[[ 2021 ]] do
        if v28.boothOwnerUserId == userid and (v26 == nil or v28.donatedRobux > v26.donatedRobux) then
            v26 = v28;
        end;
    end;
    if v26 then
        v6.display(-1, ("Biggest bag secured this year? \238\128\130%s Robux from @%s on %s. What a moment."):format(v26.donatedRobux, v26.donatorUsername, (v26.whenDonated:FormatLocalTime("LL", "en-us"))), "none");
    end;
    local v29 = {};
    for _, v31 in pairs(v19.donations) --[[ 2021 ]] do
        if v31.donatorUserId == userid then
            local v32 = v31.whenDonated:FormatUniversalTime("LL", "en-us");
            v29[v32] = (v29[v32] or 0) + v31.donatedRobux;
        end;
    end;
    local v33 = nil;
    for v34 in pairs(v29) do
        if v33 == nil or v29[v34] > v29[v33] then
            v33 = v34;
        end;
    end;
    if v33 then
        v6.display(0, ("The most Robux you donated in a single day was \238\128\130%s on %s. That's impressive..."):format(v29[v33], v33), "none");
    end;
    local v35 = {};
    for _, v37 in pairs(v19.donations) --[[ 2021 ]] do
        if v37.boothOwnerUserId == userid then
            local v38 = v37.whenDonated:FormatUniversalTime("LL", "en-us");
            v35[v38] = (v35[v38] or 0) + v37.donatedRobux;
        end;
    end;
    local v39 = nil;
    for v40 in pairs(v35) do
        if v39 == nil or v35[v40] > v35[v39] then
            v39 = v40;
        end;
    end;
    if v39 then
        v6.display(0, ("The most Robux you raised in a single day was \238\128\130%s on %s. A milestone worth celebrating."):format(v35[v39], v39), "none");
    end;
    local v41 = (v19.thisyeardonated or 0) / (v19.lastyeardonated or 0);
    if v41 > 1 then
        v6.display(1, ("You donated %s%% more Robux than last year (\238\128\130%s -> \238\128\130%s). Impressive growth."):format(math.floor(v41 * 100 - 100), v19.lastyeardonated, v19.thisyeardonated), "none");
    elseif v41 < 1 then
        v6.display(1, ("Bruh... You donated %s%% less Robux than last year (\238\128\130%s -> \238\128\130%s). Respectfully, step up your game."):format(math.floor(100 - v41 * 100), v19.lastyeardonated, v19.thisyeardonated), "none");
    else
        v6.display(1, "You donated the same amount of Robux as last year. Consistent as ever.", "none");
    end;
    local v42 = (v19.thisyearraised or 0) / (v19.lastyearraised or 0);
    if v42 > 1 then
        v6.display(1, ("You raised %s%% more Robux than last year (\238\128\130%s -> \238\128\130%s). Awesome!"):format(math.floor(v42 * 100 - 100), v19.lastyearraised, v19.thisyearraised), "none");
    elseif v42 < 1 then
        v6.display(1, ("You raised %s%% less Robux than last year (\238\128\130%s -> \238\128\130%s)... \240\159\146\128"):format(math.floor(100 - v42 * 100), v19.lastyearraised, v19.thisyearraised), "none");
    else
        v6.display(1, "D\195\169j\195\160 vu? You raised the exact same Robux as last year. Consistency king/queen \240\159\145\145!", "none");
    end;
    local v43 = {};
    local v44 = {};
    for _, v46 in pairs(v19.donations) --[[ 2021 ]] do
        v43[v46.boothOwnerUserId] = true;
        v44[v46.donatorUserId] = true;
    end;
    local v47 = 0;
    for _ in pairs(v43) do
        v47 = v47 + 1;
    end;
    v6.display(11, ("You donated to <b>%s</b> unique players this year. Sharing the love far and wide."):format(v47), "people");
    local v49 = 0;
    for _ in pairs(v44) do
        v49 = v49 + 1;
    end;
    v6.display(11, ("You received donations from <b>%s</b> unique players this year. The support is real."):format(v49), "people");
    local v51 = {};
    local v52 = {};
	for _, v54 in pairs(v19.donations) --[[ 2021 ]] do
		print(v54)
		if v54.boothOwnerUserId == userid and v54.gamepassId then
			print('Lets go saar')
            local v55 = v52[v54.gamepassId];
            if v55 == nil then
                v55 = {
                    gamepassId = v54.gamepassId, 
                    sales = 0, 
                    earnings = 0
                };
                v52[v54.gamepassId] = v55;
                table.insert(v51, v55);
            end;
            v55.sales = v55.sales + 1;
            v55.earnings = v55.earnings + v54.donatedRobux;
        end;
    end;
    if #v51 > 0 then
        table.sort(v51, function(v56, v57) --[[ Line: 174 ]]
            return v56.sales > v57.sales;
        end);
        script.Parent:FindFirstChild("2").IconFrame.Icon.Image = "rbxassetid://" .. getProductInfo(v51[1].gamepassId).IconImageAssetId;
        v6.display(2, ("Your most popular gamepass is %s with <b>%s</b> sales. A true crowd favorite."):format(getProductInfo(v51[1].gamepassId).Name, v51[1].sales), "none");
    end;
    if #v51 > 0 then
        table.sort(v51, function(v58, v59) --[[ Line: 181 ]]
            return v58.earnings > v59.earnings;
        end);
        script.Parent:FindFirstChild("2").IconFrame.Icon.Image = "rbxassetid://" .. getProductInfo(v51[1].gamepassId).IconImageAssetId;
        v6.display(2, ("Your top earner gamepass is %s with \238\128\130%s Robux in total earnings. Outstanding performance."):format(getProductInfo(v51[1].gamepassId).Name, v51[1].earnings), "none");
    end;
    local v60 = {};
    local v61 = {};
    for _, v63 in pairs(v19.donations) --[[ 2021 ]] do
        if v63.boothOwnerUserId == userid then
            local v64 = v61[v63.donatorUserId];
            if v64 == nil then
                v64 = {
                    userId = v63.donatorUserId, 
                    donations = 0, 
                    donated = 0
                };
                v61[v63.donatorUserId] = v64;
                table.insert(v60, v64);
            end;
            v64.donations = v64.donations + 1;
            v64.donated = v64.donated + v63.donatedRobux;
        end;
    end;
    if #v60 > 0 then
        table.sort(v60, function(v65, v66) --[[ Line: 203 ]]
            return v65.donations > v66.donations;
        end);
        script.Parent:FindFirstChild("3").IconFrame.Icon.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v60[1].userId .. "&width=420&height=420&format=png";
        v6.display(3, ("Your most dedicated donor is @%s with <b>%s</b> donations. Truly generous."):format(getPlayerData(v60[1].userId).Username, v60[1].donations), "none");
    end;
    if #v60 > 0 then
        table.sort(v60, function(v67, v68) --[[ Line: 210 ]]
            return v67.donated > v68.donated;
        end);
        script.Parent:FindFirstChild("3").IconFrame.Icon.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v60[1].userId .. "&width=420&height=420&format=png";
        v6.display(3, ("The donor who gave the most Robux is @%s with \238\128\130%s Robux. Incredible support."):format(getPlayerData(v60[1].userId).Username, v60[1].donated), "none");
    end;
    local v74, v75 = (function(v69, v70, _) --[[ Line: 217 ]] --[[ Name: getTitleAndDescription ]]
        if v69 == 0 and v70 == 0 then
            return "Professional Spectator", "No donations, no raises, just here to watch the chaos unfold.", 0;
        else
            local v72 = v70 > 0 and v69 / v70 or 1e999;
            local _ = nil;
            if v72 < 0.05 then
                return "The IRS", "You take more than you give, but somehow it\226\128\153s legal.", 1;
            elseif v72 < 0.1 then
                return "Greedy Gremlin", "A penny-pinching extraordinaire.", 2;
            elseif v72 < 0.2 then
                return "Donation Minimalist", "Giving just enough to stay on the nice list.", 3;
            elseif v72 < 0.5 then
                return "Generosity Rookie", "You\226\128\153re donating, but not enough to make the leaderboard. Baby steps!", 4;
            elseif v72 < 0.8 then
                return "Mid-Tier Philanthropist", "Walking the tightrope between broke and benevolent.", 6;
            elseif v72 <= 1.2 then
                return "Equity Enthusiast", "You\226\128\153ve mastered the art of balance.", 7;
            elseif v72 <= 5 then
                return "The Gift-Giver", "You're a year long Santa Claus!", 8;
            elseif v72 <= 7 then
                return "Big-Time Benefactor", "Dropping Robux like it\226\128\153s Monopoly money.", 9;
            elseif v72 <= 10 then
                return "Mythical Donor", "Even Roblox is impressed by your generosity...", 9;
            else
                return "Infinite Giver", "Your wallet defies even the laws of physics.", 10;
            end;
        end;
    end)(v19.thisyeardonated or 0, v19.thisyearraised or 0, v47);
    v6.display(4, ("Based on your Ratio this year, your title is . . . %s. %s"):format(v74, v75), "bold");
    l_RewindButton_0.Visible = true;
    l_RewindButton_0.Text = "EXIT REWIND";
end;
local v76 = false;
l_RewindButton_0.Activated:Connect(function() --[[ Line: 269 ]]
    game.SoundService.SFX.Click:Play();
    if not v7 then
        rewind();
        return;
    elseif v76 then
        return;
    else
        spawn(function() --[[ Line: 275 ]]
            for _, v78 in ipairs(game.SoundService.RewindMusic:GetChildren()) do
                if v78:IsA("Sound") and v78.Playing then
                    local v79 = {
                        Volume = 0
                    };
                    local v80 = TweenInfo.new(1, Enum.EasingStyle.Quint);
                    l_TweenService_0:Create(v78, v80, v79):Play();
                    v78:Stop();
                end;
            end;
        end);
        v76 = true;
        l_PlayerGui_0.TransitionGui.Transition.Position = UDim2.new(0, 0, 0, 0);
        local l_Transition_0 = l_PlayerGui_0.TransitionGui.Transition;
        local v82 = {
            Position = UDim2.new(0, 0, 1, 0)
        };
        local v83 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Transition_0, v83, v82):Play();
        task.wait(1);
        l_PlayerGui_0.Rewind.Enabled = false;
        l_PlayerGui_0.ScreenGui.Enabled = true;
        l_Transition_0 = l_PlayerGui_0.TransitionGui.Transition;
        v82 = {
            Position = UDim2.new(0, 0, 2, 0)
        };
        v83 = TweenInfo.new(1, Enum.EasingStyle.Quint);
        l_TweenService_0:Create(l_Transition_0, v83, v82):Play();
        task.wait(1);
        v76 = false;
        v7 = false;
        return;
    end;
end);
l_RewindButton_0.MouseEnter:Connect(function() --[[ Line: 297 ]]
    game.SoundService.SFX.Hover:Play();
end);
l_RewindButton_0.MouseButton1Down:Connect(function() --[[ Line: 301 ]]
    local l_UIScale_0 = l_RewindButton_0.UIScale;
    local v85 = {
        Scale = 0.9
    };
    local l_Back_0 = Enum.EasingStyle.Back;
    local v87 = TweenInfo.new(0.2, l_Back_0 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(l_UIScale_0, v87, v85):Play();
end);
l_RewindButton_0.MouseButton1Up:Connect(function() --[[ Line: 305 ]]
    local l_UIScale_1 = l_RewindButton_0.UIScale;
    local v89 = {
        Scale = 1
    };
    local l_Back_1 = Enum.EasingStyle.Back;
    local v91 = TweenInfo.new(0.5, l_Back_1 or Enum.EasingStyle.Quint);
    l_TweenService_0:Create(l_UIScale_1, v91, v89):Play();
end);