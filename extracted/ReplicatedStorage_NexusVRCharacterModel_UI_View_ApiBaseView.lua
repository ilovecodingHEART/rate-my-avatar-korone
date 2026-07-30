-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_NexusInstance_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local v3 = {};
v3.__index = v3;
v3.__new = function(v4, v5) --[[ Line: 25 ]] --[[ Name: __new ]]
    v4.Name = v5;
    v4.Destroyed = v4:CreateEvent();
    v4.Frame = Instance.new("Frame");
    v4.Frame.Name = tostring(v4.Name);
    v4.Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    v4.Frame.BackgroundTransparency = 1;
    v4.Frame.Size = UDim2.new(1, 0, 1, 0);
    v4.Frame.Visible = false;
    v4.Frame.SizeConstraint = Enum.SizeConstraint.RelativeXX;
    v4:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 36 ]]
        -- upvalues: v4 (copy)
        v4.Frame.Name = tostring(v4.Name);
    end);
    v4:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 39 ]]
        -- upvalues: v4 (copy)
        v4.Frame.Visible = v4.Visible;
    end);
end;
v3.GetContainer = function(v6) --[[ Line: 47 ]] --[[ Name: GetContainer ]]
    return v6.Frame;
end;
v3.AddBackground = function(v7) --[[ Line: 54 ]] --[[ Name: AddBackground ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0.05, 0);
    l_UICorner_0.Parent = v7.Frame;
    v7.Frame.BackgroundTransparency = 0.6 * l_GuiService_0.PreferredTransparency;
    l_GuiService_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 62 ]]
        -- upvalues: v7 (copy), l_GuiService_0 (ref)
        v7.Frame.BackgroundTransparency = 0.6 * l_GuiService_0.PreferredTransparency;
    end);
end;
v3.Destroy = function(v9) --[[ Line: 70 ]] --[[ Name: Destroy ]]
    v9.Destroyed:Fire();
    v9.Frame:Destroy();
end;
return (l_NexusInstance_0.ToInstance(v3));