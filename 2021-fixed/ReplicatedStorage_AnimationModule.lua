-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x35, pairs() wrap x6, if-expr -> __2021_if x0, compound-assign x0, shims: __2021_freeze
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no table.freeze on this client (2022 API); identity shim, immutability not enforced
local function __2021_freeze(vt)
	return vt
end
local v1 = game:GetService("RunService")
local v_u_2 = math.exp
local v_u_3 = math.sin
local v_u_4 = math.cos
local v_u_5 = math.min
local v_u_6 = math.sqrt
local v_u_7 = math.round
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10, p11, p12, p13) -- line: 12
	-- upvalues: (copy) v_u_8
	local v14 = p13.toIntermediate(p11)
	local v15 = {
		["d"] = p9,
		["f"] = p10,
		["g"] = v14,
		["p"] = v14,
		["v"] = table.create(#v14, 0),
		["typedat"] = p13,
		["rawGoal"] = p12
	}
	local v16 = v_u_8
	return setmetatable(v15, v16)
end
function v_u_8.setGoal(p17, p18) -- line: 27
	p17.rawGoal = p18
	p17.g = p17.typedat.toIntermediate(p18)
end
function v_u_8.setDampingRatio(p19, p20) -- line: 31
	p19.d = p20
end
function v_u_8.setFrequency(p21, p22) -- line: 34
	p21.f = p22
end
function v_u_8.canSleep(p23) -- line: 37
	local v24 = 0
	for _, v25 in pairs(p23.v) --[[ 2021 ]] do
		v24 = v24 + v25 ^ 2
	end
	if v24 > 0.0001 then
		return false
	end
	local v26 = p23.p
	local v27 = p23.g
	local v28 = 0
	for v29, v30 in pairs(v26) --[[ 2021 ]] do
		v28 = v28 + (v27[v29] - v30) ^ 2
	end
	return v28 <= 6.781684027777778e-8
end
function v_u_8.step(p31, p32) -- line: 53
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v33 = p31.d
	local v34 = p31.f * 2 * 3.141592653589793
	local v35 = p31.g
	local v36 = p31.p
	local v37 = p31.v
	if v33 == 1 then
		local v38 = v_u_2(-v34 * p32)
		local v39 = p32 * v38
		local v40 = v38 + v39 * v34
		local v41 = v38 - v39 * v34
		local v42 = v39 * v34 * v34
		for v43 = 1, #v36 do
			local v44 = v36[v43] - v35[v43]
			v36[v43] = v44 * v40 + v37[v43] * v39 + v35[v43]
			v37[v43] = v37[v43] * v41 - v44 * v42
		end
	elseif v33 < 1 then
		local v45 = v_u_2(-v33 * v34 * p32)
		local v46 = v_u_6(1 - v33 * v33)
		local v47 = v_u_4(p32 * v34 * v46)
		local v48 = v_u_3(p32 * v34 * v46)
		local v49
		if v46 > 0.00001 then
			v49 = v48 / v46
		else
			local v50 = p32 * v34
			v49 = v50 + (v50 * v50 * v46 * v46 * v46 * v46 / 20 - v46 * v46) * v50 * v50 * v50 / 6
		end
		local v51
		if v34 * v46 > 0.00001 then
			v51 = v48 / v34 * v46
		else
			local v52 = v34 * v46
			v51 = p32 + (p32 * p32 * v52 * v52 * v52 * v52 / 20 - v52 * v52) * p32 * p32 * p32 / 6
		end
		for v53 = 1, #v36 do
			local v54 = v36[v53] - v35[v53]
			v36[v53] = (v54 * (v47 + v49 * v33) + v37[v53] * v51) * v45 + v35[v53]
			v37[v53] = (v37[v53] * (v47 - v49 * v33) - v54 * v49 * v34) * v45
		end
	else
		local v55 = v_u_6(v33 * v33 - 1)
		local v56 = -v34 * (v33 - v55)
		local v57 = -v34 * (v33 + v55)
		local v58 = v_u_2(v56 * p32)
		local v59 = v_u_2(v57 * p32)
		for v60 = 1, #v36 do
			local v61 = v36[v60] - v35[v60]
			local v62 = (v37[v60] - v61 * v56) / 2 * v34 * v55
			local v63 = v58 * (v61 - v62)
			v36[v60] = v63 + v62 * v59 + v35[v60]
			v37[v60] = v63 * v56 + v62 * v59 * v57
		end
	end
	return p31.typedat.fromIntermediate(p31.p)
end
local v_u_64 = {}
v_u_64.__index = v_u_64
function v_u_64.new(p65, p66, p67, p68) -- line: 113
	-- upvalues: (copy) v_u_64
	local v69 = {
		["d"] = p65,
		["f"] = p66,
		["g"] = p68,
		["p"] = p67,
		["v"] = Vector3.zero
	}
	local v70 = v_u_64
	return setmetatable(v69, v70)
end
function v_u_64.setGoal(p71, p72) -- line: 125
	p71.g = p72
end
function v_u_64.setDampingRatio(p73, p74) -- line: 128
	p73.d = p74
end
function v_u_64.setFrequency(p75, p76) -- line: 131
	p75.f = p76
end
function v_u_64.canSleep(p77) -- line: 134
	local v78 = p77.p
	local _, v79 = p77.g:ToObjectSpace(v78):ToAxisAngle()
	local v80
	if math.abs(v79) < 0.00017453292519943296 then
		v80 = p77.v.Magnitude < 0.0017453292519943296
	else
		v80 = false
	end
	return v80
end
function v_u_64.step(p81, p82) -- line: 139
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v83 = p81.d
	local v84 = p81.f * 2 * 3.141592653589793
	local v85 = p81.g
	local v86 = p81.p
	local v87 = p81.v
	local v88, v89 = (v86 * v85:Inverse()):ToAxisAngle()
	local v90 = v88 * v89
	local v91 = v_u_2(-v83 * v84 * p82)
	local v92, v93
	if v83 == 1 then
		local _ = p82 * v91
		local v94 = (v90 * (1 + v84 * p82) + v87 * p82) * v91
		local v95 = v94.Magnitude
		local v96
		if v95 > 1e-6 then
			v96 = CFrame.fromAxisAngle(v94.Unit, v95)
		else
			v96 = CFrame.identity
		end
		v92 = v96 * v85
		v93 = (v87 * (1 - p82 * v84) - v90 * p82 * v84 * v84) * v91
	elseif v83 < 1 then
		local v97 = v_u_6(1 - v83 * v83)
		local v98 = v_u_4(p82 * v84 * v97)
		local v99 = v_u_3(p82 * v84 * v97)
		local v100 = v99 / v84 * v97
		local v101 = v99 / v97
		local v102 = (v90 * (v98 + v101 * v83) + v87 * v100) * v91
		local v103 = v102.Magnitude
		local v104
		if v103 > 1e-6 then
			v104 = CFrame.fromAxisAngle(v102.Unit, v103)
		else
			v104 = CFrame.identity
		end
		v92 = v104 * v85
		v93 = (v87 * (v98 - v101 * v83) - v90 * v101 * v84) * v91
	else
		local v105 = v_u_6(v83 * v83 - 1)
		local v106 = -v84 * (v83 - v105)
		local v107 = -v84 * (v83 + v105)
		local v108 = (v87 - v90 * v106) / 2 * v84 * v105
		local v109 = (v90 - v108) * v_u_2(v106 * p82)
		local v110 = v108 * v_u_2(v107 * p82)
		local v111 = v109 + v110
		local v112 = v111.Magnitude
		local v113
		if v112 > 1e-6 then
			v113 = CFrame.fromAxisAngle(v111.Unit, v112)
		else
			v113 = CFrame.identity
		end
		v92 = v113 * v85
		v93 = v109 * v106 + v110 * v107
	end
	p81.p = v92
	p81.v = v93
	return v92
end
local v_u_119 = {
	["springType"] = v_u_8.new,
	["toIntermediate"] = function(p114)
		return { p114.X, p114.Y, p114.Z }
	end,
	["fromIntermediate"] = function(p115)
		local v116 = p115[1]
		local v117 = p115[2]
		local v118 = p115[3]
		return Vector3.new(v116, v117, v118)
	end
}
local v_u_120 = {}
v_u_120.__index = v_u_120
function v_u_120.new(p121, p122, p123, p124, _) -- line: 214
	-- upvalues: (copy) v_u_8, (copy) v_u_119, (copy) v_u_64, (copy) v_u_120
	local v125 = {
		["rawGoal"] = p124,
		["_position"] = v_u_8.new(p121, p122, p123.Position, p124.Position, v_u_119),
		["_rotation"] = v_u_64.new(p121, p122, p123.Rotation, p124.Rotation)
	}
	local v126 = v_u_120
	return setmetatable(v125, v126)
end
function v_u_120.setGoal(p127, p128) -- line: 224
	p127.rawGoal = p128
	p127._position:setGoal(p128.Position)
	p127._rotation:setGoal(p128.Rotation)
end
function v_u_120.setDampingRatio(p129, p130) -- line: 229
	p129._position:setDampingRatio(p130)
	p129._rotation:setDampingRatio(p130)
end
function v_u_120.setFrequency(p131, p132) -- line: 233
	p131._position:setFrequency(p132)
	p131._rotation:setFrequency(p132)
end
function v_u_120.canSleep(p133) -- line: 237
	local v134 = p133._position:canSleep()
	if v134 then
		v134 = p133._rotation:canSleep()
	end
	return v134
end
function v_u_120.step(p135, p136) -- line: 244
	local v137 = p135._position:step(p136)
	return p135._rotation:step(p136) + v137
end
local function rgbToLuv(p138) -- line: 248
	local v139 = p138.R
	local v140 = p138.G
	local v141 = p138.B
	local v142 = v139 < 0.0404482362771076 and v139 / 12.92 or 0.87941546140213 * (v139 + 0.055) ^ 2.4
	local v143 = v140 < 0.0404482362771076 and v140 / 12.92 or 0.87941546140213 * (v140 + 0.055) ^ 2.4
	local v144 = v141 < 0.0404482362771076 and v141 / 12.92 or 0.87941546140213 * (v141 + 0.055) ^ 2.4
	local v145 = 0.9257063972951867 * v142 - 0.8333736323779866 * v143 - 0.09209820666085898 * v144
	local v146 = 0.2125862307855956 * v142 + 0.7151703037034108 * v143 + 0.0722004986433362 * v144
	local v147 = 3.6590806972265884 * v142 + 11.442689580057424 * v143 + 4.114991502426484 * v144
	local v148 = v146 > 0.008856451679035631 and 116 * v146 ^ 0.3333333333333333 - 16 or 903.296296296296 * v146
	local v149, v150
	if v147 > 1e-14 then
		v149 = v148 * v145 / v147
		v150 = v148 * (9 * v146 / v147 - 0.46832)
	else
		v149 = -0.19783 * v148
		v150 = -0.46832 * v148
	end
	return { v148, v149, v150 }
end
local function luvToRgb(p151) -- line: 269
	-- upvalues: (copy) v_u_5
	local v152 = p151[1]
	if v152 < 0.0197955 then
		return Color3.new(0, 0, 0)
	end
	local v153 = p151[2] / v152 + 0.19783
	local v154 = p151[3] / v152 + 0.46832
	local v155 = (v152 + 16) / 116
	local v156 = v155 > 0.20689655172413793 and v155 * v155 * v155 or 0.12841854934601665 * v155 - 0.01771290335807126
	local v157 = v156 * v153 / v154
	local v158 = v156 * ((3 - 0.75 * v153) / v154 - 5)
	local v159 = 7.2914074 * v157 - 1.537208 * v156 - 0.4986286 * v158
	local v160 = -2.180094 * v157 + 1.8757561 * v156 + 0.0415175 * v158
	local v161 = 0.1253477 * v157 - 0.2040211 * v156 + 1.0569959 * v158
	if v159 < 0 and v159 < v160 and v159 < v161 then
		v160 = v160 - v159
		v161 = v161 - v159
		v159 = 0
	elseif v160 < 0 and v160 < v161 then
		v159 = v159 - v160
		v161 = v161 - v160
		v160 = 0
	elseif v161 < 0 then
		v159 = v159 - v161
		v160 = v160 - v161
		v161 = 0
	end
	return Color3.new(v_u_5(v159 < 0.0031306684425 and 12.92 * v159 or 1.055 * v159 ^ 0.4166666666666667 - 0.055, 1), v_u_5(v160 < 0.0031306684425 and 12.92 * v160 or 1.055 * v160 ^ 0.4166666666666667 - 0.055, 1), (v_u_5(v161 < 0.0031306684425 and 12.92 * v161 or 1.055 * v161 ^ 0.4166666666666667 - 0.055, 1)))
end
local v_u_181 = {
	["boolean"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p162)
			return { p162 and 1 or 0 }
		end,
		["fromIntermediate"] = function(p163)
			return p163[1] >= 0.5
		end
	},
	["number"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p164)
			return { p164 }
		end,
		["fromIntermediate"] = function(p165)
			return p165[1]
		end
	},
	["NumberRange"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p166)
			return { p166.Min, p166.Max }
		end,
		["fromIntermediate"] = function(p167)
			return NumberRange.new(p167[1], p167[2])
		end
	},
	["UDim"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p168)
			return { p168.Scale, p168.Offset }
		end,
		["fromIntermediate"] = function(p169)
			-- upvalues: (copy) v_u_7
			return UDim.new(p169[1], (v_u_7(p169[2])))
		end
	},
	["UDim2"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p170)
			local v171 = p170.X
			local v172 = p170.Y
			return {
				v171.Scale,
				v171.Offset,
				v172.Scale,
				v172.Offset
			}
		end,
		["fromIntermediate"] = function(p173)
			-- upvalues: (copy) v_u_7
			return UDim2.new(p173[1], v_u_7(p173[2]), p173[3], (v_u_7(p173[4])))
		end
	},
	["Vector2"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p174)
			return { p174.X, p174.Y }
		end,
		["fromIntermediate"] = function(p175)
			return Vector2.new(p175[1], p175[2])
		end
	},
	["Vector3"] = v_u_119,
	["Color3"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = rgbToLuv,
		["fromIntermediate"] = luvToRgb
	},
	["ColorSequence"] = {
		["springType"] = v_u_8.new,
		["toIntermediate"] = function(p176)
			-- upvalues: (copy) rgbToLuv
			local v177 = p176.Keypoints
			local v178 = rgbToLuv(v177[1].Value)
			local v179 = rgbToLuv(v177[#v177].Value)
			return {
				v178[1],
				v178[2],
				v178[3],
				v179[1],
				v179[2],
				v179[3]
			}
		end,
		["fromIntermediate"] = function(p180)
			-- upvalues: (copy) luvToRgb
			return ColorSequence.new(luvToRgb({ p180[1], p180[2], p180[3] }), luvToRgb({ p180[4], p180[5], p180[6] }))
		end
	},
	["CFrame"] = {
		["springType"] = v_u_120.new,
		["toIntermediate"] = error,
		["fromIntermediate"] = error
	}
}
local v_u_188 = {
	["Pivot"] = {
		["class"] = "PVInstance",
		["get"] = function(p182)
			return p182:GetPivot()
		end,
		["set"] = function(p183, p184)
			p183:PivotTo(p184)
		end
	},
	["Scale"] = {
		["class"] = "Model",
		["get"] = function(p185)
			return p185:GetScale()
		end,
		["set"] = function(p186, p187)
			p186:ScaleTo(p187)
		end
	}
}
local v_u_189 = {}
local v_u_190 = {}
v1.Heartbeat:Connect(function(p191)
	-- upvalues: (copy) v_u_189, (copy) v_u_188, (copy) v_u_190
	for v192, v193 in pairs(v_u_189) --[[ 2021 ]] do
		for v194, v195 in pairs(v193) --[[ 2021 ]] do
			local v196 = v_u_188[v194]
			if v196 and v192:IsA(v196.class) then
				if v195:canSleep() then
					v193[v194] = nil
					v196.set(v192, v195.rawGoal)
				else
					v196.set(v192, v195:step(p191))
				end
			elseif v195:canSleep() then
				v193[v194] = nil
				v192[v194] = v195.rawGoal
			else
				v192[v194] = v195:step(p191)
			end
		end
		if not next(v193) then
			v_u_189[v192] = nil
			local v197 = v_u_190[v192]
			if v197 then
				v_u_190[v192] = nil
				for _, v198 in pairs(v197) --[[ 2021 ]] do
					task.spawn(v198)
				end
			end
		end
	end
end)
return __2021_freeze({
	["target"] = function(p199, p200, p201, p202)
		-- upvalues: (copy) v_u_189, (copy) v_u_188, (copy) v_u_181
		if not ("Instance"):find((typeof(p199))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(1, "spr.target", "Instance", (typeof(p199))), 3)
		end
		if not ("number"):find((typeof(p200))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(2, "spr.target", "number", (typeof(p200))), 3)
		end
		if not ("number"):find((typeof(p201))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(3, "spr.target", "number", (typeof(p201))), 3)
		end
		if not ("table"):find((typeof(p202))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(4, "spr.target", "table", (typeof(p202))), 3)
		end
		if p200 ~= p200 or p200 < 0 then
			error(("expected damping ratio >= 0; got %.2f"):format(p200), 2)
		end
		if p201 ~= p201 or p201 < 0 then
			error(("expected undamped frequency >= 0; got %.2f"):format(p201), 2)
		end
		local v203 = v_u_189[p199]
		if not v203 then
			v203 = {}
			v_u_189[p199] = v203
		end
		for v204, v205 in pairs(p202) --[[ 2021 ]] do
			local v206 = v_u_188[v204]
			local v207
			if v206 and p199:IsA(v206.class) then
				v207 = v206.get(p199)
			else
				v207 = p199[v204]
			end
			if typeof(v205) ~= typeof(v207) then
				error(("bad property %s to spr.target (%s expected, got %s)"):format(v204, typeof(v207), (typeof(v205))), 2)
			end
			if p201 == (1 / 0) then
				p199[v204] = v205
				v203[v204] = nil
			else
				local v208 = v203[v204]
				if not v208 then
					local v209 = v_u_181[typeof(v205)]
					if not v209 then
						error("unsupported type: " .. typeof(v205), 2)
					end
					v208 = v209.springType(p200, p201, v207, v205, v209)
					v203[v204] = v208
				end
				v208:setGoal(v205)
				v208:setDampingRatio(p200)
				v208:setFrequency(p201)
			end
		end
		if not next(v203) then
			v_u_189[p199] = nil
		end
	end,
	["stop"] = function(p210, p211)
		-- upvalues: (copy) v_u_189
		if not ("Instance"):find((typeof(p210))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(1, "spr.stop", "Instance", (typeof(p210))), 3)
		end
		if not ("string|nil"):find((typeof(p211))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(2, "spr.stop", "string|nil", (typeof(p211))), 3)
		end
		if p211 then
			local v212 = v_u_189[p210]
			if v212 then
				v212[p211] = nil
				return
			end
		else
			v_u_189[p210] = nil
		end
	end,
	["completed"] = function(p213, p214)
		-- upvalues: (copy) v_u_190
		if not ("Instance"):find((typeof(p213))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(1, "spr.completed", "Instance", (typeof(p213))), 3)
		end
		if not ("function"):find((typeof(p214))) then
			error(("bad argument #%s to %s (%s expected, got %s)"):format(2, "spr.completed", "function", (typeof(p214))), 3)
		end
		local v215 = v_u_190[p213]
		if v215 then
			table.insert(v215, p214)
		else
			v_u_190[p213] = { p214 }
		end
	end
})
