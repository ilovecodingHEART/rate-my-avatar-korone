-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.Utility.None);
local v4 = {};
local v5 = false;
local v6 = {};
local v7 = {};
v4.enqueueProperty = function(v8, v9, v10) --[[ Line: 20 ]] --[[ Name: enqueueProperty ]]
    v5 = true;
    if v10 == nil then
        v10 = v3;
    end;
    local v11 = v6[v8];
    if v11 == nil then
        v6[v8] = {
            [v9] = v10
        };
        return;
    else
        v11[v9] = v10;
        return;
    end;
end;
v4.enqueueCallback = function(v12) --[[ Line: 41 ]] --[[ Name: enqueueCallback ]]
    v5 = true;
    v7[v12] = true;
end;
v4.runTasks = function() --[[ Line: 50 ]] --[[ Name: runTasks ]]
    if not v5 then
        return;
    else
        for v13, v14 in pairs(v6) do
            for v15, v16 in pairs(v14) do
                if v16 == v3 then
                    v16 = nil;
                end;
                v13[v15] = v16;
            end;
        end;
        for v17 in pairs(v7) do
            v17();
        end;
        v5 = false;
        table.clear(v6);
        table.clear(v7);
        return;
    end;
end;
l_RunService_0:BindToRenderStep("__FusionUIScheduler", Enum.RenderPriority.Last.Value, v4.runTasks);
return v4;