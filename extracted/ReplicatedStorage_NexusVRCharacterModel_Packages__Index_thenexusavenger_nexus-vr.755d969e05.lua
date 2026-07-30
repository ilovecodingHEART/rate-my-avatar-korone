-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_NexusInstance_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("NexusInstance"));
local l_BaseScreenGui_0 = require(script.Parent:WaitForChild("BaseScreenGui"));
local v2 = {
    ClassName = "ScreenGui2D"
};
v2.__index = v2;
setmetatable(v2, l_BaseScreenGui_0);
v2.__new = function(v3) --[[ Line: 20 ]] --[[ Name: __new ]]
    -- upvalues: l_BaseScreenGui_0 (copy)
    l_BaseScreenGui_0.__new(v3, Instance.new("ScreenGui"));
end;
v2.IsA = function(v4, v5) --[[ Line: 28 ]] --[[ Name: IsA ]]
    -- upvalues: l_BaseScreenGui_0 (copy)
    return l_BaseScreenGui_0.IsA(v4, v5) or v5 == "ScreenGui2D";
end;
return (l_NexusInstance_0.ToInstance(v2));