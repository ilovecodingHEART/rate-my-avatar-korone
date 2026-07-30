-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.GetAttachmentCFrame = function(_, v2, v3) --[[ Line: 23 ]] --[[ Name: GetAttachmentCFrame ]]
    local l_v2_FirstChild_0 = v2:FindFirstChild(v3);
    return l_v2_FirstChild_0 and l_v2_FirstChild_0.CFrame or CFrame.identity;
end;
return v0;