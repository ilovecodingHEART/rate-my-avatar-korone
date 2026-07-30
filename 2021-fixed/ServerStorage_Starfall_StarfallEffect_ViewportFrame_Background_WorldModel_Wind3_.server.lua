-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
while wait(0.5) do
	script.Parent.Color = Color3.new(255/255,0/255,0/255)
	for i = 0,255,10 do
		wait()
		script.Parent.Color = Color3.new(255/255,i/255,0/255)
	end
	for i = 255,0,-10 do
		wait()
		script.Parent.Color = Color3.new(i/255,255/255,0/255)
	end
	for i = 0,255,10 do
		wait()
		script.Parent.Color = Color3.new(0/255,255/255,i/255)
	end
	for i = 255,0,-10 do
		wait()
		script.Parent.Color = Color3.new(0/255,i/255,255/255)
	end
	for i = 0,255,10 do
		wait()
		script.Parent.Color = Color3.new(i/255,0/255,255/255)
	end
	for i = 255,0,-10 do
		wait()
		script.Parent.Color = Color3.new(255/255,0/255,i/255)
	end
end
