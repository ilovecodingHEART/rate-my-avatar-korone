-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("PhysicsService");
local _ = require(script.Parent.Parent.Parent);
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent);
local l_Assets_0 = l_Parent_0:WaitForChild("Assets");
local l_Events_0 = l_Parent_0:WaitForChild("Events");
local v8 = {
    Snowballs = {}
};
v8.GiveSnowballs = function(_) --[[ Line: 21 ]] --[[ Name: GiveSnowballs ]]
    -- upvalues: l_Players_0 (copy), l_Assets_0 (copy), l_Events_0 (copy), v8 (copy)
    for _, v11 in pairs(l_Players_0:GetPlayers()) do
        local v12 = l_Assets_0.Models.Snowball:Clone();
        v12.Parent = v11.Backpack;
        l_Events_0.GiveSnowball:FireClient(v11, v12);
        table.insert(v8.Snowballs, v12);
    end;
    script.Init.CanFire.Value = true;
end;
v8.DestroySnowballs = function(_) --[[ Line: 34 ]] --[[ Name: DestroySnowballs ]]
    -- upvalues: v8 (copy)
    for _, v15 in pairs(v8.Snowballs) do
        pcall(function() --[[ Line: 37 ]]
            -- upvalues: v15 (copy)
            if v15 and v15.Parent then
                v15:Destroy();
            end;
        end);
    end;
    script.Init.CanFire.Value = false;
end;
v8.PlayEffect = function(_) --[[ Line: 47 ]] --[[ Name: PlayEffect ]]
    -- upvalues: l_Players_0 (copy), l_Events_0 (copy), v8 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    for _, v19 in pairs(l_l_Players_0_Players_0) do
        l_Events_0.Play:FireClient(v19);
    end;
    task.delay(10, function() --[[ Line: 54 ]]
        -- upvalues: v8 (ref)
        v8:GiveSnowballs();
        task.delay(1200, function() --[[ Line: 57 ]]
            -- upvalues: v8 (ref)
            v8:DestroySnowballs();
        end);
    end);
end;
return v8;