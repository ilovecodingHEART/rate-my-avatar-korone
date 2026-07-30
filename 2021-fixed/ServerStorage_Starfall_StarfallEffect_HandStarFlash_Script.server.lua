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
local handstarflash = script.Parent
game.TweenService:Create(handstarflash.Star1,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(50.414, 101.96, 5.189)}):Play()
game.TweenService:Create(handstarflash.Star2,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(50.414, 101.96, 5.189)}):Play()
game.TweenService:Create(handstarflash.StarShard1,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(41.993, 94.898, 3.819)}):Play()
game.TweenService:Create(handstarflash.StarShard2,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(41.993, 94.898, 3.819)}):Play()
game.TweenService:Create(handstarflash.Ring,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(81.193, 6.856, 81.193)}):Play()
game.TweenService:Create(handstarflash.RingShard,TweenInfo.new(0.175,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Size = Vector3.new(67.209, 4.734, 67.209)}):Play()
game.TweenService:Create(handstarflash.Star1,TweenInfo.new(.5,Enum.EasingStyle.Quad),{CFrame = handstarflash.CFrames.Star1.CFrame}):Play()
game.TweenService:Create(handstarflash.Star2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{CFrame = handstarflash.CFrames.Star2.CFrame}):Play()
game.TweenService:Create(handstarflash.StarShard1,TweenInfo.new(.5,Enum.EasingStyle.Quad),{CFrame = handstarflash.CFrames.StarShard1.CFrame}):Play()
game.TweenService:Create(handstarflash.StarShard2,TweenInfo.new(.5,Enum.EasingStyle.Quad),{CFrame = handstarflash.CFrames.StarShard2.CFrame}):Play()
game.TweenService:Create(handstarflash.RingShard,TweenInfo.new(0.05,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Transparency = 0}):Play()
wait(0.175)
game.TweenService:Create(handstarflash.Star1,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.125),{Size = Vector3.new(0, 101.711, 0)}):Play()
game.TweenService:Create(handstarflash.Star2,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,.125),{Size = Vector3.new(0, 101.711, 0)}):Play()
game.TweenService:Create(handstarflash.RingShard,TweenInfo.new(0.175,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{Transparency = 1}):Play()
game.TweenService:Create(handstarflash.StarShard1,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(9.538, 58.887, 3.978)}):Play()
game.TweenService:Create(handstarflash.StarShard2,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(9.538, 58.887, 3.978)}):Play()
game.TweenService:Create(handstarflash.Ring,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0.125),{Transparency = 1}):Play()
wait(.125)
game.TweenService:Create(handstarflash.StarShard1,TweenInfo.new(0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 0, 0)}):Play()
game.TweenService:Create(handstarflash.StarShard2,TweenInfo.new(0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{Size = Vector3.new(0, 0, 0)}):Play()
