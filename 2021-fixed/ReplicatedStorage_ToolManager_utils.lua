-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local l_Tools_0 = script.Parent:WaitForChild("Tools");
local v2 = {
    server = {}, 
    client = {}, 
    shared = {}, 
    scr = script, 
    uid = 0
};
v2.server.getUID = function(_, v4) --[[ Line: 19 ]] --[[ Name: getUID ]]
    -- upvalues: v2 (copy)
    local l_v2_0 = v2;
    l_v2_0.uid = l_v2_0.uid + 1;
    return v4 .. v2.uid;
end;
v2.server.createRemoteEvent = function(_, v7, v8, v9) --[[ Line: 24 ]] --[[ Name: createRemoteEvent ]]
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = v7;
    l_RemoteEvent_0.Parent = v8;
    local v11 = {
        connections = {}
    };
    v11.OnServerEvent = function(v12) --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        table.insert(v11.connections, v12);
        return {
            Disconnect = function(_) --[[ Line: 38 ]] --[[ Name: Disconnect ]]
                -- upvalues: v11 (ref)
                v11.get:Disconnect();
            end
        };
    end;
    v11.get = l_RemoteEvent_0.OnServerEvent:Connect(function(v14, ...) --[[ Line: 45 ]]
        -- upvalues: v9 (copy), v11 (copy)
        if v9 and v14 and v14 ~= v9 then
            return;
        else
            for _, v16 in pairs(v11.connections) do
                v16(...);
            end;
            return;
        end;
    end);
    v11.FireClient = function(_, v18, ...) --[[ Line: 55 ]] --[[ Name: FireClient ]]
        -- upvalues: l_RemoteEvent_0 (copy)
        l_RemoteEvent_0:FireClient(v18, ...);
    end;
    return v11;
end;
v2.shared.getReplicationRange = function(_, v20, v21) --[[ Line: 62 ]] --[[ Name: getReplicationRange ]]
    -- upvalues: l_Players_0 (copy)
    local v22 = {};
    for _, v24 in pairs(l_Players_0:GetPlayers()) do
        local l_Character_0 = v24.Character;
        if l_Character_0 and (v20 - l_Character_0:GetPivot().Position).Magnitude <= v21 then
            table.insert(v22, v24);
        end;
    end;
    return v22;
end;
v2.server.replicateToClient = function(_, v27, v28, _) --[[ Line: 78 ]] --[[ Name: replicateToClient ]]
    -- upvalues: l_Tools_0 (copy), v2 (copy)
    if not l_Tools_0[v27]:FindFirstChild("controller") then
        return;
    else
        v2.scr:WaitForChild("replicate"):FireAllClients(v27, v28);
        return;
    end;
end;
v2.server.replicateToClientInRange = function(_, v31, v32, v33, v34, v35) --[[ Line: 85 ]] --[[ Name: replicateToClientInRange ]]
    -- upvalues: l_Tools_0 (copy), v2 (copy)
    if not l_Tools_0[v31]:FindFirstChild("controller") then
        return;
    else
        for _, v37 in pairs(v2.shared:getReplicationRange(v33, v34)) do
            v2.scr:WaitForChild("replicate"):FireClient(v37, v31, v32, v35, "server");
        end;
        return;
    end;
end;
v2.client.replicateToClient = function(v38, v39, v40, v41) --[[ Line: 94 ]] --[[ Name: replicateToClient ]]
    -- upvalues: l_Tools_0 (copy)
    local l_controller_0 = l_Tools_0[v38]:FindFirstChild("controller");
    if not l_controller_0 then
        return;
    else
        require(l_controller_0).client[v39](v40, v41);
        return;
    end;
end;
v2.shared.getAttachmentWorldRoot = function(_) --[[ Line: 101 ]] --[[ Name: getAttachmentWorldRoot ]]
    if workspace:FindFirstChild("attachmentWorldRoot") then
        return workspace.attachmentWorldRoot;
    else
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        l_Part_0.Transparency = 1;
        l_Part_0.CanQuery = false;
        l_Part_0.CanTouch = false;
        l_Part_0.AudioCanCollide = false;
        l_Part_0.Size = Vector3.new(1, 1, 1, 0);
        l_Part_0.Name = "attachmentWorldRoot";
        l_Part_0.Parent = workspace;
        return l_Part_0;
    end;
end;
return v2;