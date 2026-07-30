-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = {
    {
        Name = "UpdateTime", 
        Type = "number"
    }, 
    {
        Name = "CurrentWalkspeed", 
        Type = "number"
    }, 
    {
        Name = "HeadCFrame", 
        Type = "CFrame"
    }, 
    {
        Name = "LeftHandCFrame", 
        Type = "CFrame"
    }, 
    {
        Name = "RightHandCFrame", 
        Type = "CFrame"
    }, 
    {
        Name = "LeftFootCFrame", 
        Type = "CFrame"
    }, 
    {
        Name = "RightFootCFrame", 
        Type = "CFrame"
    }
};
local v1 = {
    number = 8, 
    CFrame = 28
};
local v28 = {
    Serialize = function(v2) --[[ Line: 62 ]] --[[ Name: Serialize ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v3 = {};
        local v4 = 1;
        for v5, v6 in v0 do
            local v7 = v2[v6.Name];
            if v7 and typeof(v7) == v6.Type then
                local v8 = v1[v6.Type];
                v4 = v4 + (1 + v1[v6.Type]);
                table.insert(v3, {
                    Index = v5, 
                    Length = v8, 
                    Data = v7
                });
            end;
        end;
        local v9 = buffer.create(v4);
        local v10 = 1;
        buffer.writei8(v9, 0, #v3);
        for _, v12 in v3 do
            buffer.writei8(v9, v10, v12.Index);
            v10 = v10 + 1;
            local l_Data_0 = v12.Data;
            local v14 = typeof(l_Data_0);
            if v14 == "number" then
                buffer.writef64(v9, v10, l_Data_0);
            elseif v14 == "CFrame" then
                local l_Position_0 = l_Data_0.Position;
                local v16, v17 = l_Data_0:ToAxisAngle();
                buffer.writef32(v9, v10, l_Position_0.X);
                buffer.writef32(v9, v10 + 4, l_Position_0.Y);
                buffer.writef32(v9, v10 + 8, l_Position_0.Z);
                buffer.writef32(v9, v10 + 12, v16.X);
                buffer.writef32(v9, v10 + 16, v16.Y);
                buffer.writef32(v9, v10 + 20, v16.Z);
                buffer.writef32(v9, v10 + 24, v17);
            end;
            v10 = v10 + v12.Length;
        end;
        return v9;
    end, 
    DeserializeSection = function(v18, v19) --[[ Line: 111 ]] --[[ Name: DeserializeSection ]]
        -- upvalues: v0 (copy)
        local v20 = {};
        local l_v19_0 = v19;
        local v22 = buffer.readi8(v18, v19);
        v19 = v19 + 1;
        for _ = 1, v22 do
            local v24 = v0[buffer.readi8(v18, v19)];
            v19 = v19 + 1;
            if v24.Type == "number" then
                v20[v24.Name] = buffer.readf64(v18, v19);
                v19 = v19 + 8;
            elseif v24.Type == "CFrame" then
                local v25 = CFrame.new(buffer.readf32(v18, v19), buffer.readf32(v18, v19 + 4), (buffer.readf32(v18, v19 + 8)));
                local v26 = Vector3.new(buffer.readf32(v18, v19 + 12), buffer.readf32(v18, v19 + 16), (buffer.readf32(v18, v19 + 20)));
                local v27 = buffer.readf32(v18, v19 + 24);
                v20[v24.Name] = v25 * CFrame.fromAxisAngle(v26, v27);
                v19 = v19 + 28;
            end;
        end;
        return v20, v19 - l_v19_0;
    end
};
v28.Deserialize = function(v29) --[[ Line: 135 ]] --[[ Name: Deserialize ]]
    -- upvalues: v28 (copy)
    local v30 = buffer.len(v29);
    local v31 = 0;
    local v32 = {};
    while v31 < v30 do
        local v33 = buffer.readf64(v29, v31);
        v31 = v31 + 8;
        local v34, v35 = v28.DeserializeSection(v29, v31);
        v32[v33] = v34;
        v31 = v31 + v35;
    end;
    return v32;
end;
return v28;