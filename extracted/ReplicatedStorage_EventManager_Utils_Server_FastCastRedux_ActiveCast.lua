-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local _ = require(script.Parent.TypeDefinitions);
local v8 = require(script.Parent.TypeMarshaller);
local v9 = {};
v9.__index = v9;
v9.__type = "ActiveCast";
local l_RunService_0 = game:GetService("RunService");
local v11 = require(script.Parent.Table);
local v12 = nil;
local function _() --[[ Line: 61 ]] --[[ Name: GetFastCastVisualizationContainer ]]
    local l_FastCastVisualizationObjects_0 = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");
    if l_FastCastVisualizationObjects_0 ~= nil then
        return l_FastCastVisualizationObjects_0;
    else
        l_FastCastVisualizationObjects_0 = Instance.new("Folder");
        l_FastCastVisualizationObjects_0.Name = "FastCastVisualizationObjects";
        l_FastCastVisualizationObjects_0.Archivable = false;
        l_FastCastVisualizationObjects_0.Parent = workspace.Terrain;
        return l_FastCastVisualizationObjects_0;
    end;
end;
local function _(v15) --[[ Line: 79 ]] --[[ Name: PrintDebug ]]
    -- upvalues: v12 (ref)
    if v12.DebugLogging == true then
        print(v15);
    end;
end;
DbgVisualizeSegment = function(v17, v18) --[[ Line: 86 ]] --[[ Name: DbgVisualizeSegment ]]
    -- upvalues: v12 (ref)
    if v12.VisualizeCasts ~= true then
        return nil;
    else
        local l_ConeHandleAdornment_0 = Instance.new("ConeHandleAdornment");
        l_ConeHandleAdornment_0.Adornee = workspace.Terrain;
        l_ConeHandleAdornment_0.CFrame = v17;
        l_ConeHandleAdornment_0.Height = v18;
        l_ConeHandleAdornment_0.Color3 = Color3.new();
        l_ConeHandleAdornment_0.Radius = 0.25;
        l_ConeHandleAdornment_0.Transparency = 0.5;
        local l_FastCastVisualizationObjects_1 = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");
        local v21;
        if l_FastCastVisualizationObjects_1 ~= nil then
            v21 = l_FastCastVisualizationObjects_1;
        else
            l_FastCastVisualizationObjects_1 = Instance.new("Folder");
            l_FastCastVisualizationObjects_1.Name = "FastCastVisualizationObjects";
            l_FastCastVisualizationObjects_1.Archivable = false;
            l_FastCastVisualizationObjects_1.Parent = workspace.Terrain;
            v21 = l_FastCastVisualizationObjects_1;
        end;
        l_ConeHandleAdornment_0.Parent = v21;
        return l_ConeHandleAdornment_0;
    end;
end;
DbgVisualizeHit = function(v22, v23) --[[ Line: 100 ]] --[[ Name: DbgVisualizeHit ]]
    -- upvalues: v12 (ref)
    if v12.VisualizeCasts ~= true then
        return nil;
    else
        local l_SphereHandleAdornment_0 = Instance.new("SphereHandleAdornment");
        l_SphereHandleAdornment_0.Adornee = workspace.Terrain;
        l_SphereHandleAdornment_0.CFrame = v22;
        l_SphereHandleAdornment_0.Radius = 0.4;
        l_SphereHandleAdornment_0.Transparency = 0.25;
        l_SphereHandleAdornment_0.Color3 = v23 == false and Color3.new(0.2, 1, 0.5) or Color3.new(1, 0.2, 0.2);
        local l_FastCastVisualizationObjects_2 = workspace.Terrain:FindFirstChild("FastCastVisualizationObjects");
        local v26;
        if l_FastCastVisualizationObjects_2 ~= nil then
            v26 = l_FastCastVisualizationObjects_2;
        else
            l_FastCastVisualizationObjects_2 = Instance.new("Folder");
            l_FastCastVisualizationObjects_2.Name = "FastCastVisualizationObjects";
            l_FastCastVisualizationObjects_2.Archivable = false;
            l_FastCastVisualizationObjects_2.Parent = workspace.Terrain;
            v26 = l_FastCastVisualizationObjects_2;
        end;
        l_SphereHandleAdornment_0.Parent = v26;
        return l_SphereHandleAdornment_0;
    end;
end;
local function _(v27, v28, v29, v30) --[[ Line: 120 ]] --[[ Name: GetPositionAtTime ]]
    local v31 = Vector3.new(v30.X * v27 ^ 2 / 2, v30.Y * v27 ^ 2 / 2, v30.Z * v27 ^ 2 / 2);
    return v28 + v29 * v27 + v31;
end;
local function _(v33, v34, v35) --[[ Line: 126 ]] --[[ Name: GetVelocityAtTime ]]
    return v34 + v35 * v33;
end;
local function v47(v37, v38) --[[ Line: 130 ]] --[[ Name: GetTrajectoryInfo ]]
    assert(v37.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    local v39 = v37.StateInfo.Trajectories[v38];
    local v40 = v39.EndTime - v39.StartTime;
    local l_Origin_0 = v39.Origin;
    local l_InitialVelocity_0 = v39.InitialVelocity;
    local l_Acceleration_0 = v39.Acceleration;
    local v44 = {};
    local v45 = Vector3.new(l_Acceleration_0.X * v40 ^ 2 / 2, l_Acceleration_0.Y * v40 ^ 2 / 2, l_Acceleration_0.Z * v40 ^ 2 / 2);
    local v46 = l_Origin_0 + l_InitialVelocity_0 * v40 + v45;
    v45 = l_InitialVelocity_0 + l_Acceleration_0 * v40;
    v6(v44, 1, v46, v45);
    return v44;
end;
local function _(v48) --[[ Line: 143 ]] --[[ Name: GetLatestTrajectoryEndInfo ]]
    -- upvalues: v47 (copy)
    assert(v48.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    return (v47(v48, #v48.StateInfo.Trajectories));
end;
local function _(v50) --[[ Line: 148 ]] --[[ Name: CloneCastParams ]]
    local v51 = RaycastParams.new();
    v51.CollisionGroup = v50.CollisionGroup;
    v51.FilterType = v50.FilterType;
    v51.FilterDescendantsInstances = v50.FilterDescendantsInstances;
    v51.IgnoreWater = v50.IgnoreWater;
    return v51;
end;
local function _(v53, v54, v55, v56) --[[ Line: 157 ]] --[[ Name: SendRayHit ]]
    v53.Caster.RayHit:Fire(v53, v54, v55, v56);
end;
local function _(v58, v59, v60, v61) --[[ Line: 162 ]] --[[ Name: SendRayPierced ]]
    v58.Caster.RayPierced:Fire(v58, v59, v60, v61);
end;
local function _(v63, v64, v65, v66, v67, v68) --[[ Line: 167 ]] --[[ Name: SendLengthChanged ]]
    v63.Caster.LengthChanged:Fire(v63, v64, v65, v66, v67, v68);
end;
local function v121(v70, v71, v72) --[[ Line: 173 ]] --[[ Name: SimulateCast ]]
    -- upvalues: v12 (ref), v11 (copy)
    assert(v70.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    if v12.DebugLogging == true then
        print("Casting for frame.");
    end;
    local v73 = v70.StateInfo.Trajectories[#v70.StateInfo.Trajectories];
    local l_Origin_1 = v73.Origin;
    local v75 = v70.StateInfo.TotalRuntime - v73.StartTime;
    local l_InitialVelocity_1 = v73.InitialVelocity;
    local l_Acceleration_1 = v73.Acceleration;
    local l_v75_0 = v75;
    local v79 = Vector3.new(l_Acceleration_1.X * l_v75_0 ^ 2 / 2, l_Acceleration_1.Y * l_v75_0 ^ 2 / 2, l_Acceleration_1.Z * l_v75_0 ^ 2 / 2);
    local v80 = l_Origin_1 + l_InitialVelocity_1 * l_v75_0 + v79;
    l_v75_0 = l_InitialVelocity_1 + l_Acceleration_1 * v75;
    v79 = v70.StateInfo.TotalRuntime - v73.StartTime;
    local l_StateInfo_0 = v70.StateInfo;
    l_StateInfo_0.TotalRuntime = l_StateInfo_0.TotalRuntime + v71;
    v75 = v70.StateInfo.TotalRuntime - v73.StartTime;
    local l_v75_1 = v75;
    local v83 = Vector3.new(l_Acceleration_1.X * l_v75_1 ^ 2 / 2, l_Acceleration_1.Y * l_v75_1 ^ 2 / 2, l_Acceleration_1.Z * l_v75_1 ^ 2 / 2);
    l_StateInfo_0 = l_Origin_1 + l_InitialVelocity_1 * l_v75_1 + v83;
    l_v75_1 = l_InitialVelocity_1 + l_Acceleration_1 * v75;
    local v84 = (l_StateInfo_0 - v80).Unit * l_v75_1.Magnitude * v71;
    local l_WorldRoot_0 = v70.RayInfo.WorldRoot;
    local v86 = l_WorldRoot_0:Raycast(v80, v84, v70.RayInfo.Parameters);
    local l_l_StateInfo_0_0 = l_StateInfo_0;
    local v88 = nil;
    local l_Air_0 = Enum.Material.Air;
    local v90 = Vector3.new();
    if v86 ~= nil then
        l_l_StateInfo_0_0 = v86.Position;
        v88 = v86.Instance;
        l_Air_0 = v86.Material;
        v90 = v86.Normal;
    end;
    local l_Magnitude_0 = (l_l_StateInfo_0_0 - v80).Magnitude;
    local l_Unit_0 = v84.Unit;
    local l_CosmeticBulletObject_0 = v70.RayInfo.CosmeticBulletObject;
    v70.Caster.LengthChanged:Fire(v70, v80, l_Unit_0, l_Magnitude_0, l_v75_1, l_CosmeticBulletObject_0);
    l_Unit_0 = v70.StateInfo;
    l_Unit_0.DistanceCovered = l_Unit_0.DistanceCovered + l_Magnitude_0;
    l_Unit_0 = nil;
    if v71 > 0 then
        l_Unit_0 = DbgVisualizeSegment(CFrame.new(v80, v80 + v84), l_Magnitude_0);
    end;
    if v88 and v88 ~= v70.RayInfo.CosmeticBulletObject then
        l_CosmeticBulletObject_0 = tick();
        if v12.DebugLogging == true then
            print("Hit something, testing now.");
        end;
        if v70.RayInfo.CanPierceCallback ~= nil then
            if v72 == false and v70.StateInfo.IsActivelySimulatingPierce then
                v70:Terminate();
                error("ERROR: The latest call to CanPierceCallback took too long to complete! This cast is going to suffer desyncs which WILL cause unexpected behavior and errors. Please fix your performance problems, or remove statements that yield (e.g. wait() calls)");
            end;
            v70.StateInfo.IsActivelySimulatingPierce = true;
        end;
        if v70.RayInfo.CanPierceCallback == nil or v70.RayInfo.CanPierceCallback ~= nil and v70.RayInfo.CanPierceCallback(v70, v86, l_v75_1, v70.RayInfo.CosmeticBulletObject) == false then
            if v12.DebugLogging == true then
                print("Piercing function is nil or it returned FALSE to not pierce this hit.");
            end;
            v70.StateInfo.IsActivelySimulatingPierce = false;
            if v70.StateInfo.HighFidelityBehavior == 2 and v73.Acceleration ~= Vector3.new() and v70.StateInfo.HighFidelitySegmentSize ~= 0 then
                v70.StateInfo.CancelHighResCast = false;
                if v70.StateInfo.IsActivelyResimulating then
                    v70:Terminate();
                    error("Cascading cast lag encountered! The caster attempted to perform a high fidelity cast before the previous one completed, resulting in exponential cast lag. Consider increasing HighFidelitySegmentSize.");
                end;
                v70.StateInfo.IsActivelyResimulating = true;
                if v12.DebugLogging == true then
                    print("Hit was registered, but recalculation is on for physics based casts. Recalculating to verify a real hit...");
                end;
                local v94 = math.floor(l_Magnitude_0 / v70.StateInfo.HighFidelitySegmentSize);
                local _ = l_Magnitude_0 / v94;
                local v96 = v71 / v94;
                for v97 = 1, v94 do
                    if v70.StateInfo.CancelHighResCast then
                        v70.StateInfo.CancelHighResCast = false;
                        break;
                    else
                        local v98 = v79 + v96 * v97;
                        local v99 = Vector3.new(l_Acceleration_1.X * v98 ^ 2 / 2, l_Acceleration_1.Y * v98 ^ 2 / 2, l_Acceleration_1.Z * v98 ^ 2 / 2);
                        local v100 = l_Origin_1 + l_InitialVelocity_1 * v98 + v99;
                        v98 = l_InitialVelocity_1 + l_Acceleration_1 * (v79 + v96 * v97);
                        local v101 = l_WorldRoot_0:Raycast(v100, v98 * v71, v70.RayInfo.Parameters);
                        local l_Magnitude_1 = (v100 - (v100 + v98)).Magnitude;
                        if v101 ~= nil then
                            local l_Magnitude_2 = (v100 - v101.Position).Magnitude;
                            local v104 = DbgVisualizeSegment(CFrame.new(v100, v100 + v98), l_Magnitude_2);
                            if v104 ~= nil then
                                v104.Color3 = Color3.new(0.286275, 0.329412, 0.247059);
                            end;
                            if v70.RayInfo.CanPierceCallback == nil or v70.RayInfo.CanPierceCallback ~= nil and v70.RayInfo.CanPierceCallback(v70, v101, v98, v70.RayInfo.CosmeticBulletObject) == false then
                                v70.StateInfo.IsActivelyResimulating = false;
                                local l_CosmeticBulletObject_1 = v70.RayInfo.CosmeticBulletObject;
                                v70.Caster.RayHit:Fire(v70, v101, v98, l_CosmeticBulletObject_1);
                                v70:Terminate();
                                l_CosmeticBulletObject_1 = DbgVisualizeHit(CFrame.new(l_l_StateInfo_0_0), false);
                                if l_CosmeticBulletObject_1 ~= nil then
                                    l_CosmeticBulletObject_1.Color3 = Color3.new(0.0588235, 0.87451, 1);
                                end;
                                return;
                            else
                                local l_CosmeticBulletObject_2 = v70.RayInfo.CosmeticBulletObject;
                                v70.Caster.RayPierced:Fire(v70, v101, v98, l_CosmeticBulletObject_2);
                                l_CosmeticBulletObject_2 = DbgVisualizeHit(CFrame.new(l_l_StateInfo_0_0), true);
                                if l_CosmeticBulletObject_2 ~= nil then
                                    l_CosmeticBulletObject_2.Color3 = Color3.new(1, 0.113725, 0.588235);
                                end;
                                if v104 ~= nil then
                                    v104.Color3 = Color3.new(0.305882, 0.243137, 0.329412);
                                end;
                            end;
                        else
                            local v107 = DbgVisualizeSegment(CFrame.new(v100, v100 + v98), l_Magnitude_1);
                            if v107 ~= nil then
                                v107.Color3 = Color3.new(0.286275, 0.329412, 0.247059);
                            end;
                        end;
                    end;
                end;
                v70.StateInfo.IsActivelyResimulating = false;
            elseif v70.StateInfo.HighFidelityBehavior ~= 1 and v70.StateInfo.HighFidelityBehavior ~= 3 then
                v70:Terminate();
                error("Invalid value " .. v70.StateInfo.HighFidelityBehavior .. " for HighFidelityBehavior.");
            else
                if v12.DebugLogging == true then
                    print("Hit was successful. Terminating.");
                end;
                local l_v86_0 = v86;
                local l_CosmeticBulletObject_3 = v70.RayInfo.CosmeticBulletObject;
                v70.Caster.RayHit:Fire(v70, l_v86_0, l_v75_1, l_CosmeticBulletObject_3);
                v70:Terminate();
                DbgVisualizeHit(CFrame.new(l_l_StateInfo_0_0), false);
                return;
            end;
        else
            if v12.DebugLogging == true then
                print("Piercing function returned TRUE to pierce this part.");
            end;
            if l_Unit_0 ~= nil then
                l_Unit_0.Color3 = Color3.new(0.4, 0.05, 0.05);
            end;
            DbgVisualizeHit(CFrame.new(l_l_StateInfo_0_0), true);
            local l_Parameters_0 = v70.RayInfo.Parameters;
            local v111 = {};
            local v112 = 0;
            local l_FilterDescendantsInstances_0 = l_Parameters_0.FilterDescendantsInstances;
            local v114 = false;
            while true do
                if v86.Instance:IsA("Terrain") then
                    if l_Air_0 == Enum.Material.Water then
                        v70:Terminate();
                        error("Do not add Water as a piercable material. If you need to pierce water, set cast.RayInfo.Parameters.IgnoreWater = true instead", 0);
                    end;
                    warn("WARNING: The pierce callback for this cast returned TRUE on Terrain! This can cause severely adverse effects.");
                end;
                if l_Parameters_0.FilterType == Enum.RaycastFilterType.Blacklist then
                    local l_FilterDescendantsInstances_1 = l_Parameters_0.FilterDescendantsInstances;
                    v11.insert(l_FilterDescendantsInstances_1, v86.Instance);
                    v11.insert(v111, v86.Instance);
                    l_Parameters_0.FilterDescendantsInstances = l_FilterDescendantsInstances_1;
                else
                    local l_FilterDescendantsInstances_2 = l_Parameters_0.FilterDescendantsInstances;
                    v11.removeObject(l_FilterDescendantsInstances_2, v86.Instance);
                    v11.insert(v111, v86.Instance);
                    l_Parameters_0.FilterDescendantsInstances = l_FilterDescendantsInstances_2;
                end;
                local l_v86_1 = v86;
                local l_CosmeticBulletObject_4 = v70.RayInfo.CosmeticBulletObject;
                v70.Caster.RayPierced:Fire(v70, l_v86_1, l_v75_1, l_CosmeticBulletObject_4);
                v86 = l_WorldRoot_0:Raycast(v80, v84, l_Parameters_0);
                if v86 ~= nil then
                    if v112 >= 100 then
                        warn("WARNING: Exceeded maximum pierce test budget for a single ray segment (attempted to test the same segment " .. 100 .. " times!)");
                        break;
                    else
                        v112 = v112 + 1;
                        if v70.RayInfo.CanPierceCallback(v70, v86, l_v75_1, v70.RayInfo.CosmeticBulletObject) == false then
                            v114 = true;
                            break;
                        end;
                    end;
                else
                    break;
                end;
            end;
            v70.RayInfo.Parameters.FilterDescendantsInstances = l_FilterDescendantsInstances_0;
            v70.StateInfo.IsActivelySimulatingPierce = false;
            if v114 then
                local v119 = "Broke because the ray hit something solid (" .. tostring(v86.Instance) .. ") while testing for a pierce. Terminating the cast.";
                if v12.DebugLogging == true then
                    print(v119);
                end;
                v119 = v86;
                local l_CosmeticBulletObject_5 = v70.RayInfo.CosmeticBulletObject;
                v70.Caster.RayHit:Fire(v70, v119, l_v75_1, l_CosmeticBulletObject_5);
                v70:Terminate();
                DbgVisualizeHit(CFrame.new(v86.Position), false);
                return;
            end;
        end;
    end;
    if v70.StateInfo.DistanceCovered >= v70.RayInfo.MaxDistance then
        v70:Terminate();
        DbgVisualizeHit(CFrame.new(l_StateInfo_0), false);
    end;
end;
v9.new = function(v122, v123, v124, v125, v126) --[[ Line: 422 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v11 (copy), l_RunService_0 (copy), v9 (copy), v12 (ref), v121 (copy)
    if v8(v125) == "number" then
        v125 = v124.Unit * v125;
    end;
    if v126.HighFidelitySegmentSize <= 0 then
        error("Cannot set FastCastBehavior.HighFidelitySegmentSize <= 0!", 0);
    end;
    local v127 = {
        Caster = v122, 
        StateInfo = {
            UpdateConnection = nil, 
            Paused = false, 
            TotalRuntime = 0, 
            DistanceCovered = 0, 
            HighFidelitySegmentSize = v126.HighFidelitySegmentSize, 
            HighFidelityBehavior = v126.HighFidelityBehavior, 
            IsActivelySimulatingPierce = false, 
            IsActivelyResimulating = false, 
            CancelHighResCast = false, 
            Trajectories = {
                {
                    StartTime = 0, 
                    EndTime = -1, 
                    Origin = v123, 
                    InitialVelocity = v125, 
                    Acceleration = v126.Acceleration
                }
            }
        }, 
        RayInfo = {
            Parameters = v126.RaycastParams, 
            WorldRoot = workspace, 
            MaxDistance = v126.MaxDistance or 1000, 
            CosmeticBulletObject = v126.CosmeticBulletTemplate, 
            CanPierceCallback = v126.CanPierceFunction
        }, 
        UserData = {}
    };
    if v127.StateInfo.HighFidelityBehavior == 2 then
        v127.StateInfo.HighFidelityBehavior = 3;
    end;
    if v127.RayInfo.Parameters ~= nil then
        local l_RayInfo_0 = v127.RayInfo;
        local l_Parameters_1 = v127.RayInfo.Parameters;
        local v130 = RaycastParams.new();
        v130.CollisionGroup = l_Parameters_1.CollisionGroup;
        v130.FilterType = l_Parameters_1.FilterType;
        v130.FilterDescendantsInstances = l_Parameters_1.FilterDescendantsInstances;
        v130.IgnoreWater = l_Parameters_1.IgnoreWater;
        l_RayInfo_0.Parameters = v130;
    else
        v127.RayInfo.Parameters = RaycastParams.new();
    end;
    local v131 = false;
    if v126.CosmeticBulletProvider == nil then
        if v127.RayInfo.CosmeticBulletObject ~= nil then
            v127.RayInfo.CosmeticBulletObject = v127.RayInfo.CosmeticBulletObject:Clone();
            v127.RayInfo.CosmeticBulletObject.CFrame = CFrame.new(v123, v123 + v124);
            v127.RayInfo.CosmeticBulletObject.Parent = v126.CosmeticBulletContainer;
        end;
    elseif v8(v126.CosmeticBulletProvider) == "PartCache" then
        if v127.RayInfo.CosmeticBulletObject ~= nil then
            warn("Do not define FastCastBehavior.CosmeticBulletTemplate and FastCastBehavior.CosmeticBulletProvider at the same time! The provider will be used, and CosmeticBulletTemplate will be set to nil.");
            v127.RayInfo.CosmeticBulletObject = nil;
            v126.CosmeticBulletTemplate = nil;
        end;
        v127.RayInfo.CosmeticBulletObject = v126.CosmeticBulletProvider:GetPart();
        v127.RayInfo.CosmeticBulletObject.CFrame = CFrame.new(v123, v123 + v124);
        v131 = true;
    else
        warn("FastCastBehavior.CosmeticBulletProvider was not an instance of the PartCache module (an external/separate model)! Are you inputting an instance created via PartCache.new? If so, are you on the latest version of PartCache? Setting FastCastBehavior.CosmeticBulletProvider to nil.");
        v126.CosmeticBulletProvider = nil;
    end;
    local v132 = nil;
    v132 = if v131 then v126.CosmeticBulletProvider.CurrentCacheParent else v126.CosmeticBulletContainer;
    if v126.AutoIgnoreContainer == true and v132 ~= nil then
        local l_FilterDescendantsInstances_3 = v127.RayInfo.Parameters.FilterDescendantsInstances;
        if v11.find(l_FilterDescendantsInstances_3, v132) == nil then
            v11.insert(l_FilterDescendantsInstances_3, v132);
            v127.RayInfo.Parameters.FilterDescendantsInstances = l_FilterDescendantsInstances_3;
        end;
    end;
    local v134 = nil;
    v134 = if l_RunService_0:IsClient() then l_RunService_0.RenderStepped else l_RunService_0.Heartbeat;
    setmetatable(v127, v9);
    v127.StateInfo.UpdateConnection = v134:Connect(function(v135) --[[ Line: 535 ]]
        -- upvalues: v127 (copy), v12 (ref), v121 (ref)
        if v127.StateInfo.Paused then
            return;
        else
            if v12.DebugLogging == true then
                print("Casting for frame.");
            end;
            local v136 = v127.StateInfo.Trajectories[#v127.StateInfo.Trajectories];
            if v127.StateInfo.HighFidelityBehavior == 3 and v136.Acceleration ~= Vector3.new() and v127.StateInfo.HighFidelitySegmentSize > 0 then
                local v137 = tick();
                if v127.StateInfo.IsActivelyResimulating then
                    v127:Terminate();
                    error("Cascading cast lag encountered! The caster attempted to perform a high fidelity cast before the previous one completed, resulting in exponential cast lag. Consider increasing HighFidelitySegmentSize.");
                end;
                v127.StateInfo.IsActivelyResimulating = true;
                local l_Origin_2 = v136.Origin;
                local v139 = v127.StateInfo.TotalRuntime - v136.StartTime;
                local l_InitialVelocity_2 = v136.InitialVelocity;
                local l_Acceleration_2 = v136.Acceleration;
                local l_v139_0 = v139;
                local v143 = Vector3.new(l_Acceleration_2.X * l_v139_0 ^ 2 / 2, l_Acceleration_2.Y * l_v139_0 ^ 2 / 2, l_Acceleration_2.Z * l_v139_0 ^ 2 / 2);
                local v144 = l_Origin_2 + l_InitialVelocity_2 * l_v139_0 + v143;
                l_v139_0 = l_InitialVelocity_2 + l_Acceleration_2 * v139;
                v143 = v127.StateInfo.TotalRuntime - v136.StartTime;
                local l_StateInfo_1 = v127.StateInfo;
                l_StateInfo_1.TotalRuntime = l_StateInfo_1.TotalRuntime + v135;
                v139 = v127.StateInfo.TotalRuntime - v136.StartTime;
                local l_v139_1 = v139;
                local v147 = Vector3.new(l_Acceleration_2.X * l_v139_1 ^ 2 / 2, l_Acceleration_2.Y * l_v139_1 ^ 2 / 2, l_Acceleration_2.Z * l_v139_1 ^ 2 / 2);
                l_StateInfo_1 = l_Origin_2 + l_InitialVelocity_2 * l_v139_1 + v147;
                l_v139_1 = l_InitialVelocity_2 + l_Acceleration_2 * v139;
                local v148 = (l_StateInfo_1 - v144).Unit * l_v139_1.Magnitude * v135;
                local v149 = v127.RayInfo.WorldRoot:Raycast(v144, v148, v127.RayInfo.Parameters);
                local l_l_StateInfo_1_0 = l_StateInfo_1;
                if v149 ~= nil then
                    l_l_StateInfo_1_0 = v149.Position;
                end;
                local l_Magnitude_3 = (l_l_StateInfo_1_0 - v144).Magnitude;
                local l_StateInfo_2 = v127.StateInfo;
                l_StateInfo_2.TotalRuntime = l_StateInfo_2.TotalRuntime - v135;
                local v153 = math.floor(l_Magnitude_3 / v127.StateInfo.HighFidelitySegmentSize);
                if v153 == 0 then
                    v153 = 1;
                end;
                local v154 = v135 / v153;
                for v155 = 1, v153 do
                    if getmetatable(v127) == nil then
                        return;
                    elseif v127.StateInfo.CancelHighResCast then
                        v127.StateInfo.CancelHighResCast = false;
                        break;
                    else
                        local v156 = "[" .. v155 .. "] Subcast of time increment " .. v154;
                        if v12.DebugLogging == true then
                            print(v156);
                        end;
                        v121(v127, v154, true);
                    end;
                end;
                if getmetatable(v127) == nil then
                    return;
                else
                    v127.StateInfo.IsActivelyResimulating = false;
                    if tick() - v137 > 0.08 then
                        warn("Extreme cast lag encountered! Consider increasing HighFidelitySegmentSize.");
                        return;
                    end;
                end;
            else
                v121(v127, v135, false);
            end;
            return;
        end;
    end);
    return v127;
end;
v9.SetStaticFastCastReference = function(v157) --[[ Line: 619 ]] --[[ Name: SetStaticFastCastReference ]]
    -- upvalues: v12 (ref)
    v12 = v157;
end;
local function v166(v158, v159, v160, v161) --[[ Line: 625 ]] --[[ Name: ModifyTransformation ]]
    -- upvalues: v47 (copy), v11 (copy)
    local l_Trajectories_0 = v158.StateInfo.Trajectories;
    local v163 = l_Trajectories_0[#l_Trajectories_0];
    if v163.StartTime == v158.StateInfo.TotalRuntime then
        if v159 == nil then
            v159 = v163.InitialVelocity;
        end;
        if v160 == nil then
            v160 = v163.Acceleration;
        end;
        if v161 == nil then
            v161 = v163.Origin;
        end;
        v163.Origin = v161;
        v163.InitialVelocity = v159;
        v163.Acceleration = v160;
        return;
    else
        v163.EndTime = v158.StateInfo.TotalRuntime;
        assert(v158.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
        local v164, v165 = unpack((v47(v158, #v158.StateInfo.Trajectories)));
        if v159 == nil then
            v159 = v165;
        end;
        if v160 == nil then
            v160 = v163.Acceleration;
        end;
        if v161 == nil then
            v161 = v164;
        end;
        v11.insert(v158.StateInfo.Trajectories, {
            StartTime = v158.StateInfo.TotalRuntime, 
            EndTime = -1, 
            Origin = v161, 
            InitialVelocity = v159, 
            Acceleration = v160
        });
        v158.StateInfo.CancelHighResCast = true;
        return;
    end;
end;
v9.SetVelocity = function(v167, v168) --[[ Line: 671 ]] --[[ Name: SetVelocity ]]
    -- upvalues: v9 (copy), v166 (copy)
    assert(getmetatable(v167) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("SetVelocity", "ActiveCast.new(...)"));
    assert(v167.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v166(v167, v168, nil, nil);
end;
v9.SetAcceleration = function(v169, v170) --[[ Line: 677 ]] --[[ Name: SetAcceleration ]]
    -- upvalues: v9 (copy), v166 (copy)
    assert(getmetatable(v169) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("SetAcceleration", "ActiveCast.new(...)"));
    assert(v169.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v166(v169, nil, v170, nil);
end;
v9.SetPosition = function(v171, v172) --[[ Line: 683 ]] --[[ Name: SetPosition ]]
    -- upvalues: v9 (copy), v166 (copy)
    assert(getmetatable(v171) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("SetPosition", "ActiveCast.new(...)"));
    assert(v171.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v166(v171, nil, nil, v172);
end;
v9.GetVelocity = function(v173) --[[ Line: 689 ]] --[[ Name: GetVelocity ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v173) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("GetVelocity", "ActiveCast.new(...)"));
    assert(v173.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    local v174 = v173.StateInfo.Trajectories[#v173.StateInfo.Trajectories];
    local v175 = v173.StateInfo.TotalRuntime - v174.StartTime;
    return v174.InitialVelocity + v174.Acceleration * v175;
end;
v9.GetAcceleration = function(v176) --[[ Line: 696 ]] --[[ Name: GetAcceleration ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v176) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("GetAcceleration", "ActiveCast.new(...)"));
    assert(v176.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    return v176.StateInfo.Trajectories[#v176.StateInfo.Trajectories].Acceleration;
end;
v9.GetPosition = function(v177) --[[ Line: 703 ]] --[[ Name: GetPosition ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v177) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("GetPosition", "ActiveCast.new(...)"));
    assert(v177.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    local v178 = v177.StateInfo.Trajectories[#v177.StateInfo.Trajectories];
    local v179 = v177.StateInfo.TotalRuntime - v178.StartTime;
    local l_Origin_3 = v178.Origin;
    local l_InitialVelocity_3 = v178.InitialVelocity;
    local l_Acceleration_3 = v178.Acceleration;
    local v183 = Vector3.new(l_Acceleration_3.X * v179 ^ 2 / 2, l_Acceleration_3.Y * v179 ^ 2 / 2, l_Acceleration_3.Z * v179 ^ 2 / 2);
    return l_Origin_3 + l_InitialVelocity_3 * v179 + v183;
end;
v9.AddVelocity = function(v184, v185) --[[ Line: 712 ]] --[[ Name: AddVelocity ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v184) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("AddVelocity", "ActiveCast.new(...)"));
    assert(v184.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v184:SetVelocity(v184:GetVelocity() + v185);
end;
v9.AddAcceleration = function(v186, v187) --[[ Line: 718 ]] --[[ Name: AddAcceleration ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v186) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("AddAcceleration", "ActiveCast.new(...)"));
    assert(v186.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v186:SetAcceleration(v186:GetAcceleration() + v187);
end;
v9.AddPosition = function(v188, v189) --[[ Line: 724 ]] --[[ Name: AddPosition ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v188) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("AddPosition", "ActiveCast.new(...)"));
    assert(v188.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v188:SetPosition(v188:GetPosition() + v189);
end;
v9.Pause = function(v190) --[[ Line: 732 ]] --[[ Name: Pause ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v190) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Pause", "ActiveCast.new(...)"));
    assert(v190.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v190.StateInfo.Paused = true;
end;
v9.Resume = function(v191) --[[ Line: 738 ]] --[[ Name: Resume ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v191) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Resume", "ActiveCast.new(...)"));
    assert(v191.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    v191.StateInfo.Paused = false;
end;
v9.Terminate = function(v192) --[[ Line: 744 ]] --[[ Name: Terminate ]]
    -- upvalues: v9 (copy)
    assert(getmetatable(v192) == v9, ("Cannot statically invoke method '%s' - It is an instance method. Call it on an instance of this class created via %s"):format("Terminate", "ActiveCast.new(...)"));
    assert(v192.StateInfo.UpdateConnection ~= nil, "This ActiveCast has been terminated. It can no longer be used.");
    local l_Trajectories_1 = v192.StateInfo.Trajectories;
    l_Trajectories_1[#l_Trajectories_1].EndTime = v192.StateInfo.TotalRuntime;
    v192.StateInfo.UpdateConnection:Disconnect();
    v192.Caster.CastTerminating:FireSync(v192);
    v192.StateInfo.UpdateConnection = nil;
    v192.Caster = nil;
    v192.StateInfo = nil;
    v192.RayInfo = nil;
    v192.UserData = nil;
    setmetatable(v192, nil);
end;
return v9;