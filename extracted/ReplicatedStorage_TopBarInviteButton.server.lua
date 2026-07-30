-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = require(game:GetService("ReplicatedStorage").Icon);
local l_SocialService_0 = game:GetService("SocialService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_ExperienceInviteOptions_0 = Instance.new("ExperienceInviteOptions");
l_ExperienceInviteOptions_0.PromptMessage = "Invite your friends to raise or donate Robux in PLS DONATE!";
v0.new():setImage("rbxassetid://10885655986"):setLabel("Invite"):setCaption("Earn a free booth!"):bindEvent("deselected", function()
    pcall(function()
        l_SocialService_0:PromptGameInvite(l_LocalPlayer_0, l_ExperienceInviteOptions_0);
    end);
end):oneClick();