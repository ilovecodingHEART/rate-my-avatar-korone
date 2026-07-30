-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x32, pairs() wrap x10, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local v1 = require(game.ReplicatedStorage.Remotes);
local _ = l_Players_0.LocalPlayer;
local v3 = v1.Function("PDRewind"):InvokeServer();
local l_userid_0 = v3.userid;
local v5 = nil;
for _, v7 in pairs(v3.donations) --[[ 2021 ]] do
    if v7.donatorUserId == l_userid_0 and (v5 == nil or v7.donatedRobux > v5.donatedRobux) then
        print("we are setting the largest donation");
        v5 = v7;
    end;
end;
if v5 then
    print((("The largest donation you made is %s to @%s on %s"):format(v5.donatedRobux, v5.boothOwnerUsername, (v5.whenDonated:FormatLocalTime("LL", "en-us")))));
end;
local v8 = nil;
for _, v10 in pairs(v3.donations) --[[ 2021 ]] do
    if v10.boothOwnerUserId == l_userid_0 and (v8 == nil or v10.donatedRobux > v8.donatedRobux) then
        v8 = v10;
    end;
end;
if v8 then
    print((("The largest donation you received is %s from %s on %s"):format(v8.donatedRobux, v8.donatorUsername, (v8.whenDonated:FormatLocalTime("LL", "en-us")))));
end;
local v11 = {};
local v12 = {};
for _, v14 in pairs(v3.donations) --[[ 2021 ]] do
    local v15 = v14.whenDonated:FormatUniversalTime("LL", "en-us");
    if v14.donatorUserId == l_userid_0 then
        if v11[v15] == nil then
            v11[v15] = 0;
        end;
        v11[v15] = v11[v15] + v14.donatedRobux;
    else
        if v12[v15] == nil then
            v12[v15] = 0;
        end;
        v12[v15] = v12[v15] + v14.donatedRobux;
    end;
end;
local v16 = nil;
for v17 in pairs(v11) --[[ 2021 ]] do
    if v16 == nil or v11[v17] > v11[v16] then
        v16 = v17;
    end;
end;
if v16 then
    print((("The most Robux you donated in a day was %s on %s"):format(v11[v16], v16)));
end;
local v18 = nil;
for v19 in pairs(v12) --[[ 2021 ]] do
    if v18 == nil or v12[v19] > v12[v18] then
        v18 = v19;
    end;
end;
if v18 then
    print((("The most Robux you raised in a day was %s on %s"):format(v12[v18], v18)));
end;
local v20 = v3.thisyeardonated / v3.lastyeardonated;
if v20 > 1 then
    print((("You donated %s%% more robux than last year (%s -> %s)"):format(math.floor(v20 * 100 - 100), v3.lastyeardonated, v3.thisyeardonated)));
elseif v20 < 1 then
    print((("You donated %s%% less robux than last year (%s -> %s)"):format(math.floor(100 - v20 * 100), v3.lastyeardonated, v3.thisyeardonated)));
else
    print("You donated the same amount of robux as last year!");
end;
local v21 = v3.thisyearraised / v3.lastyearraised;
if v21 > 1 then
    print((("You raised %s%% more robux than last year (%s -> %s)"):format(math.floor(v21 * 100 - 100), v3.lastyearraised, v3.thisyearraised)));
elseif v21 < 1 then
    print((("You raised %s%% less robux than last year (%s -> %s)"):format(math.floor(100 - v21 * 100), v3.lastyearraised, v3.thisyearraised)));
else
    print("You raised the same amount of robux as last year!");
end;
local v22 = {};
local v23 = {};
for _, v25 in pairs(v3.donations) --[[ 2021 ]] do
    v22[v25.boothOwnerUserId] = true;
    v23[v25.donatorUserId] = true;
end;
local v26 = 0;
for _ in pairs(v22) --[[ 2021 ]] do
    v26 = v26 + 1;
end;
print((("You donated to %s unique players this year!"):format(v26)));
local v28 = 0;
for _ in pairs(v23) --[[ 2021 ]] do
    v28 = v28 + 1;
end;
print((("You received donations from %s unique players this year!"):format(v28)));
local v30 = {};
local v31 = {};
for _, v33 in pairs(v3.donations) --[[ 2021 ]] do
    if v33.boothOwnerUserId == l_userid_0 and v33.gamepassId then
        local v34 = v31[v33.gamepassId];
        if v34 == nil then
            v34 = {
                gamepassId = v33.gamepassId, 
                sales = 0, 
                earnings = 0
            };
            v31[v33.gamepassId] = v34;
            table.insert(v30, v34);
        end;
        v34.sales = v34.sales + 1;
        v34.earnings = v34.earnings + v33.donatedRobux;
    end;
end;
table.sort(v30, function(v35, v36) --[[ Line: 137 ]]
    return v35.sales > v36.sales;
end);
if #v30 > 0 then
    print((("The gamepass with most sales is %s with %s sales"):format(v30[1].gamepassId, v30[1].sales)));
end;
table.sort(v30, function(v37, v38) --[[ Line: 145 ]]
    return v37.earnings > v38.earnings;
end);
if #v30 > 0 then
    print((("The gamepass with most earnings is %s with %s robux"):format(v30[1].gamepassId, v30[1].earnings)));
end;
local v39 = {};
local v40 = {};
for _, v42 in pairs(v3.donations) --[[ 2021 ]] do
    if v42.boothOwnerUserId == l_userid_0 then
        local v43 = v40[v42.donatorUserId];
        if v43 == nil then
            v43 = {
                userId = v42.donatorUserId, 
                donations = 0, 
                donated = 0
            };
            v40[v42.donatorUserId] = v43;
            table.insert(v39, v43);
        end;
        v43.donations = v43.donations + 1;
        v43.donated = v43.donated + v42.donatedRobux;
    end;
end;
table.sort(v39, function(v44, v45) --[[ Line: 170 ]]
    return v44.donations > v45.donations;
end);
if #v39 > 0 then
    print((("You received the most donations from %s with %s donations"):format(v39[1].userId, v39[1].donations)));
end;
table.sort(v39, function(v46, v47) --[[ Line: 178 ]]
    return v46.donated > v47.donated;
end);
if #v39 > 0 then
    print((("You raised the most robux from %s with %s robux"):format(v39[1].userId, v39[1].donated)));
end;