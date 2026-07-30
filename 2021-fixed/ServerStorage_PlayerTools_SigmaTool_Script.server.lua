-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
script.Parent.Equipped:Connect(function()
	script.Parent.Handle["Chinese Birthday D"].Playing = true;
end);
script.Parent.Unequipped:Connect(function()
	script.Parent.Handle["Chinese Birthday D"].Playing = false;
end);