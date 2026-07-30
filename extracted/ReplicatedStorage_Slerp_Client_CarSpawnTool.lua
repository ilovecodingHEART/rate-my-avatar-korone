-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_SpawnCarForLocalPlayer_0 = l_ReplicatedStorage_0.Slerp.RemoteEvents.SpawnCarForLocalPlayer;
local l_DestroyCarsForLocalPlayer_0 = l_ReplicatedStorage_0.Slerp.RemoteEvents.DestroyCarsForLocalPlayer;
local v5 = {};
local v6 = {};
local function _(v7) --[[ Line: 23 ]] --[[ Name: toolActivated ]]
    local l_v7_Attribute_0 = v7:GetAttribute("CarKind");
    if not l_v7_Attribute_0 then
        return;
    else
        l_SpawnCarForLocalPlayer_0:FireServer(l_v7_Attribute_0);
        return;
    end;
end;
local function _() --[[ Line: 31 ]] --[[ Name: toolDeactivated ]]
    l_DestroyCarsForLocalPlayer_0:FireServer();
end;
local function v23() --[[ Line: 35 ]] --[[ Name: createScriptConnections ]]
    v6.characterModel = l_LocalPlayer_0.Character;
    local v11 = nil;
    local v12 = nil;
    local function _(v13) --[[ Line: 42 ]] --[[ Name: characterAdded ]]
        v6.characterModel = v13;
        if v11 then
            v11:Disconnect();
        end;
        v11 = v13.ChildAdded:Connect(function(v14) --[[ Line: 47 ]]
            if v14:IsA("Tool") and l_CollectionService_0:HasTag(v14, "CarSpawnTool") then
                local l_v14_Attribute_0 = v14:GetAttribute("CarKind");
                if l_v14_Attribute_0 then
                    l_SpawnCarForLocalPlayer_0:FireServer(l_v14_Attribute_0);
                end;
                v12 = v14.Unequipped:Connect(function() --[[ Line: 50 ]]
                    if v12 then
                        v12:Disconnect();
                        v12 = nil;
                    end;
                    l_DestroyCarsForLocalPlayer_0:FireServer();
                end);
            end;
        end);
    end;
    if l_LocalPlayer_0.Character then
        local l_Character_0 = l_LocalPlayer_0.Character;
        v6.characterModel = l_Character_0;
        if v11 then
            v11:Disconnect();
        end;
        v11 = l_Character_0.ChildAdded:Connect(function(v18) --[[ Line: 47 ]]
            if v18:IsA("Tool") and l_CollectionService_0:HasTag(v18, "CarSpawnTool") then
                local l_v18_Attribute_0 = v18:GetAttribute("CarKind");
                if l_v18_Attribute_0 then
                    l_SpawnCarForLocalPlayer_0:FireServer(l_v18_Attribute_0);
                end;
                v12 = v18.Unequipped:Connect(function() --[[ Line: 50 ]]
                    if v12 then
                        v12:Disconnect();
                        v12 = nil;
                    end;
                    l_DestroyCarsForLocalPlayer_0:FireServer();
                end);
            end;
        end);
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(function(v20) --[[ Line: 63 ]]
        v6.characterModel = v20;
        if v11 then
            v11:Disconnect();
        end;
        v11 = v20.ChildAdded:Connect(function(v21) --[[ Line: 47 ]]
            if v21:IsA("Tool") and l_CollectionService_0:HasTag(v21, "CarSpawnTool") then
                local l_v21_Attribute_0 = v21:GetAttribute("CarKind");
                if l_v21_Attribute_0 then
                    l_SpawnCarForLocalPlayer_0:FireServer(l_v21_Attribute_0);
                end;
                v12 = v21.Unequipped:Connect(function() --[[ Line: 50 ]]
                    if v12 then
                        v12:Disconnect();
                        v12 = nil;
                    end;
                    l_DestroyCarsForLocalPlayer_0:FireServer();
                end);
            end;
        end);
    end);
end;
v5.init = function() --[[ Line: 68 ]] --[[ Name: init ]]
    v23();
end;
v5.getCollectionServiceTag = function() --[[ Line: 72 ]] --[[ Name: getCollectionServiceTag ]]
    return "CarSpawnTool";
end;
table.freeze(v5);
return v5;