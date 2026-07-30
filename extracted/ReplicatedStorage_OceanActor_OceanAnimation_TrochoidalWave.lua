-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--!native
local v0 = {};
local l_new_0 = Vector3.new;
local l_zero_0 = Vector3.zero;
local l_Dot_0 = Vector2.zero.Dot;
local l_cos_0 = math.cos;
local l_sin_0 = math.sin;
v0.computeLocalTranslation = function(v6, v7, v8, v9, v10, v11) --[[ Line: 19 ]] --[[ Name: computeLocalTranslation ]]
    local v12 = v8 * l_Dot_0(v7, v6) + v11;
    local v13 = v10 * l_cos_0(v12);
    return (l_new_0(v13 * v7.X, v9 * l_sin_0(v12), v13 * v7.Y));
end;
v0.computeDisplacementOld = function(v14, v15, v16, v17, v18, v19) --[[ Line: 36 ]] --[[ Name: computeDisplacementOld ]]
    local l_l_zero_0_0 = l_zero_0;
    for v21, v22 in ipairs(v16) do
        local v23 = v17[v21];
        local v24 = v18[v21];
        local v25 = v15[v21];
        local v26 = v22 * l_Dot_0(v25, v14) + v19;
        local v27 = v24 * l_cos_0(v26);
        l_l_zero_0_0 = l_l_zero_0_0 + l_new_0(v27 * v25.X, v23 * l_sin_0(v26), v27 * v25.Y);
    end;
    return l_l_zero_0_0;
end;
v0.computeFrequency = function(v28) --[[ Line: 61 ]] --[[ Name: computeFrequency ]]
    return 2 / v28;
end;
v0.computeQ = function(v29, v30, v31, v32) --[[ Line: 65 ]] --[[ Name: computeQ ]]
    return v29 / (v31 * v32 * v30);
end;
v0.computeTimeAddend = function(v33, v34, v35) --[[ Line: 69 ]] --[[ Name: computeTimeAddend ]]
    return v34 * v33 * v35;
end;
v0.computeBaseFactor = function(v36, v37) --[[ Line: 73 ]] --[[ Name: computeBaseFactor ]]
    return v37 * v36;
end;
v0.computeDisplacement = function(v38, v39, v40, v41, v42, v43) --[[ Line: 77 ]] --[[ Name: computeDisplacement ]]
    local v44 = v40 * l_Dot_0(v39, v38) + v43;
    local v45 = v42 * l_cos_0(v44);
    return (l_new_0(v45 * v39.X, v41 * l_sin_0(v44), v45 * v39.Y));
end;
v0.computeTangentSpaceBasisVectorsSinCos = function(v46, v47, v48, v49) --[[ Line: 94 ]] --[[ Name: computeTangentSpaceBasisVectorsSinCos ]]
    local l_X_0 = v47.X;
    local l_Y_0 = v47.Y;
    local v52 = v48 * (l_X_0 * v46.X + l_Y_0 * v46.Z) + v49;
    local v53 = l_sin_0(v52);
    local v54 = l_cos_0(v52);
    return l_new_0(v53, -v54, v53), l_new_0(v53, -v54, v53), (l_new_0(v54, v53, v54));
end;
v0.computeSinCos = function(v55, v56, v57, v58) --[[ Line: 109 ]] --[[ Name: computeSinCos ]]
    local l_X_1 = v56.X;
    local l_Y_1 = v56.Y;
    local v61 = v57 * (l_X_1 * v55.X + l_Y_1 * v55.Z) + v58;
    return l_sin_0(v61), (l_cos_0(v61));
end;
v0.computeBinormalSinCos = function(v62, v63) --[[ Line: 121 ]] --[[ Name: computeBinormalSinCos ]]
    return (l_new_0(v62, -v63, v62));
end;
v0.computeNormalSinCos = function(v64, v65) --[[ Line: 125 ]] --[[ Name: computeNormalSinCos ]]
    return (l_new_0(v65, v64, v65));
end;
v0.computeTangentSinCos = function(v66, v67) --[[ Line: 129 ]] --[[ Name: computeTangentSinCos ]]
    return (l_new_0(v66, -v67, v66));
end;
v0.computeBinormalFactor = function(v68, v69, v70, v71) --[[ Line: 133 ]] --[[ Name: computeBinormalFactor ]]
    local v72 = v68 * v69;
    return (l_new_0(v72 * v69 * v71, v69 * v71, v72 * v70 * v71));
end;
v0.computeNormalFactor = function(v73, v74, v75, v76) --[[ Line: 147 ]] --[[ Name: computeNormalFactor ]]
    return (l_new_0(v74 * v76, v73 * v76, v75 * v76));
end;
v0.computeTangentFactor = function(v77, v78, v79, v80) --[[ Line: 160 ]] --[[ Name: computeTangentFactor ]]
    local v81 = v77 * v79;
    return (l_new_0(v81 * v78 * v80, v79 * v80, v81 * v79 * v80));
end;
v0.binormal = Vector3.xAxis;
v0.normal = Vector3.yAxis;
v0.tangent = Vector3.zAxis;
v0.computeBinormalAddend = function() --[[ Line: 178 ]] --[[ Name: computeBinormalAddend ]]

end;
local l_xAxis_0 = Vector3.xAxis;
v0.computeBinormalFromSum = function(v83) --[[ Line: 185 ]] --[[ Name: computeBinormalFromSum ]]
    return (l_xAxis_0 - v83) * Vector3.new(1, -1, 1, 0);
end;
local l_yAxis_0 = Vector3.yAxis;
v0.computeTangentFromSum = function(v85) --[[ Line: 192 ]] --[[ Name: computeTangentFromSum ]]
    return (l_yAxis_0 - v85) * Vector3.new(-1, 1, 1, 0);
end;
local l_zAxis_0 = Vector3.zAxis;
v0.computeNormalFromSum = function(v87) --[[ Line: 199 ]] --[[ Name: computeNormalFromSum ]]
    return (l_zAxis_0 - v87) * Vector3.new(-1, -1, 1, 0);
end;
v0.computeLocalTranslation2 = function(v88, v89, v90, v91, v92, v93) --[[ Line: 203 ]] --[[ Name: computeLocalTranslation2 ]]
    local v94 = v90 * l_Dot_0(v89, v88) + v93;
    local v95 = v92 * l_cos_0(v94);
    return (l_new_0(v95 * v89.X, v91 * l_sin_0(v94), v95 * v89.Y));
end;
v0.computeTangentSpaceBasisVectorAddends = function(v96, v97, v98, v99, v100, v101) --[[ Line: 220 ]] --[[ Name: computeTangentSpaceBasisVectorAddends ]]
    local l_X_2 = v97.X;
    local l_Y_2 = v97.Y;
    local v104 = v98 * l_Dot_0(v97, v96) + v101;
    local v105 = v99 * l_sin_0(v104);
    local v106 = v99 * l_cos_0(v104);
    return l_new_0(v100 * l_X_2 * l_X_2 * v105, l_X_2 * v106, v100 * l_X_2 * l_Y_2 * v105), l_new_0(l_X_2 * v106, v100 * v105, l_Y_2 * v106), (l_new_0(v100 * l_X_2 * l_Y_2 * v105, l_Y_2 * v106, v100 * l_Y_2 * l_Y_2 * v105));
end;
v0.getPosition = function(v107, v108, v109, v110, v111, v112, v113) --[[ Line: 253 ]] --[[ Name: getPosition ]]
    local v114 = 2 / v108;
    local v115 = v110 * 2 / v108;
    local v116 = v112 / (v114 * v109);
    local v117 = v114 * l_Dot_0(v111, v107) + v115 * v113;
    local v118 = v116 * v109 * l_cos_0(v117);
    return (l_new_0(v118 * v111.X, v109 * l_sin_0(v117), v118 * v111.Y));
end;
v0.getBinormal = function() --[[ Line: 275 ]] --[[ Name: getBinormal ]]

end;
v0.getNormal = function() --[[ Line: 279 ]] --[[ Name: getNormal ]]

end;
v0.getTangent = function() --[[ Line: 283 ]] --[[ Name: getTangent ]]

end;
return v0;