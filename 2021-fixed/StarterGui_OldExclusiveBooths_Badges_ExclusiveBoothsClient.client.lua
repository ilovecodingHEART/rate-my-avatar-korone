-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_BadgeService_0 = game:GetService("BadgeService");
local _ = game:GetService("CollectionService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Children_0 = script.Parent:GetChildren();
script.Parent.Parent.Adornee = workspace.ExclusiveBoothsPart;
for _, v6 in ipairs(l_Children_0) do
    if v6.ClassName == "Frame" and l_BadgeService_0:UserHasBadgeAsync(l_LocalPlayer_0.UserId, v6.BadgeId.Value) then
        v6.Info.Owned.Visible = true;
        v6.Top.BadgeIcon.Image = "rbxassetid://" .. l_BadgeService_0:GetBadgeInfoAsync(v6.BadgeId.Value).IconImageId;
        v6.LayoutOrder = -999;
    end;
end;