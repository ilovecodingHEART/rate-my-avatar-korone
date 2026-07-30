-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Parent.CameraShakeInstance);
local v17 = {
    Bump = function() --[[ Line: 26 ]] --[[ Name: Bump ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(2.5, 4, 0.1, 0.75);
        v1.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v1.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v1;
    end, 
    Explosion = function() --[[ Line: 36 ]] --[[ Name: Explosion ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new(5, 10, 0, 1.5);
        v2.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v2.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v2;
    end, 
    Earthquake = function() --[[ Line: 46 ]] --[[ Name: Earthquake ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new(0.6, 3.5, 2, 10);
        v3.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v3.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v3;
    end, 
    BadTrip = function() --[[ Line: 56 ]] --[[ Name: BadTrip ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(10, 0.15, 5, 10);
        v4.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
        v4.RotationInfluence = Vector3.new(2, 1, 4, 0);
        return v4;
    end, 
    HandheldCamera = function() --[[ Line: 66 ]] --[[ Name: HandheldCamera ]]
        -- upvalues: v0 (copy)
        local v5 = v0.new(1, 0.25, 5, 10);
        v5.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v5.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v5;
    end, 
    Vibration = function() --[[ Line: 76 ]] --[[ Name: Vibration ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new(0.4, 27, 2, 2);
        v6.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        v6.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
        return v6;
    end, 
    RoughDriving = function() --[[ Line: 86 ]] --[[ Name: RoughDriving ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new(1, 2, 1, 1);
        v7.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v7.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v7;
    end, 
    SmallMeteorStrike = function() --[[ Line: 93 ]] --[[ Name: SmallMeteorStrike ]]
        -- upvalues: v0 (copy)
        local v8 = v0.new(3, 45, 0.02, 1);
        v8.PositionInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
        v8.RotationInfluence = Vector3.new(2, 1, 1, 0);
        return v8;
    end, 
    MeteorStrike = function() --[[ Line: 100 ]] --[[ Name: MeteorStrike ]]
        -- upvalues: v0 (copy)
        local v9 = v0.new(6, 65, 0.02, 1);
        v9.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v9.RotationInfluence = Vector3.new(2, 1, 1, 0);
        return v9;
    end, 
    TsunamiWave = function() --[[ Line: 107 ]] --[[ Name: TsunamiWave ]]
        -- upvalues: v0 (copy)
        local v10 = v0.new(0.85, 10, 0.25, 2);
        v10.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v10.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v10;
    end, 
    TsunamiWaveIncoming = function() --[[ Line: 114 ]] --[[ Name: TsunamiWaveIncoming ]]
        -- upvalues: v0 (copy)
        local v11 = v0.new(1.5, 35, 0.25, 2);
        v11.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v11.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v11;
    end, 
    PresentHitWater = function() --[[ Line: 121 ]] --[[ Name: PresentHitWater ]]
        -- upvalues: v0 (copy)
        local v12 = v0.new(5, 45, 0.25, 4);
        v12.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v12.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v12;
    end, 
    CrystalCharging = function() --[[ Line: 128 ]] --[[ Name: CrystalCharging ]]
        -- upvalues: v0 (copy)
        local v13 = v0.new(0.5, 15, 0.25, 2);
        v13.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v13.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v13;
    end, 
    CrystalExplode = function() --[[ Line: 135 ]] --[[ Name: CrystalExplode ]]
        -- upvalues: v0 (copy)
        local v14 = v0.new(5, 65, 0.25, 2);
        v14.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v14.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v14;
    end, 
    CrystalStorm = function() --[[ Line: 142 ]] --[[ Name: CrystalStorm ]]
        -- upvalues: v0 (copy)
        local v15 = v0.new(2, 25, 0.25, 2);
        v15.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v15.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v15;
    end, 
    CrystalStormPeak = function() --[[ Line: 149 ]] --[[ Name: CrystalStormPeak ]]
        -- upvalues: v0 (copy)
        local v16 = v0.new(3, 100, 0.25, 2);
        v16.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v16.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v16;
    end
};
return (setmetatable({}, {
    __index = function(_, v19) --[[ Line: 159 ]] --[[ Name: __index ]]
        -- upvalues: v17 (copy)
        local v20 = v17[v19];
        if type(v20) == "function" then
            return v20();
        else
            error("No preset found with index \"" .. v19 .. "\"");
            return;
        end;
    end
}));