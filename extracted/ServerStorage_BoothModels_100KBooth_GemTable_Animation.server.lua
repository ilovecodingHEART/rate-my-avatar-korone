local l_Parent_0 = script.Parent;
game:GetService("TweenService"):Create(l_Parent_0, TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    CFrame = CFrame.new(l_Parent_0.Position) * l_Parent_0.CFrame.Rotation * CFrame.new(0, 1, 0)
}):Play();