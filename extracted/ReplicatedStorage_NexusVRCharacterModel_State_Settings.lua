-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Parent_0 = script.Parent.Parent;
local l_TypedEvent_0 = require(l_Parent_0:WaitForChild("Packages"):WaitForChild("NexusInstance")).TypedEvent;
local v2 = {};
v2.__index = v2;
local v3 = nil;
v2.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        Defaults = {}, 
        Overrides = {}, 
        SettingsChangeEvents = {}, 
        SettingsCache = {}
    }, v2));
end;
v2.GetInstance = function() --[[ Line: 37 ]] --[[ Name: GetInstance ]]
    -- upvalues: v3 (ref), v2 (copy)
    if not v3 then
        v3 = v2.new();
    end;
    return v3;
end;
v2.GetSetting = function(v4, v5) --[[ Line: 47 ]] --[[ Name: GetSetting ]]
    if v4.SettingsCache[v5] ~= nil then
        return v4.SettingsCache[v5];
    else
        local l_Defaults_0 = v4.Defaults;
        local l_Overrides_0 = v4.Overrides;
        local v8 = string.split(v5, ".");
        for v9 = 1, #v8 - 1 do
            l_Defaults_0 = l_Defaults_0[v8[v9]] or {};
            l_Overrides_0 = l_Overrides_0[v8[v9]] or {};
        end;
        local v10 = l_Overrides_0[v8[#v8]];
        if v10 == nil then
            v10 = l_Defaults_0[v8[#v8]];
        end;
        v4.SettingsCache[v5] = v10;
        return v10;
    end;
end;
v2.SetSetting = function(v11, v12, v13) --[[ Line: 73 ]] --[[ Name: SetSetting ]]
    local l_Overrides_1 = v11.Overrides;
    local v15 = string.split(v12, ".");
    for v16 = 1, #v15 - 1 do
        if not l_Overrides_1[v15[v16]] then
            l_Overrides_1[v15[v16]] = {};
        end;
        l_Overrides_1 = l_Overrides_1[v15[v16]];
    end;
    l_Overrides_1[v15[#v15]] = v13;
    v11.SettingsCache[v12] = v13;
    local v17 = v11.SettingsChangeEvents[string.lower(v12)];
    if v17 then
        v17:Fire();
    end;
end;
v2.SetDefaults = function(v18, v19) --[[ Line: 96 ]] --[[ Name: SetDefaults ]]
    v18.Defaults = v19;
    v18.SettingsCache = {};
    for _, v21 in v18.SettingsChangeEvents do
        v21:Fire();
    end;
end;
v2.SetOverrides = function(v22, v23) --[[ Line: 110 ]] --[[ Name: SetOverrides ]]
    v22.Overrides = v23;
    v22.SettingsCache = {};
    for _, v25 in v22.SettingsChangeEvents do
        v25:Fire();
    end;
end;
v2.GetSettingsChangedSignal = function(v26, v27) --[[ Line: 124 ]] --[[ Name: GetSettingsChangedSignal ]]
    -- upvalues: l_TypedEvent_0 (copy)
    v27 = string.lower(v27);
    if not v26.SettingsChangeEvents[v27] then
        v26.SettingsChangeEvents[v27] = l_TypedEvent_0.new();
    end;
    return v26.SettingsChangeEvents[v27];
end;
v2.Destroy = function(v28) --[[ Line: 139 ]] --[[ Name: Destroy ]]
    for _, v30 in v28.SettingsChangeEvents do
        v30:Destroy();
    end;
    v28.SettingsChangeEvents = {};
end;
return v2;