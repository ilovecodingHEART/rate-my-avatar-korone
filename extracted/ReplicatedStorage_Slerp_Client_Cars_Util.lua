-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Car_0 = game:GetService("ReplicatedStorage").Slerp.Shared.Car;
local l_RemoteEvents_0 = require(l_Car_0.Net).RemoteEvents;
local _ = require(script.Parent.Types);
local v3 = {};
local function _(v4, v5) --[[ Line: 5 ]] --[[ Name: _ ]]
    v4.Enabled = v5;
end;
local function v11(v7, v8) --[[ Line: 8 ]] --[[ Name: v11 ]]
    for _, v10 in v7 do
        if v10:IsA("SurfaceLight") or v10:IsA("Beam") then
            v10.Enabled = v8;
        end;
    end;
end;
local function _(v12, v13) --[[ Line: 15 ]] --[[ Name: _ ]]
    -- upvalues: v11 (copy)
    if v13 then
        v12.Material = Enum.Material.Neon;
    else
        v12.Material = Enum.Material.SmoothPlastic;
    end;
    v11(v12:GetChildren(), v13);
end;
v3.setOwnedCarLightsAreEnabled = function(v15) --[[ Line: 24 ]]
    -- upvalues: l_RemoteEvents_0 (copy)
    l_RemoteEvents_0.SetLightsAreEnabled:FireServer(v15);
end;
v3.setLightsAreEnabled = function(v16, v17) --[[ Line: 28 ]]
    -- upvalues: v11 (copy)
    local l_sharedRecord_0 = v16.sharedRecord;
    local l_frontLightParts_0 = l_sharedRecord_0.frontLightParts;
    local l_tailLightParts_0 = l_sharedRecord_0.tailLightParts;
    v16.sharedRecord.lightsAreEnabled = v17;
    for _, v22 in l_frontLightParts_0 do
        if v17 then
            v22.Material = Enum.Material.Neon;
        else
            v22.Material = Enum.Material.SmoothPlastic;
        end;
        v11(v22:GetChildren(), v17);
    end;
    for _, v24 in l_tailLightParts_0 do
        if v17 then
            v24.Material = Enum.Material.Neon;
        else
            v24.Material = Enum.Material.SmoothPlastic;
        end;
        v11(v24:GetChildren(), v17);
    end;
end;
return v3;