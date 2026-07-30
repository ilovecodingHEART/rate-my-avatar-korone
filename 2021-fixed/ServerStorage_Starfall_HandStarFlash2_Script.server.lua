-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
for _,v in ipairs(script.Parent:GetChildren()) do
	if v:IsA("MeshPart") then
		v.Size = Vector3.new(0,0,0)
	end
end
game.TweenService:Create(script.Parent.Star1,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(49.88, 101.711, 4.964)}):Play()
game.TweenService:Create(script.Parent.Star2,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(49.88, 101.711, 4.964)}):Play()
game.TweenService:Create(script.Parent.StarShard1,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(35.938, 80.187, 3.978)}):Play()
game.TweenService:Create(script.Parent.StarShard2,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(35.938, 80.187, 3.978)}):Play()
game.TweenService:Create(script.Parent.Ring,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(81.193, 6.856, 81.193)}):Play()
game.TweenService:Create(script.Parent.RingShard,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(62.974, 4.436, 62.974)}):Play()
game.TweenService:Create(script.Parent.Star1,TweenInfo.new(1,Enum.EasingStyle.Quad),{CFrame = script.Parent.CFrames.Star1.CFrame}):Play()
game.TweenService:Create(script.Parent.Star2,TweenInfo.new(1,Enum.EasingStyle.Quad),{CFrame = script.Parent.CFrames.Star2.CFrame}):Play()
game.TweenService:Create(script.Parent.StarShard1,TweenInfo.new(1,Enum.EasingStyle.Quad),{CFrame = script.Parent.CFrames.StarShard1.CFrame}):Play()
game.TweenService:Create(script.Parent.StarShard2,TweenInfo.new(1,Enum.EasingStyle.Quad),{CFrame = script.Parent.CFrames.StarShard2.CFrame}):Play()
game.TweenService:Create(script.Parent.RingShard,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Transparency = 0}):Play()
wait(0.35)
game.TweenService:Create(script.Parent.Star1,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.25),{Size = Vector3.new(0, 101.711, 0)}):Play()
game.TweenService:Create(script.Parent.Star2,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.25),{Size = Vector3.new(0, 101.711, 0)}):Play()
game.TweenService:Create(script.Parent.RingShard,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Transparency = 1}):Play()
game.TweenService:Create(script.Parent.StarShard1,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(9.538, 58.887, 3.978)}):Play()
game.TweenService:Create(script.Parent.StarShard2,TweenInfo.new(0.3,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(9.538, 58.887, 3.978)}):Play()
game.TweenService:Create(script.Parent.Ring,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0.25),{Transparency = 1}):Play()
wait(.25)
game.TweenService:Create(script.Parent.StarShard1,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 0, 0)}):Play()
game.TweenService:Create(script.Parent.StarShard2,TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 0, 0)}):Play()