-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Types);
return require(script.Utility.restrictRead)("Fusion", {
    New = require(script.Instances.New), 
    Children = require(script.Instances.Children), 
    OnEvent = require(script.Instances.OnEvent), 
    OnChange = require(script.Instances.OnChange), 
    State = require(script.State.State), 
    Computed = require(script.State.Computed), 
    ComputedPairs = require(script.State.ComputedPairs), 
    Compat = require(script.State.Compat), 
    Tween = require(script.Animation.Tween), 
    Spring = require(script.Animation.Spring)
});