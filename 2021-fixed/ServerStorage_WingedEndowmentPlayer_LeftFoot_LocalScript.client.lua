-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
while wait(.1) do
	if script.Parent:FindFirstChild("ImageLabel") then
		for i,v in ipairs(script.Parent:FindFirstChild("ImageLabel"):GetChildren()) do
			local Particles = game.ReplicatedStorage.Particle:Clone()
			Particles.Texture1.Texture = v.Image
			Particles.Parent = game.Workspace
		end
	end
end