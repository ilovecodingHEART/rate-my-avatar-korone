-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- 22slipz

local ServerStorage = game:GetService("ServerStorage")

local function Lock(tool)
	if tool:IsA("Tool") then
		tool.CanBeDropped = false
		
		tool:GetPropertyChangedSignal("CanBeDropped"):Connect(function()
			if tool.CanBeDropped then
				tool.CanBeDropped = false
			end
		end)
	end
end

for _, item in ipairs(ServerStorage:GetDescendants()) do
	Lock(item)
end

ServerStorage.DescendantAdded:Connect(Lock)