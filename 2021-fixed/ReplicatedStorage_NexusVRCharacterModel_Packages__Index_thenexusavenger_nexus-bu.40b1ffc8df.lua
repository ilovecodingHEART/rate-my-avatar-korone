-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_BufferedRemoteEventReceiver_0 = require(script:WaitForChild("Receiver"):WaitForChild("BufferedRemoteEventReceiver"));
local l_PlayerBufferedRemoteEventReceiver_0 = require(script:WaitForChild("Receiver"):WaitForChild("PlayerBufferedRemoteEventReceiver"));
local l_BufferedRemoteEventSender_0 = require(script:WaitForChild("Sender"):WaitForChild("BufferedRemoteEventSender"));
local l_EnrollableRemoteEvent_0 = require(script:WaitForChild("Sender"):WaitForChild("EnrollableRemoteEvent"));
return {
    Receiver = {
        BufferedRemoteEventReceiver = l_BufferedRemoteEventReceiver_0, 
        PlayerBufferedRemoteEventReceiver = l_PlayerBufferedRemoteEventReceiver_0
    }, 
    Sender = {
        BufferedRemoteEventSender = l_BufferedRemoteEventSender_0, 
        EnrollableRemoteEvent = l_EnrollableRemoteEvent_0
    }
};