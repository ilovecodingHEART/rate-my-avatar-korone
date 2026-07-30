-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x9, pairs() wrap x2, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {};
v0.__index = v0;
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v4 = {
    Enabled = true, 
    Brightness = 1, 
    LightEmission = 1, 
    LightInfluence = 0, 
    Texture = "rbxassetid://11552476728", 
    TextureLength = 4, 
    TextureSpeed = 3, 
    Transparency = NumberSequence.new(0), 
    ZOffset = 0, 
    FaceCamera = true, 
    CurveSize0 = 0, 
    CurveSize1 = 0, 
    Segments = 5, 
    Width0 = 4, 
    Width1 = 4
};
local function _(v5) --[[ Line: 28 ]] --[[ Name: throwWarning ]]
    warn((("[ARROW BEAMS] %s"):format(v5)));
end;
v0.new = function(v7, v8) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    local v9 = setmetatable({
        Attachment0 = Instance.new("Attachment"), 
        Attachment1 = Instance.new("Attachment"), 
        Beam = Instance.new("Beam"), 
        Parent = v7 or workspace.Terrain, 
        _segmentUpdater = nil
    }, v0);
    v9:resetDefault();
    if v8 then
        for v10, v11 in pairs(v8) --[[ 2021 ]] do
            pcall(function() --[[ Line: 45 ]]
                -- upvalues: v9 (copy), v10 (copy), v11 (copy)
                v9.Beam[v10] = v11;
            end);
        end;
    end;
    v9.Attachment0.Parent = v9.Parent;
    v9.Beam.Attachment0 = v9.Attachment0;
    v9.Beam.Attachment1 = v9.Attachment1;
    v9.Beam.Parent = v9.Parent;
    v9:Enable();
    v9._segmentUpdater = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 59 ]]
        -- upvalues: v9 (copy)
        v9:updateSegmentsByDistance();
    end);
    return v9;
end;
v0.setTarget = function(v12, v13) --[[ Line: 66 ]] --[[ Name: setTarget ]]
    if typeof(v13) == "Instance" then
        v12.Attachment1.Parent = v13;
    elseif typeof(v13) == "Vector3" then
        v12.Attachment1.Parent = workspace.Terrain;
        v12.Attachment1.WorldCFrame = CFrame.new(v13);
    else
        local v14 = ("%s is not a supported type."):format(v13);
        warn((("[ARROW BEAMS] %s"):format(v14)));
    end;
    v12:updateSegmentsByDistance();
end;
v0.setAttachment0 = function(v15, v16) --[[ Line: 78 ]] --[[ Name: setAttachment0 ]]
    if typeof(v16) == "Instance" then
        v15.Attachment0.Parent = v16;
    elseif typeof(v16) == "Vector3" then
        v15.Attachment0.Parent = workspace.Terrain;
        v15.Attachment0.WorldCFrame = CFrame.new(v16);
    else
        local v17 = ("%s is not a supported type."):format(v16);
        warn((("[ARROW BEAMS] %s"):format(v17)));
    end;
    v15:updateSegmentsByDistance();
end;
v0.setAttachment1 = function(v18, v19) --[[ Line: 90 ]] --[[ Name: setAttachment1 ]]
    if typeof(v19) == "Instance" then
        v18.Attachment1.Parent = v19;
    elseif typeof(v19) == "Vector3" then
        v18.Attachment1.Parent = workspace.Terrain;
        v18.Attachment1.WorldCFrame = CFrame.new(v19);
    else
        local v20 = ("%s is not a supported type."):format(v19);
        warn((("[ARROW BEAMS] %s"):format(v20)));
    end;
    v18:updateSegmentsByDistance();
end;
v0.setTexture = function(v21, v22) --[[ Line: 102 ]] --[[ Name: setTexture ]]
    if typeof(v22) == "string" then
        v21.Beam.Texture = v22;
        return;
    elseif typeof(v22) == "number" then
        v21.Beam.Texture = ("rbxassetid://%s"):format(v22);
        return;
    else
        warn((("[ARROW BEAMS] %s"):format("TextureID is not valid")));
        return;
    end;
end;
v0.setParent = function(v23, v24) --[[ Line: 112 ]] --[[ Name: setParent ]]
    v23.Parent = v24;
    v23.Beam.Parent = v23.Parent;
end;
v0.Enable = function(v25) --[[ Line: 117 ]] --[[ Name: Enable ]]
    v25.Beam.Enabled = true;
end;
v0.Disable = function(v26) --[[ Line: 121 ]] --[[ Name: Disable ]]
    v26.Beam.Enabled = false;
end;
v0.resetDefault = function(v27) --[[ Line: 125 ]] --[[ Name: resetDefault ]]
    -- upvalues: v4 (copy)
    for v28, v29 in pairs(v4) --[[ 2021 ]] do
        pcall(function() --[[ Line: 127 ]]
            -- upvalues: v27 (copy), v28 (copy), v29 (copy)
            v27.Beam[v28] = v29;
        end);
    end;
end;
v0.updateSegmentsByDistance = function(v30, v31, v32) --[[ Line: 133 ]] --[[ Name: updateSegmentsByDistance ]]
    local l_Magnitude_0 = (v30.Attachment0.WorldPosition - v30.Attachment1.WorldPosition).Magnitude;
    local v34 = math.max(v31 or 5, (math.floor(l_Magnitude_0 * (v32 or 0.25))));
    v30.Beam.Segments = v34;
    v30.Beam.TextureLength = math.max(1, l_Magnitude_0 / 4);
end;
v0.Destroy = function(v35) --[[ Line: 149 ]] --[[ Name: Destroy ]]
    if v35._segmentUpdater then
        v35._segmentUpdater:Disconnect();
    end;
    v35.Attachment0:Destroy();
    v35.Attachment1:Destroy();
    v35.Beam:Destroy();
    for v36 in pairs(v35) do
        v35[v36] = nil;
    end;
    setmetatable(v35, nil);
end;
return v0;