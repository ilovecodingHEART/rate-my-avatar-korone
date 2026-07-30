-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v4 = 0;
local v5 = require(game.ReplicatedStorage.popup);
v4 = game.PlaceId == 14569410003 and 2196126949 or 2196129038;
local v6 = require(game.ReplicatedStorage.Remotes);
local v7 = nil;
script.Parent.Triggered:Connect(function()
	if v7 == nil then
		v7 = v6.Function("HasCarouselBooth"):InvokeServer();
	end;
	if v7 then
		v5("danger", "already owned!");
		return;
	else
		v6.Function("BuyCarouselBooth"):InvokeServer();
	end;
end);