-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({}, v1));
end;
v1.GetCurrentText = function(_) --[[ Line: 26 ]] --[[ Name: GetCurrentText ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    local l___EnigmaPluginData_0 = l_ReplicatedStorage_0:FindFirstChild("__EnigmaPluginData");
    if not l___EnigmaPluginData_0 then
        return "";
    else
        return l___EnigmaPluginData_0.Value;
    end;
end;
return v1;