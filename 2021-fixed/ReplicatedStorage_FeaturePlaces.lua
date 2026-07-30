-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local v0 = 0;
local v1 = 8737602449;
local v2 = game.PlaceId == 8943844393 and "voice" or game.PlaceId == v0 and "legacy" or "normal";
if game.GameId == 3355148533 then
    v0 = 8945794252;
    v1 = 8869572430;
    v2 = v2 .. "-test";
end;
local v3 = game.PlaceId == v0;
if game:GetService("RunService"):IsStudio() and script:GetAttribute("ForceLegacy") then
    v3 = true;
end;
return {
    PlaceName = v2, 
    IsVoiceChatOnly = game.PlaceId == 0, 
    IsDeluxeVoiceChatOnly = game.PlaceId == 0, 
    IsLegacyMap = v3, 
    VoiceChatOnlyPlaceId = 0, 
    DeluxeVoiceChatOnlyPlaceId = 0, 
    LegacyMapPlaceId = v0, 
    LivePlaceId = v1
};