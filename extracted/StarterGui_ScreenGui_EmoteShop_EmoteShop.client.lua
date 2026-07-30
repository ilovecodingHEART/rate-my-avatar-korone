local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local emoteList = script.Parent.Frame.Emotes1
local emoteList2 = script.Parent.Frame.Emotes2
local Remotes = require(game.ReplicatedStorage:WaitForChild("Remotes"))
local RandomIds = {0,  game.Players.LocalPlayer.UserId};
local Emotes = {
	[1] = {
		['songname'] = "tokyo";
		['intro'] = "rbxassetid://104647505794470",
		['loopmusic'] = "rbxassetid://95243438313799",
		['introanimationid'] = "rbxassetid://92613246831212",
		['loopanimationid'] = "rbxassetid://116268800171812",
	},
	[2] = {
		['songname'] = "orange";
		['intro'] = false,
		['loopmusic'] = "rbxassetid://85579565752155",
		['introanimationid'] = false,
		['loopanimationid'] = "rbxassetid://112649650368637",
	},
}
local Emotes2 = {
	[1] = {
		['songname'] = "eagle";
		['intro'] = false,
		['loopmusic'] = "rbxassetid://79244289954615",
		['introanimationid'] = false,
		['loopanimationid'] = "rbxassetid://140281014912996",
	},
	[2] = {
		['songname'] = "doop";
		['intro'] = "rbxassetid://95181836781085",
		['loopmusic'] = "rbxassetid://92196083573981",
		['introanimationid'] = "rbxassetid://135213373595163",
		['loopanimationid'] = "rbxassetid://87345123254228",
	},
}
function PlayAnimation(character, id)
	local Animation = Instance.new("Animation", character);
	Animation.AnimationId = id;
	return character.Humanoid:LoadAnimation(Animation):Play()
end;
local SoundPlaying = nil;
function TweenVolume(sound, targetVolume, duration)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(SoundPlaying, tweenInfo, {Volume = targetVolume})
	tween:Play()
	SoundPlaying = nil
end
function PlaySong(soundId)
	local sound = Instance.new("Sound");
	sound.SoundId = soundId;
	sound.Volume = 0;
	sound.Looped = true;
	sound.Parent = localPlayer;
	sound:Play();
	SoundPlaying = sound
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(SoundPlaying, tweenInfo, {Volume = 3})
	tween:Play()
	return sound;
end;
function StopSong(sound)
	if sound then
		TweenVolume(sound, 0, 0.5);
	end;
end;
local function u5(p3, p4)
	local v8 = game.Players:GetHumanoidDescriptionFromUserId(p3);
	v8.DepthScale = v8.DepthScale
	v8.HeadScale = v8.HeadScale
	v8.HeightScale = v8.HeightScale
	v8.WidthScale = v8.WidthScale
	p4.Humanoid:ApplyDescription(v8);
end;
for _, emoteFrame in pairs(emoteList:GetChildren()) do
	if emoteFrame:IsA("Frame") then
		local Emote = Emotes[emoteFrame.LayoutOrder];
		local Camera = Instance.new("Camera", emoteFrame.ViewportFrame);
		emoteFrame.ViewportFrame.CurrentCamera = Camera;
		local wModel2 = Instance.new("WorldModel")
		local char2 = game.ReplicatedStorage.Rig:Clone()
		char2.Parent = workspace
		PlayAnimation(char2, Emote.loopanimationid);
		wModel2.Parent = emoteFrame.ViewportFrame
		char2.Parent = wModel2
		u5(RandomIds[math.random(1, #RandomIds)], char2);
		local hrp2 = char2.HumanoidRootPart
		Camera.CFrame = CFrame.new(hrp2.Position + hrp2.CFrame.LookVector * 5.2, hrp2.Position)
		emoteFrame.MouseEnter:Connect(function()
			PlaySong(Emote.loopmusic);
		end);
		emoteFrame.MouseLeave:Connect(function()
			StopSong(Emote.loopmusic);
		end);
	end;
end;
for _, emoteFrame in pairs(emoteList2:GetChildren()) do
	if emoteFrame:IsA("Frame") then
		local Emote = Emotes2[emoteFrame.LayoutOrder];
		local Camera = Instance.new("Camera", emoteFrame.ViewportFrame);
		emoteFrame.ViewportFrame.CurrentCamera = Camera;
		local wModel2 = Instance.new("WorldModel")
		local char2 = game.ReplicatedStorage.Rig:Clone()
		char2.Parent = workspace
		PlayAnimation(char2, Emote.loopanimationid);
		wModel2.Parent = emoteFrame.ViewportFrame
		char2.Parent = wModel2
		u5(RandomIds[math.random(1, #RandomIds)], char2);
		local hrp2 = char2.HumanoidRootPart
		Camera.CFrame = CFrame.new(hrp2.Position + hrp2.CFrame.LookVector * 5.2, hrp2.Position)
		emoteFrame.MouseEnter:Connect(function()
			PlaySong(Emote.loopmusic);
		end);
		emoteFrame.MouseLeave:Connect(function()
			StopSong(Emote.loopmusic);
		end);
		emoteFrame.BuyGiftbux.Activated:Connect(function()
			Remotes.Function("PurchaseEmote"):InvokeServer(Emote.songname);
		end);
	end;
end;
