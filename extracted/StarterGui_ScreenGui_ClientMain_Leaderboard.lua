-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserService_0 = game:GetService("UserService");
local v2 = require(l_ReplicatedStorage_0.Roact);
local v3 = require(l_ReplicatedStorage_0.Packages.RoactHooks);
local v4 = require(l_ReplicatedStorage_0.Packages.Promise);
local v5 = require(l_ReplicatedStorage_0.NumberHelpers);
local function _(v6) --[[ Line: 10 ]] --[[ Name: avatarHeadshotThumbnail ]]
    return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=420&h=420", v6);
end;
local function v17(v8, v9) --[[ Line: 18 ]] --[[ Name: makeUserInfoLoaders ]]
    local v10 = nil;
    local v11 = {};
    for _, v13 in pairs(v8) do
        v11[v13] = function() --[[ Line: 22 ]]
            if v10 == nil then
                v10 = v4.try(function() --[[ Line: 24 ]]
                    if v9 then
                        v9();
                    end;
                    return l_UserService_0:GetUserInfosByUserIdsAsync(v8);
                end);
            end;
            return v10:andThen(function(v14) --[[ Line: 29 ]]
                for _, v16 in pairs(v14) do
                    if v16.Id == v13 then
                        return v16;
                    end;
                end;
            end);
        end;
    end;
    return v11;
end;
local v36 = v3.new(v2)(function(v18, v19) --[[ Line: 41 ]] --[[ Name: LeaderboardEntry ]]
    local v20, v21 = v19.useState("Loading");
    v19.useEffect(function() --[[ Line: 43 ]]
        local v23 = v18.loadUserInfo():andThen(function(v22) --[[ Line: 44 ]]
            v21(v22.Username);
        end);
        return function() --[[ Line: 47 ]]
            v23:cancel();
        end;
    end);
    local l_createElement_0 = v2.createElement;
    local v25 = "Frame";
    local v26 = {
        LayoutOrder = v18.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 26), 
        BackgroundTransparency = 1
    };
    local v27 = {};
    local l_createElement_1 = v2.createElement;
    local v29 = "Frame";
    local v30 = {
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(0, 1)
    };
    local v31 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 6)
        }), 
        Rank = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Text = "#" .. v18.rank, 
            TextColor3 = Color3.fromRGB(60, 60, 60), 
            TextSize = 16, 
            Size = UDim2.fromOffset(28, 0), 
            Font = Enum.Font.GothamBlack
        })
    };
    local l_createElement_2 = v2.createElement;
    local v33 = "ImageLabel";
    local v34 = {
        BackgroundTransparency = 0.9
    };
    local l_userId_0 = v18.userId;
    v34.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=420&h=420", l_userId_0);
    v34.Size = UDim2.fromOffset(24, 24);
    v34.LayoutOrder = 2;
    v31.Avatar = l_createElement_2(v33, v34, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Thickness = 1
        })
    });
    v31.Username = v2.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3, 
        Font = Enum.Font.GothamSemibold, 
        TextColor3 = Color3.fromRGB(100, 100, 100), 
        TextSize = 20, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = "@" .. v20
    });
    v27.User = l_createElement_1(v29, v30, v31);
    v27.Robux = v2.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.X, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.fromScale(0, 1), 
        BackgroundTransparency = 1, 
        Text = v5.formatCommas(v18.robux), 
        TextColor3 = Color3.fromRGB(6, 197, 25), 
        Font = Enum.Font.GothamBlack, 
        TextSize = 20
    });
    return l_createElement_0(v25, v26, v27);
end, {
    componentType = "PureComponent"
});
local function v38(v37) --[[ Line: 117 ]] --[[ Name: Divider ]]
    return v2.createElement("Frame", {
        BackgroundColor3 = Color3.new(0, 0, 0), 
        LayoutOrder = v37.layoutOrder, 
        BackgroundTransparency = 0.975, 
        Size = UDim2.new(1, 0, 0, 2), 
        BorderSizePixel = 0
    });
end;
return function(v39) --[[ Line: 127 ]]
    local v40 = {};
    for _, v42 in pairs(v39.leaderboard) do
        table.insert(v40, v42.userId);
    end;
    local v43 = v17(v40, function() --[[ Line: 132 ]]
        print(string.format("Getting user info for %i users", #v40));
    end);
    local v44 = {};
    for v45, v46 in pairs(v39.leaderboard) do
        v44[v46.userId] = v2.createElement(v36, {
            layoutOrder = v45 * 2, 
            rank = v45, 
            userId = v46.userId, 
            username = v46.userId, 
            robux = v46.robux, 
            loadUserInfo = v43[v46.userId]
        });
    end;
    for v47 = 1, #v39.leaderboard - 1 do
        v44["Line" .. v47] = v2.createElement(v38, {
            layoutOrder = v47 * 2 + 1
        });
    end;
    return v2.createFragment(v44);
end;