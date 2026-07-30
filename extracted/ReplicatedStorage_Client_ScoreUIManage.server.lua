-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Charm_0 = require(script.Parent.Parent:WaitForChild("Packages"):WaitForChild("Charm"));
local l_atoms_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("atoms"));
local l_Util_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Util"));
local l_atoms_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Client"):WaitForChild("atoms"));
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v5 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("Adidas", 1e999);
l_Charm_0.subscribe(l_atoms_1.GameplayStatus, function(v6) --[[ Line: 12 ]]
    -- upvalues: v5 (copy)
    v5.ScoreUI.Visible = v6 == "penalty";
    if v6 == "penalty" then
        game.SoundService.Music.AdidasTrack.SoundId = "rbxassetid://79511908539454";
        return;
    else
        game.SoundService.Music.AdidasTrack.SoundId = "rbxassetid://105569946096492";
        return;
    end;
end);
l_Charm_0.subscribe(l_atoms_0.goals, function(v7) --[[ Line: 21 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v5 (copy)
    if not v7[l_LocalPlayer_0.Name] then
        return;
    else
        v5.ScoreUI.Goals.Score.Text = v7[l_LocalPlayer_0.Name];
        return;
    end;
end);
l_Charm_0.subscribe(l_atoms_0["players/datastore"], function(v8) --[[ Line: 26 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v5 (copy), l_Util_0 (copy)
    local l_team_0 = (v8[l_LocalPlayer_0.Name] or {}).team;
    if not l_team_0 then
        return;
    else
        v5.ScoreUI.Team.TeamLogo.Image = ("rbxassetid://%*"):format(l_Util_0.findTeamByName(l_team_0).LogoId);
        return;
    end;
end);