-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

_G.__DEV__ = true;
local l_CharmSync_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("CharmSync"));
local l_atoms_0 = require(script.Parent.Parent:WaitForChild("Common"):WaitForChild("atoms"));
local l_remotes_0 = require(script.Parent:WaitForChild("remotes"));
for _, v4 in (game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("Controllers"):GetChildren()) do
    require(v4):Init();
end;
local v5 = l_CharmSync_0.client({
    atoms = l_atoms_0, 
    ignoreUnhydrated = true
});
l_remotes_0.SyncState.On(function(v6) --[[ Line: 20 ]]
    -- upvalues: v5 (copy)
    v5:sync(v6);
end);
l_remotes_0.RequestState.Fire();