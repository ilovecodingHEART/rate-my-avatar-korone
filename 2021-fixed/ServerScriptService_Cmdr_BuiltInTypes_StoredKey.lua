-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Util = require(script.Parent.Parent.Shared.Util)

local VALID_STORED_KEY_NAME_PATTERNS = {
	"^%a[%w_]*$",
	"^%$%a[%w_]*$",
	"^%.%a[%w_]*$",
	"^%$%.%a[%w_]*$",
}

return function (registry)
	local storedKeyType = {
		Autocomplete = function(text)
			local find = registry.Cmdr.Util.MakeFuzzyFinder(registry.Cmdr.Util.DictionaryKeys(registry:GetStore("vars_used") or {}))

			return find(text)
		end;

		Validate = function(text)
			for _, pattern in ipairs(VALID_STORED_KEY_NAME_PATTERNS) do
				if text:match(pattern) then
					return true
				end
			end

			return false, "Key names must start with an optional modifier: . $ or $. and must begin with a letter."
		end;

		Parse = function(text)
			return text
		end;
	}
	registry:RegisterType("storedKey", storedKeyType)
	registry:RegisterType("storedKeys", Util.MakeListableType(storedKeyType))
end
