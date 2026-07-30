-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    local function _(v2) --[[ Line: 5 ]] --[[ Name: wrapper ]]
        -- upvalues: v1 (copy)
        return function(v3, v4) --[[ Line: 6 ]]
            -- upvalues: v1 (ref), v2 (copy)
            return v1.Internal._Insert(v2, v3, v4);
        end;
    end;
    local v6 = "Window";
    local l_v6_0 = v6 --[[ copy: 3 -> 4 ]];
    v1.Window = function(v8, v9) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_0 (copy)
        return v1.Internal._Insert(l_v6_0, v8, v9);
    end;
    v1.SetFocusedWindow = v1.Internal.SetFocusedWindow;
    v6 = "Tooltip";
    local l_v6_1 = v6 --[[ copy: 3 -> 5 ]];
    v1.Tooltip = function(v11, v12) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_1 (copy)
        return v1.Internal._Insert(l_v6_1, v11, v12);
    end;
    v6 = "MenuBar";
    local l_v6_2 = v6 --[[ copy: 3 -> 6 ]];
    v1.MenuBar = function(v14, v15) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_2 (copy)
        return v1.Internal._Insert(l_v6_2, v14, v15);
    end;
    v6 = "Menu";
    local l_v6_3 = v6 --[[ copy: 3 -> 7 ]];
    v1.Menu = function(v17, v18) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_3 (copy)
        return v1.Internal._Insert(l_v6_3, v17, v18);
    end;
    v6 = "MenuItem";
    local l_v6_4 = v6 --[[ copy: 3 -> 8 ]];
    v1.MenuItem = function(v20, v21) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_4 (copy)
        return v1.Internal._Insert(l_v6_4, v20, v21);
    end;
    v6 = "MenuToggle";
    local l_v6_5 = v6 --[[ copy: 3 -> 9 ]];
    v1.MenuToggle = function(v23, v24) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_5 (copy)
        return v1.Internal._Insert(l_v6_5, v23, v24);
    end;
    v6 = "Separator";
    local l_v6_6 = v6 --[[ copy: 3 -> 10 ]];
    v1.Separator = function(v26, v27) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_6 (copy)
        return v1.Internal._Insert(l_v6_6, v26, v27);
    end;
    v6 = "Indent";
    local l_v6_7 = v6 --[[ copy: 3 -> 11 ]];
    v1.Indent = function(v29, v30) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_7 (copy)
        return v1.Internal._Insert(l_v6_7, v29, v30);
    end;
    v6 = "SameLine";
    local l_v6_8 = v6 --[[ copy: 3 -> 12 ]];
    v1.SameLine = function(v32, v33) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_8 (copy)
        return v1.Internal._Insert(l_v6_8, v32, v33);
    end;
    v6 = "Group";
    local l_v6_9 = v6 --[[ copy: 3 -> 13 ]];
    v1.Group = function(v35, v36) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_9 (copy)
        return v1.Internal._Insert(l_v6_9, v35, v36);
    end;
    v6 = "Text";
    local l_v6_10 = v6 --[[ copy: 3 -> 14 ]];
    v1.Text = function(v38, v39) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_10 (copy)
        return v1.Internal._Insert(l_v6_10, v38, v39);
    end;
    v1.TextWrapped = function(v40) --[[ Line: 440 ]]
        -- upvalues: v1 (copy)
        v40[2] = true;
        return (v1.Internal._Insert("Text", v40));
    end;
    v1.TextColored = function(v41) --[[ Line: 465 ]]
        -- upvalues: v1 (copy)
        v41[3] = v41[2];
        v41[2] = nil;
        return (v1.Internal._Insert("Text", v41));
    end;
    v6 = "SeparatorText";
    local l_v6_11 = v6 --[[ copy: 3 -> 15 ]];
    v1.SeparatorText = function(v43, v44) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_11 (copy)
        return v1.Internal._Insert(l_v6_11, v43, v44);
    end;
    v6 = "InputText";
    local l_v6_12 = v6 --[[ copy: 3 -> 16 ]];
    v1.InputText = function(v46, v47) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_12 (copy)
        return v1.Internal._Insert(l_v6_12, v46, v47);
    end;
    v6 = "Button";
    local l_v6_13 = v6 --[[ copy: 3 -> 17 ]];
    v1.Button = function(v49, v50) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_13 (copy)
        return v1.Internal._Insert(l_v6_13, v49, v50);
    end;
    v6 = "SmallButton";
    local l_v6_14 = v6 --[[ copy: 3 -> 18 ]];
    v1.SmallButton = function(v52, v53) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_14 (copy)
        return v1.Internal._Insert(l_v6_14, v52, v53);
    end;
    v6 = "Checkbox";
    local l_v6_15 = v6 --[[ copy: 3 -> 19 ]];
    v1.Checkbox = function(v55, v56) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_15 (copy)
        return v1.Internal._Insert(l_v6_15, v55, v56);
    end;
    v6 = "RadioButton";
    local l_v6_16 = v6 --[[ copy: 3 -> 20 ]];
    v1.RadioButton = function(v58, v59) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_16 (copy)
        return v1.Internal._Insert(l_v6_16, v58, v59);
    end;
    v6 = "Image";
    local l_v6_17 = v6 --[[ copy: 3 -> 21 ]];
    v1.Image = function(v61, v62) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_17 (copy)
        return v1.Internal._Insert(l_v6_17, v61, v62);
    end;
    v6 = "ImageButton";
    local l_v6_18 = v6 --[[ copy: 3 -> 22 ]];
    v1.ImageButton = function(v64, v65) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_18 (copy)
        return v1.Internal._Insert(l_v6_18, v64, v65);
    end;
    v6 = "Tree";
    local l_v6_19 = v6 --[[ copy: 3 -> 23 ]];
    v1.Tree = function(v67, v68) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_19 (copy)
        return v1.Internal._Insert(l_v6_19, v67, v68);
    end;
    v6 = "CollapsingHeader";
    local l_v6_20 = v6 --[[ copy: 3 -> 24 ]];
    v1.CollapsingHeader = function(v70, v71) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_20 (copy)
        return v1.Internal._Insert(l_v6_20, v70, v71);
    end;
    v6 = "TabBar";
    local l_v6_21 = v6 --[[ copy: 3 -> 25 ]];
    v1.TabBar = function(v73, v74) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_21 (copy)
        return v1.Internal._Insert(l_v6_21, v73, v74);
    end;
    v6 = "Tab";
    local l_v6_22 = v6 --[[ copy: 3 -> 26 ]];
    v1.Tab = function(v76, v77) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_22 (copy)
        return v1.Internal._Insert(l_v6_22, v76, v77);
    end;
    v6 = "InputNum";
    local l_v6_23 = v6 --[[ copy: 3 -> 27 ]];
    v1.InputNum = function(v79, v80) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_23 (copy)
        return v1.Internal._Insert(l_v6_23, v79, v80);
    end;
    v6 = "InputVector2";
    local l_v6_24 = v6 --[[ copy: 3 -> 28 ]];
    v1.InputVector2 = function(v82, v83) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_24 (copy)
        return v1.Internal._Insert(l_v6_24, v82, v83);
    end;
    v6 = "InputVector3";
    local l_v6_25 = v6 --[[ copy: 3 -> 29 ]];
    v1.InputVector3 = function(v85, v86) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_25 (copy)
        return v1.Internal._Insert(l_v6_25, v85, v86);
    end;
    v6 = "InputUDim";
    local l_v6_26 = v6 --[[ copy: 3 -> 30 ]];
    v1.InputUDim = function(v88, v89) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_26 (copy)
        return v1.Internal._Insert(l_v6_26, v88, v89);
    end;
    v6 = "InputUDim2";
    local l_v6_27 = v6 --[[ copy: 3 -> 31 ]];
    v1.InputUDim2 = function(v91, v92) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_27 (copy)
        return v1.Internal._Insert(l_v6_27, v91, v92);
    end;
    v6 = "InputRect";
    local l_v6_28 = v6 --[[ copy: 3 -> 32 ]];
    v1.InputRect = function(v94, v95) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_28 (copy)
        return v1.Internal._Insert(l_v6_28, v94, v95);
    end;
    v6 = "DragNum";
    local l_v6_29 = v6 --[[ copy: 3 -> 33 ]];
    v1.DragNum = function(v97, v98) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_29 (copy)
        return v1.Internal._Insert(l_v6_29, v97, v98);
    end;
    v6 = "DragVector2";
    local l_v6_30 = v6 --[[ copy: 3 -> 34 ]];
    v1.DragVector2 = function(v100, v101) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_30 (copy)
        return v1.Internal._Insert(l_v6_30, v100, v101);
    end;
    v6 = "DragVector3";
    local l_v6_31 = v6 --[[ copy: 3 -> 35 ]];
    v1.DragVector3 = function(v103, v104) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_31 (copy)
        return v1.Internal._Insert(l_v6_31, v103, v104);
    end;
    v6 = "DragUDim";
    local l_v6_32 = v6 --[[ copy: 3 -> 36 ]];
    v1.DragUDim = function(v106, v107) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_32 (copy)
        return v1.Internal._Insert(l_v6_32, v106, v107);
    end;
    v6 = "DragUDim2";
    local l_v6_33 = v6 --[[ copy: 3 -> 37 ]];
    v1.DragUDim2 = function(v109, v110) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_33 (copy)
        return v1.Internal._Insert(l_v6_33, v109, v110);
    end;
    v6 = "DragRect";
    local l_v6_34 = v6 --[[ copy: 3 -> 38 ]];
    v1.DragRect = function(v112, v113) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_34 (copy)
        return v1.Internal._Insert(l_v6_34, v112, v113);
    end;
    v6 = "InputColor3";
    local l_v6_35 = v6 --[[ copy: 3 -> 39 ]];
    v1.InputColor3 = function(v115, v116) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_35 (copy)
        return v1.Internal._Insert(l_v6_35, v115, v116);
    end;
    v6 = "InputColor4";
    local l_v6_36 = v6 --[[ copy: 3 -> 40 ]];
    v1.InputColor4 = function(v118, v119) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_36 (copy)
        return v1.Internal._Insert(l_v6_36, v118, v119);
    end;
    v6 = "SliderNum";
    local l_v6_37 = v6 --[[ copy: 3 -> 41 ]];
    v1.SliderNum = function(v121, v122) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_37 (copy)
        return v1.Internal._Insert(l_v6_37, v121, v122);
    end;
    v6 = "SliderVector2";
    local l_v6_38 = v6 --[[ copy: 3 -> 42 ]];
    v1.SliderVector2 = function(v124, v125) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_38 (copy)
        return v1.Internal._Insert(l_v6_38, v124, v125);
    end;
    v6 = "SliderVector3";
    local l_v6_39 = v6 --[[ copy: 3 -> 43 ]];
    v1.SliderVector3 = function(v127, v128) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_39 (copy)
        return v1.Internal._Insert(l_v6_39, v127, v128);
    end;
    v6 = "SliderUDim";
    local l_v6_40 = v6 --[[ copy: 3 -> 44 ]];
    v1.SliderUDim = function(v130, v131) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_40 (copy)
        return v1.Internal._Insert(l_v6_40, v130, v131);
    end;
    v6 = "SliderUDim2";
    local l_v6_41 = v6 --[[ copy: 3 -> 45 ]];
    v1.SliderUDim2 = function(v133, v134) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_41 (copy)
        return v1.Internal._Insert(l_v6_41, v133, v134);
    end;
    v6 = "SliderRect";
    local l_v6_42 = v6 --[[ copy: 3 -> 46 ]];
    v1.SliderRect = function(v136, v137) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_42 (copy)
        return v1.Internal._Insert(l_v6_42, v136, v137);
    end;
    v6 = "Selectable";
    local l_v6_43 = v6 --[[ copy: 3 -> 47 ]];
    v1.Selectable = function(v139, v140) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_43 (copy)
        return v1.Internal._Insert(l_v6_43, v139, v140);
    end;
    v6 = "Combo";
    local l_v6_44 = v6 --[[ copy: 3 -> 48 ]];
    v1.Combo = function(v142, v143) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_44 (copy)
        return v1.Internal._Insert(l_v6_44, v142, v143);
    end;
    v1.ComboArray = function(v144, v145, v146) --[[ Line: 1665 ]]
        -- upvalues: v1 (copy)
        local v147 = nil;
        v147 = if v145 == nil then v1.State(v146[1]) else v145;
        local v148 = v1.Internal._Insert("Combo", v144, v147);
        local l_index_0 = v148.state.index;
        for _, v151 in v146 do
            v1.Internal._Insert("Selectable", {
                v151, 
                v151
            }, {
                index = l_index_0
            });
        end;
        v1.End();
        return v148;
    end;
    v1.ComboEnum = function(v152, v153, v154) --[[ Line: 1714 ]]
        -- upvalues: v1 (copy)
        local v155 = nil;
        v155 = if v153 == nil then v1.State(v154:GetEnumItems()[1]) else v153;
        local v156 = v1.Internal._Insert("Combo", v152, v155);
        local l_index_1 = v156.state.index;
        for _, v159 in v154:GetEnumItems() do
            v1.Internal._Insert("Selectable", {
                v159.Name, 
                v159
            }, {
                index = l_index_1
            });
        end;
        v1.End();
        return v156;
    end;
    v1.InputEnum = v1.ComboEnum;
    v6 = "ProgressBar";
    local l_v6_45 = v6 --[[ copy: 3 -> 49 ]];
    v1.ProgressBar = function(v161, v162) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_45 (copy)
        return v1.Internal._Insert(l_v6_45, v161, v162);
    end;
    v6 = "PlotLines";
    local l_v6_46 = v6 --[[ copy: 3 -> 50 ]];
    v1.PlotLines = function(v164, v165) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_46 (copy)
        return v1.Internal._Insert(l_v6_46, v164, v165);
    end;
    v6 = "PlotHistogram";
    local l_v6_47 = v6 --[[ copy: 3 -> 51 ]];
    v1.PlotHistogram = function(v167, v168) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_47 (copy)
        return v1.Internal._Insert(l_v6_47, v167, v168);
    end;
    v6 = "Table";
    v1.Table = function(v169, v170) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), v6 (copy)
        return v1.Internal._Insert(v6, v169, v170);
    end;
    v1.NextColumn = function() --[[ Line: 1971 ]]
        -- upvalues: v1 (copy)
        local v171 = v1.Internal._GetParentWidget();
        assert(v171 ~= nil, "Iris.NextColumn() can only called when directly within a table.");
        if v171._columnIndex == v171.arguments.NumColumns then
            v171._columnIndex = 1;
            v171._rowIndex = v171._rowIndex + 1;
        else
            v171._columnIndex = v171._columnIndex + 1;
        end;
        return v171._columnIndex;
    end;
    v1.NextRow = function() --[[ Line: 1991 ]]
        -- upvalues: v1 (copy)
        local v172 = v1.Internal._GetParentWidget();
        assert(v172 ~= nil, "Iris.NextRow() can only called when directly within a table.");
        v172._columnIndex = 1;
        v172._rowIndex = v172._rowIndex + 1;
        return v172._rowIndex;
    end;
    v1.SetColumnIndex = function(v173) --[[ Line: 2008 ]]
        -- upvalues: v1 (copy)
        local v174 = v1.Internal._GetParentWidget();
        assert(v174 ~= nil, "Iris.SetColumnIndex() can only called when directly within a table.");
        local v175 = false;
        if v173 >= 1 then
            v175 = v173 <= v174.arguments.NumColumns;
        end;
        assert(v175, (("The index must be between 1 and %*, inclusive."):format(v174.arguments.NumColumns)));
        v174._columnIndex = v173;
    end;
    v1.SetRowIndex = function(v176) --[[ Line: 2022 ]]
        -- upvalues: v1 (copy)
        local v177 = v1.Internal._GetParentWidget();
        assert(v177 ~= nil, "Iris.SetRowIndex() can only called when directly within a table.");
        assert(v176 >= 1, "The index must be greater or equal to 1.");
        v177._rowIndex = v176;
    end;
    v1.NextHeaderColumn = function() --[[ Line: 2036 ]]
        -- upvalues: v1 (copy)
        local v178 = v1.Internal._GetParentWidget();
        assert(v178 ~= nil, "Iris.NextHeaderColumn() can only called when directly within a table.");
        v178._rowIndex = 0;
        v178._columnIndex = v178._columnIndex % v178.arguments.NumColumns + 1;
        return v178._columnIndex;
    end;
    v1.SetHeaderColumnIndex = function(v179) --[[ Line: 2055 ]]
        -- upvalues: v1 (copy)
        local v180 = v1.Internal._GetParentWidget();
        assert(v180 ~= nil, "Iris.SetHeaderColumnIndex() can only called when directly within a table.");
        local v181 = false;
        if v179 >= 1 then
            v181 = v179 <= v180.arguments.NumColumns;
        end;
        assert(v181, (("The index must be between 1 and %*, inclusive."):format(v180.arguments.NumColumns)));
        v180._rowIndex = 0;
        v180._columnIndex = v179;
    end;
    v1.SetColumnWidth = function(v182, v183) --[[ Line: 2076 ]]
        -- upvalues: v1 (copy)
        local v184 = v1.Internal._GetParentWidget();
        assert(v184 ~= nil, "Iris.SetColumnWidth() can only called when directly within a table.");
        local v185 = false;
        if v182 >= 1 then
            v185 = v182 <= v184.arguments.NumColumns;
        end;
        assert(v185, (("The index must be between 1 and %*, inclusive."):format(v184.arguments.NumColumns)));
        local v186 = v184.state.widths.value[v182];
        v184.state.widths.value[v182] = v183;
        v184.state.widths:set(v184.state.widths.value, v183 ~= v186);
    end;
end;