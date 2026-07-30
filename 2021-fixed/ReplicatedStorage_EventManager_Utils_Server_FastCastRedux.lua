-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    DebugLogging = false, 
    VisualizeCasts = false
};
v0.__index = v0;
v0.__type = "FastCast";
v0.HighFidelityBehavior = {
    Default = 1, 
    Always = 3
};
local v1 = require(script.ActiveCast);
local v2 = require(script.Signal);
local _ = require(script.Table);
local _ = require(script.TypeDefinitions);
v1.SetStaticFastCastReference(v0);
v0.new = function() --[[ Line: 107 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy)
    return (setmetatable({
        LengthChanged = v2.new("LengthChanged"), 
        RayHit = v2.new("RayHit"), 
        RayPierced = v2.new("RayPierced"), 
        CastTerminating = v2.new("CastTerminating"), 
        WorldRoot = workspace
    }, v0));
end;
v0.newBehavior = function() --[[ Line: 119 ]] --[[ Name: newBehavior ]]
    -- upvalues: v0 (copy)
    return {
        RaycastParams = nil, 
        Acceleration = Vector3.new(), 
        MaxDistance = 1000, 
        CanPierceFunction = nil, 
        HighFidelityBehavior = v0.HighFidelityBehavior.Default, 
        HighFidelitySegmentSize = 0.5, 
        CosmeticBulletTemplate = nil, 
        CosmeticBulletProvider = nil, 
        CosmeticBulletContainer = nil, 
        AutoIgnoreContainer = true
    };
end;
local v5 = v0.newBehavior();
v0.Fire = function(v6, v7, v8, v9, v10) --[[ Line: 136 ]] --[[ Name: Fire ]]
    -- upvalues: v5 (copy), v1 (copy)
    if v10 == nil then
        v10 = v5;
    end;
    local v11 = v1.new(v6, v7, v8, v9, v10);
    v11.RayInfo.WorldRoot = v6.WorldRoot;
    return v11;
end;
return v0;