-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local v_u_1 = { Color3.fromRGB(76, 115, 202), Color3.fromRGB(182, 87, 119), Color3.fromRGB(186, 113, 67) }
while wait(math.random(1, 2)) do
	task.spawn(function()
		local v2 = ({ "Screen", "Screen2", "Screen3", "BottomSign3", "TopSign2" })[math.random(1, 5)]
		local v3 = math.random(1, 3)
		script.Parent:FindFirstChild(v2).Color = v_u_1[v3]
	end)
end