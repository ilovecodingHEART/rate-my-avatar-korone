-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = Color3.fromRGB(-30, -30, -30);
local l_Button_0 = require(script.Parent.Parent:WaitForChild("Button"));
local v2 = {};
v2.__index = v2;
v2.AddColor3 = function(v3, v4) --[[ Line: 20 ]] --[[ Name: AddColor3 ]]
    return Color3.new(math.clamp(v3.R + v4.R, 0, 1), math.clamp(v3.G + v4.G, 0, 1), (math.clamp(v3.B + v4.B, 0, 1)));
end;
v2.CreateDefault = function(v5) --[[ Line: 28 ]] --[[ Name: CreateDefault ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v6 = v2.new();
    v6:SetDefault("BackgroundColor3", v5);
    v6:SetDefault("BorderColor3", v2.AddColor3(v5, v0));
    v6:SetDefault("BorderTransparency", 0.25);
    return v6;
end;
v2.new = function() --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        Defaults = {}
    }, v2));
end;
v2.Create = function(v7) --[[ Line: 53 ]] --[[ Name: Create ]]
    -- upvalues: l_Button_0 (copy)
    local v8 = l_Button_0.new();
    for v9, v10 in v7.Defaults do
        v8[v9] = v10;
    end;
    return v8;
end;
v2.SetDefault = function(v11, v12, v13) --[[ Line: 69 ]] --[[ Name: SetDefault ]]
    v11.Defaults[v12] = v13;
end;
v2.UnsetDefault = function(v14, v15) --[[ Line: 76 ]] --[[ Name: UnsetDefault ]]
    v14.Defaults[v15] = nil;
end;
return v2;