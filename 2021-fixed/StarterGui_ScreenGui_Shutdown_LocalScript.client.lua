-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_TweenService_0 = game:GetService("TweenService");
local function _(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: tween ]]
	local v5 = TweenInfo.new(v2, v4 or Enum.EasingStyle.Quint);
	l_TweenService_0:Create(v1, v5, v3):Play();
end;
script.Parent:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 8 ]]
	local l_Parent_0 = script.Parent;
	local v8 = {
		GroupTransparency = 0
	};
	local v9 = TweenInfo.new(1, Enum.EasingStyle.Quint);
	l_TweenService_0:Create(l_Parent_0, v9, v8):Play();
end);