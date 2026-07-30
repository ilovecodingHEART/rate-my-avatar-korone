-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_round
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no math.round on this client; rounds half away from zero, like the real one
local function __2021_round(vn)
	return vn >= 0 and math.floor(vn + 0.5) or math.ceil(vn - 0.5)
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v2 = {
    snapToScale = function(v0, v1) --[[ Line: 3 ]] --[[ Name: snapToScale ]]
        return (math.clamp(__2021_round(v0 / v1) * v1, 0, 1));
    end
};
lerp = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: lerp ]]
    return (1 - v5) * v3 + v5 * v4;
end;
v2.map = function(v6, v7, v8, v9, v10, v11) --[[ Line: 11 ]] --[[ Name: map ]]
    local v12 = lerp(v9, v10, v2.getAlphaBetween(v7, v8, v6));
    if not v11 then
        return v12;
    else
        if v9 < v10 then
            local l_v10_0 = v10;
            v10 = v9;
            v9 = l_v10_0;
        end;
        return (math.max(math.min(v12, v9), v10));
    end;
end;
v2.getNewPosition = function(v14) --[[ Line: 24 ]] --[[ Name: getNewPosition ]]
    local v15 = v14._data.Button.AbsoluteSize[v14._config.Axis];
    local v16 = v14._holder.AbsoluteSize[v14._config.Axis];
    local v17 = v14._data.Button.AnchorPoint[v14._config.Axis];
    local v18 = v14._config.Padding / v16;
    local v19 = v17 * v15 / v16 + v18;
    local v20 = 2 * v15 * v17 - v15;
    local v21 = 1 - v19 + v20 / v16;
    local v22 = v2.map(v14._data._percent, 0, 1, v19, v21, true);
    if v14._config.Axis == "X" then
        return (UDim2.fromScale(v22, v14._data.Button.Position.Y.Scale));
    else
        return (UDim2.fromScale(v14._data.Button.Position.X.Scale, v22));
    end;
end;
v2.getScaleIncrement = function(v23) --[[ Line: 43 ]] --[[ Name: getScaleIncrement ]]
    return 1 / ((v23._config.SliderData.End - v23._config.SliderData.Start) / v23._config.SliderData.Increment);
end;
v2.getAlphaBetween = function(v24, v25, v26) --[[ Line: 47 ]] --[[ Name: getAlphaBetween ]]
    return (v26 - v24) / (v25 - v24);
end;
v2.getNewValue = function(v27) --[[ Line: 51 ]] --[[ Name: getNewValue ]]
    local v28 = lerp(v27._config.SliderData.Start, v27._config.SliderData.End, v27._data._percent);
    local v29 = 1 / v27._config.SliderData.Increment;
    return __2021_round(v28 * v29) / v29;
end;
return v2;