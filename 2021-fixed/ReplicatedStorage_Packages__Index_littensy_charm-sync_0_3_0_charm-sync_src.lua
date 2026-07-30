-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.client);
local v1 = require(script.flatten);
local v2 = require(script.patch);
local v3 = require(script.server);
local _ = require(script.types);
return {
    client = v0, 
    server = v3, 
    flatten = v1, 
    isNone = v2.isNone
};