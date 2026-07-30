local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not require(game.ReplicatedStorage.Remotes).Function("AmIAdmin"):InvokeServer() then
    return;
else
    local l_UserInputService_0 = game:GetService("UserInputService");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local v4 = require(l_ReplicatedStorage_0.AdminUI.AdminPanel);
    local v5 = require(l_ReplicatedStorage_0.AdminUI.AdminLogs);
    local v6 = require(l_ReplicatedStorage_0.AdminUI.AdminBulkBan);
    local v7 = require(l_ReplicatedStorage_0.Packages.Fusion);
    local v8 = require(l_ReplicatedStorage_0.LoadOfflinePlayer);
    local v9 = require(l_ReplicatedStorage_0.Remotes);
    local v10 = v9.Function("GetAdminLogs");
    local v11 = v7.State(l_Players_0:GetPlayers());
    l_Players_0.PlayerAdded:Connect(function() --[[ Line: 27 ]]
        v11:set(l_Players_0:GetPlayers());
    end);
    l_Players_0.PlayerRemoving:Connect(function() --[[ Line: 30 ]]
        v11:set(l_Players_0:GetPlayers());
    end);
    local v12 = v7.State({});
    local v13 = v7.State({});
    local v14 = v7.State("None");
    local v15 = v7.Computed(function() --[[ Line: 39 ]]
        return v14:get() == "AdminPanel";
    end);
    local v16 = v7.Computed(function() --[[ Line: 43 ]]
        return v14:get() == "AdminLogs";
    end);
    local v17 = v7.Computed(function() --[[ Line: 47 ]]
        return v14:get() == "AdminBulkBan";
    end);
    local function v19(v18) --[[ Line: 51 ]] --[[ Name: requestAdminLogs ]]
        v12:set({});
        v12:set(v10:InvokeServer(v18));
        print(string.format("Loaded %i admin logs", #v12:get()));
    end;
    local function _() --[[ Line: 57 ]] --[[ Name: refreshLatestAdminLogs ]]
        local v20 = DateTime.now().UnixTimestampMillis / 1000;
        v13:set({
            current = v20
        });
        v19(v20);
    end;
    local function v24(v22, ...) --[[ Line: 65 ]]
        return (function(v23, ...) --[[ Line: 66 ]]
            if v23 then
                return nil, ...;
            else
                return ...;
            end;
        end)(pcall(v22, ...));
    end;
    v7.New("ScreenGui")({
        Name = "Admin", 
        Parent = l_LocalPlayer_0.PlayerGui, 
        DisplayOrder = 2, 
        [v7.Children] = {
            v4({
                Visible = v15, 
                Players = v11, 
                LoadBanStatus = function(v25) --[[ Line: 83 ]] --[[ Name: LoadBanStatus ]]
                    return v9.Function("CheckIfBanned"):InvokeServer(v25);
                end, 
                BanUser = function(v26, v27, v28) --[[ Line: 86 ]] --[[ Name: BanUser ]]
                    v9.Function("Ban"):InvokeServer(v26, v27, v28);
                end, 
                UnbanUser = function(v29) --[[ Line: 89 ]] --[[ Name: UnbanUser ]]
                    v9.Event("Unban"):FireServer(v29);
                end, 
                KickUser = function(v30) --[[ Line: 92 ]] --[[ Name: KickUser ]]
                    v9.Event("Kick"):FireServer(v30);
                end, 
                ViewBooth = function(v31) --[[ Line: 95 ]] --[[ Name: ViewBooth ]]
                    v8(v31);
                end, 
                JoinUserServer = function(v32) --[[ Line: 98 ]] --[[ Name: JoinUserServer ]]
                    v9.Event("JoinUserServer"):FireServer(v32);
				end, 
				SummonUserToServer = function(v32) --[[ Line: 98 ]] --[[ Name: JoinUserServer ]]
					v9.Event("SummonUserToServer"):FireServer(v32);
				end, 
                CheckUserInGame = function(v33) --[[ Line: 101 ]] --[[ Name: CheckUserInGame ]]
                    return v9.Function("CheckUserInGame"):InvokeServer(v33);
                end
            }), 
            v5({
                Visible = v16, 
                Logs = v12, 
                HasPrevious = v7.Computed(function() --[[ Line: 108 ]]
                    return v13:get().previous ~= nil;
                end), 
                OnRefresh = function() --[[ Line: 111 ]] --[[ Name: OnRefresh ]]
                    local v34 = DateTime.now().UnixTimestampMillis / 1000;
                    v13:set({
                        current = v34
                    });
                    v19(v34);
                end, 
                OnNext = function() --[[ Line: 114 ]] --[[ Name: OnNext ]]
                    local v35 = v12:get();
                    v13:set({
                        current = v35[#v35].timestamp, 
                        previous = v13:get()
                    });
                    v19(v13:get().current);
                end, 
                OnPrevious = function() --[[ Line: 122 ]] --[[ Name: OnPrevious ]]
                    table.remove(v13, #v13);
                    v13:set(v13:get().previous);
                    v19(v13:get().current);
                end
            }), 
            v6({
                Visible = v17, 
                BanUser = function(v36, v37) --[[ Line: 130 ]] --[[ Name: BanUser ]]
                    local v38, v39 = v24(function() --[[ Line: 131 ]]
                        return game.Players:GetUserIdFromNameAsync(v36);
                    end);
                    if v38 then
                        return (("Failed to get user id of %*: %*"):format(v36, v38));
                    else
                        local v40 = v24(function() --[[ Line: 137 ]]
                            v9.Function("Ban"):InvokeServer(v39, v37);
                        end);
                        if v40 then
                            return (("Failed to ban %*: %*"):format(v36, v40));
                        else
                            return (("Banned %* successfully"):format(v36));
                        end;
                    end;
                end
            })
        }
    });
    l_UserInputService_0.InputBegan:Connect(function(v41, v42) --[[ Line: 149 ]]
        if v42 then
            return;
        elseif v41.KeyCode == Enum.KeyCode.C and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
            if v14:get() == "AdminPanel" then
                v14:set("None");
                return;
            else
                v14:set("AdminPanel");
                return;
            end;
        elseif v41.KeyCode == Enum.KeyCode.L and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
            if v14:get() == "AdminLogs" then
                v14:set("None");
                return;
            else
                v14:set("AdminLogs");
                return;
            end;
        else
            if v41.KeyCode == Enum.KeyCode.B and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
                if v14:get() == "AdminLogs" then
                    v14:set("None");
                    return;
                else
                    v14:set("AdminLogs");
                end;
            end;
            return;
        end;
    end);
    l_LocalPlayer_0.PlayerGui:WaitForChild("ScreenGui");
    v7.Compat(v14):onChange(function() --[[ Line: 174 ]]
        if v14:get() == "AdminLogs" and #v12:get() == 0 then
            local v43 = DateTime.now().UnixTimestampMillis / 1000;
            v13:set({
                current = v43
            });
            v19(v43);
        end;
    end);
    l_LocalPlayer_0.PlayerGui.ScreenGui.NavigationButtons.Admin.Visible = true;
    local v44 = 0;
    l_LocalPlayer_0.PlayerGui.ScreenGui.NavigationButtons.Admin.Activated:Connect(function() --[[ Line: 186 ]]
        if v44 == 0 then
            v44 = v44 + 1;
            v14:set("AdminPanel");
            return;
        elseif v44 == 1 then
            v44 = v44 + 1;
            v14:set("None");
            return;
        elseif v44 == 2 then
            v44 = v44 + 1;
            v14:set("AdminBulkBan");
            return;
        elseif v44 == 3 then
            v44 = v44 + 1;
            v14:set("None");
            return;
        elseif v44 == 4 then
            v44 = v44 + 1;
            v14:set("AdminLogs");
            return;
        elseif v44 == 5 then
            v44 = 0;
            v14:set("None");
            return;
        else
            return;
        end;
    end);
    return;
end;