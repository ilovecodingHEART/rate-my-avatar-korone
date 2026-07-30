-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return {
	Name = "blink";
	Aliases = {"b"};
	Description = "Teleports you to where your mouse is hovering.";
	Group = "DefaultDebug";
	Args = {};

	ClientRun = function(context)
		-- We implement this here because player position is owned by the client.
		-- No reason to bother the server for this!

		local mouse = context.Executor:GetMouse()
		local character = context.Executor.Character

		if not character then
			return "You don't have a character."
		end

		character:MoveTo(mouse.Hit.p)

		return "Blinked!"
	end
}