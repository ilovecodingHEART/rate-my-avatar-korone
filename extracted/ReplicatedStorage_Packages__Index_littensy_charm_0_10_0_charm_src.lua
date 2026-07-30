-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.atom);
local v1 = require(script.computed);
local v2 = require(script.effect);
local v3 = require(script.mapped);
local v4 = require(script.observe);
local v5 = require(script.store);
local v6 = require(script.subscribe);
local _ = require(script.types);
return {
    atom = v0, 
    computed = v1, 
    effect = v2, 
    mapped = v3, 
    observe = v4, 
    subscribe = v6, 
    batch = v5.batch, 
    capture = v5.capture, 
    isAtom = v5.isAtom, 
    notify = v5.notify, 
    peek = v5.peek
};