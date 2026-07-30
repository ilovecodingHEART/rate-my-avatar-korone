-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ToolIcon_0 = require(script.Parent:WaitForChild("ToolIcon"));
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = setmetatable({
        IconGroups = {}
    }, v1);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    v2.AdornFrame = l_Frame_0;
    return v2;
end;
v1.CreateToolIcon = function(v4, v5, v6) --[[ Line: 40 ]] --[[ Name: CreateToolIcon ]]
    -- upvalues: l_ToolIcon_0 (copy)
    return l_ToolIcon_0.new(v4.AdornFrame, v5, v6);
end;
v1.SetRadius = function(v7, v8) --[[ Line: 47 ]] --[[ Name: SetRadius ]]
    v8 = math.max(1, v8);
    if v8 == #v7.IconGroups then
        return;
    else
        for v9 = #v7.IconGroups + 1, v8 do
            local v10 = {};
            for v11 = 1, v9 + 1 do
                table.insert(v10, v7:CreateToolIcon(-(v9 + 1) / 2 + v11 - 0.5, -v9));
            end;
            local v12 = {};
            local v13 = v9 + 1;
            for v14 = 2, 2 * v9 do
                if v14 <= v9 + 1 then
                    v13 = v13 + 1;
                else
                    v13 = v13 + -1;
                end;
                table.insert(v12, v7:CreateToolIcon(-v13 / 2 + 1 - 0.5, -v9 + v14 - 1));
                table.insert(v10, v7:CreateToolIcon(-v13 / 2 + v13 - 0.5, -v9 + v14 - 1));
            end;
            for v15 = v9 + 1, 1, -1 do
                table.insert(v10, v7:CreateToolIcon(-(v9 + 1) / 2 + v15 - 0.5, v9));
            end;
            for v16 = #v12, 1, -1 do
                table.insert(v10, v12[v16]);
            end;
            table.insert(v7.IconGroups, v10);
        end;
        for v17 = #v7.IconGroups, v8 + 1, -1 do
            local v18 = v7.IconGroups[v17];
            table.remove(v7.IconGroups, v17);
            for _, v20 in v18 do
                v20:Destroy();
            end;
        end;
        return;
    end;
end;
v1.SetTools = function(v21, v22) --[[ Line: 97 ]] --[[ Name: SetTools ]]
    local v23 = 1;
    local v24 = 6;
    while v24 < #v22 do
        v23 = v23 + 1;
        v24 = v24 + v23 * 6;
    end;
    v21:SetRadius(v23);
    local v25 = 1;
    for _, v27 in v21.IconGroups do
        for _, v29 in v27 do
            v29:SetTool(v22[v25]);
            v25 = v25 + 1;
        end;
    end;
end;
v1.UpdateFocusedIcon = function(v30, v31, v32) --[[ Line: 120 ]] --[[ Name: UpdateFocusedIcon ]]
    local v33 = nil;
    local v34 = 0.5;
    for _, v36 in v30.IconGroups do
        for _, v38 in v36 do
            local v39 = ((v31 - v38.RelativePositionX) ^ 2 + (v32 - v38.RelativePositionY) ^ 2) ^ 0.5;
            if v39 < v34 then
                v33 = v38;
                v34 = v39;
            end;
        end;
    end;
    if v33 ~= v30.FocusedIcon then
        if v30.FocusedIcon then
            v30.FocusedIcon:SetFocused(false);
        end;
        if v33 then
            v33:SetFocused(true);
        end;
        v30.FocusedIcon = v33;
    end;
end;
v1.Destroy = function(v40) --[[ Line: 149 ]] --[[ Name: Destroy ]]
    v40.AdornFrame:Destroy();
    for _, v42 in v40.IconGroups do
        for _, v44 in v42 do
            v44:Destroy();
        end;
    end;
    v40.IconGroups = {};
end;
return v1;