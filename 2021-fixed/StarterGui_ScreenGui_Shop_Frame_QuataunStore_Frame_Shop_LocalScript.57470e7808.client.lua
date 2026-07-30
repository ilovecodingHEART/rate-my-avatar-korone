-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_PolicyService_0 = game:GetService("PolicyService");
local v1 = require(game.ReplicatedStorage.popup);
local l_QuataunStore_0 = game.Players.LocalPlayer.PlayerGui.CustomCoreGui.QuataunStore;
script.Parent.Activated:Connect(function() --[[ Line: 5 ]]
    -- upvalues: l_PolicyService_0 (copy), v1 (copy), l_QuataunStore_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 6 ]]
        -- upvalues: l_PolicyService_0 (ref)
        return l_PolicyService_0:GetPolicyInfoForPlayerAsync(game.Players.LocalPlayer);
    end);
    if not l_status_0 then
        warn("PolicyService error: " .. l_result_0);
        return;
    elseif not l_result_0.IsEligibleToPurchaseCommerceProduct then
        v1("warn", "Ineligible to buy commerce products through Roblox. (Outside US / Under 13)");
        if l_result_0.AllowedExternalLinkReferences then
            v1("info", "Join and view announcements in our Discord server (discord.gg/hazem) to learn how you can view our store without being in the US/13+!");
        end;
        return;
    else
        l_QuataunStore_0.Visible = not l_QuataunStore_0.Visible;
        return;
    end;
end);