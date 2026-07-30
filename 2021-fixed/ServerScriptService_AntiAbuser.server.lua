-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
workspace.ChildAdded:Connect(function(arg1)
	if arg1.Name == ("RiseBeams") then
		task.wait(5);
		arg1:Destroy();
	end;
end);
workspace.ChildAdded:Connect(function(arg1)
	if arg1.Name == ("EndowmentWingsSounds") then
		task.wait(15);
		arg1:Destroy();
	end;
end);