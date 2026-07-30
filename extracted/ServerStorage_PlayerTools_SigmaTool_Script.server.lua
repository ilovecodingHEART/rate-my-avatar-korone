script.Parent.Equipped:Connect(function()
	script.Parent.Handle["Chinese Birthday D"].Playing = true;
end);
script.Parent.Unequipped:Connect(function()
	script.Parent.Handle["Chinese Birthday D"].Playing = false;
end);