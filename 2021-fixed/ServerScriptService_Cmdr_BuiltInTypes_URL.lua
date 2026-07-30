-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Util = require(script.Parent.Parent.Shared.Util)

local storedKeyType = {
	Validate = function(text)
		if text:match("^https?://.+$") then
			return true
		end

		return false, "URLs must begin with http:// or https://"
	end;

	Parse = function(text)
		return text
	end;
}

return function (cmdr)
	cmdr:RegisterType("url", storedKeyType)
	cmdr:RegisterType("urls", Util.MakeListableType(storedKeyType))
end
