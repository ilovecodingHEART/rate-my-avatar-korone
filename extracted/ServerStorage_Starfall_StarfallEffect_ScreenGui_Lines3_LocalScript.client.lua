-- Decompiled with the Synapse X Luau decompiler.

game["Run Service"].RenderStepped:Connect(function()
	script.Parent.Position = UDim2.fromScale(0 + math.random(-20, 20) / 100, 0.5 + math.random(-100, 100) / 100);
end);
