local l_TweenService_0 = game:GetService("TweenService");
local v1 = TweenInfo.new(0.5);
script.Parent:WaitForChild("Door1"):WaitForChild("Weld");
script.Parent:WaitForChild("Door2"):WaitForChild("Weld");
local v2 = l_TweenService_0:Create(script.Parent.Door1, v1, {
    Size = Vector3.new(0.20000000298023224, 6.650000095367432, 0.5130000114440918, 0)
});
local v3 = l_TweenService_0:Create(script.Parent.Door2, v1, {
    Size = Vector3.new(0.20000000298023224, 6.650000095367432, 0.5170000195503235, 0)
});
local v4 = l_TweenService_0:Create(script.Parent.Door1.Weld, v1, {
    C0 = script.Parent.Door1.Weld.C0 - Vector3.new(1.0579999685287476, 0, 0, 0)
});
local v5 = l_TweenService_0:Create(script.Parent.Door2.Weld, v1, {
    C0 = script.Parent.Door2.Weld.C0 + Vector3.new(1.0579999685287476, 0, 0, 0)
});
local v6 = l_TweenService_0:Create(script.Parent.Door1, v1, {
    Size = Vector3.new(2.315999984741211, 6.650000095367432, 0.5130000114440918, 0)
});
local v7 = l_TweenService_0:Create(script.Parent.Door2, v1, {
    Size = Vector3.new(2.315999984741211, 6.650000095367432, 0.5170000195503235, 0)
});
local v8 = l_TweenService_0:Create(script.Parent.Door1.Weld, v1, {
    C0 = script.Parent.Door1.Weld.C0
});
local v9 = l_TweenService_0:Create(script.Parent.Door2.Weld, v1, {
    C0 = script.Parent.Door2.Weld.C0
});
local function v10() --[[ Line: 15 ]] --[[ Name: updateDoors ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    if script.Parent:GetAttribute("DoorsOpen") then
        v2:Play();
        v3:Play();
        v4:Play();
        v5:Play();
        return;
    else
        v6:Play();
        v7:Play();
        v8:Play();
        v9:Play();
        return;
    end;
end;
script.Parent:GetAttributeChangedSignal("DoorsOpen"):Connect(v10);
v10();