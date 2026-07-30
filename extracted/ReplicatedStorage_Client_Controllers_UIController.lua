-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Roact_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Roact"));
local l_Players_0 = game:GetService("Players");
local l_UIRoot_0 = require(script.Parent.Parent:WaitForChild("UI"):WaitForChild("UIRoot"));
return {
    Init = function(_) --[[ Line: 9 ]] --[[ Name: Init ]]
        -- upvalues: l_Roact_0 (copy), l_UIRoot_0 (copy), l_Players_0 (copy)
        l_Roact_0.mount(l_Roact_0.createElement("ScreenGui", {}, {
            Frame = l_Roact_0.createElement(l_UIRoot_0)
        }), l_Players_0.LocalPlayer.PlayerGui);
    end
};