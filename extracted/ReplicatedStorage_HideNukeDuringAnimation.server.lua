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