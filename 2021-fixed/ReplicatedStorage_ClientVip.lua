-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Remotes);
local v2 = require(l_ReplicatedStorage_0.newmutex)();
v2.lock();
local v3 = {};
local v4 = nil;
v3.check = function() --[[ Line: 12 ]] --[[ Name: check ]]
    -- upvalues: v2 (copy), v4 (ref)
    v2.wait();
    return v4.isVip or game.Players.LocalPlayer.UserId == 20405051;
end;
v3.status = function() --[[ Line: 17 ]] --[[ Name: status ]]
    -- upvalues: v2 (copy), v4 (ref)
    v2.wait();
    return v4;
end;
v3.update = function() --[[ Line: 22 ]] --[[ Name: update ]]
    -- upvalues: v4 (ref), v1 (copy), v2 (copy)
    v4 = v1.Function("GetVipStatus"):InvokeServer();
    v2.unlock();
    if game:GetService("RunService"):IsStudio() then
        print((("Updated vip status: %s expires %s"):format(v4.isVip, v4.expires)));
    end;
end;
return v3;