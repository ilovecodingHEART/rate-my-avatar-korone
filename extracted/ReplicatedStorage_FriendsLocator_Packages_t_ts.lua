-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = typeof or type;
local function _(v1) --[[ Line: 6 ]] --[[ Name: primitive ]]
    return function(v2) --[[ Line: 7 ]]
        if v0(v2) == v1 then
            return true;
        else
            return false;
        end;
    end;
end;
local v5 = {
    any = function(v4) --[[ Line: 26 ]] --[[ Name: any ]]
        if v4 ~= nil then
            return true;
        else
            return false;
        end;
    end
};
local v6 = "boolean";
local l_v6_0 = v6 --[[ copy: 4 -> 5 ]];
v5.boolean = function(v8) --[[ Line: 7 ]]
    if v0(v8) == l_v6_0 then
        return true;
    else
        return false;
    end;
end;
v6 = "thread";
local l_v6_1 = v6 --[[ copy: 4 -> 6 ]];
v5.thread = function(v10) --[[ Line: 7 ]]
    if v0(v10) == l_v6_1 then
        return true;
    else
        return false;
    end;
end;
v6 = "function";
local l_v6_2 = v6 --[[ copy: 4 -> 7 ]];
v5.callback = function(v12) --[[ Line: 7 ]]
    if v0(v12) == l_v6_2 then
        return true;
    else
        return false;
    end;
end;
v5["function"] = v5.callback;
v6 = "nil";
local l_v6_3 = v6 --[[ copy: 4 -> 8 ]];
v5.none = function(v14) --[[ Line: 7 ]]
    if v0(v14) == l_v6_3 then
        return true;
    else
        return false;
    end;
end;
v5["nil"] = v5.none;
v6 = "string";
local l_v6_4 = v6 --[[ copy: 4 -> 9 ]];
v5.string = function(v16) --[[ Line: 7 ]]
    if v0(v16) == l_v6_4 then
        return true;
    else
        return false;
    end;
end;
v6 = "table";
local l_v6_5 = v6 --[[ copy: 4 -> 10 ]];
v5.table = function(v18) --[[ Line: 7 ]]
    if v0(v18) == l_v6_5 then
        return true;
    else
        return false;
    end;
end;
v6 = "userdata";
local l_v6_6 = v6 --[[ copy: 4 -> 11 ]];
v5.userdata = function(v20) --[[ Line: 7 ]]
    if v0(v20) == l_v6_6 then
        return true;
    else
        return false;
    end;
end;
v5.number = function(v21) --[[ Line: 108 ]] --[[ Name: number ]]
    if v0(v21) == "number" then
        if v21 == v21 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.nan = function(v22) --[[ Line: 128 ]] --[[ Name: nan ]]
    if v22 ~= v22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Axes";
local l_v6_7 = v6 --[[ copy: 4 -> 12 ]];
v5.Axes = function(v24) --[[ Line: 7 ]]
    if v0(v24) == l_v6_7 then
        return true;
    else
        return false;
    end;
end;
v6 = "BrickColor";
local l_v6_8 = v6 --[[ copy: 4 -> 13 ]];
v5.BrickColor = function(v26) --[[ Line: 7 ]]
    if v0(v26) == l_v6_8 then
        return true;
    else
        return false;
    end;
end;
v6 = "CFrame";
local l_v6_9 = v6 --[[ copy: 4 -> 14 ]];
v5.CFrame = function(v28) --[[ Line: 7 ]]
    if v0(v28) == l_v6_9 then
        return true;
    else
        return false;
    end;
end;
v6 = "Color3";
local l_v6_10 = v6 --[[ copy: 4 -> 15 ]];
v5.Color3 = function(v30) --[[ Line: 7 ]]
    if v0(v30) == l_v6_10 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequence";
local l_v6_11 = v6 --[[ copy: 4 -> 16 ]];
v5.ColorSequence = function(v32) --[[ Line: 7 ]]
    if v0(v32) == l_v6_11 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequenceKeypoint";
local l_v6_12 = v6 --[[ copy: 4 -> 17 ]];
v5.ColorSequenceKeypoint = function(v34) --[[ Line: 7 ]]
    if v0(v34) == l_v6_12 then
        return true;
    else
        return false;
    end;
end;
v6 = "DockWidgetPluginGuiInfo";
local l_v6_13 = v6 --[[ copy: 4 -> 18 ]];
v5.DockWidgetPluginGuiInfo = function(v36) --[[ Line: 7 ]]
    if v0(v36) == l_v6_13 then
        return true;
    else
        return false;
    end;
end;
v6 = "Faces";
local l_v6_14 = v6 --[[ copy: 4 -> 19 ]];
v5.Faces = function(v38) --[[ Line: 7 ]]
    if v0(v38) == l_v6_14 then
        return true;
    else
        return false;
    end;
end;
v6 = "Instance";
local l_v6_15 = v6 --[[ copy: 4 -> 20 ]];
v5.Instance = function(v40) --[[ Line: 7 ]]
    if v0(v40) == l_v6_15 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberRange";
local l_v6_16 = v6 --[[ copy: 4 -> 21 ]];
v5.NumberRange = function(v42) --[[ Line: 7 ]]
    if v0(v42) == l_v6_16 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequence";
local l_v6_17 = v6 --[[ copy: 4 -> 22 ]];
v5.NumberSequence = function(v44) --[[ Line: 7 ]]
    if v0(v44) == l_v6_17 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequenceKeypoint";
local l_v6_18 = v6 --[[ copy: 4 -> 23 ]];
v5.NumberSequenceKeypoint = function(v46) --[[ Line: 7 ]]
    if v0(v46) == l_v6_18 then
        return true;
    else
        return false;
    end;
end;
v6 = "PathWaypoint";
local l_v6_19 = v6 --[[ copy: 4 -> 24 ]];
v5.PathWaypoint = function(v48) --[[ Line: 7 ]]
    if v0(v48) == l_v6_19 then
        return true;
    else
        return false;
    end;
end;
v6 = "PhysicalProperties";
local l_v6_20 = v6 --[[ copy: 4 -> 25 ]];
v5.PhysicalProperties = function(v50) --[[ Line: 7 ]]
    if v0(v50) == l_v6_20 then
        return true;
    else
        return false;
    end;
end;
v6 = "Random";
local l_v6_21 = v6 --[[ copy: 4 -> 26 ]];
v5.Random = function(v52) --[[ Line: 7 ]]
    if v0(v52) == l_v6_21 then
        return true;
    else
        return false;
    end;
end;
v6 = "Ray";
local l_v6_22 = v6 --[[ copy: 4 -> 27 ]];
v5.Ray = function(v54) --[[ Line: 7 ]]
    if v0(v54) == l_v6_22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Rect";
local l_v6_23 = v6 --[[ copy: 4 -> 28 ]];
v5.Rect = function(v56) --[[ Line: 7 ]]
    if v0(v56) == l_v6_23 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3";
local l_v6_24 = v6 --[[ copy: 4 -> 29 ]];
v5.Region3 = function(v58) --[[ Line: 7 ]]
    if v0(v58) == l_v6_24 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3int16";
local l_v6_25 = v6 --[[ copy: 4 -> 30 ]];
v5.Region3int16 = function(v60) --[[ Line: 7 ]]
    if v0(v60) == l_v6_25 then
        return true;
    else
        return false;
    end;
end;
v6 = "TweenInfo";
local l_v6_26 = v6 --[[ copy: 4 -> 31 ]];
v5.TweenInfo = function(v62) --[[ Line: 7 ]]
    if v0(v62) == l_v6_26 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim";
local l_v6_27 = v6 --[[ copy: 4 -> 32 ]];
v5.UDim = function(v64) --[[ Line: 7 ]]
    if v0(v64) == l_v6_27 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim2";
local l_v6_28 = v6 --[[ copy: 4 -> 33 ]];
v5.UDim2 = function(v66) --[[ Line: 7 ]]
    if v0(v66) == l_v6_28 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector2";
local l_v6_29 = v6 --[[ copy: 4 -> 34 ]];
v5.Vector2 = function(v68) --[[ Line: 7 ]]
    if v0(v68) == l_v6_29 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3";
local l_v6_30 = v6 --[[ copy: 4 -> 35 ]];
v5.Vector3 = function(v70) --[[ Line: 7 ]]
    if v0(v70) == l_v6_30 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3int16";
local l_v6_31 = v6 --[[ copy: 4 -> 36 ]];
v5.Vector3int16 = function(v72) --[[ Line: 7 ]]
    if v0(v72) == l_v6_31 then
        return true;
    else
        return false;
    end;
end;
v6 = "Enum";
local l_v6_32 = v6 --[[ copy: 4 -> 37 ]];
v5.Enum = function(v74) --[[ Line: 7 ]]
    if v0(v74) == l_v6_32 then
        return true;
    else
        return false;
    end;
end;
v6 = "EnumItem";
local l_v6_33 = v6 --[[ copy: 4 -> 38 ]];
v5.EnumItem = function(v76) --[[ Line: 7 ]]
    if v0(v76) == l_v6_33 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptSignal";
local l_v6_34 = v6 --[[ copy: 4 -> 39 ]];
v5.RBXScriptSignal = function(v78) --[[ Line: 7 ]]
    if v0(v78) == l_v6_34 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptConnection";
v5.RBXScriptConnection = function(v79) --[[ Line: 7 ]]
    if v0(v79) == v6 then
        return true;
    else
        return false;
    end;
end;
v5.literal = function(...) --[[ Line: 408 ]] --[[ Name: literal ]]
    local v80 = select("#", ...);
    if v80 == 1 then
        local v81 = ...;
        return function(v82) --[[ Line: 412 ]]
            if v82 ~= v81 then
                return false;
            else
                return true;
            end;
        end;
    else
        local v83 = {};
        for v84 = 1, v80 do
            local v85 = select(v84, ...);
            v83[v84] = v5.literal(v85);
        end;
        return v5.union(table.unpack(v83, 1, v80));
    end;
end;
v5.exactly = v5.literal;
v5.keyOf = function(v86) --[[ Line: 443 ]] --[[ Name: keyOf ]]
    local v87 = {};
    local v88 = 0;
    for v89 in pairs(v86) do
        v88 = v88 + 1;
        v87[v88] = v89;
    end;
    return v5.literal(table.unpack(v87, 1, v88));
end;
v5.valueOf = function(v90) --[[ Line: 461 ]] --[[ Name: valueOf ]]
    local v91 = {};
    local v92 = 0;
    for _, v94 in pairs(v90) do
        v92 = v92 + 1;
        v91[v92] = v94;
    end;
    return v5.literal(table.unpack(v91, 1, v92));
end;
v5.integer = function(v95) --[[ Line: 479 ]] --[[ Name: integer ]]
    if not v5.number(v95) then
        return false;
    elseif v95 % 1 == 0 then
        return true;
    else
        return false;
    end;
end;
v5.numberMin = function(v96) --[[ Line: 499 ]] --[[ Name: numberMin ]]
    return function(v97) --[[ Line: 500 ]]
        if not v5.number(v97) then
            return false;
        elseif v96 <= v97 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMax = function(v98) --[[ Line: 521 ]] --[[ Name: numberMax ]]
    return function(v99) --[[ Line: 522 ]]
        if not v5.number(v99) then
            return false;
        elseif v99 <= v98 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMinExclusive = function(v100) --[[ Line: 543 ]] --[[ Name: numberMinExclusive ]]
    return function(v101) --[[ Line: 544 ]]
        if not v5.number(v101) then
            return false;
        elseif v100 < v101 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMaxExclusive = function(v102) --[[ Line: 565 ]] --[[ Name: numberMaxExclusive ]]
    return function(v103) --[[ Line: 566 ]]
        if not v5.number(v103) then
            return false;
        elseif v103 < v102 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberPositive = v5.numberMinExclusive(0);
v5.numberNegative = v5.numberMaxExclusive(0);
v5.numberConstrained = function(v104, v105) --[[ Line: 602 ]] --[[ Name: numberConstrained ]]
    assert(v5.number(v104));
    assert(v5.number(v105));
    local v106 = v5.numberMin(v104);
    local v107 = v5.numberMax(v105);
    return function(v108) --[[ Line: 608 ]]
        if not v106(v108) then
            return false;
        elseif not v107(v108) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.numberConstrainedExclusive = function(v109, v110) --[[ Line: 631 ]] --[[ Name: numberConstrainedExclusive ]]
    assert(v5.number(v109));
    assert(v5.number(v110));
    local v111 = v5.numberMinExclusive(v109);
    local v112 = v5.numberMaxExclusive(v110);
    return function(v113) --[[ Line: 637 ]]
        if not v111(v113) then
            return false;
        elseif not v112(v113) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.match = function(v114) --[[ Line: 659 ]] --[[ Name: match ]]
    assert(v5.string(v114));
    return function(v115) --[[ Line: 661 ]]
        if not v5.string(v115) then
            return false;
        elseif string.match(v115, v114) == nil then
            return false;
        else
            return true;
        end;
    end;
end;
v5.optional = function(v116) --[[ Line: 682 ]] --[[ Name: optional ]]
    assert(v5.callback(v116));
    return function(v117) --[[ Line: 684 ]]
        if v117 == nil then
            return true;
        elseif v116(v117) then
            return true;
        else
            return false;
        end;
    end;
end;
v5.tuple = function(...) --[[ Line: 705 ]] --[[ Name: tuple ]]
    local v118 = {
        ...
    };
    return function(...) --[[ Line: 707 ]]
        local v119 = {
            ...
        };
        for v120, v121 in ipairs(v118) do
            if v121(v119[v120]) == false then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.keys = function(v122) --[[ Line: 727 ]] --[[ Name: keys ]]
    assert(v5.callback(v122));
    return function(v123) --[[ Line: 729 ]]
        if v5.table(v123) == false then
            return false;
        else
            for v124 in pairs(v123) do
                if v122(v124) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.values = function(v125) --[[ Line: 753 ]] --[[ Name: values ]]
    assert(v5.callback(v125));
    return function(v126) --[[ Line: 755 ]]
        if v5.table(v126) == false then
            return false;
        else
            for _, v128 in pairs(v126) do
                if v125(v128) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.map = function(v129, v130) --[[ Line: 780 ]] --[[ Name: map ]]
    assert(v5.callback(v129));
    assert(v5.callback(v130));
    local v131 = v5.keys(v129);
    local v132 = v5.values(v130);
    return function(v133) --[[ Line: 786 ]]
        if not v131(v133) then
            return false;
        elseif not v132(v133) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.set = function(v134) --[[ Line: 808 ]] --[[ Name: set ]]
    return v5.map(v134, v5.literal(true));
end;
local v135 = v5.keys(v5.integer);
local l_v135_0 = v135 --[[ copy: 3 -> 40 ]];
v5.array = function(v137) --[[ Line: 821 ]] --[[ Name: array ]]
    assert(v5.callback(v137));
    local v138 = v5.values(v137);
    return function(v139) --[[ Line: 825 ]]
        if l_v135_0(v139) == false then
            return false;
        else
            local v140 = 0;
            for _ in ipairs(v139) do
                v140 = v140 + 1;
            end;
            for v142 in pairs(v139) do
                if v142 < 1 or v140 < v142 then
                    return false;
                end;
            end;
            if not v138(v139) then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v5.strictArray = function(...) --[[ Line: 861 ]] --[[ Name: strictArray ]]
    local v143 = {
        ...
    };
    assert(v5.array(v5.callback)(v143));
    return function(v144) --[[ Line: 865 ]]
        if l_v135_0(v144) == false then
            return false;
        elseif #v143 < #v144 then
            return false;
        else
            for v145, v146 in pairs(v143) do
                if not v146(v144[v145]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v135 = v5.array(v5.callback);
local l_v135_1 = v135 --[[ copy: 3 -> 41 ]];
v5.union = function(...) --[[ Line: 897 ]] --[[ Name: union ]]
    local v148 = {
        ...
    };
    assert(l_v135_1(v148));
    return function(v149) --[[ Line: 901 ]]
        for _, v151 in ipairs(v148) do
            if v151(v149) then
                return true;
            end;
        end;
        return false;
    end;
end;
v5.some = v5.union;
v5.intersection = function(...) --[[ Line: 924 ]] --[[ Name: intersection ]]
    local v152 = {
        ...
    };
    assert(l_v135_1(v152));
    return function(v153) --[[ Line: 928 ]]
        for _, v155 in ipairs(v152) do
            if not v155(v153) then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.every = v5.intersection;
v135 = v5.map(v5.any, v5.callback);
local l_v135_2 = v135 --[[ copy: 3 -> 42 ]];
v5.interface = function(v157) --[[ Line: 955 ]] --[[ Name: interface ]]
    assert(l_v135_2(v157));
    return function(v158) --[[ Line: 957 ]]
        if v5.table(v158) == false then
            return false;
        else
            for v159, v160 in pairs(v157) do
                if v160(v158[v159]) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.strictInterface = function(v161) --[[ Line: 981 ]] --[[ Name: strictInterface ]]
    assert(l_v135_2(v161));
    return function(v162) --[[ Line: 983 ]]
        if v5.table(v162) == false then
            return false;
        else
            for v163, v164 in pairs(v161) do
                if v164(v162[v163]) == false then
                    return false;
                end;
            end;
            for v165 in pairs(v162) do
                if not v161[v165] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.instanceOf = function(v166, v167) --[[ Line: 1014 ]] --[[ Name: instanceOf ]]
    assert(v5.string(v166));
    local v168 = nil;
    if v167 ~= nil then
        v168 = v5.children(v167);
    end;
    return function(v169) --[[ Line: 1022 ]]
        if not v5.Instance(v169) then
            return false;
        elseif v169.ClassName ~= v166 then
            return false;
        elseif v168 and not v168(v169) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.instance = v5.instanceOf;
v5.instanceIsA = function(v170, v171) --[[ Line: 1052 ]] --[[ Name: instanceIsA ]]
    assert(v5.string(v170));
    local v172 = nil;
    if v171 ~= nil then
        v172 = v5.children(v171);
    end;
    return function(v173) --[[ Line: 1060 ]]
        if not v5.Instance(v173) then
            return false;
        elseif not v173:IsA(v170) then
            return false;
        elseif v172 and not v172(v173) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.enum = function(v174) --[[ Line: 1088 ]] --[[ Name: enum ]]
    assert(v5.Enum(v174));
    return function(v175) --[[ Line: 1090 ]]
        if not v5.EnumItem(v175) then
            return false;
        elseif v175.EnumType == v174 then
            return true;
        else
            return false;
        end;
    end;
end;
v135 = v5.tuple(v5.callback, v5.callback);
local l_v135_3 = v135 --[[ copy: 3 -> 43 ]];
v5.wrap = function(v177, v178) --[[ Line: 1115 ]] --[[ Name: wrap ]]
    assert(l_v135_3(v177, v178));
    return function(...) --[[ Line: 1117 ]]
        assert(v178(...));
        return v177(...);
    end;
end;
v5.strict = function(v179) --[[ Line: 1131 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1132 ]]
        assert(v179(...));
    end;
end;
v135 = v5.map(v5.string, v5.callback);
v5.children = function(v180) --[[ Line: 1151 ]] --[[ Name: children ]]
    assert(v135(v180));
    return function(v181) --[[ Line: 1154 ]]
        if not v5.Instance(v181) then
            return false;
        else
            local v182 = {};
            for _, v184 in ipairs(v181:GetChildren()) do
                local l_Name_0 = v184.Name;
                if v180[l_Name_0] then
                    if v182[l_Name_0] then
                        return false;
                    else
                        v182[l_Name_0] = v184;
                    end;
                end;
            end;
            for v186, v187 in pairs(v180) do
                if not v187(v182[v186]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return {
    t = v5
};