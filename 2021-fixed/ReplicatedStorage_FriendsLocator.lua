-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(script.Configuration.FriendsLocatorConfiguration);
local l_BindableEvents_0 = script.BindableEvents;
return {
    configure = v0.configure, 
    visibilityChanged = l_BindableEvents_0.FriendLocatorVisibilityChanged.Event, 
    clicked = l_BindableEvents_0.FriendLocatorClicked.Event
};