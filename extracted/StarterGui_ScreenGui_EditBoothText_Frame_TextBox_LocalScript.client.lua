-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local _ = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local l_AISuggestions_0 = l_Parent_0.AISuggestions;
local v5 = tick();
tween = function(v6, v7, v8) --[[ Line: 10 ]] --[[ Name: tween ]]
	-- upvalues: l_TweenService_0 (copy)
	l_TweenService_0:Create(v6, TweenInfo.new(v7, Enum.EasingStyle.Quint), v8):Play();
end;
local l_AITextSuggestion_0 = l_ReplicatedStorage_0:WaitForChild("AITextSuggestion");
local v10 = 0;
local function _(v11) --[[ Line: 18 ]] --[[ Name: rotateGradientInfinite ]]
	spawn(function() --[[ Line: 19 ]]
		-- upvalues: v11 (copy)
		while true do
			for v12 = 0, 360 do
				v11.Rotation = v12;
				wait(0.01);
			end;
		end;
	end);
end;
local function v29(v14, v15) --[[ Line: 30 ]] --[[ Name: debounceRequest ]]
	-- upvalues: l_Parent_0 (copy), v5 (ref), v10 (ref), l_AITextSuggestion_0 (copy), l_AISuggestions_0 (copy)
	if l_Parent_0:IsFocused() then
		v5 = tick();
		wait(2);
		if tick() - v5 >= 2 and v10 == v15 then
			if not l_Parent_0:IsFocused() then
				return;
			else
				local v16 = l_AITextSuggestion_0:InvokeServer(v14);
				if v16 ~= false then
					local v17 = {};
					local v18 = v16:gsub("^[^.]*%:", ""):gsub("^%s*(.-)%s*$", "%1"):gsub("\"", ""):gsub("'", "");
					for v19 in string.gmatch(v18, "[^,]+") do
						local v20 = v19:match("^%s*(.-)%s*$");
						if v20 ~= "" then
							table.insert(v17, v20);
						end;
					end;
					spawn(function() --[[ Line: 62 ]]
						-- upvalues: l_AISuggestions_0 (ref), v17 (copy), l_Parent_0 (ref)
						for _, v22 in l_AISuggestions_0:GetChildren() do
							if v22:IsA("TextButton") then
								tween(v22.UIScale, 0.5, {
									Scale = 0
								});
								tween(v22, 0.25, {
									Transparency = 1
								});
								spawn(function() --[[ Line: 67 ]]
									-- upvalues: v22 (copy)
									v22:Destroy();
								end);
							end;
						end;
						for v23, v24 in ipairs(v17) do
							local v25 = script.Suggestion:Clone();
							v25.Text = v24;
							v25.UIScale.Scale = 0;
							v25.LayoutOrder = v23;
							v25.Parent = l_AISuggestions_0;
							local l_UIGradient_0 = v25.UIGradient;
							spawn(function() --[[ Line: 19 ]]
								-- upvalues: l_UIGradient_0 (copy)
								while true do
									for v27 = 0, 360 do
										l_UIGradient_0.Rotation = v27;
										wait(0.01);
									end;
								end;
							end);
							tween(v25.UIScale, 0.25, {
								Scale = 1
							});
							tween(v25, 0.25, {
								Transparency = 0
							});
							v25.MouseEnter:Connect(function() --[[ Line: 83 ]]
								-- upvalues: l_Parent_0 (ref)
								l_Parent_0:ReleaseFocus();
							end);
							v25.Activated:Connect(function() --[[ Line: 87 ]]
								-- upvalues: l_Parent_0 (ref), v24 (copy)
								local l_Text_0 = l_Parent_0.Text;
								if l_Text_0:sub(-1) == " " then
									l_Parent_0.Text = l_Text_0 .. v24;
									return;
								else
									l_Parent_0.Text = l_Text_0 .. " " .. v24;
									return;
								end;
							end);
							task.wait(0.15);
						end;
					end);
				end;
			end;
		end;
	end;
end;
l_Parent_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 107 ]]
	-- upvalues: v10 (ref), l_AISuggestions_0 (copy), l_Parent_0 (copy), v29 (copy)
	v10 = v10 + 1;
	for _, v31 in l_AISuggestions_0:GetChildren() do
		if v31:IsA("TextButton") then
			tween(v31.UIScale, 0.5, {
				Scale = 0
			});
			tween(v31, 0.25, {
				Transparency = 1
			});
			spawn(function() --[[ Line: 115 ]]
				-- upvalues: v31 (copy)
				v31:Destroy();
			end);
		end;
	end;
	if l_Parent_0.Text ~= "" then
		v29(l_Parent_0.Text, v10);
	end;
end);