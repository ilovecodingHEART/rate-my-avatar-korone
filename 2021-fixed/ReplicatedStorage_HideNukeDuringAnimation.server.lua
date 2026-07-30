-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

workspace.ChildAdded:Connect(function(v0) --[[ Line: 1 ]]
    if v0.Name == "RobuxNuke" then
        workspace.Map.NukeIsland.Nuke.Transparency = 1;
    end;
end);
workspace.ChildRemoved:Connect(function(v1) --[[ Line: 6 ]]
    if v1.Name == "RobuxNuke" then
        workspace.Map.NukeIsland.Nuke.Transparency = 0;
    end;
end);