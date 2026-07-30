-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

task.defer(function() --[[ Line: 21 ]]
    local l_RunService_0 = game:GetService("RunService");
    local v1 = require(script.Parent.VERSION);
    local v2 = v1.getAppVersion();
    local v3 = v1.getLatestVersion();
    local v4 = not v1.isUpToDate();
    if not l_RunService_0:IsStudio() then
        print((("\240\159\141\141 Running TopbarPlus %s by @ForeverHD & HD Admin"):format(v2)));
    end;
    if v4 then
        warn((("A new version of TopbarPlus (%s) is available: https://devforum.roblox.com/t/topbarplus/1017485"):format(v3)));
    end;
end);
return {};