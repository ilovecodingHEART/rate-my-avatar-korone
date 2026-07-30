-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Roact_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Roact"));
return function(v1) --[[ Line: 3 ]] --[[ Name: Group ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v1[l_Roact_0.Children]);
end;