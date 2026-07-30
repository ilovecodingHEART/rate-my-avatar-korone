-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_NexusBufferedReplication_0 = require(script:WaitForChild("Packages"):WaitForChild("NexusBufferedReplication"));
local v3 = require(script:WaitForChild("State"):WaitForChild("Settings")).GetInstance();
local l_BufferProtocol_0 = require(script:WaitForChild("Util"):WaitForChild("BufferProtocol"));
local l_BufferedRemoteEventSender_0 = l_NexusBufferedReplication_0.Sender.BufferedRemoteEventSender;
local l_EnrollableRemoteEvent_0 = l_NexusBufferedReplication_0.Sender.EnrollableRemoteEvent;
return {
    SetConfiguration = function(_, v8) --[[ Line: 28 ]] --[[ Name: SetConfiguration ]]
        -- upvalues: l_HttpService_0 (copy), v3 (copy)
        local l_Configuration_0 = script:FindFirstChild("Configuration");
        if not l_Configuration_0 then
            local l_StringValue_0 = Instance.new("StringValue");
            l_StringValue_0.Name = "Configuration";
            l_StringValue_0.Parent = script;
            l_Configuration_0 = l_StringValue_0;
        end;
        local v11 = false;
        if v8.Extra then
            v11 = v8.Extra.HideVersion == true;
        end;
        if not v8.Version then
            v8.Version = {};
        end;
        if not v8.Version.Tag then
            v8.Version.Tag = v11 and "Hidden" or "2.15.1";
        end;
        if not v8.Version.Commit then
            v8.Version.Commit = v11 and "Hidden" or "c6e3ad0";
        end;
        l_Configuration_0.Value = l_HttpService_0:JSONEncode(v8);
        v3:SetDefaults(v8);
    end, 
    Load = function(_) --[[ Line: 61 ]] --[[ Name: Load ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_EnrollableRemoteEvent_0 (copy), l_BufferedRemoteEventSender_0 (copy), l_BufferProtocol_0 (copy), v3 (copy)
        if l_ReplicatedStorage_0:FindFirstChild("NexusVRCharacterModel") then
            return;
        else
            script.Name = "NexusVRCharacterModel";
            script.Parent = l_ReplicatedStorage_0;
            if not l_ReplicatedStorage_0:FindFirstChild("NexusVRCore") then
                local l_Packages_0 = script:FindFirstChild("Packages");
                if l_Packages_0 then
                    local l_l_Packages_0_FirstChild_0 = l_Packages_0:FindFirstChild("nexus-vr-core", true);
                    local l_l_Packages_0_FirstChild_1 = l_Packages_0:FindFirstChild("nexus-instance", true);
                    if l_l_Packages_0_FirstChild_0 and l_l_Packages_0_FirstChild_1 then
                        local v16 = l_l_Packages_0_FirstChild_0:Clone();
                        v16.Name = "NexusVRCore";
                        v16:WaitForChild("Packages"):WaitForChild("NexusInstance"):Destroy();
                        local v17 = l_l_Packages_0_FirstChild_1:Clone();
                        v17.Name = "NexusInstance";
                        v17.Parent = v16:WaitForChild("Packages");
                        v16.Parent = l_ReplicatedStorage_0;
                    end;
                end;
            end;
            require(l_ReplicatedStorage_0:WaitForChild("NexusVRCharacterModel"):WaitForChild("Util"):WaitForChild("Warnings"))();
            script:WaitForChild("NexusVRCharacterModelClientLoader").Parent = l_ReplicatedStorage_0;
            local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
            l_UnreliableRemoteEvent_0.Name = "UpdateInputs";
            l_UnreliableRemoteEvent_0.Parent = script;
            local l_RemoteEvent_0 = Instance.new("RemoteEvent");
            l_RemoteEvent_0.Name = "ReplicationReady";
            l_RemoteEvent_0.Parent = script;
            local v20 = l_EnrollableRemoteEvent_0.new(l_UnreliableRemoteEvent_0);
            local v22 = l_BufferedRemoteEventSender_0.WithPlayerKeys(v20, function(v21) --[[ Line: 107 ]]
                -- upvalues: l_BufferProtocol_0 (ref)
                return l_BufferProtocol_0.Serialize(v21);
            end);
            v22:StartDataSendingWithDelay(0.03333333333333333);
            l_UnreliableRemoteEvent_0.OnServerEvent:Connect(function(v23, v24) --[[ Line: 112 ]]
                -- upvalues: v22 (copy)
                if typeof(v24) ~= "table" then
                    return;
                else
                    v22:QueueData(v23, v24);
                    return;
                end;
            end);
            l_RemoteEvent_0.OnServerEvent:Connect(function(v25) --[[ Line: 117 ]]
                -- upvalues: v20 (copy)
                v20:EnrollPlayer(v25);
            end);
            if v3:GetSetting("Extra.NexusVRBackpackEnabled") ~= false then
                require(10728805649)();
            end;
            return;
        end;
    end, 
    Api = require(script:WaitForChild("Api"))()
};