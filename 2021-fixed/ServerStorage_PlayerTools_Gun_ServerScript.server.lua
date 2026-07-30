-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
script.Parent.Shoot.OnServerEvent:Connect(function(Player, Hit, Position)
	if Hit and Hit.Parent then
		local character = Hit.Parent
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and character ~= Player.Character then
			humanoid:TakeDamage(20)
		end;
	end;
	local beam = script.Parent.Beam:Clone()
	local attachment1 = script.Parent.Handle:FindFirstChild("BeamEnd")
	beam.Parent = workspace;
	attachment1.WorldPosition = Position
	script.Parent.Handle.Fire:Play()
	beam.Enabled = true
	task.wait(0.1)
	beam.Enabled = false
end);
script.Parent.Equipped:Connect(function()
	script.Parent.Equip:Play();
end);