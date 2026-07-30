script.Parent:WaitForChild("CenterPole2");
local l_CFrame_0 = script.Parent.CenterPole2.CFrame;
local v1 = {};
local v2 = 0;
local v3 = 1e999;
for v4, v5 in script.Parent.Horses:GetChildren() do
    local l_v5_Pivot_0 = v5:GetPivot();
    local l_Y_0 = l_v5_Pivot_0.Y;
    if v2 < l_Y_0 then
        v2 = l_Y_0;
    end;
    if l_Y_0 < v3 then
        v3 = l_Y_0;
    end;
    v1[v4] = {
        model = v5, 
        offset = l_CFrame_0:ToObjectSpace(l_v5_Pivot_0), 
        height = l_Y_0
    };
end;
print(v2 - v3);
local v8 = {};
for v9, v10 in script.Parent.Poles:GetChildren() do
    v8[v9] = {
        part = v10, 
        offset = l_CFrame_0:ToObjectSpace(v10.CFrame)
    };
end;
local _ = game:GetService("RunService");
local v12 = 0;
while true do
    v12 = v12 + task.wait();
    local v13 = l_CFrame_0 * CFrame.Angles(0, math.rad(v12 * 45), 0);
    for _, v15 in v1 do
        local v16 = (v15.height - v3) / (v2 - v3);
        local v17 = math.sin(os.clock() + v16 * 3.141592653589793) / 2;
        v15.model:PivotTo(v13 * v15.offset + Vector3.new(0, v17, 0));
    end;
    for _, v19 in v8 do
        v19.part.CFrame = v13 * v19.offset;
    end;
end;