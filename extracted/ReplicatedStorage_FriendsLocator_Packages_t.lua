-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = typeof or type;
local function _(v1) --[[ Line: 6 ]] --[[ Name: primitive ]]
    return function(v2) --[[ Line: 7 ]]
        local v3 = v0(v2);
        if v3 == v1 then
            return true;
        else
            return false, string.format("%s expected, got %s", v1, v3);
        end;
    end;
end;
local v6 = {
    any = function(v5) --[[ Line: 26 ]] --[[ Name: any ]]
        if v5 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
local v7 = "boolean";
local l_v7_0 = v7 --[[ copy: 4 -> 5 ]];
v6.boolean = function(v9) --[[ Line: 7 ]]
    local v10 = v0(v9);
    if v10 == l_v7_0 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_0, v10);
    end;
end;
v7 = "thread";
local l_v7_1 = v7 --[[ copy: 4 -> 6 ]];
v6.thread = function(v12) --[[ Line: 7 ]]
    local v13 = v0(v12);
    if v13 == l_v7_1 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_1, v13);
    end;
end;
v7 = "function";
local l_v7_2 = v7 --[[ copy: 4 -> 7 ]];
v6.callback = function(v15) --[[ Line: 7 ]]
    local v16 = v0(v15);
    if v16 == l_v7_2 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_2, v16);
    end;
end;
v6["function"] = v6.callback;
v7 = "nil";
local l_v7_3 = v7 --[[ copy: 4 -> 8 ]];
v6.none = function(v18) --[[ Line: 7 ]]
    local v19 = v0(v18);
    if v19 == l_v7_3 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_3, v19);
    end;
end;
v6["nil"] = v6.none;
v7 = "string";
local l_v7_4 = v7 --[[ copy: 4 -> 9 ]];
v6.string = function(v21) --[[ Line: 7 ]]
    local v22 = v0(v21);
    if v22 == l_v7_4 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_4, v22);
    end;
end;
v7 = "table";
local l_v7_5 = v7 --[[ copy: 4 -> 10 ]];
v6.table = function(v24) --[[ Line: 7 ]]
    local v25 = v0(v24);
    if v25 == l_v7_5 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_5, v25);
    end;
end;
v7 = "userdata";
local l_v7_6 = v7 --[[ copy: 4 -> 11 ]];
v6.userdata = function(v27) --[[ Line: 7 ]]
    local v28 = v0(v27);
    if v28 == l_v7_6 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_6, v28);
    end;
end;
v6.number = function(v29) --[[ Line: 108 ]] --[[ Name: number ]]
    local v30 = v0(v29);
    if v30 == "number" then
        if v29 == v29 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v30);
    end;
end;
v6.nan = function(v31) --[[ Line: 128 ]] --[[ Name: nan ]]
    if v31 ~= v31 then
        return true;
    else
        return false, "unexpected non-NaN value";
    end;
end;
v7 = "Axes";
local l_v7_7 = v7 --[[ copy: 4 -> 12 ]];
v6.Axes = function(v33) --[[ Line: 7 ]]
    local v34 = v0(v33);
    if v34 == l_v7_7 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_7, v34);
    end;
end;
v7 = "BrickColor";
local l_v7_8 = v7 --[[ copy: 4 -> 13 ]];
v6.BrickColor = function(v36) --[[ Line: 7 ]]
    local v37 = v0(v36);
    if v37 == l_v7_8 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_8, v37);
    end;
end;
v7 = "CFrame";
local l_v7_9 = v7 --[[ copy: 4 -> 14 ]];
v6.CFrame = function(v39) --[[ Line: 7 ]]
    local v40 = v0(v39);
    if v40 == l_v7_9 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_9, v40);
    end;
end;
v7 = "Color3";
local l_v7_10 = v7 --[[ copy: 4 -> 15 ]];
v6.Color3 = function(v42) --[[ Line: 7 ]]
    local v43 = v0(v42);
    if v43 == l_v7_10 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_10, v43);
    end;
end;
v7 = "ColorSequence";
local l_v7_11 = v7 --[[ copy: 4 -> 16 ]];
v6.ColorSequence = function(v45) --[[ Line: 7 ]]
    local v46 = v0(v45);
    if v46 == l_v7_11 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_11, v46);
    end;
end;
v7 = "ColorSequenceKeypoint";
local l_v7_12 = v7 --[[ copy: 4 -> 17 ]];
v6.ColorSequenceKeypoint = function(v48) --[[ Line: 7 ]]
    local v49 = v0(v48);
    if v49 == l_v7_12 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_12, v49);
    end;
end;
v7 = "DockWidgetPluginGuiInfo";
local l_v7_13 = v7 --[[ copy: 4 -> 18 ]];
v6.DockWidgetPluginGuiInfo = function(v51) --[[ Line: 7 ]]
    local v52 = v0(v51);
    if v52 == l_v7_13 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_13, v52);
    end;
end;
v7 = "Faces";
local l_v7_14 = v7 --[[ copy: 4 -> 19 ]];
v6.Faces = function(v54) --[[ Line: 7 ]]
    local v55 = v0(v54);
    if v55 == l_v7_14 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_14, v55);
    end;
end;
v7 = "Instance";
local l_v7_15 = v7 --[[ copy: 4 -> 20 ]];
v6.Instance = function(v57) --[[ Line: 7 ]]
    local v58 = v0(v57);
    if v58 == l_v7_15 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_15, v58);
    end;
end;
v7 = "NumberRange";
local l_v7_16 = v7 --[[ copy: 4 -> 21 ]];
v6.NumberRange = function(v60) --[[ Line: 7 ]]
    local v61 = v0(v60);
    if v61 == l_v7_16 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_16, v61);
    end;
end;
v7 = "NumberSequence";
local l_v7_17 = v7 --[[ copy: 4 -> 22 ]];
v6.NumberSequence = function(v63) --[[ Line: 7 ]]
    local v64 = v0(v63);
    if v64 == l_v7_17 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_17, v64);
    end;
end;
v7 = "NumberSequenceKeypoint";
local l_v7_18 = v7 --[[ copy: 4 -> 23 ]];
v6.NumberSequenceKeypoint = function(v66) --[[ Line: 7 ]]
    local v67 = v0(v66);
    if v67 == l_v7_18 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_18, v67);
    end;
end;
v7 = "PathWaypoint";
local l_v7_19 = v7 --[[ copy: 4 -> 24 ]];
v6.PathWaypoint = function(v69) --[[ Line: 7 ]]
    local v70 = v0(v69);
    if v70 == l_v7_19 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_19, v70);
    end;
end;
v7 = "PhysicalProperties";
local l_v7_20 = v7 --[[ copy: 4 -> 25 ]];
v6.PhysicalProperties = function(v72) --[[ Line: 7 ]]
    local v73 = v0(v72);
    if v73 == l_v7_20 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_20, v73);
    end;
end;
v7 = "Random";
local l_v7_21 = v7 --[[ copy: 4 -> 26 ]];
v6.Random = function(v75) --[[ Line: 7 ]]
    local v76 = v0(v75);
    if v76 == l_v7_21 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_21, v76);
    end;
end;
v7 = "Ray";
local l_v7_22 = v7 --[[ copy: 4 -> 27 ]];
v6.Ray = function(v78) --[[ Line: 7 ]]
    local v79 = v0(v78);
    if v79 == l_v7_22 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_22, v79);
    end;
end;
v7 = "Rect";
local l_v7_23 = v7 --[[ copy: 4 -> 28 ]];
v6.Rect = function(v81) --[[ Line: 7 ]]
    local v82 = v0(v81);
    if v82 == l_v7_23 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_23, v82);
    end;
end;
v7 = "Region3";
local l_v7_24 = v7 --[[ copy: 4 -> 29 ]];
v6.Region3 = function(v84) --[[ Line: 7 ]]
    local v85 = v0(v84);
    if v85 == l_v7_24 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_24, v85);
    end;
end;
v7 = "Region3int16";
local l_v7_25 = v7 --[[ copy: 4 -> 30 ]];
v6.Region3int16 = function(v87) --[[ Line: 7 ]]
    local v88 = v0(v87);
    if v88 == l_v7_25 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_25, v88);
    end;
end;
v7 = "TweenInfo";
local l_v7_26 = v7 --[[ copy: 4 -> 31 ]];
v6.TweenInfo = function(v90) --[[ Line: 7 ]]
    local v91 = v0(v90);
    if v91 == l_v7_26 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_26, v91);
    end;
end;
v7 = "UDim";
local l_v7_27 = v7 --[[ copy: 4 -> 32 ]];
v6.UDim = function(v93) --[[ Line: 7 ]]
    local v94 = v0(v93);
    if v94 == l_v7_27 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_27, v94);
    end;
end;
v7 = "UDim2";
local l_v7_28 = v7 --[[ copy: 4 -> 33 ]];
v6.UDim2 = function(v96) --[[ Line: 7 ]]
    local v97 = v0(v96);
    if v97 == l_v7_28 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_28, v97);
    end;
end;
v7 = "Vector2";
local l_v7_29 = v7 --[[ copy: 4 -> 34 ]];
v6.Vector2 = function(v99) --[[ Line: 7 ]]
    local v100 = v0(v99);
    if v100 == l_v7_29 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_29, v100);
    end;
end;
v7 = "Vector3";
local l_v7_30 = v7 --[[ copy: 4 -> 35 ]];
v6.Vector3 = function(v102) --[[ Line: 7 ]]
    local v103 = v0(v102);
    if v103 == l_v7_30 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_30, v103);
    end;
end;
v7 = "Vector3int16";
local l_v7_31 = v7 --[[ copy: 4 -> 36 ]];
v6.Vector3int16 = function(v105) --[[ Line: 7 ]]
    local v106 = v0(v105);
    if v106 == l_v7_31 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_31, v106);
    end;
end;
v7 = "Enum";
local l_v7_32 = v7 --[[ copy: 4 -> 37 ]];
v6.Enum = function(v108) --[[ Line: 7 ]]
    local v109 = v0(v108);
    if v109 == l_v7_32 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_32, v109);
    end;
end;
v7 = "EnumItem";
local l_v7_33 = v7 --[[ copy: 4 -> 38 ]];
v6.EnumItem = function(v111) --[[ Line: 7 ]]
    local v112 = v0(v111);
    if v112 == l_v7_33 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_33, v112);
    end;
end;
v7 = "RBXScriptSignal";
local l_v7_34 = v7 --[[ copy: 4 -> 39 ]];
v6.RBXScriptSignal = function(v114) --[[ Line: 7 ]]
    local v115 = v0(v114);
    if v115 == l_v7_34 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_34, v115);
    end;
end;
v7 = "RBXScriptConnection";
v6.RBXScriptConnection = function(v116) --[[ Line: 7 ]]
    local v117 = v0(v116);
    if v117 == v7 then
        return true;
    else
        return false, string.format("%s expected, got %s", v7, v117);
    end;
end;
v6.literal = function(...) --[[ Line: 408 ]] --[[ Name: literal ]]
    local v118 = select("#", ...);
    if v118 == 1 then
        local v119 = ...;
        return function(v120) --[[ Line: 412 ]]
            if v120 ~= v119 then
                return false, string.format("expected %s, got %s", tostring(v119), (tostring(v120)));
            else
                return true;
            end;
        end;
    else
        local v121 = {};
        for v122 = 1, v118 do
            local v123 = select(v122, ...);
            v121[v122] = v6.literal(v123);
        end;
        return v6.union(table.unpack(v121, 1, v118));
    end;
end;
v6.exactly = v6.literal;
v6.keyOf = function(v124) --[[ Line: 443 ]] --[[ Name: keyOf ]]
    local v125 = {};
    local v126 = 0;
    for v127 in pairs(v124) do
        v126 = v126 + 1;
        v125[v126] = v127;
    end;
    return v6.literal(table.unpack(v125, 1, v126));
end;
v6.valueOf = function(v128) --[[ Line: 461 ]] --[[ Name: valueOf ]]
    local v129 = {};
    local v130 = 0;
    for _, v132 in pairs(v128) do
        v130 = v130 + 1;
        v129[v130] = v132;
    end;
    return v6.literal(table.unpack(v129, 1, v130));
end;
v6.integer = function(v133) --[[ Line: 479 ]] --[[ Name: integer ]]
    local v134, v135 = v6.number(v133);
    if not v134 then
        return false, v135 or "";
    elseif v133 % 1 == 0 then
        return true;
    else
        return false, string.format("integer expected, got %s", v133);
    end;
end;
v6.numberMin = function(v136) --[[ Line: 499 ]] --[[ Name: numberMin ]]
    return function(v137) --[[ Line: 500 ]]
        local v138, v139 = v6.number(v137);
        if not v138 then
            return false, v139 or "";
        elseif v136 <= v137 then
            return true;
        else
            return false, string.format("number >= %s expected, got %s", v136, v137);
        end;
    end;
end;
v6.numberMax = function(v140) --[[ Line: 521 ]] --[[ Name: numberMax ]]
    return function(v141) --[[ Line: 522 ]]
        local v142, v143 = v6.number(v141);
        if not v142 then
            return false, v143;
        elseif v141 <= v140 then
            return true;
        else
            return false, string.format("number <= %s expected, got %s", v140, v141);
        end;
    end;
end;
v6.numberMinExclusive = function(v144) --[[ Line: 543 ]] --[[ Name: numberMinExclusive ]]
    return function(v145) --[[ Line: 544 ]]
        local v146, v147 = v6.number(v145);
        if not v146 then
            return false, v147 or "";
        elseif v144 < v145 then
            return true;
        else
            return false, string.format("number > %s expected, got %s", v144, v145);
        end;
    end;
end;
v6.numberMaxExclusive = function(v148) --[[ Line: 565 ]] --[[ Name: numberMaxExclusive ]]
    return function(v149) --[[ Line: 566 ]]
        local v150, v151 = v6.number(v149);
        if not v150 then
            return false, v151 or "";
        elseif v149 < v148 then
            return true;
        else
            return false, string.format("number < %s expected, got %s", v148, v149);
        end;
    end;
end;
v6.numberPositive = v6.numberMinExclusive(0);
v6.numberNegative = v6.numberMaxExclusive(0);
v6.numberConstrained = function(v152, v153) --[[ Line: 602 ]] --[[ Name: numberConstrained ]]
    assert(v6.number(v152));
    assert(v6.number(v153));
    local v154 = v6.numberMin(v152);
    local v155 = v6.numberMax(v153);
    return function(v156) --[[ Line: 608 ]]
        local v157, v158 = v154(v156);
        if not v157 then
            return false, v158 or "";
        else
            local v159, v160 = v155(v156);
            if not v159 then
                return false, v160 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.numberConstrainedExclusive = function(v161, v162) --[[ Line: 631 ]] --[[ Name: numberConstrainedExclusive ]]
    assert(v6.number(v161));
    assert(v6.number(v162));
    local v163 = v6.numberMinExclusive(v161);
    local v164 = v6.numberMaxExclusive(v162);
    return function(v165) --[[ Line: 637 ]]
        local v166, v167 = v163(v165);
        if not v166 then
            return false, v167 or "";
        else
            local v168, v169 = v164(v165);
            if not v168 then
                return false, v169 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.match = function(v170) --[[ Line: 659 ]] --[[ Name: match ]]
    assert(v6.string(v170));
    return function(v171) --[[ Line: 661 ]]
        local v172, v173 = v6.string(v171);
        if not v172 then
            return false, v173;
        elseif string.match(v171, v170) == nil then
            return false, string.format("%q failed to match pattern %q", v171, v170);
        else
            return true;
        end;
    end;
end;
v6.optional = function(v174) --[[ Line: 682 ]] --[[ Name: optional ]]
    assert(v6.callback(v174));
    return function(v175) --[[ Line: 684 ]]
        if v175 == nil then
            return true;
        else
            local v176, v177 = v174(v175);
            if v176 then
                return true;
            else
                return false, string.format("(optional) %s", v177 or "");
            end;
        end;
    end;
end;
v6.tuple = function(...) --[[ Line: 705 ]] --[[ Name: tuple ]]
    local v178 = {
        ...
    };
    return function(...) --[[ Line: 707 ]]
        local v179 = {
            ...
        };
        for v180, v181 in ipairs(v178) do
            local v182, v183 = v181(v179[v180]);
            if v182 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v180, v183 or "");
            end;
        end;
        return true;
    end;
end;
v6.keys = function(v184) --[[ Line: 727 ]] --[[ Name: keys ]]
    assert(v6.callback(v184));
    return function(v185) --[[ Line: 729 ]]
        local v186, v187 = v6.table(v185);
        if v186 == false then
            return false, v187 or "";
        else
            for v188 in pairs(v185) do
                local v189, v190 = v184(v188);
                if v189 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v188), v190 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.values = function(v191) --[[ Line: 753 ]] --[[ Name: values ]]
    assert(v6.callback(v191));
    return function(v192) --[[ Line: 755 ]]
        local v193, v194 = v6.table(v192);
        if v193 == false then
            return false, v194 or "";
        else
            for v195, v196 in pairs(v192) do
                local v197, v198 = v191(v196);
                if v197 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v195), v198 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.map = function(v199, v200) --[[ Line: 780 ]] --[[ Name: map ]]
    assert(v6.callback(v199));
    assert(v6.callback(v200));
    local v201 = v6.keys(v199);
    local v202 = v6.values(v200);
    return function(v203) --[[ Line: 786 ]]
        local v204, v205 = v201(v203);
        if not v204 then
            return false, v205 or "";
        else
            local v206, v207 = v202(v203);
            if not v206 then
                return false, v207 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.set = function(v208) --[[ Line: 808 ]] --[[ Name: set ]]
    return v6.map(v208, v6.literal(true));
end;
local v209 = v6.keys(v6.integer);
local l_v209_0 = v209 --[[ copy: 3 -> 40 ]];
v6.array = function(v211) --[[ Line: 821 ]] --[[ Name: array ]]
    assert(v6.callback(v211));
    local v212 = v6.values(v211);
    return function(v213) --[[ Line: 825 ]]
        local v214, v215 = l_v209_0(v213);
        if v214 == false then
            return false, string.format("[array] %s", v215 or "");
        else
            local v216 = 0;
            for _ in ipairs(v213) do
                v216 = v216 + 1;
            end;
            for v218 in pairs(v213) do
                if v218 < 1 or v216 < v218 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v218)));
                end;
            end;
            local v219, v220 = v212(v213);
            if not v219 then
                return false, string.format("[array] %s", v220 or "");
            else
                return true;
            end;
        end;
    end;
end;
v6.strictArray = function(...) --[[ Line: 861 ]] --[[ Name: strictArray ]]
    local v221 = {
        ...
    };
    assert(v6.array(v6.callback)(v221));
    return function(v222) --[[ Line: 865 ]]
        local v223, v224 = l_v209_0(v222);
        if v223 == false then
            return false, string.format("[strictArray] %s", v224 or "");
        elseif #v221 < #v222 then
            return false, string.format("[strictArray] Array size exceeds limit of %d", #v221);
        else
            for v225, v226 in pairs(v221) do
                local v227, v228 = v226(v222[v225]);
                if not v227 then
                    return false, string.format("[strictArray] Array index #%d - %s", v225, v228);
                end;
            end;
            return true;
        end;
    end;
end;
v209 = v6.array(v6.callback);
local l_v209_1 = v209 --[[ copy: 3 -> 41 ]];
v6.union = function(...) --[[ Line: 897 ]] --[[ Name: union ]]
    local v230 = {
        ...
    };
    assert(l_v209_1(v230));
    return function(v231) --[[ Line: 901 ]]
        for _, v233 in ipairs(v230) do
            if v233(v231) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v6.some = v6.union;
v6.intersection = function(...) --[[ Line: 924 ]] --[[ Name: intersection ]]
    local v234 = {
        ...
    };
    assert(l_v209_1(v234));
    return function(v235) --[[ Line: 928 ]]
        for _, v237 in ipairs(v234) do
            local v238, v239 = v237(v235);
            if not v238 then
                return false, v239 or "";
            end;
        end;
        return true;
    end;
end;
v6.every = v6.intersection;
v209 = v6.map(v6.any, v6.callback);
local l_v209_2 = v209 --[[ copy: 3 -> 42 ]];
v6.interface = function(v241) --[[ Line: 955 ]] --[[ Name: interface ]]
    assert(l_v209_2(v241));
    return function(v242) --[[ Line: 957 ]]
        local v243, v244 = v6.table(v242);
        if v243 == false then
            return false, v244 or "";
        else
            for v245, v246 in pairs(v241) do
                local v247, v248 = v246(v242[v245]);
                if v247 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v245), v248 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.strictInterface = function(v249) --[[ Line: 981 ]] --[[ Name: strictInterface ]]
    assert(l_v209_2(v249));
    return function(v250) --[[ Line: 983 ]]
        local v251, v252 = v6.table(v250);
        if v251 == false then
            return false, v252 or "";
        else
            for v253, v254 in pairs(v249) do
                local v255, v256 = v254(v250[v253]);
                if v255 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v253), v256 or "");
                end;
            end;
            for v257 in pairs(v250) do
                if not v249[v257] then
                    return false, string.format("[interface] unexpected field %q", (tostring(v257)));
                end;
            end;
            return true;
        end;
    end;
end;
v6.instanceOf = function(v258, v259) --[[ Line: 1014 ]] --[[ Name: instanceOf ]]
    assert(v6.string(v258));
    local v260 = nil;
    if v259 ~= nil then
        v260 = v6.children(v259);
    end;
    return function(v261) --[[ Line: 1022 ]]
        local v262, v263 = v6.Instance(v261);
        if not v262 then
            return false, v263 or "";
        elseif v261.ClassName ~= v258 then
            return false, string.format("%s expected, got %s", v258, v261.ClassName);
        else
            if v260 then
                local v264, v265 = v260(v261);
                if not v264 then
                    return false, v265;
                end;
            end;
            return true;
        end;
    end;
end;
v6.instance = v6.instanceOf;
v6.instanceIsA = function(v266, v267) --[[ Line: 1052 ]] --[[ Name: instanceIsA ]]
    assert(v6.string(v266));
    local v268 = nil;
    if v267 ~= nil then
        v268 = v6.children(v267);
    end;
    return function(v269) --[[ Line: 1060 ]]
        local v270, v271 = v6.Instance(v269);
        if not v270 then
            return false, v271 or "";
        elseif not v269:IsA(v266) then
            return false, string.format("%s expected, got %s", v266, v269.ClassName);
        else
            if v268 then
                local v272, v273 = v268(v269);
                if not v272 then
                    return false, v273;
                end;
            end;
            return true;
        end;
    end;
end;
v6.enum = function(v274) --[[ Line: 1088 ]] --[[ Name: enum ]]
    assert(v6.Enum(v274));
    return function(v275) --[[ Line: 1090 ]]
        local v276, v277 = v6.EnumItem(v275);
        if not v276 then
            return false, v277;
        elseif v275.EnumType == v274 then
            return true;
        else
            return false, string.format("enum of %s expected, got enum of %s", tostring(v274), (tostring(v275.EnumType)));
        end;
    end;
end;
v209 = v6.tuple(v6.callback, v6.callback);
local l_v209_3 = v209 --[[ copy: 3 -> 43 ]];
v6.wrap = function(v279, v280) --[[ Line: 1115 ]] --[[ Name: wrap ]]
    assert(l_v209_3(v279, v280));
    return function(...) --[[ Line: 1117 ]]
        assert(v280(...));
        return v279(...);
    end;
end;
v6.strict = function(v281) --[[ Line: 1131 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1132 ]]
        assert(v281(...));
    end;
end;
v209 = v6.map(v6.string, v6.callback);
v6.children = function(v282) --[[ Line: 1151 ]] --[[ Name: children ]]
    assert(v209(v282));
    return function(v283) --[[ Line: 1154 ]]
        local v284, v285 = v6.Instance(v283);
        if not v284 then
            return false, v285 or "";
        else
            local v286 = {};
            for _, v288 in ipairs(v283:GetChildren()) do
                local l_Name_0 = v288.Name;
                if v282[l_Name_0] then
                    if v286[l_Name_0] then
                        return false, string.format("Cannot process multiple children with the same name %q", l_Name_0);
                    else
                        v286[l_Name_0] = v288;
                    end;
                end;
            end;
            for v290, v291 in pairs(v282) do
                local v292, v293 = v291(v286[v290]);
                if not v292 then
                    return false, string.format("[%s.%s] %s", v283:GetFullName(), v290, v293 or "");
                end;
            end;
            return true;
        end;
    end;
end;
return v6;