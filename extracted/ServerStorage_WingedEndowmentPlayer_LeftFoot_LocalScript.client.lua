while wait(.1) do
	if script.Parent:FindFirstChild("ImageLabel") then
		for i,v in ipairs(script.Parent:FindFirstChild("ImageLabel"):GetChildren()) do
			local Particles = game.ReplicatedStorage.Particle:Clone()
			Particles.Texture1.Texture = v.Image
			Particles.Parent = game.Workspace
		end
	end
end