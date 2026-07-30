-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_Players_0 = game:GetService("Players");
local v15 = {
    getCharacterTeleportPoint = function(v1, v2) --[[ Line: 10 ]] --[[ Name: getCharacterTeleportPoint ]]
        local v3 = v1 and v1:FindFirstChild("HumanoidRootPart");
        local v4 = v1 and v1:FindFirstChild("Humanoid");
        if not v3 or not v4 then
            return;
        else
            local v5 = {
                v1
            };
            for _, v7 in ipairs(l_Players_0:GetChildren()) do
                table.insert(v5, v7.Character);
            end;
            local v8 = RaycastParams.new();
            v8.FilterType = Enum.RaycastFilterType.Blacklist;
            v8.FilterDescendantsInstances = v5;
            for v9 = 1, 10 do
                local v10 = v3.CFrame * CFrame.Angles(0, 6.283185307179586 * (v9 / 10), 0);
                if not workspace:Raycast(v3.Position, v10.LookVector * 5, v8) then
                    local v11 = v10 + v10.LookVector * v2;
                    local v12 = workspace:Raycast(v11.Position, Vector3.new(0, -100, 0, 0), v8);
                    local v13 = v12 and v12.Position;
                    if v13 then
                        local v14 = Vector3.new(v3.CFrame.X, v13.Y, v3.CFrame.Z);
                        return CFrame.lookAt(v13, v14);
                    end;
                end;
            end;
            return;
        end;
    end
};
v15.teleport = function(v16, v17, v18) --[[ Line: 47 ]] --[[ Name: teleport ]]
    v18 = v18 or 5;
    local v19 = v15.getCharacterTeleportPoint(v17.Character, v18);
    if not v19 or not v15.validate(v16, v17, v19) then
        return false;
    else
        local v20 = v16.Character and v16.Character:FindFirstChild("HumanoidRootPart");
        local v21 = v16.Character and v16.Character:FindFirstChild("Humanoid");
        if not v20 or not v21 then
            return false;
        else
            if v21.Sit then
                v21.Sit = false;
                v21.Seated:Wait();
            end;
            local v22 = v21.HipHeight + v20.Size.Y / 2;
            if v21.RigType == Enum.HumanoidRigType.R6 then
                local v23 = v21.Parent:FindFirstChild("Left Leg") or v21.Parent:FindFirstChild("Right Leg");
                if v23 then
                    v22 = v22 + v23.Size.Y;
                end;
            end;
            v20.CFrame = v19 + Vector3.new(0, v22, 0);
            return true;
        end;
    end;
end;
v15.validate = function(_, _, _) --[[ Line: 80 ]] --[[ Name: validate ]]
    return true;
end;
v15.setTeleportationValidator = function(v27) --[[ Line: 88 ]] --[[ Name: setTeleportationValidator ]]
    assert(typeof(v27) == "function", "setTeleportationValidator expects a function as its first argument");
    v15.validate = v27;
end;
return v15;