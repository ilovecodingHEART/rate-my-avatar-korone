-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_BaseScreenGui_0 = require(script:WaitForChild("Container"):WaitForChild("BaseScreenGui"));
local l_ScreenGui_0 = require(script:WaitForChild("Container"):WaitForChild("ScreenGui"));
local l_ScreenGui2D_0 = require(script:WaitForChild("Container"):WaitForChild("ScreenGui2D"));
local l_ScreenGui3D_0 = require(script:WaitForChild("Container"):WaitForChild("ScreenGui3D"));
local l_PartUtility_0 = require(script:WaitForChild("Utility"):WaitForChild("PartUtility"));
return {
    BaseScreenGui = l_BaseScreenGui_0, 
    ScreenGui = l_ScreenGui_0, 
    ScreenGui2D = l_ScreenGui2D_0, 
    ScreenGui3D = l_ScreenGui3D_0, 
    PartUtility = l_PartUtility_0, 
    GetResource = function(_, v6) --[[ Line: 30 ]] --[[ Name: GetResource ]]
        local l_script_0 = script;
        for _, v9 in string.split(v6, ".") do
            l_script_0 = l_script_0[v9];
        end;
        return (require(l_script_0));
    end
};