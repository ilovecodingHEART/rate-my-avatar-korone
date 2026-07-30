-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local TweenService = game:GetService('TweenService')
local CollectionService = game:GetService('CollectionService')
local Tweeninfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint)

local MainTween = TweenService:Create(script.Parent, Tweeninfo, {
	Position = Vector3.new(script.Parent.Position.X, math.random(40, 60), script.Parent.Position.Z)
})

wait(script.Parent:GetAttribute('WaitTime'))

CollectionService:AddTag(script.Parent, 'Firework')

MainTween:Play()

MainTween.Completed:Connect(function()

	script.Parent.BangSound:Play()
	script.Parent.EmitPoint.Flash:Emit(10)
	script.Parent.EmitPoint.Sparks:Emit(30)
	script.Parent.EmitPoint.Stars:Emit(30)

	wait(5)

	script.Parent:Destroy()

end)