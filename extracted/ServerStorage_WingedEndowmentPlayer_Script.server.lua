local v11 = script.Parent
local u4 = Vector3.new(0, 0.583, 0);
v11.PrimaryPart = v11.FloorLevel;
v11:SetPrimaryPartCFrame(CFrame.new(u4.X, u4.Y, u4.Z));
v11:SetPrimaryPartCFrame(v11.FloorLevel.CFrame:ToWorldSpace(CFrame.Angles(0, math.rad(math.random(-180, 180)), 0)));
v11:SetPrimaryPartCFrame(v11.FloorLevel.CFrame:ToWorldSpace(CFrame.new(0,0,0)));
v11.PrimaryPart = v11.HumanoidRootPart;