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