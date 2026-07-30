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