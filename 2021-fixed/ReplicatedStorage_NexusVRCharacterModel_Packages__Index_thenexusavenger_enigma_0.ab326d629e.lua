-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 24 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        Index = 1, 
        Data = string.split(v1, "|")
    }, v0));
end;
v0.ReadString = function(v2) --[[ Line: 34 ]] --[[ Name: ReadString ]]
    local l_Index_0 = v2.Index;
    if not v2.Data[l_Index_0] then
        error("Reached end of serialized string.");
    end;
    v2.Index = v2.Index + 1;
    return v2.Data[l_Index_0];
end;
v0.ReadNumber = function(v4) --[[ Line: 44 ]] --[[ Name: ReadNumber ]]
    return (tonumber(v4:ReadString()));
end;
v0.ReadVector3 = function(v5) --[[ Line: 51 ]] --[[ Name: ReadVector3 ]]
    return (Vector3.new(v5:ReadNumber(), v5:ReadNumber(), v5:ReadNumber()));
end;
v0.ReadQuaternion = function(v6) --[[ Line: 58 ]] --[[ Name: ReadQuaternion ]]
    return {
        X = v6:ReadNumber(), 
        Y = v6:ReadNumber(), 
        Z = v6:ReadNumber(), 
        W = v6:ReadNumber()
    };
end;
return v0;