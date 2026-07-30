-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.utils);
local v3 = nil;
local function v13() --[[ Line: 9 ]] --[[ Name: detect ]]
    -- upvalues: v3 (ref), l_Parent_0 (copy), l_LocalPlayer_0 (copy)
    if v3 then
        v3:Disconnect();
        v3 = nil;
    end;
    local v4 = {};
    local function v9(v5) --[[ Line: 17 ]] --[[ Name: get ]]
        -- upvalues: v4 (copy), l_Parent_0 (ref), l_LocalPlayer_0 (ref)
        local _ = v5:GetAttribute("UID");
        local l_v5_Attribute_1 = v5:GetAttribute("folderID");
        if table.find(v4, v5) then
            return;
        else
            table.insert(v4, v5);
            if not l_v5_Attribute_1 then
                return;
            else
                local v8 = l_Parent_0.Tools[l_v5_Attribute_1];
                if not v8 then
                    return;
                else
                    require(v8.controller).client:assignTool(l_LocalPlayer_0, v5);
                    return;
                end;
            end;
        end;
    end;
    for _, v11 in pairs(l_LocalPlayer_0:WaitForChild("Backpack"):GetChildren()) do
        v9(v11);
    end;
    v3 = l_LocalPlayer_0.Backpack.ChildAdded:Connect(function(v12) --[[ Line: 35 ]]
        -- upvalues: v9 (copy)
        v9(v12);
    end);
end;
if l_LocalPlayer_0.Character then
    v13();
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(_) --[[ Line: 44 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (copy)
    if not l_LocalPlayer_0:HasAppearanceLoaded() then
        l_LocalPlayer_0.CharacterAppearanceLoaded:Wait();
    end;
    v13();
end);
v2.scr:WaitForChild("replicate").OnClientEvent:Connect(v2.client.replicateToClient);