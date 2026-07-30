-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    X = 0, 
    Y = 0, 
    Z = 0, 
    W = 1
};
local l_TrackerRole_0 = require(script.Parent.Parent:WaitForChild("Data"):WaitForChild("TrackerRole"));
local l_StringDeserializer_0 = require(script.Parent:WaitForChild("StringDeserializer"));
local v3 = {};
local function _(v4) --[[ Line: 22 ]] --[[ Name: WarnOnce ]]
    -- upvalues: v3 (copy)
    if v3[v4] then
        return;
    else
        v3[v4] = true;
        warn(v4);
        return;
    end;
end;
return function(v6) --[[ Line: 30 ]]
    -- upvalues: l_StringDeserializer_0 (copy), v3 (copy), l_TrackerRole_0 (copy), v0 (copy)
    local v7 = l_StringDeserializer_0.new(v6);
    local v8 = v7:ReadNumber();
    local v9 = v7:ReadNumber();
    if v8 ~= 1 and v8 ~= 2 then
        local v10 = ("Enigma protocol version %* is unsupported and might not work as expected. Supported versions: 1, 2"):format(v8);
        if not v3[v10] then
            v3[v10] = true;
            warn(v10);
        end;
    end;
    local v11 = {};
    if v8 == 1 then
        for _ = 1, v9 do
            local v13 = l_TrackerRole_0[v7:ReadNumber() + 1] or "Unsupported";
            local v14 = v7:ReadVector3();
            local v15 = v7:ReadQuaternion();
            local v16 = v7:ReadVector3();
            table.insert(v11, {
                TrackerRole = v13, 
                FloorRelativeCFrame = CFrame.new(v14.X, v14.Y, v14.Z, v15.X, v15.Y, v15.Z, v15.W), 
                FloorRelativeVelocity = v16
            });
        end;
        return v11;
    else
        for _ = 1, v9 do
            local v18 = "Unsupported";
            local v19 = Vector3.new(0, 0, 0, 0);
            local l_v0_0 = v0;
            local v21 = Vector3.new(0, 0, 0, 0);
            for _ = 1, v7:ReadNumber() do
                local v23 = v7:ReadNumber();
                local v24 = v7:ReadNumber();
                if v23 == 0 then
                    v18 = l_TrackerRole_0[v7:ReadNumber() + 1] or "Unsupported";
                elseif v23 == 1 then
                    v19 = v7:ReadVector3();
                elseif v23 == 2 then
                    l_v0_0 = v7:ReadQuaternion();
                elseif v23 == 3 then
                    v21 = v7:ReadVector3();
                else
                    local v25 = {};
                    for _ = 1, v24 do
                        table.insert(v25, v7:ReadString());
                    end;
                    local v27 = ("Unsupported property id %* sent with %* values: %*"):format(v23, v24, (table.concat(v25, "|")));
                    if not v3[v27] then
                        v3[v27] = true;
                        warn(v27);
                    end;
                end;
            end;
            table.insert(v11, {
                TrackerRole = v18, 
                FloorRelativeCFrame = CFrame.new(v19.X, v19.Y, v19.Z, l_v0_0.X, l_v0_0.Y, l_v0_0.Z, l_v0_0.W), 
                FloorRelativeVelocity = v21
            });
        end;
        return v11;
    end;
end;