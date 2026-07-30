-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Configuration.FriendsLocatorConfiguration);
local l_BindableEvents_0 = script.BindableEvents;
return {
    configure = v0.configure, 
    visibilityChanged = l_BindableEvents_0.FriendLocatorVisibilityChanged.Event, 
    clicked = l_BindableEvents_0.FriendLocatorClicked.Event
};