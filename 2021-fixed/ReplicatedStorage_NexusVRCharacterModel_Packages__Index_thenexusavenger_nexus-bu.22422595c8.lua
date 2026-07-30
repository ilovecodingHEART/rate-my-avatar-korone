-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x3, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    Xbox = {
        ButtonA = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(95, 95), 
            Offset = Vector2.new(318, 416)
        }, 
        ButtonB = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(95, 95), 
            Offset = Vector2.new(520, 522)
        }, 
        ButtonX = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(95, 95), 
            Offset = Vector2.new(510, 416)
        }, 
        ButtonY = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(95, 95), 
            Offset = Vector2.new(616, 318)
        }, 
        DPadUp = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(616, 530)
        }, 
        DPadDown = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(212, 522)
        }, 
        DPadLeft = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(318, 522)
        }, 
        DPadRight = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(212, 416)
        }, 
        ButtonSelect = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(95, 95), 
            Offset = Vector2.new(424, 522)
        }, 
        ButtonLB = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(115, 64), 
            Offset = Vector2.new(116, 628)
        }, 
        ButtonRB = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(115, 64), 
            Offset = Vector2.new(0, 628)
        }, 
        ButtonLT = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 115), 
            Offset = Vector2.new(616, 0)
        }, 
        ButtonRT = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 115), 
            Offset = Vector2.new(616, 414)
        }, 
        ButtonLS = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(0, 522)
        }, 
        ButtonRS = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(0, 416)
        }, 
        Thumbstick1 = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(616, 116)
        }, 
        Thumbstick2 = {
            Image = "rbxassetid://408444495", 
            Size = Vector2.new(105, 105), 
            Offset = Vector2.new(106, 522)
        }
    }, 
    PlayStation = {
        ButtonCross = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(0, 0)
        }, 
        ButtonCircle = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(58, 0)
        }, 
        ButtonSquare = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(116, 0)
        }, 
        ButtonTriangle = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(0, 58)
        }, 
        ButtonL1 = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(58, 58)
        }, 
        ButtonR1 = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(116, 58)
        }, 
        ButtonL2 = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(0, 116)
        }, 
        ButtonR2 = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(58, 116)
        }, 
        ButtonTouchpad = {
            Image = "rbxassetid://15530886548", 
            Size = Vector2.new(58, 58), 
            Offset = Vector2.new(116, 116)
        }
    }
};
v0.Default = v0.Xbox;
v0.Default.ButtonL1 = v0.Xbox.ButtonLB;
v0.Default.ButtonR1 = v0.Xbox.ButtonRB;
v0.Default.ButtonL2 = v0.Xbox.ButtonLT;
v0.Default.ButtonR2 = v0.Xbox.ButtonRT;
v0.Default.ButtonL3 = v0.Xbox.ButtonLS;
v0.Default.ButtonR3 = v0.Xbox.ButtonRS;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_NexusInstance_0 = require(script.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_ThemedFrame_0 = require(script.Parent:WaitForChild("ThemedFrame"));
local l_SimpleWrappedInstance_0 = require(script.Parent:WaitForChild("SimpleWrappedInstance"));
local v5 = {};
v5.__index = v5;
setmetatable(v5, l_ThemedFrame_0);
local v6 = {};
v5.ResolveImage = function(v7) --[[ Line: 188 ]] --[[ Name: ResolveImage ]]
    -- upvalues: l_UserInputService_0 (copy), v0 (copy), v6 (copy)
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v7);
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v7);
    for v10, v11 in pairs(v0) --[[ 2021 ]] do
        if string.find(string.lower(l_l_UserInputService_0_ImageForKeyCode_0), string.lower(v10)) and v11[l_l_UserInputService_0_StringForKeyCode_0] then
            return v11[l_l_UserInputService_0_StringForKeyCode_0];
        end;
    end;
    if v0.Default[l_l_UserInputService_0_StringForKeyCode_0] then
        return v0.Default[l_l_UserInputService_0_StringForKeyCode_0];
    else
        if not v6[l_l_UserInputService_0_StringForKeyCode_0] then
            warn((("No override exists for %s (from %s) with %s. Returning default image."):format(l_l_UserInputService_0_StringForKeyCode_0, v7.Name, l_l_UserInputService_0_ImageForKeyCode_0)));
            v6[l_l_UserInputService_0_StringForKeyCode_0] = true;
        end;
        return {
            Image = l_l_UserInputService_0_ImageForKeyCode_0, 
            Size = Vector2.zero, 
            Offset = Vector2.zero, 
            Color = Color3.fromRGB(60, 60, 60)
        };
    end;
end;
v5.__new = function(v12) --[[ Line: 221 ]] --[[ Name: __new ]]
    -- upvalues: l_ThemedFrame_0 (copy), l_UserInputService_0 (copy)
    l_ThemedFrame_0.__new(v12);
    v12.SubTheme = "GamepadIconBackground";
    v12:DisableChangeReplication("IconScale");
    v12.IconScale = 0.9;
    v12:DisableChangeReplication("Icon");
    v12:DisableChangeReplication("IconUIScale");
    v12:DisableChangeReplication("KeyCode");
    v12:DisableChangeReplication("EventConnections");
    v12.EventConnections = {};
    table.insert(v12.EventConnections, l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 235 ]]
        -- upvalues: v12 (copy)
        v12:UpdateVisibility();
    end));
    table.insert(v12.EventConnections, l_UserInputService_0.GamepadDisconnected:Connect(function() --[[ Line: 238 ]]
        -- upvalues: v12 (copy)
        v12:UpdateVisibility();
    end));
    v12:DisableChangeReplication("IconVisible");
    v12.IconVisible = false;
    v12:UpdateVisibility();
end;
v5.UpdateVisibility = function(v13) --[[ Line: 251 ]] --[[ Name: UpdateVisibility ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v13.Icon then
        v13.Visible = false;
        v13.IconVisible = false;
        return;
    else
        local v14 = #l_UserInputService_0:GetConnectedGamepads() ~= 0;
        v13.Visible = v14;
        v13.IconVisible = v14;
        return;
    end;
end;
v5.SetIcon = function(v15, v16) --[[ Line: 270 ]] --[[ Name: SetIcon ]]
    if v16 == nil then
        v15.KeyCode = nil;
        if v15.Icon then
            v15.Icon:Destroy();
            v15.Icon = nil;
        end;
        v15:UpdateVisibility();
        return;
    else
        if type(v16) == "string" then
            v16 = Enum.KeyCode[v16];
        end;
        if v15.Icon then
            v15.Icon:Destroy();
        end;
        local v17 = v15.ResolveImage(v16);
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
        if v17.Size.X > v17.Size.Y then
            l_ImageLabel_0.Size = UDim2.new(1, 0, v17.Size.Y / v17.Size.X, 0);
        elseif v17.Size.X < v17.Size.Y then
            l_ImageLabel_0.Size = UDim2.new(v17.Size.X / v17.Size.Y, 0, 1, 0);
        else
            l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
        end;
        l_ImageLabel_0.ZIndex = v15.ZIndex;
        l_ImageLabel_0.Image = v17.Image;
        l_ImageLabel_0.ImageRectSize = v17.Size;
        l_ImageLabel_0.ImageRectOffset = v17.Offset;
        l_ImageLabel_0.ImageColor3 = v17.Color or Color3.fromRGB(255, 255, 255);
        l_ImageLabel_0.Parent = v15:GetWrappedInstance();
        local l_UIScale_0 = Instance.new("UIScale");
        l_UIScale_0.Scale = v15.IconScale or 1;
        l_UIScale_0.Parent = l_ImageLabel_0;
        v15.IconUIScale = l_UIScale_0;
        v15.Icon = l_ImageLabel_0;
        v15.KeyCode = v16;
        v15:UpdateVisibility();
        return;
    end;
end;
v5.SetScale = function(v20, v21) --[[ Line: 325 ]] --[[ Name: SetScale ]]
    v20.IconScale = v21;
    if v20.IconUIScale then
        v20.IconUIScale.Scale = v21;
    end;
end;
v5.Destroy = function(v22) --[[ Line: 335 ]] --[[ Name: Destroy ]]
    -- upvalues: l_SimpleWrappedInstance_0 (copy)
    l_SimpleWrappedInstance_0.Destroy(v22);
    for _, v24 in pairs(v22.EventConnections) --[[ 2021 ]] do
        v24:Disconnect();
    end;
    v22.EventConnections = {};
end;
return (l_NexusInstance_0.ToInstance(v5));