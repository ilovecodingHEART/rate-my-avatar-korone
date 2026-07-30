-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local l_Parent_0 = script.Parent;
local _ = l_Parent_0:WaitForChild("Shoot");
local l_GunEnd_0 = l_Parent_0:WaitForChild("Handle"):WaitForChild("GunEnd");
local l_Mouse_0 = game.Players.LocalPlayer:GetMouse();
local function giveIgnore()
    local v4 = {
        l_Parent_0.Parent, 
        l_Parent_0
    };
    for _, v6 in pairs(game.Players:GetPlayers()) do
        if v6.Character then
            for _, v8 in v6.Character:GetDescendants() do
                if v8:IsA("Accessory") then
                    table.insert(v4, v8);
                end;
            end;
        end;
    end;
    return v4;
end;
local function shootRay(v10)
    local v11 = RaycastParams.new();
	v11.FilterDescendantsInstances = giveIgnore();
    v11.FilterType = Enum.RaycastFilterType.Blacklist;
    return workspace:Raycast(l_GunEnd_0.WorldPosition, (l_GunEnd_0.WorldPosition - v10) * -50, v11);
end;
script.Parent.Activated:Connect(function()
    if game:GetService("VRService").VREnabled then
        local v13 = l_GunEnd_0.WorldPosition + l_GunEnd_0.WorldCFrame.LookVector;
        local v14 = RaycastParams.new();
		v14.FilterDescendantsInstances = giveIgnore();
        v14.FilterType = Enum.RaycastFilterType.Blacklist;
        local v15 = workspace:Raycast(l_GunEnd_0.WorldPosition, (l_GunEnd_0.WorldPosition - v13) * -50, v14);
        script.Parent.Shoot:FireServer(v15.Instance, v15.Position);
        return;
    else
        local l_p_0 = l_Mouse_0.Hit.Position;
        local v17 = RaycastParams.new();
		v17.FilterDescendantsInstances = giveIgnore();
        v17.FilterType = Enum.RaycastFilterType.Blacklist;
        local v18 = workspace:Raycast(l_GunEnd_0.WorldPosition, (l_GunEnd_0.WorldPosition - l_p_0) * -50, v17);
        script.Parent.Shoot:FireServer(v18.Instance, v18.Position);
        return;
    end;
end);