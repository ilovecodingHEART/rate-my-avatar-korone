-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local HttpService = game:GetService("HttpService")

return function(registry)
	registry:RegisterType("json", {
		Validate = function(text)
			return pcall(HttpService.JSONDecode, HttpService, text)
		end;

		Parse = function(text)
			return HttpService:JSONDecode(text)
		end
	})
end
