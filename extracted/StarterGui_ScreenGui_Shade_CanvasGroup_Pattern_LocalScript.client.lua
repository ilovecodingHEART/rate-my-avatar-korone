-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v0 = game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(50, Enum.EasingStyle.Linear), {
    Position = UDim2.new(0, 0, -1)
});
while true do
    script.Parent.Position = UDim2.new(-1);
    v0:Play();
    v0.Completed:Wait();
end;