-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local TeleportService = game:GetService("TeleportService")

return function (_, playerId, format)
	format = format or "PlaceIdJobId"

	local ok, _, errorText, placeId, jobId = pcall(function()
		return TeleportService:GetPlayerPlaceInstanceAsync(playerId)
	end)

	if not ok or (errorText and #errorText > 0) then
		if format == "PlaceIdJobId" then
			return "0" .. " -"
		elseif format == "PlaceId" then
			return "0"
		elseif format == "JobId" then
			return "-"
		end
	end

	if format == "PlaceIdJobId" then
		return placeId .. " " .. jobId
	elseif format == "PlaceId" then
		return tostring(placeId)
	elseif format == "JobId" then
		return tostring(jobId)
	end
end