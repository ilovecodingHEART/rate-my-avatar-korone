local v0 = {
    [1] = Color3.fromRGB(131, 126, 185), 
    [2] = Color3.fromRGB(183, 114, 86), 
    [3] = Color3.fromRGB(83, 177, 175)
};
while wait(math.random(2, 3)) do
    task.spawn(function()
        script.Parent:FindFirstChild("Lights" .. math.random(1, 3)).Color = v0[math.random(1, 3)];
    end);
end;