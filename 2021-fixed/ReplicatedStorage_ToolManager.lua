-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Tools_0 = script:WaitForChild("Tools");
local l_utils_0 = require(script:WaitForChild("utils"));
local v3 = {
    loaded = false, 
    tools = {}
};
v3.deleteTools = function(v4) --[[ Line: 13 ]] --[[ Name: deleteTools ]]
    -- upvalues: v3 (copy)
    if not v3.tools[v4.UserId] then
        return;
    else
        for _, v6 in pairs(v3.tools[v4.UserId]) do
            v6.destroy();
        end;
        return;
    end;
end;
v3.createTool = function(v7, v8) --[[ Line: 20 ]] --[[ Name: createTool ]]
    -- upvalues: l_Tools_0 (copy), v3 (copy)
    local l_Tool_0 = l_Tools_0[v8]:FindFirstChildWhichIsA("Tool");
    if not l_Tool_0 then
        warn("tool not found while creating");
        return;
    else
        l_Tool_0 = l_Tool_0:Clone();
        local v10 = require(l_Tools_0[v8].controller).server:assignTool(v7, l_Tool_0);
        l_Tool_0.Parent = v7.Backpack;
        if not v3.tools[v7.UserId] then
            v3.tools[v7.UserId] = {};
        end;
        table.insert(v3.tools[v7.UserId], v10);
        return v10, l_Tool_0;
    end;
end;
v3.load = function() --[[ Line: 41 ]] --[[ Name: load ]]
    -- upvalues: v3 (copy), l_utils_0 (copy), l_Players_0 (copy)
    if v3.loaded then
        return;
    else
        v3.loaded = true;
        l_utils_0.server:createRemoteEvent("replicate", l_utils_0.scr);
        l_Players_0.PlayerRemoving:Connect(v3.deleteTools);
        return;
    end;
end;
return v3;