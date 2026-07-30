-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v12 = {
    RaycastToFront = function(v0, v1, v2) --[[ Line: 10 ]] --[[ Name: RaycastToFront ]]
        local v3 = (v2 * CFrame.new(0, 0, -v1.Z / 2)):Inverse() * v0;
        local l_LookVector_0 = v3.LookVector;
        local v5 = math.atan2((l_LookVector_0.X ^ 2 + l_LookVector_0.Y ^ 2) ^ 0.5, l_LookVector_0.Z);
        local v6 = v3.Z / math.cos(v5);
        local l_Position_0 = (v3 * CFrame.new(0, 0, v6)).Position;
        return 1 - (0.5 + l_Position_0.X / v1.X), 1 - (0.5 + l_Position_0.Y / v1.Y), -v3.Z * (1 / l_LookVector_0.Z);
    end, 
    ProjectToFront = function(v8, v9, v10) --[[ Line: 32 ]] --[[ Name: ProjectToFront ]]
        local v11 = (v10 * CFrame.new(0, 0, -v9.Z / 2)):Inverse() * CFrame.new(v8);
        return 1 - (0.5 + v11.X / v9.X), 1 - (0.5 + v11.Y / v9.Y), -v11.Z;
    end
};
v12.Raycast = function(v13, v14, v15) --[[ Line: 50 ]] --[[ Name: Raycast ]]
    -- upvalues: v12 (copy)
    local l_Size_0 = v13.Size;
    if v15 == Enum.NormalId.Front or v15 == "Front" then
        return v12.RaycastToFront(v14, l_Size_0, v13.CFrame);
    elseif v15 == Enum.NormalId.Back or v15 == "Back" then
        return v12.RaycastToFront(v14, l_Size_0, v13.CFrame * CFrame.Angles(0, 3.141592653589793, 0));
    elseif v15 == Enum.NormalId.Top or v15 == "Top" then
        local v17, v18, v19 = v12.RaycastToFront(v14, Vector3.new(l_Size_0.X, l_Size_0.Z, l_Size_0.Y), v13.CFrame * CFrame.Angles(1.5707963267948966, 0, 0));
        return 1 - v17, v18, v19;
    elseif v15 == Enum.NormalId.Bottom or v15 == "Bottom" then
        local v20, v21, v22 = v12.RaycastToFront(v14, Vector3.new(l_Size_0.X, l_Size_0.Z, l_Size_0.Y), v13.CFrame * CFrame.Angles(-1.5707963267948966, 0, 0));
        return v20, 1 - v21, v22;
    elseif v15 == Enum.NormalId.Left or v15 == "Left" then
        return v12.RaycastToFront(v14, Vector3.new(l_Size_0.Z, l_Size_0.Y, l_Size_0.X), v13.CFrame * CFrame.Angles(0, 1.5707963267948966, 0));
    elseif v15 == Enum.NormalId.Right or v15 == "Right" then
        return v12.RaycastToFront(v14, Vector3.new(l_Size_0.Z, l_Size_0.Y, l_Size_0.X), v13.CFrame * CFrame.Angles(0, -1.5707963267948966, 0));
    else
        error("Unknown face type: " .. tostring(v15));
        return;
    end;
end;
v12.Project = function(v23, v24, v25) --[[ Line: 76 ]] --[[ Name: Project ]]
    -- upvalues: v12 (copy)
    local l_Size_1 = v23.Size;
    if v25 == Enum.NormalId.Front or v25 == "Front" then
        return v12.ProjectToFront(v24, l_Size_1, v23.CFrame);
    elseif v25 == Enum.NormalId.Back or v25 == "Back" then
        return v12.ProjectToFront(v24, l_Size_1, v23.CFrame * CFrame.Angles(0, 3.141592653589793, 0));
    elseif v25 == Enum.NormalId.Top or v25 == "Top" then
        local v27, v28, v29 = v12.ProjectToFront(v24, Vector3.new(l_Size_1.X, l_Size_1.Z, l_Size_1.Y), v23.CFrame * CFrame.Angles(1.5707963267948966, 0, 0));
        return 1 - v27, v28, v29;
    elseif v25 == Enum.NormalId.Bottom or v25 == "Bottom" then
        local v30, v31, v32 = v12.ProjectToFront(v24, Vector3.new(l_Size_1.X, l_Size_1.Z, l_Size_1.Y), v23.CFrame * CFrame.Angles(-1.5707963267948966, 0, 0));
        return v30, 1 - v31, v32;
    elseif v25 == Enum.NormalId.Left or v25 == "Left" then
        return v12.ProjectToFront(v24, Vector3.new(l_Size_1.Z, l_Size_1.Y, l_Size_1.X), v23.CFrame * CFrame.Angles(0, 1.5707963267948966, 0));
    elseif v25 == Enum.NormalId.Right or v25 == "Right" then
        return v12.ProjectToFront(v24, Vector3.new(l_Size_1.Z, l_Size_1.Y, l_Size_1.X), v23.CFrame * CFrame.Angles(0, -1.5707963267948966, 0));
    else
        error("Unknown face type: " .. tostring(v25));
        return;
    end;
end;
return v12;