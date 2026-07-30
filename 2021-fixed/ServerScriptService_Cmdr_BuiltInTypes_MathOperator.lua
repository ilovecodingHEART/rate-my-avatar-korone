-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
return function(registry)
	registry:RegisterType("mathOperator", registry.Cmdr.Util.MakeEnumType("Math Operator", {
		{
			Name = "+";
			Perform = function(a, b)
				return a + b
			end
		};
		{
			Name = "-";
			Perform = function(a, b)
				return a - b
			end
		};
		{
			Name = "*";
			Perform = function(a, b)
				return a * b
			end
		};
		{
			Name = "/";
			Perform = function(a, b)
				return a / b
			end
		};
		{
			Name = "**";
			Perform = function(a, b)
				return a ^ b
			end
		};
		{
			Name = "%";
			Perform = function(a, b)
				return a % b
			end
		}
	}))
end
