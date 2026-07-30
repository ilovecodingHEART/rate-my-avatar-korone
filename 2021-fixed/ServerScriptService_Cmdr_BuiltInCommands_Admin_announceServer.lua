-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local Chat = game:GetService("Chat")

return function (context, text)
	local filterResult = TextService:FilterStringAsync(text, context.Executor.UserId, Enum.TextFilterContext.PublicChat)

	for _, player in ipairs(Players:GetPlayers()) do
		if Chat:CanUsersChatAsync(context.Executor.UserId, player.UserId) then
			context:SendEvent(player, "Message", filterResult:GetChatForUserAsync(player.UserId), context.Executor)
		end
	end

	return "Created announcement."
end