-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    MapRoot = CFrame.new(166.436, 1.585, 307.589), 
    DefaultLighting = {
        lighting = script.DefaultLighting.Lighting:GetAttributes(), 
        atmosphere = script.DefaultLighting.Atmosphere:GetAttributes(), 
        objects = script.DefaultLighting.Objects:GetChildren()
    }, 
    Ocean = {
        workspace:WaitForChild("TestPlane").Plane, 
        workspace:WaitForChild("TestPlane").Plane.CFrame
    }, 
    BoothFolder = workspace:WaitForChild("BoothModels")
};