-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script.Parent;
local l_Events_0 = require(l_Parent_0:WaitForChild("Events"));
local l_InitClient_0 = l_Parent_0:WaitForChild("InitClient");
local l_PlayClient_0 = l_InitClient_0:WaitForChild("PlayClient");
local v5 = {};
local function v11(v6) --[[ Line: 11 ]] --[[ Name: Init ]]
    -- upvalues: l_Events_0 (copy), v5 (copy), l_ContentProvider_0 (copy)
    local v7 = l_Events_0[v6];
    if not v7 then
        warn("EVENT NOT FOUND CRITICAL ERROR");
        return;
    elseif table.find(v5, v6) then
        warn("Event already fetched");
        return;
    else
        table.insert(v5, v6);
        if v7.InitClient then
            require(v7.InitClient).Init();
        end;
        local v8 = tick();
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: l_ContentProvider_0 (ref), v7 (copy)
            l_ContentProvider_0:PreloadAsync(v7.Preloads);
        end);
        if l_status_0 then
            warn(v6 .. " assets loaded in " .. tick() - v8 .. " seconds");
            return;
        else
            warn(l_result_0);
            warn("Couldnt load assets successfully");
            return;
        end;
    end;
end;
l_InitClient_0.OnClientEvent:Connect(function(v12) --[[ Line: 36 ]]
    -- upvalues: v11 (copy)
    v11(v12);
end);
l_PlayClient_0.OnClientEvent:Connect(function(v13, v14) --[[ Line: 40 ]]
    if not v13.PlayClient then
        warn("EVENT NOT FOUND CRITICAL ERROR");
        return;
    else
        require(v13.PlayClient):PlayEffect(v13, v14);
        return;
    end;
end);
require(l_Parent_0).LoadUtils();
l_InitClient_0:FireServer();