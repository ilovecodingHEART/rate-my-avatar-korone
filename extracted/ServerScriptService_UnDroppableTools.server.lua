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