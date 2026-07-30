-- cool

local l_Parent_0 = script.Parent;
local v1 = 0;
local v2 = 0;
local v3 = {
    "rbxassetid://14620869622", 
    "rbxassetid://14620869447"
};
local v4 = 0;
local v5 = 1;
local v6 = 0;
for _, v8 in ipairs(v3) do
    local v9 = script.ImageLabel:Clone();
    v9.Parent = script.Parent.Parent;
    v9.Image = v8;
    while true do
        task.wait();
        if v9.IsLoaded then
            break;
        end;
    end;
    v9:Destroy();
end;
local function _()
    if v4 >= 60 then
        return ;
    else
        v4 = v4 + 1;
        if v6 == 36 then
            v5 = v5 % #v3 + 1;
            l_Parent_0.Image = v3[v5];
            v6 = 0;
        end;
        v6 = v6 + 1;
        l_Parent_0.ImageRectOffset = Vector2.new(v1 * 170, v2 * 170);
        v1 = (v1 + 1) % 6;
        if v1 == 0 then
            v2 = (v2 + 1) % 6;
        end;
        return ;
    end;
end;
game:GetService("RunService").RenderStepped:Connect(function()
    if v4 >= 60 then
        v1 = 0;
        v2 = 0;
        v4 = 0;
        v6 = 0;
        v5 = 1;
        l_Parent_0.Image = v3[v5];
    end;
    if v4 >= 60 then
        return ;
    else
        v4 = v4 + 1;
        if v6 == 36 then
            v5 = v5 % #v3 + 1;
            l_Parent_0.Image = v3[v5];
            v6 = 0;
        end;
        v6 = v6 + 1;
        l_Parent_0.ImageRectOffset = Vector2.new(v1 * 170, v2 * 170);
        v1 = (v1 + 1) % 6;
        if v1 == 0 then
            v2 = (v2 + 1) % 6;
        end;
        return ;
    end;
end);