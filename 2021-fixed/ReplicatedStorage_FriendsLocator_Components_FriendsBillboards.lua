-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.Parent.Packages.Roact);
local v1 = require(script.Parent.Parent.Packages.Cryo);
local l_withConfiguration_0 = require(script.Parent.Parent.Libraries.Configuration).ConfigurationContext.withConfiguration;
local v3 = v0.Component:extend("FriendsBillboards");
v3.defaultProps = {
    Players = game:GetService("Players"), 
    selectUserIdsByDistance = require(script.Parent.Parent.Modules.selectUserIdsByDistance), 
    FriendBillboard = require(script.Parent:WaitForChild("FriendBillboard"))
};
v3.init = function(v4) --[[ Line: 15 ]] --[[ Name: init ]]
    v4.state = {
        userIds = {}, 
        distanceFromCamera = {}
    };
end;
v3.render = function(v5) --[[ Line: 22 ]] --[[ Name: render ]]
    local l_userIds_0 = v5.state.userIds;
    local l_distanceFromCamera_0 = v5.state.distanceFromCamera;
    local l_configuration_0 = v5.props.configuration;
    local l_selectUserIdsByDistance_0 = v5.props.selectUserIdsByDistance;
    local l_FriendBillboard_0 = v5.props.FriendBillboard;
    if not l_configuration_0.enabled then
        return nil;
    else
        local v11 = l_selectUserIdsByDistance_0(v1.Dictionary.keys(l_userIds_0), l_distanceFromCamera_0, l_configuration_0);
        local v12 = {};
        for _, v14 in ipairs(v11) do
            v12[v14] = true;
        end;
        local v15 = {};
        for v16, _ in pairs(v5.state.userIds) do
            v15[v16] = v0.createElement(l_FriendBillboard_0, {
                userId = v16, 
                isShown = v12[v16], 
                onDistanceChanged = function(v18) --[[ Line: 44 ]] --[[ Name: onDistanceChanged ]]
                    v5:setState({
                        distanceFromCamera = v1.Dictionary.join(l_distanceFromCamera_0, {
                            [v16] = v18
                        })
                    });
                end
            });
        end;
        return v0.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, v15);
    end;
end;
v3.didMount = function(v19) --[[ Line: 57 ]] --[[ Name: didMount ]]
    local l_Players_0 = v19.props.Players;
    l_Players_0.PlayerAdded:Connect(function(v21) --[[ Line: 60 ]]
        if v19:_shouldDisplay(v21) then
            v19:setState({
                userIds = v1.Dictionary.join(v19.state.userIds, {
                    [tostring(v21.UserId)] = true
                })
            });
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function(v22) --[[ Line: 69 ]]
        if v19.state.userIds[tostring(v22.UserId)] then
            v19:setState({
                userIds = v1.Dictionary.join(v19.state.userIds, {
                    [tostring(v22.UserId)] = v1.None
                })
            });
        end;
    end);
    v19:_updateFriendList();
end;
v3.didUpdate = function(v23, v24) --[[ Line: 82 ]] --[[ Name: didUpdate ]]
    if v23.props.configuration ~= v24.configuration then
        v23:_updateFriendList();
    end;
end;
v3._shouldDisplay = function(v25, v26) --[[ Line: 90 ]] --[[ Name: _shouldDisplay ]]
    local l_Players_1 = v25.props.Players;
    if v25.props.configuration.showAllPlayers then
        return v26 ~= l_Players_1.LocalPlayer;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 97 ]]
            return l_Players_1.LocalPlayer:IsFriendsWith(v26.UserId);
        end);
        return l_status_0 and l_result_0 or false;
    end;
end;
v3._updateFriendList = function(v30) --[[ Line: 104 ]] --[[ Name: _updateFriendList ]]
    local l_Players_2 = v30.props.Players;
    local v32 = {};
    for _, v34 in pairs(l_Players_2:GetChildren()) do
        if v30:_shouldDisplay(v34) then
            v32[tostring(v34.UserId)] = true;
        end;
    end;
    v30:setState({
        userIds = v32
    });
end;
return l_withConfiguration_0(v3);