-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
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