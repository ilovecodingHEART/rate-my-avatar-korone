-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ScreenGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui");
local v4 = require(l_ReplicatedStorage_0.popup);
local function _(v5, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	l_TweenService_0:Create(v5, TweenInfo.new(v6, v8 or Enum.EasingStyle.Back), v7):Play();
end;
local v10 = 0;
return function(v11) --[[ Line: 18 ]] --[[ Name: toggleLoading ]]
	-- upvalues: v10 (ref), l_TweenService_0 (copy), l_ScreenGui_0 (copy), v4 (copy)
	v10 = v10 + 1;
	local l_v10_0 = v10;
	if v11 == true then
		local l_Camera_0 = workspace.Camera;
		local v14 = {
			FieldOfView = 50
		};
		l_TweenService_0:Create(l_Camera_0, TweenInfo.new(0.5, Enum.EasingStyle.Back), v14):Play();
		l_Camera_0 = l_ScreenGui_0.Loading;
		v14 = {
			GroupTransparency = 0
		};
		l_TweenService_0:Create(l_Camera_0, TweenInfo.new(0.5, Enum.EasingStyle.Back), v14):Play();
		task.delay(8, function() --[[ Line: 29 ]]
			-- upvalues: l_v10_0 (copy), v10 (ref), l_ScreenGui_0 (ref), l_TweenService_0 (ref), v4 (ref)
			if l_v10_0 == v10 and l_ScreenGui_0.Loading.GroupTransparency == 0 then
				local l_Camera_1 = workspace.Camera;
				local v16 = {
					FieldOfView = 70
				};
				l_TweenService_0:Create(l_Camera_1, TweenInfo.new(0.5, Enum.EasingStyle.Back), v16):Play();
				l_Camera_1 = l_ScreenGui_0.Loading;
				v16 = {
					GroupTransparency = 1
				};
				l_TweenService_0:Create(l_Camera_1, TweenInfo.new(0.5, Enum.EasingStyle.Back), v16):Play();
				v4("warn", "timed out!");
			end;
		end);
		return;
	else
		local l_Camera_2 = workspace.Camera;
		local v18 = {
			FieldOfView = 70
		};
		l_TweenService_0:Create(l_Camera_2, TweenInfo.new(0.5, Enum.EasingStyle.Back), v18):Play();
		l_Camera_2 = l_ScreenGui_0.Loading;
		v18 = {
			GroupTransparency = 1
		};
		l_TweenService_0:Create(l_Camera_2, TweenInfo.new(0.5, Enum.EasingStyle.Back), v18):Play();
		return;
	end;
end;