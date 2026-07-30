local v0 = require(game.ReplicatedStorage.Slerp.Client.DeferredRemoteEvent);
local l_TestRemote_0 = game.ReplicatedStorage.Slerp.RemoteEvents.TestRemote;
local v2 = v0.new(l_TestRemote_0, 0.016666666666666666);
v0.addCallback(v2, 1, function(...) --[[ Line: 6 ]]
    print("got:", {
        ...
    });
end);
v0.init(v2);