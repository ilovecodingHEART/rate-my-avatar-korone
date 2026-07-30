-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_ReplicatedStorage_0.Roact);
local v3 = require(script.Parent.Leaderboard);
return function(v4) --[[ Line: 9 ]]
    local v5 = l_StarterGui_0.ScreenGui.BoothStatistics:Clone();
    local v6 = v2.mount(v2.createElement(v3, {
        leaderboard = {
            {
                userId = 20405051, 
                robux = 10000
            }, 
            {
                userId = 151848836, 
                robux = 3452
            }, 
            {
                userId = 1, 
                robux = 1
            }, 
            {
                userId = 2, 
                robux = 2
            }, 
            {
                userId = 3, 
                robux = 3
            }
        }
    }), v5.Leaderboard);
    v5.Visible = true;
    v5.Parent = v4;
    return function() --[[ Line: 32 ]]
        v2.unmount(v6);
        v5:Destroy();
    end;
end;