-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Packages.Roact);
local l_ConfigurationContext_0 = require(script.Parent.Parent.Libraries.Configuration).ConfigurationContext;
local l_FriendLocator_0 = require(script.Parent:WaitForChild("FriendLocator"));
local v5 = require(script.Parent.CustomGui);
local l_createElement_0 = v2.createElement;
local l_BindableEvents_0 = script.Parent.Parent.BindableEvents;
local l_withConfiguration_0 = l_ConfigurationContext_0.withConfiguration;
local v9 = v2.Component:extend("FriendBillboard");
v9.defaultProps = {
    isShown = false, 
    Players = l_Players_0, 
    camera = workspace.CurrentCamera
};
local function _(v10) --[[ Line: 21 ]] --[[ Name: getRootPartFromPlayer ]]
    local v11 = v10 and v10.Character;
    return v11 and v11:FindFirstChild("HumanoidRootPart");
end;
v9.init = function(v13) --[[ Line: 26 ]] --[[ Name: init ]]
    local l_PlayerByUserId_0 = v13.props.Players:GetPlayerByUserId(v13.props.userId);
    local v15 = {};
    local v16 = l_PlayerByUserId_0 and l_PlayerByUserId_0.Character;
    v15.adornee = v16 and v16:FindFirstChild("HumanoidRootPart");
    v13.state = v15;
    v13.characterConn = l_PlayerByUserId_0.CharacterAdded:Connect(function(v17) --[[ Line: 32 ]]
        v13:setState({
            adornee = v17:WaitForChild("HumanoidRootPart")
        });
    end);
    v13.getBillboardGuiSize = function() --[[ Line: 36 ]]
        if v13.props.customGui then
            local l_Size_0 = v13.props.customGui.Size;
            local l_X_0 = l_Size_0.X;
            local l_Y_0 = l_Size_0.Y;
            return UDim2.new(0, l_X_0.Offset, 0, l_Y_0.Offset);
        else
            return v13.props.configuration.locatorSize;
        end;
    end;
end;
v9.render = function(v21) --[[ Line: 48 ]] --[[ Name: render ]]
    local l_configuration_0 = v21.props.configuration;
    if not v21.props.isShown then
        return nil;
    else
        return l_createElement_0("BillboardGui", {
            Size = v21.getBillboardGuiSize(), 
            Adornee = v21.state.adornee, 
            SizeOffset = Vector2.new(0, 0.75), 
            StudsOffsetWorldSpace = Vector3.new(0, 1.5, 0, 0), 
            Active = true, 
            AlwaysOnTop = l_configuration_0.alwaysOnTop
        }, {
            FriendLocator = l_createElement_0(l_FriendLocator_0, {
                userId = v21.props.userId
            })
        });
    end;
end;
v9.didMount = function(v23) --[[ Line: 72 ]] --[[ Name: didMount ]]
    v23.previousDistance = nil;
    v23.heartbeatConn = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 76 ]]
        local l_adornee_0 = v23.state.adornee;
        local l_onDistanceChanged_0 = v23.props.onDistanceChanged;
        local l_camera_0 = v23.props.camera;
        if l_camera_0 and l_adornee_0 then
            local l_Magnitude_0 = (l_camera_0.CFrame.Position - l_adornee_0.Position).Magnitude;
            if l_Magnitude_0 ~= v23.previousDistance and l_onDistanceChanged_0 then
                l_onDistanceChanged_0(l_Magnitude_0);
            end;
            v23.previousDistance = l_Magnitude_0;
        end;
    end);
end;
v9.didUpdate = function(v28, v29) --[[ Line: 94 ]] --[[ Name: didUpdate ]]
    local l_isShown_0 = v28.props.isShown;
    if v29.isShown ~= l_isShown_0 then
        local l_adornee_1 = v28.state.adornee;
        local l_PlayerByUserId_1 = v28.props.Players:GetPlayerByUserId(v28.props.userId);
        (v28.props.visibilityChangedEvent or l_BindableEvents_0.FriendLocatorVisibilityChanged):Fire(l_PlayerByUserId_1, l_adornee_1.CFrame, l_isShown_0);
    end;
end;
v9.willUnmount = function(v33) --[[ Line: 107 ]] --[[ Name: willUnmount ]]
    if v33.characterConn then
        v33.characterConn:Disconnect();
        v33.characterConn = nil;
    end;
    if v33.heartbeatConn then
        v33.heartbeatConn:Disconnect();
        v33.heartbeatConn = nil;
    end;
end;
return l_withConfiguration_0(v5("FriendLocator")(v9));