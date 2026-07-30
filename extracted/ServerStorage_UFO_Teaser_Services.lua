-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

return {
    Players = game:GetService("Players"), 
    Lighting = game:GetService("Lighting"), 
    RunService = game:GetService("RunService"), 
    TweenService = game:GetService("TweenService"), 
    CollectionService = game:GetService("CollectionService"), 
    DebrisService = function(v0, v1) --[[ Line: 7 ]] --[[ Name: DebrisService ]]
        task.spawn(function() --[[ Line: 8 ]]
            -- upvalues: v1 (copy), v0 (copy)
            task.wait(v1);
            v0:Destroy();
        end);
    end, 
    PathFindingService = game:GetService("PathfindingService"), 
    ServerStorage = game:GetService("ServerStorage")
};