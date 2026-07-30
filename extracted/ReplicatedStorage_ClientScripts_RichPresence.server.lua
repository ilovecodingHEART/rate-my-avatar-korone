local l_ScreenGui_0 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui", 10);
local v1 = require(game.ReplicatedStorage.BloxstrapRPC);
v1.SetRichPresence({
	details = "PLS DONATE \240\159\146\184", 
    state = "In Lobby", 
    largeImage = {
        assetId = 8945426040, 
		hoverText = "PLS DONATE \240\159\146\184"
    }, 
    smallImage = {
        assetId = 8945426040, 
		hoverText = "PLS DONATE \240\159\146\184"
    }
});
l_ScreenGui_0.ClientMain.Activity:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 22 ]]
    v1.SetRichPresence({
		details = "PLS DONATE \240\159\146\184", 
        state = l_ScreenGui_0.ClientMain.Activity.Value, 
        largeImage = {
            assetId = 8945426040, 
			hoverText = "PLS DONATE \240\159\146\184"
        }, 
        smallImage = {
            assetId = 8945426040, 
			hoverText = "PLS DONATE \240\159\146\184"
        }
    });
end);