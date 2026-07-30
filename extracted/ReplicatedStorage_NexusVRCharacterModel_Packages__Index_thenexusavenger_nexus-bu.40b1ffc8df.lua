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