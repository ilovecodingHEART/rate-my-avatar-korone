-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_FriendsLocator_0 = game:GetService("ReplicatedStorage"):WaitForChild("FriendsLocator");
local v2 = require(l_FriendsLocator_0.Packages.Roact);
local v3 = require(l_FriendsLocator_0.Configuration.FriendsLocatorConfiguration);
local l_ConfigurationContext_0 = require(l_FriendsLocator_0.Libraries.Configuration).ConfigurationContext;
local v5 = require(l_FriendsLocator_0.Components.FriendsBillboards);
local l_ConfigurationProvider_0 = l_ConfigurationContext_0.ConfigurationProvider;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v8 = v2.createElement(l_ConfigurationProvider_0, {
    config = v3
}, {
    v2.createElement(v5)
});
v2.mount(v8, l_LocalPlayer_0.PlayerGui, "FriendsLocator");