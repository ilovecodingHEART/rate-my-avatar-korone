-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local Util = require(script.Parent.Parent.Shared.Util)

local combinedInputEnums = Enum.UserInputType:GetEnumItems()

for _, e in pairs(Enum.KeyCode:GetEnumItems()) do
	combinedInputEnums[#combinedInputEnums + 1] = e
end

local userInputType = {
	Transform = function (text)
		local findEnum = Util.MakeFuzzyFinder(combinedInputEnums)

		return findEnum(text)
	end;

	Validate = function (enums)
		return #enums > 0
	end;

	Autocomplete = function (enums)
		return Util.GetNames(enums)
	end;

	Parse = function (enums)
		return enums[1];
	end;
}

return function (cmdr)
	cmdr:RegisterType("userInput", userInputType)
	cmdr:RegisterType("userInputs", Util.MakeListableType(userInputType))
end