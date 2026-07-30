-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.Packages.Roact);
local l_ConfigurationContext_0 = require(script.Parent.Parent.Libraries.Configuration).ConfigurationContext;
local v3 = require(script.Parent.Parent.Libraries.TeleportToPlayer);
local v4 = require(script.Parent.CustomGui);
local l_withConfiguration_0 = l_ConfigurationContext_0.withConfiguration;
local l_BindableEvents_0 = script.Parent.Parent.BindableEvents;
local v7 = v1.Component:extend("FriendLocator");
local v8 = Color3.fromRGB(64, 182, 255);
local function _(v9) --[[ Line: 20 ]] --[[ Name: getRootPartFromPlayer ]]
    local v10 = v9 and v9.Character;
    return v10 and v10:FindFirstChild("HumanoidRootPart");
end;
v7.init = function(v12) --[[ Line: 25 ]] --[[ Name: init ]]
    v12.Players = v12.props.Players or l_Players_0;
    v12.onClick = function() --[[ Line: 28 ]] --[[ Name: onClick ]]
        local l_configuration_0 = v12.props.configuration;
        local l_LocalPlayer_0 = v12.Players.LocalPlayer;
        local l_PlayerByUserId_0 = v12.Players:GetPlayerByUserId(v12.props.userId);
        if l_configuration_0.teleportToFriend then
            v3.teleport(l_LocalPlayer_0, l_PlayerByUserId_0);
        end;
        local v16 = l_PlayerByUserId_0 and l_PlayerByUserId_0.Character;
        local v17 = v16 and v16:FindFirstChild("HumanoidRootPart");
        l_BindableEvents_0.FriendLocatorClicked:Fire(l_PlayerByUserId_0, v17.CFrame);
    end;
    v12.parent = v1.createRef();
end;
v7.render = function(v18) --[[ Line: 45 ]] --[[ Name: render ]]
    v18:_renderCustomGui();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v1.Ref] = v18.parent
    }, {
        ImageButton = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v1.Event.Activated] = v18.onClick
        }), 
        Content = not v18.props.customGui and v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Border = v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v8
            }, {
                Circle = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            Portrait = v1.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0.9, 0.9), 
                Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", v18.props.userId), 
                BackgroundColor3 = v8, 
                ZIndex = 2
            }, {
                Circle = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            Tail = v1.createElement("Frame", {
                Size = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.8535533905932737), 
                Rotation = 45, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v8
            })
        })
    });
end;
v7.didMount = function(v19) --[[ Line: 96 ]] --[[ Name: didMount ]]
    if v19.props.customGui then
        local v20 = v19.parent:getValue();
        v19.props.customGui.Parent = v20;
    end;
end;
v7._renderCustomGui = function(v21) --[[ Line: 104 ]] --[[ Name: _renderCustomGui ]]
    local l_customGui_0 = v21.props.customGui;
    if not l_customGui_0 then
        return;
    else
        local l_l_customGui_0_FirstChild_0 = l_customGui_0:FindFirstChild("Portrait", true);
        if l_l_customGui_0_FirstChild_0 and l_l_customGui_0_FirstChild_0:IsA("ImageLabel") then
            l_l_customGui_0_FirstChild_0.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", v21.props.userId);
        end;
        local l_l_customGui_0_FirstChild_1 = l_customGui_0:FindFirstChild("DisplayName", true);
        if l_l_customGui_0_FirstChild_1 and l_l_customGui_0_FirstChild_1:IsA("TextLabel") then
            l_l_customGui_0_FirstChild_1.Text = v21.Players:GetPlayerByUserId(v21.props.userId).DisplayName;
        end;
        return;
    end;
end;
return l_withConfiguration_0(v4("FriendLocator")(v7));