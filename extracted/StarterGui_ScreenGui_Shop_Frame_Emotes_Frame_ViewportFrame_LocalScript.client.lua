local Camera = Instance.new("Camera", script.Parent);
local Rig = game.ReplicatedStorage:WaitForChild("Rig"):Clone();
local WorldModel = Instance.new("WorldModel");
script.Parent.CurrentCamera = Camera;
Rig.Parent = workspace;
WorldModel.Parent = script.Parent;
Rig.Parent = WorldModel;
local hrp2 = Rig.HumanoidRootPart
Camera.CFrame = CFrame.new(hrp2.Position + hrp2.CFrame.LookVector * 5.2, hrp2.Position)
local AnimationIds = {116268800171812, 140281014912996, 87345123254228, 112649650368637, game.Players.LocalPlayer.UserId};
local RandomPlayers = {game.Players.LocalPlayer.UserId, }
local Animation = Instance.new('Animation', Rig);
Animation.AnimationId = AnimationIds[math.random(1, #AnimationIds)];
Rig.Humanoid:LoadAnimation(Animation):Play();