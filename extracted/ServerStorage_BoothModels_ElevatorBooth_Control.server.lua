local buttons = script.Parent.Elevator.IndoorButtons:GetChildren();
local prismaticConstraint = script.Parent.PrismaticConstraint;
local _doors = script.Parent.Elevator;
local _heights = {
	["1"] = 0,
	["2"] = 37.599998474121094,  
	["3"] = 75.19999694824219,  
	["4"] = 112.80000305175781,  
	["5"] = 150.39999389648438,
	["6"] = 188
};
local _again = true
local function _move(arg1)
	if not _doors:GetAttribute("DoorsOpen") then
		return;
	end;
	_doors:SetAttribute("DoorsOpen", false);
	local _tween = game:GetService("TweenService"):Create(script.Parent.PrismaticConstraint, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Speed = 78.5});
	local _tween2 = game:GetService("TweenService"):Create(script.Parent.PrismaticConstraint, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {TargetPosition = arg1});
	_tween2:Play();
	_tween:Play();
	_tween.Completed:Wait();
	_doors:SetAttribute("DoorsOpen", true);
end
for _, button in pairs(buttons) do
	if button:IsA("MeshPart") then
		local click = button:FindFirstChild("ClickDetector")
		if click then
			click.MouseClick:Connect(function()
				_move(_heights[button.Name]);
			end);
		end;
	end;
end;
