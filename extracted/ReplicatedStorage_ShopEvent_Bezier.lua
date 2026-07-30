-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 05:01:35
-- Luau version 6, Types version 3
-- Time taken: 0.011698 seconds

local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function B(arg1, arg2, arg3) -- Line 20
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local function fact_upvr(arg1_2) -- Line 23, Named "fact"
		--[[ Upvalues[1]:
			[1]: fact_upvr (readonly)
		]]
		if arg1_2 == 0 then
			return 1
		end
		return arg1_2 * fact_upvr(arg1_2 - 1)
	end
	if arg1 == 0 then
	else
	end
	if arg2 == 0 then
	else
	end
	local var2 = arg1 - arg2
	if var2 == 0 then
	else
	end
	return (arg1 * fact_upvr(arg1 - 1)) / ((arg2 * fact_upvr(arg2 - 1)) * (var2 * fact_upvr(var2 - 1))) * arg3 ^ arg2 * (1 - arg3) ^ (arg1 - arg2)
end
function module_2_upvr.new(...) -- Line 38
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_2_upvr)
	setmetatable_result1.Points = {}
	setmetatable_result1.LengthIterations = 1000
	setmetatable_result1.LengthIndeces = {}
	setmetatable_result1.Length = 0
	setmetatable_result1._connections = {}
	for _, v in pairs({...}) do
		if typeof(v) == "Vector3" or typeof(v) == "Instance" and v:IsA("BasePart") then
			setmetatable_result1:AddBezierPoint(v)
		else
			error("The Bezier.new() constructor only takes in Vector3s and BaseParts as inputs!")
		end
	end
	return setmetatable_result1
end
function module_2_upvr.AddBezierPoint(arg1, arg2, arg3) -- Line 70
	if arg2 and typeof(arg2) == "Instance" and arg2:IsA("BasePart") or typeof(arg2) == "Vector3" then
		local tbl_upvr = {}
		if typeof(arg2) == "Vector3" then
		else
		end
		tbl_upvr.Type = "BasePartPoint"
		tbl_upvr.Point = arg2
		if tbl_upvr.Type == "BasePartPoint" then
			local any_Connect_result1_upvw = arg2.Changed:Connect(function(arg1_3) -- Line 84
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				if arg1_3 == "Position" then
					arg1:UpdateLength()
				end
			end)
			if not arg1._connections[arg2] then
				arg1._connections[arg2] = {}
			end
			table.insert(arg1._connections[arg2], any_Connect_result1_upvw)
			table.insert(arg1._connections[arg2], arg2.AncestryChanged:Connect(function(arg1_4, arg2_2) -- Line 91
				--[[ Upvalues[3]:
					[1]: arg1 (readonly)
					[2]: tbl_upvr (readonly)
					[3]: any_Connect_result1_upvw (read and write)
				]]
				if arg2_2 == nil then
					local table_find_result1 = table.find(arg1.Points, tbl_upvr)
					if table_find_result1 then
						table.remove(arg1.Points, table_find_result1)
					end
					any_Connect_result1_upvw:Disconnect()
					any_Connect_result1_upvw:Disconnect()
				end
			end))
		end
		if arg3 and type(arg3) == "number" then
			table.insert(arg1.Points, arg3, tbl_upvr)
		elseif not arg3 then
			table.insert(arg1.Points, tbl_upvr)
		elseif type(arg3) ~= "number" then
			error("Bezier:AddBezierPoint() only accepts an integer as the second argument!")
		end
		arg1:UpdateLength()
	else
		tbl_upvr = error
		tbl_upvr("Bezier:AddBezierPoint() only accepts a Vector3 or BasePart as the first argument!")
	end
end
function module_2_upvr.ChangeBezierPoint(arg1, arg2, arg3) -- Line 137
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg2) ~= "number" then
		error("Bezier:ChangeBezierPoint() only accepts a number index as the first argument!")
	end
	if arg3 and typeof(arg3) == "Instance" and arg3:IsA("BasePart") or typeof(arg3) == "Vector3" then
		local Points = arg1.Points
		local var16 = Points[arg2]
		if var16 then
			if typeof(arg3) == "Vector3" then
			else
			end
			var16.Type = "BasePartPoint"
			var16.Point = arg3
			arg1:UpdateLength()
		else
			error("Did not find BezierPoint at index "..tostring(arg2))
		end
	end
	error("Bezier:ChangeBezierPoint() only accepts a Vector3 or BasePart as the second argument!")
end
function module_2_upvr.GetAllPoints(arg1) -- Line 171
	local module = {}
	for i_2 = 1, #arg1.Points do
		table.insert(module, arg1:GetPoint(i_2))
	end
	return module
end
function module_2_upvr.GetPoint(arg1, arg2) -- Line 189
	local Points_2 = arg1.Points
	local var21
	if var21 then
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var21 = Points_2[arg2].Point
			return var21
		end
		if typeof(Points_2[arg2].Point) ~= "Vector3" or not INLINED() then
			var21 = Points_2[arg2].Point.Position
		end
		return var21
	end
	error("Did not find a BezierPoint at index "..tostring(arg2)..'!')
end
function module_2_upvr.RemoveBezierPoint(arg1, arg2) -- Line 202
	if arg1.Points[arg2] then
		local popped = table.remove(arg1.Points, arg2)
		if typeof(popped.Point) == "Instance" and popped.Point:IsA("BasePart") then
			for _, v_2 in pairs(arg1._connections[popped.Point]) do
				if v_2.Connected then
					v_2:Disconnect()
				end
			end
			arg1._connections[popped.Point] = nil
		end
		arg1:UpdateLength()
	end
end
function module_2_upvr.UpdateLength(arg1) -- Line 225
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local LengthIterations = arg1.LengthIterations
	local var33
	if var33 < 2 then
		var33 = 0
		return var33, {{0, 0, 0}, {0, 0, 0}}
	end
	var33 = 0
	local tbl = {}
	for i_4 = 1, LengthIterations do
		local any_CalculateDerivativeAt_result1 = arg1:CalculateDerivativeAt((i_4 - 1) / (LengthIterations - 1))
		var33 += (any_CalculateDerivativeAt_result1.Magnitude) * (1 / LengthIterations)
		table.insert(tbl, {(i_4 - 1) / (LengthIterations - 1), var33, any_CalculateDerivativeAt_result1})
	end
	arg1.Length = var33
	arg1.LengthIndeces = tbl
end
function module_2_upvr.CalculatePositionAt(arg1, arg2) -- Line 251
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg2) ~= "number" then
		error("Bezier:CalculatePositionAt() only accepts a number, got "..tostring(arg2)..'!')
	end
	local var44
	if 0 < #arg1.Points then
		local any_GetAllPoints_result1_2 = arg1:GetAllPoints()
		local len_2 = #any_GetAllPoints_result1_2
		var44 = nil
		var44 = Vector3.new()
		for i_5 = 1, len_2 do
			var44 += B(len_2 - 1, i_5 - 1, arg2) * any_GetAllPoints_result1_2[i_5]
			local var47
		end
		return var44
	end
	error("Bezier:CalculatePositionAt() only works if there is at least 1 BezierPoint!")
end
function module_2_upvr.CalculatePositionRelativeToLength(arg1, arg2) -- Line 291
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
	error("Bezier:CalculatePositionRelativeToLength() only accepts a number, got "..tostring(arg2)..'!')
	-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_2_upvr.CalculateDerivativeAt(arg1, arg2) -- Line 357
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if type(arg2) ~= "number" then
		error("Bezier:CalculateDerivativeAt() only accepts a number, got "..tostring(arg2)..'!')
	end
	local var52
	if 1 < #arg1.Points then
		local any_GetAllPoints_result1 = arg1:GetAllPoints()
		local len = #any_GetAllPoints_result1
		var52 = nil
		var52 = Vector3.new()
		for i_6 = 1, len - 1 do
			var52 += (B(len - 2, i_6 - 1, arg2)) * ((len - 1) * (any_GetAllPoints_result1[i_6 + 1] - any_GetAllPoints_result1[i_6]))
			local var55
		end
		return var52
	end
	error("Bezier:CalculateDerivativeAt() only works if there are at least 2 BezierPoints!")
end
function module_2_upvr.CalculateDerivativeRelativeToLength(arg1, arg2) -- Line 400
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
	error("Bezier:CalculateDerivativeRelativeToLength() only accepts a number, got "..tostring(arg2)..'!')
	-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [19] 16. Error Block 3 end (CF ANALYSIS FAILED)
end
function module_2_upvr.CreateVector3Tween(arg1, arg2, arg3, arg4, arg5) -- Line 458
	if #arg1.Points == 0 then
		error("Bezier:CreateVector3Tween() only works if there is at least 1 BezierPoint in the Bezier!")
	end
	if typeof(arg2) ~= "Instance" and typeof(arg2) ~= "table" then
		error("Bezier:CreateVector3Tween() requires an Instance or a table as the first argument!")
	end
	if typeof(arg4) ~= "TweenInfo" then
		error("Bezier:CreateVector3Tween() requires a TweenInfo object as the third argument!")
	end
	local pcall_result1, pcall_result2_2 = pcall(function() -- Line 476
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: arg2 (readonly)
		]]
		local var64
		for _, v_3 in pairs(arg3) do
			if typeof(arg2[v_3]) ~= "Vector3" and typeof(arg2[v_3]) ~= "nil" then
				var64 = false
				return var64
			end
		end
		return var64
	end)
	if pcall_result1 and pcall_result2_2 then
		local NumberValue_upvr = Instance.new("NumberValue")
		local any_Create_result1_upvr_2 = game:GetService("TweenService"):Create(NumberValue_upvr, arg4, {
			Value = 1;
		})
		local var71_upvw
		any_Create_result1_upvr_2.Changed:Connect(function(arg1_5) -- Line 493
			--[[ Upvalues[7]:
				[1]: any_Create_result1_upvr_2 (readonly)
				[2]: var71_upvw (read and write)
				[3]: NumberValue_upvr (readonly)
				[4]: arg3 (readonly)
				[5]: arg2 (readonly)
				[6]: arg5 (readonly)
				[7]: arg1 (readonly)
			]]
			if arg1_5 == "PlaybackState" then
				if any_Create_result1_upvr_2.PlaybackState == Enum.PlaybackState.Playing then
					var71_upvw = NumberValue_upvr.Changed:Connect(function(arg1_6) -- Line 497
						--[[ Upvalues[4]:
							[1]: arg3 (copied, readonly)
							[2]: arg2 (copied, readonly)
							[3]: arg5 (copied, readonly)
							[4]: arg1 (copied, readonly)
						]]
						for _, v_4 in pairs(arg3) do
							local var80
							local function INLINED_2() -- Internal function, doesn't exist in bytecode
								var80 = arg1:CalculatePositionRelativeToLength(arg1_6)
								return var80
							end
							if not arg5 or not INLINED_2() then
								var80 = arg1:CalculatePositionAt(arg1_6)
							end
							arg2[v_4] = var80
						end
					end)
					return
				end
				if var71_upvw then
					var71_upvw:Disconnect()
					var71_upvw = nil
				end
			end
		end)
		return any_Create_result1_upvr_2
	end
	NumberValue_upvr = "Bezier:CreateVector3Tween() requires a matching property table with Vector3 or nil property names for the object as the second argument!"
	error(NumberValue_upvr)
end
function module_2_upvr.CreateCFrameTween(arg1, arg2, arg3, arg4, arg5) -- Line 519
	if #arg1.Points <= 1 then
		error("Bezier:CreateVector3Tween() only works if there are at least 2 BezierPoints in the Bezier!")
	end
	if typeof(arg2) ~= "Instance" and typeof(arg2) ~= "table" then
		error("Bezier:CreateCFrameTween() requires an Instance or a table as the first argument!")
	end
	if typeof(arg4) ~= "TweenInfo" then
		error("Bezier:CreateCFrameTween() requires a TweenInfo object as the third argument!")
	end
	local pcall_result1_2, pcall_result2 = pcall(function() -- Line 537
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: arg2 (readonly)
		]]
		local var89
		for _, v_5 in pairs(arg3) do
			if typeof(arg2[v_5]) ~= "CFrame" and typeof(arg2[v_5]) ~= "nil" then
				var89 = false
				return var89
			end
		end
		return var89
	end)
	if pcall_result1_2 and pcall_result2 then
		local NumberValue_upvr_2 = Instance.new("NumberValue")
		local any_Create_result1_upvr = game:GetService("TweenService"):Create(NumberValue_upvr_2, arg4, {
			Value = 1;
		})
		local var96_upvw
		any_Create_result1_upvr.Changed:Connect(function(arg1_7) -- Line 554
			--[[ Upvalues[7]:
				[1]: any_Create_result1_upvr (readonly)
				[2]: var96_upvw (read and write)
				[3]: NumberValue_upvr_2 (readonly)
				[4]: arg3 (readonly)
				[5]: arg5 (readonly)
				[6]: arg1 (readonly)
				[7]: arg2 (readonly)
			]]
			if arg1_7 == "PlaybackState" then
				if any_Create_result1_upvr.PlaybackState == Enum.PlaybackState.Playing then
					var96_upvw = NumberValue_upvr_2.Changed:Connect(function(arg1_8) -- Line 558
						--[[ Upvalues[4]:
							[1]: arg3 (copied, readonly)
							[2]: arg5 (copied, readonly)
							[3]: arg1 (copied, readonly)
							[4]: arg2 (copied, readonly)
						]]
						-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
						for _, v_6 in pairs(arg3) do
							local var109
							local function INLINED_3() -- Internal function, doesn't exist in bytecode
								var109 = arg1:CalculatePositionRelativeToLength(arg1_8)
								return var109
							end
							if not arg5 or not INLINED_3() then
								var109 = arg1:CalculatePositionAt(arg1_8)
							end
							if not arg5 or not arg1:CalculateDerivativeRelativeToLength(arg1_8) then
							end
							arg2[v_6] = CFrame.new(var109, var109 + arg1:CalculateDerivativeAt(arg1_8))
						end
					end)
					return
				end
				if var96_upvw then
					var96_upvw:Disconnect()
					var96_upvw = nil
				end
			end
		end)
		return any_Create_result1_upvr
	end
	NumberValue_upvr_2 = "Bezier:CreateCFrameTween() requires a matching property table with CFrame or nil property names for the object as the second argument!"
	error(NumberValue_upvr_2)
end
return module_2_upvr