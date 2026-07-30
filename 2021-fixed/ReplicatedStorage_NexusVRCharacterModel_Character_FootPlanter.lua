-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x10, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- [2021] no if-then-else expressions on this client; lazy ternary helper
local function __2021_if(vcond, vthen, velse)
	if vcond() then
		return vthen();
	else
		return velse();
	end;
end
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
local l_new_0 = CFrame.new;
local l_Angles_0 = CFrame.Angles;
local l_new_1 = Vector3.new;
local _ = math.rad;
local l_atan2_0 = math.atan2;
local l_acos_0 = math.acos;
local l_min_0 = math.min;
local l_max_0 = math.max;
local l_abs_0 = math.abs;
local l_log_0 = math.log;
v0.CreateSolver = function(_, v12, v13) --[[ Line: 20 ]] --[[ Name: CreateSolver ]]
    -- upvalues: l_new_0 (copy), l_Angles_0 (copy), l_atan2_0 (copy), l_new_1 (copy), l_log_0 (copy), l_min_0 (copy), l_max_0 (copy), l_abs_0 (copy), l_acos_0 (copy)
    local v14 = {};
    local l_Parent_0 = v12.Parent;
    local v16 = 1.2;
    local v17 = 0.85;
    local v18 = 1.65;
    local v19 = 0.6;
    local v20 = 1;
    local function _(v21) --[[ Line: 42 ]] --[[ Name: flatten ]]
        -- upvalues: l_new_0 (ref), l_Angles_0 (ref), l_atan2_0 (ref)
        local l_X_0 = v21.X;
        local l_Y_0 = v21.Y;
        local l_Z_0 = v21.Z;
        local l_X_1 = v21.lookVector.X;
        local l_Z_1 = v21.lookVector.Z;
        return l_new_0(l_X_0, l_Y_0, l_Z_0) * l_Angles_0(0, l_atan2_0(l_X_1, l_Z_1), 0);
    end;
    local v28 = nil;
    local v29 = nil;
    local v30 = false;
    local function v36(v31) --[[ Line: 51 ]] --[[ Name: getVelocity ]]
        -- upvalues: v30 (ref), v28 (ref), l_new_1 (ref), v29 (ref)
        if v30 then
            v30 = true;
            local _ = tick();
            v28 = v31.p;
            return (l_new_1());
        elseif v29 then
            local v33 = tick();
            local l_p_0 = v31.p;
            local v35 = (l_p_0 - v28) * 1 / (v33 - v29);
            v29 = v33;
            v28 = l_p_0;
            return v35;
        else
            v29 = tick();
            v28 = v31.p;
            return (l_new_1());
        end;
    end;
    local function _(v37) --[[ Line: 78 ]] --[[ Name: getWalkSpeed ]]
        -- upvalues: l_new_1 (ref)
        return l_new_1(v37.x, 0, v37.z).magnitude;
    end;
    local function _(v39) --[[ Line: 82 ]] --[[ Name: getWalkDirection ]]
        if v39.magnitude > 0 then
            return v39.unit;
        else
            return (Vector3.new(0, 0, -1, 0));
        end;
    end;
    local function _(v41) --[[ Line: 90 ]] --[[ Name: isWalking ]]
        -- upvalues: l_new_1 (ref)
        return l_new_1(v41.x, 0, v41.z).magnitude > 2;
    end;
    local function _() --[[ Line: 95 ]] --[[ Name: getBaseCFrame ]]
        -- upvalues: v12 (copy), l_new_0 (ref)
        return v12.CFrame * l_new_0(0, -v12.Size.Y / 2 - 2, 0);
    end;
    local function _() --[[ Line: 99 ]] --[[ Name: getBaseRotationY ]]
        -- upvalues: v12 (copy), l_new_0 (ref), l_atan2_0 (ref)
        local l_lookVector_0 = (v12.CFrame * l_new_0(0, -v12.Size.Y / 2 - 2, 0)).lookVector;
        return (l_atan2_0(l_lookVector_0.X, l_lookVector_0.Z));
    end;
    local l_FindCollidablePartOnRay_0 = require(script.Parent.Parent:WaitForChild("Util"):WaitForChild("FindCollidablePartOnRay"));
    local function _(v47, v48) --[[ Line: 105 ]] --[[ Name: FindPartOnRay ]]
        -- upvalues: l_FindCollidablePartOnRay_0 (copy), v12 (copy)
        return l_FindCollidablePartOnRay_0(v47.Origin, v47.Direction, v48, v12);
    end;
    local v50 = nil;
    local v51 = nil;
    local _ = nil;
    local _ = nil;
    local v54 = {};
    local v55 = nil;
    local function v63() --[[ Line: 116 ]] --[[ Name: initLegs ]]
        -- upvalues: v12 (copy), l_new_0 (ref), l_Angles_0 (ref), l_atan2_0 (ref), v55 (ref), v50 (ref), v16 (ref), v51 (ref), v54 (ref)
        local v56 = v12.CFrame * l_new_0(0, -v12.Size.Y / 2 - 2, 0);
        local l_X_2 = v56.X;
        local l_Y_1 = v56.Y;
        local l_Z_2 = v56.Z;
        local l_X_3 = v56.lookVector.X;
        local l_Z_3 = v56.lookVector.Z;
        local v62 = l_new_0(l_X_2, l_Y_1, l_Z_2) * l_Angles_0(0, l_atan2_0(l_X_3, l_Z_3), 0);
        v55 = v62;
        v50 = {
            OffsetModifier = l_new_0(-v16 / 2, 0, 0), 
            Side = -1, 
            StepCycle = 0, 
            FootPosition = v62 * l_new_0(-v16 / 2, 0, 0).p, 
            LastStepTo = v62 * l_new_0(-v16 / 2, 0, 0).p, 
            Takeoff = v62 * l_new_0(-v16 / 2, 0, 0).p
        };
        v51 = {
            OffsetModifier = l_new_0(v16 / 2, 0, 0), 
            Side = 1, 
            StepCycle = 0, 
            FootPosition = v62 * l_new_0(v16 / 2, 0, 0).p, 
            LastStepTo = v62 * l_new_0(-v16 / 2, 0, 0).p, 
            Takeoff = v62 * l_new_0(-v16 / 2, 0, 0).p
        };
        v50.OtherLeg = v51;
        v51.OtherLeg = v50;
        v54 = {
            v51, 
            v50
        };
    end;
    local v64 = 1;
    local function _() --[[ Line: 143 ]] --[[ Name: UpdateScaling ]]
        -- upvalues: v13 (copy), v64 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v50 (ref), l_new_0 (ref)
        local v65 = v13 and v13.Value or 1;
        local v66 = v65 / v64;
        v64 = v65;
        v16 = v16 * v66;
        v17 = v17 * v66;
        v18 = v18 * v66;
        v19 = v19 * v66;
        v20 = v20 * v66;
        v50.OffsetModifier = l_new_0(-v16 / 2, 0, 0);
    end;
    if v13 then
        v13.Changed:Connect(function() --[[ Line: 177 ]]
            -- upvalues: v50 (ref), v13 (copy), v64 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), l_new_0 (ref)
            if v50 then
                local v68 = v13 and v13.Value or 1;
                local v69 = v68 / v64;
                v64 = v68;
                v16 = v16 * v69;
                v17 = v17 * v69;
                v18 = v18 * v69;
                v19 = v19 * v69;
                v20 = v20 * v69;
                v50.OffsetModifier = l_new_0(-v16 / 2, 0, 0);
            end;
        end);
    end;
    local v70 = 1;
    local v71 = false;
    local function _() --[[ Line: 190 ]] --[[ Name: getStrideForward ]]
        -- upvalues: v70 (ref), v17 (ref)
        if v70 > 0 then
            return v17 + v17 * 1 * v70;
        else
            return v17 + v17 * 0.5 * v70;
        end;
    end;
    local function _() --[[ Line: 198 ]] --[[ Name: getStrideFull ]]
        -- upvalues: v70 (ref), v17 (ref), v18 (ref)
        if v70 > 0 then
            return v17 + v18 + (v17 + v18) * 1.5 * v70;
        else
            return v17 + v18 + (v17 + v18) * 0.5 * v70;
        end;
    end;
    local function v89(v74) --[[ Line: 206 ]] --[[ Name: snapDown ]]
        -- upvalues: l_Parent_0 (copy), l_FindCollidablePartOnRay_0 (copy), v12 (copy)
        local v75 = v74 + Vector3.new(0, 2, 0, 0);
        local _ = Vector3.new(0, -500, 0, 0);
        local v77 = Ray.new(v75, (Vector3.new(0, -500, 0, 0)));
        local l_l_Parent_0_0 = l_Parent_0;
        local v79, v80 = l_FindCollidablePartOnRay_0(v77.Origin, v77.Direction, l_l_Parent_0_0, v12);
        local l_v79_0 = v79;
        local l_v80_0 = v80;
        if l_v79_0 then
            v79 = Ray.new(v75 + Vector3.new(0, 0, 0.009999999776482582, 0), (Vector3.new(0, -500, 0, 0)));
            v80 = l_Parent_0;
            local v83, v84 = l_FindCollidablePartOnRay_0(v79.Origin, v79.Direction, v80, v12);
            v77 = v83;
            l_l_Parent_0_0 = v84;
            v83 = Ray.new(v75 + Vector3.new(0, 0, -0.009999999776482582, 0), (Vector3.new(0, -500, 0, 0)));
            v84 = l_Parent_0;
            local v85, v86 = l_FindCollidablePartOnRay_0(v83.Origin, v83.Direction, v84, v12);
            v79 = v85;
            v80 = v86;
            v85 = Ray.new(v75 + Vector3.new(0.009999999776482582, 0, 0, 0), (Vector3.new(0, -500, 0, 0)));
            v86 = l_Parent_0;
            local v87, v88 = l_FindCollidablePartOnRay_0(v85.Origin, v85.Direction, v86, v12);
            v83 = v87;
            v84 = v88;
            v85 = nil;
            if v77 and v79 and v83 then
                v85 = (l_l_Parent_0_0 - v80):Cross(v80 - v84).unit;
                if v85.Y < 0 then
                    v85 = -v85;
                end;
            end;
            return l_v80_0, v85;
        else
            return v74, (Vector3.new(0, 1, 0, 0));
        end;
    end;
    local _ = function() --[[ Line: 228 ]] --[[ Name: fixFeetPositionsY ]]
        -- upvalues: v54 (ref), v89 (copy)
        for _, v91 in pairs(v54) do
            local v92, _ = v89(v91.FootPosition);
            v91.FootPosition = v92;
        end;
    end;
    local v95 = nil;
    v14.GetFeetCFrames = function(_) --[[ Line: 236 ]] --[[ Name: GetFeetCFrames ]]
        -- upvalues: v51 (ref), v63 (copy), v13 (copy), v64 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v50 (ref), l_new_0 (ref), v95 (ref), v36 (copy), v12 (copy), l_new_1 (ref), l_Angles_0 (ref), l_atan2_0 (ref), v70 (ref), l_log_0 (ref), l_min_0 (ref), l_max_0 (ref), v71 (ref), v89 (copy), v54 (ref), l_abs_0 (ref), l_acos_0 (ref)
        if not v51 then
            v63();
            local v97 = v13 and v13.Value or 1;
            local v98 = v97 / v64;
            v64 = v97;
            v16 = v16 * v98;
            v17 = v17 * v98;
            v18 = v18 * v98;
            v19 = v19 * v98;
            v20 = v20 * v98;
            v50.OffsetModifier = l_new_0(-v16 / 2, 0, 0);
        end;
        local v99 = tick();
        if not v95 then
            v95 = v99;
        end;
        local v100 = v99 - v95;
        v95 = v99;
        local v101 = v36(v12.CFrame);
        local l_magnitude_0 = l_new_1(v101.x, 0, v101.z).magnitude;
        local l_CFrame_0 = v12.CFrame;
        local l_X_4 = l_CFrame_0.X;
        local l_Y_2 = l_CFrame_0.Y;
        local l_Z_4 = l_CFrame_0.Z;
        local l_X_5 = l_CFrame_0.lookVector.X;
        local l_Z_5 = l_CFrame_0.lookVector.Z;
        local v109 = l_new_0(l_X_4, l_Y_2, l_Z_4) * l_Angles_0(0, l_atan2_0(l_X_5, l_Z_5), 0);
        l_CFrame_0 = v109.lookVector;
        l_X_4 = l_CFrame_0:Cross((Vector3.new(0, 1, 0, 0)));
        l_Y_2 = __2021_if(function() return v101.magnitude > 0 end, function() return v101.unit end, function() return Vector3.new(0, 0, -1, 0) end);
        l_Z_4 = l_Y_2:Cross((Vector3.new(0, 1, 0, 0)));
        v70 = l_max_0(-1, (l_min_0(1, l_log_0(l_magnitude_0 / 16) / 0.6931471805599453)));
        l_X_5 = v51.StepCycle > 0;
        l_Z_5 = v50.StepCycle > 0;
        local function v110(v111, v112, v113) --[[ Line: 263 ]] --[[ Name: spline ]]
            -- upvalues: v110 (copy)
            if v112 == 1 then
                return v113[1];
            else
                local v114 = 1 - v111;
                for v115 = 1, v112 - 1 do
                    v113[v115] = v114 * v113[v115] + v111 * v113[v115 + 1];
                end;
                return v110(v111, v112 - 1, v113);
            end;
        end;
        local function v129(v116, v117) --[[ Line: 275 ]] --[[ Name: positionFootByCycle ]]
            -- upvalues: l_Z_4 (copy), v16 (ref), v19 (ref), l_new_1 (ref), v110 (copy), v100 (copy), l_magnitude_0 (copy)
            local v118 = v117 - v116.Takeoff;
            local v119 = l_Z_4 * v116.Side;
            local _ = v118.magnitude;
            local v121 = v119 * (v16 / 2) * 0.3;
            local v122 = l_new_1(0, v19 * 1.3 * (1 / v116.StepSpeedMod), 0);
            local v123 = v116.Takeoff + v118 * 1 / 2 + v122 + v121;
            local v124 = v116.Takeoff + v118 * 0.9 + v122 + v121;
            local v125 = v116.StepCycle ^ (_G.A or 1);
            local v126 = v110(v125, 4, {
                v116.Takeoff, 
                v123, 
                v124, 
                v117
            });
            if (v126 - v116.FootPosition).magnitude > v100 * l_magnitude_0 * 2 then
                local v127 = (1 - v116.StepCycle) * v116.FootPosition + v116.StepCycle * v126;
                local v128 = v116.FootPosition + (v126 - v116.FootPosition).unit * v100 * l_magnitude_0 * 2;
                v126 = __2021_if(function() return (v127 - v126).magnitude < (v128 - v126).magnitude end, function() return v127 end, function() return v128 end);
            end;
            v116.FootPosition = v126;
            v116.LastStepTo = v117;
        end;
        local v130 = l_new_1(v101.x, 0, v101.z).magnitude > 2;
        if v130 then
            v71 = false;
        end;
        if v130 then
            local v131 = l_Z_4 * (v16 / 2) * 0.5;
            local l_p_1 = (v109 * v50.OffsetModifier + (__2021_if(function() return v70 > 0 end, function() return v17 + v17 * 1 * v70 end, function() return v17 + v17 * 0.5 * v70 end)) * l_Y_2 - v50.Side * v131).p;
            local l_p_2 = (v109 * v51.OffsetModifier + (__2021_if(function() return v70 > 0 end, function() return v17 + v17 * 1 * v70 end, function() return v17 + v17 * 0.5 * v70 end)) * l_Y_2 - v51.Side * v131).p;
            local v134 = nil;
            local v135 = nil;
            local v136, v137 = v89(l_p_1);
            l_p_1 = v136;
            v134 = v137;
            v136, v137 = v89(l_p_2);
            l_p_2 = v136;
            v135 = v137;
            if not l_Z_5 or not v50.AheadStep or (l_p_1 - v50.AheadStep).magnitude < v100 * l_magnitude_0 then
                v50.AheadStep = l_p_1;
            else
                v50.AheadStep = v50.AheadStep + (l_p_1 - v50.AheadStep).unit * v100 * l_magnitude_0 * 2;
            end;
            v50.NormalHint = v134;
            if not l_X_5 or not v51.AheadStep or (l_p_2 - v51.AheadStep).magnitude < v100 * l_magnitude_0 then
                v51.AheadStep = l_p_2;
            else
                v51.AheadStep = v51.AheadStep + (l_p_2 - v51.AheadStep).unit * v100 * l_magnitude_0 * 2;
            end;
            v51.NormalHint = v135;
            v136 = 0.9 - l_max_0(0, v70) * 0.3;
            v137 = l_magnitude_0 / (__2021_if(function() return v70 > 0 end, function() return v17 + v18 + (v17 + v18) * 1.5 * v70 end, function() return v17 + v18 + (v17 + v18) * 0.5 * v70 end)) * v136;
            if not l_X_5 and not l_Z_5 then
                if (v51.FootPosition - v51.AheadStep).magnitude < (v50.FootPosition - v50.AheadStep).magnitude then
                    v51.StepSpeedMod = 1 / (1 - l_min_0(0.9, (l_max_0(0, (v51.FootPosition - v51.AheadStep).magnitude / __2021_if(function() return v70 > 0 end, function() return v17 + v18 + (v17 + v18) * 1.5 * v70 end, function() return v17 + v18 + (v17 + v18) * 0.5 * v70 end)))));
                    v51.StepCycle = v100;
                    v51.Takeoff = v51.FootPosition;
                else
                    v50.StepSpeedMod = 1 / (1 - l_min_0(0.9, (l_max_0(0, (v50.FootPosition - v50.AheadStep).magnitude / __2021_if(function() return v70 > 0 end, function() return v17 + v18 + (v17 + v18) * 1.5 * v70 end, function() return v17 + v18 + (v17 + v18) * 0.5 * v70 end)))));
                    v50.StepCycle = v100;
                    v50.Takeoff = v50.FootPosition;
                end;
            elseif l_X_5 and l_Z_5 then
                for _, v139 in pairs(v54) do
                    v139.StepCycle = l_min_0(1, v139.StepCycle + v100 * v137 * v139.StepSpeedMod);
                    v129(v139, v139.AheadStep);
                    if v139.StepCycle == 1 then
                        v139.StepCycle = 0;
                    end;
                end;
            else
                for _, v141 in pairs(v54) do
                    if v141.StepCycle > 0 then
                        v141.StepCycle = l_min_0(1, v141.StepCycle + v100 * v137 * v141.StepSpeedMod);
                        v129(v141, v141.AheadStep);
                        if v136 < v141.StepCycle then
                            v141.OtherLeg.StepSpeedMod = 1;
                            v141.OtherLeg.StepCycle = v100;
                            v141.OtherLeg.Takeoff = v141.OtherLeg.FootPosition;
                            v129(v141.OtherLeg, v141.AheadStep);
                        end;
                        if v141.StepCycle == 1 then
                            v141.StepCycle = 0;
                            break;
                        else
                            break;
                        end;
                    end;
                end;
            end;
        else
            if l_X_5 or l_Z_5 then
                for _, v143 in pairs(v54) do
                    if v143.StepCycle > 0 then
                        v143.StepCycle = l_min_0(1, v143.StepCycle + v100 * 2);
                        local l_p_3 = (v109 * v143.OffsetModifier).p;
                        local v145 = v143.LastStepTo - l_p_3;
                        local v146 = nil;
                        v146 = __2021_if(function() return v145.magnitude > v20 end, function() return l_p_3 + v145.unit * v20 end, function() return v143.LastStepTo end);
                        local v147 = nil;
                        local v148, v149 = v89(v146);
                        v146 = v148;
                        v147 = v149;
                        v143.AheadStep = v146;
                        v143.NormalHint = v147;
                        v129(v143, v146);
                        if v143.StepCycle == 1 then
                            v143.StepCycle = 0;
                        end;
                    end;
                end;
            else
                for _, v151 in pairs(v54) do
                    local v152, _ = v89(v151.FootPosition);
                    v151.FootPosition = v152;
                end;
            end;
            if v50.StepCycle == 0 and v51.StepCycle == 0 then
                local l_p_4 = (v109 * v50.OffsetModifier).p;
                local l_p_5 = (v109 * v51.OffsetModifier).p;
                local v156 = v50.FootPosition - l_p_4;
                local v157 = v51.FootPosition - l_p_5;
                local v158 = l_abs_0(v156:Dot(l_CFrame_0) - v157:Dot(l_CFrame_0)) > 3;
                local v159 = l_acos_0((l_min_0(1, (l_max_0(-1, v156.unit:Dot(v157.unit))))));
                local v160 = l_abs_0(v156.magnitude - v157.magnitude);
                if v156:Dot(l_X_4) > v16 / 4 then
                    v71 = false;
                    v50.Takeoff = v50.FootPosition;
                    v50.StepCycle = v100;
                    local v161 = v157.unit * 0.5;
                    if v157.magnitude == 0 then
                        v161 = -l_X_4 * 0.5;
                    elseif v157:Dot(l_X_4) > 0 then
                        v161 = (v157 - 2 * l_X_4 * v157:Dot(l_X_4)).unit * 0.5;
                    end;
                    v50.LastStepTo = l_p_4 + v161;
                    if (v50.LastStepTo - v50.Takeoff).magnitude < 0.5 then
                        v50.StepCycle = 0;
                    end;
                    v50.StepSpeedMod = 1 / (1 - l_min_0(0.9, (l_max_0(0, (v50.FootPosition - v50.LastStepTo).magnitude / __2021_if(function() return v70 > 0 end, function() return v17 + v18 + (v17 + v18) * 1.5 * v70 end, function() return v17 + v18 + (v17 + v18) * 0.5 * v70 end)))));
                elseif v157:Dot(l_X_4) < -v16 / 4 then
                    v71 = false;
                    v51.Takeoff = v51.FootPosition;
                    v51.StepCycle = v100;
                    local v162 = v156.unit * 0.5;
                    if v156.magnitude == 0 then
                        v162 = l_X_4 * 0.5;
                    elseif v156:Dot(l_X_4) < 0 then
                        v162 = (v156 - 2 * l_X_4 * v156:Dot(l_X_4)).unit * 0.5;
                    end;
                    v51.LastStepTo = l_p_5 + v162;
                    if (v50.LastStepTo - v50.Takeoff).magnitude < 0.5 then
                        v50.StepCycle = 0;
                    end;
                    v51.StepSpeedMod = 1 / (1 - l_min_0(0.9, (l_max_0(0, (v51.FootPosition - v51.LastStepTo).magnitude / __2021_if(function() return v70 > 0 end, function() return v17 + v18 + (v17 + v18) * 1.5 * v70 end, function() return v17 + v18 + (v17 + v18) * 0.5 * v70 end)))));
                elseif not v71 and (v159 < 2.6179938779914944 or v160 > 0.2 or v158) then
                    v71 = true;
                    local v163 = nil;
                    local v164 = nil;
                    local v165 = nil;
                    if v156.magnitude > v157.magnitude then
                        v163 = v50;
                        v164 = l_p_4;
                        v165 = v157;
                    else
                        v163 = v51;
                        v164 = l_p_5;
                        v165 = v156;
                    end;
                    v163.StepCycle = v100;
                    v163.Takeoff = v163.FootPosition;
                    v163.StepSpeedMod = 1;
                    if v158 then
                        v163.LastStepTo = v164 - 0.5 * v165;
                    else
                        v163.LastStepTo = v164 - v165;
                    end;
                    if (v163.Takeoff - v163.LastStepTo).magnitude < 0.2 then
                        v163.StepCycle = 0;
                    end;
                end;
            end;
            for _, v167 in pairs(v54) do
                local v168, _ = v89(v167.FootPosition);
                v167.FootPosition = v168;
            end;
        end;
        local l_FootPosition_0 = v51.FootPosition;
        local l_FootPosition_1 = v50.FootPosition;
        local l_lookVector_1 = (v12.CFrame * l_new_0(0, -v12.Size.Y / 2 - 2, 0)).lookVector;
        local v173 = l_atan2_0(l_lookVector_1.X, l_lookVector_1.Z);
        l_lookVector_1 = l_Angles_0(0, 0.08726646259971647 + v173, 0);
        local v174 = l_Angles_0(0, -0.08726646259971647 + v173, 0);
        return l_new_0(l_FootPosition_0) * l_lookVector_1, l_new_0(l_FootPosition_1) * v174;
    end;
    v14.OffsetFeet = function(_, v176) --[[ Line: 504 ]] --[[ Name: OffsetFeet ]]
        -- upvalues: v30 (ref), v54 (ref)
        v30 = true;
        for _, v178 in pairs(v54) do
            v178.FootPosition = v178.FootPosition + v176;
            v178.LastStepTo = v178.LastStepTo + v176;
            if v178.Takeoff then
                v178.Takeoff = v178.Takeoff + v176;
            end;
            if v178.AheadStep then
                v178.AheadStep = v178.AheadStep + v176;
            end;
        end;
        v30 = true;
    end;
    return v14;
end;
return v0;