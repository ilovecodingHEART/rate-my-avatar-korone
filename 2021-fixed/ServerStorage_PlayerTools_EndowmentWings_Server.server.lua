-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local _players = game:GetService("Players");
local _serverstorage = game:GetService("ServerStorage");
local _tweenservice = game:GetService("TweenService");
local _canagain = true;
local _wings = script.Parent.SEFolder.Value:Clone();
script.Parent.Activated:Connect(function()
	if _canagain then
		local _player = _players:GetPlayerFromCharacter(script.Parent.Parent);
		local _beams = _serverstorage.WingsAssets:WaitForChild("RiseBeams"):Clone();
		local _soundsfoler = _serverstorage.WingsAssets.EndowmentWingsSounds:Clone();
		_soundsfoler.Parent = workspace;
		local _sounds = {
			['starsound'] = _soundsfoler:WaitForChild("RiseBeamStart");
			['spawning'] = _soundsfoler:WaitForChild("RiseBeamOpen_2");
			['spawningcrack'] = _soundsfoler:WaitForChild("Appear_1");
			['charging'] = _soundsfoler:WaitForChild("ApperanceCharge");
			['finishing'] = _soundsfoler:WaitForChild("Appear_3");
			['loop'] = _soundsfoler:WaitForChild("RiseBeamLoop");
			['openbeam'] = _soundsfoler:WaitForChild("RiseBeamOpen_1");
			['finishsound'] = _soundsfoler:WaitForChild("Appear_2")
		};
		local _tool = script.Parent;
		local _handle = script.Parent.Handle;
		_handle.Transparency = 1;
		_sounds.starsound:Play();
		_player.Character.Humanoid.WalkSpeed = 0;
		local _explosions = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Explosions"):Clone();
		local _shockwave = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Shockwave"):Clone();
		--local _shockwave2 =_serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Shockwave1"):Clone();
		local _streaks = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Streaks"):Clone();
		local _glow = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Glow"):Clone();
		local _fireburst = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("FireBurst"):Clone();
		local _sparks = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("Sparks"):Clone();
		local _controller = _serverstorage.WingsAssets:WaitForChild("WingsController"):Clone();
		local _particle = _serverstorage.WingsAssets.EndowmentWingsVFX:WaitForChild("DashRing"):Clone();
		local _vfxpart = _serverstorage.WingsAssets:WaitForChild("FlyingVfx"):Clone();
		local _star = _serverstorage.WingsAssets.EndowmentWingsVFX.Start_Star:Clone();
		local _ring2 = _serverstorage.WingsAssets.EndowmentWingsVFX.Start_Ring:Clone();
		local _humanoidrootpart = _player.Character.HumanoidRootPart;
		local _endvfxattatchment = Instance.new("Attachment", _humanoidrootpart);
		_endvfxattatchment.Name = "TransformEndAtt";
		local _emitpoint = _wings.Halo:FindFirstChild("EmitPoint");
		local _attachment = Instance.new("Attachment", _humanoidrootpart);
		local _attachment1 = Instance.new("Attachment",  _player.Character.UpperTorso);
		_attachment.Name = "RootPartAtt";
		_star.Parent = _player.Character.HumanoidRootPart.RootAttachment;
		_star:Emit(1);
		_ring2.Parent = _player.Character.HumanoidRootPart.RootAttachment;
		_ring2:Emit(_ring2:GetAttribute("EmitCount"));
		_handle:Destroy();
		wait(1.05);
		local _highlight = game.ServerStorage.WingsAssets:FindFirstChild("Highlight"):Clone();
		local _highlight2 = game.ServerStorage.WingsAssets:FindFirstChild("Highlight"):Clone();
		local _alignattatchment = Instance.new("Attachment", _humanoidrootpart);
		_alignattatchment.Name = "FloatAttachment";
		local _alignposition = Instance.new("AlignPosition", _alignattatchment);
		_alignattatchment.Name = "Float";
		_alignposition.Mode = Enum.PositionAlignmentMode.OneAttachment
		_alignposition.Attachment0 = _player.Character.HumanoidRootPart.RootAttachment
		_alignposition.MaxForce = math.huge
		_alignposition.MaxVelocity = math.huge
		_alignposition.Responsiveness = 5;
		_alignposition.Attachment0 = _alignattatchment
		_alignposition.Position = _player.Character.HumanoidRootPart.Position + Vector3.new(0, _player.Character:FindFirstChildOfClass("Humanoid").BodyHeightScale.Value * 10.00);
		_highlight.Parent = _player.Character;
		_highlight.FillTransparency = 1;
		_highlight.OutlineTransparency = 1;
		_sounds.spawning:Play();
		_sounds.openbeam:Play();
		_sounds.spawningcrack:Play();
		_beams.Parent = workspace;
		_beams.Beam_1.Size = Vector3.new(0, 1000, 0);
		_beams.Beam_2.Size = Vector3.new(0, 1000, 0);
		_beams.Beam_3.Size = Vector3.new(0, 1000, 0);
		_beams.Beam_4.Size = Vector3.new(0, 1000, 0);
		_beams.Beam_1.Lines.TimeScale = 0.65;
		_beams.Beam_1.Lines.Rate = 100;
		_tweenservice:Create(_highlight, TweenInfo.new(1, Enum.EasingStyle.Quad), {FillTransparency = 0}):Play();
		_tweenservice:Create(_highlight2, TweenInfo.new(1, Enum.EasingStyle.Quad), {FillTransparency = 0}):Play();
		local _beamtweentime = 2.0;
		_tweenservice:Create(_beams.Beam_4, TweenInfo.new(_beamtweentime, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, _beams.Beam_4:GetAttribute("DelayTime")), {
			Size = Vector3.new(_beams.Beam_4:GetAttribute("OriginalWidth"), 1000, _beams.Beam_4:GetAttribute("OriginalWidth"))
		}):Play();
		_tweenservice:Create(_beams.Beam_3, TweenInfo.new(_beamtweentime, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false,  _beams.Beam_3:GetAttribute("DelayTime")), {
			Size = Vector3.new(_beams.Beam_3:GetAttribute("OriginalWidth"), 1000, _beams.Beam_3:GetAttribute("OriginalWidth"))
		}):Play();
		_tweenservice:Create(_beams.Beam_2, TweenInfo.new(_beamtweentime, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, _beams.Beam_2:GetAttribute("DelayTime")), {
			Size = Vector3.new(_beams.Beam_2:GetAttribute("OriginalWidth"), 1000, _beams.Beam_2:GetAttribute("OriginalWidth"))
		}):Play();
		_tweenservice:Create(_beams.Beam_1, TweenInfo.new(_beamtweentime, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false,  _beams.Beam_1:GetAttribute("DelayTime")), {
			Size = Vector3.new(_beams.Beam_1:GetAttribute("OriginalWidth"), 1000, _beams.Beam_1:GetAttribute("OriginalWidth"))
		}):Play();
		_tweenservice:Create(_beams.Beam_1.Lines, TweenInfo.new(5.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.40), {
			Rate = 250
		}):Play();
		_tweenservice:Create(_beams.Beam_1.Lines, TweenInfo.new(5.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
			TimeScale = 1
		}):Play();
		_beams.Beam_1.Position = _player.Character.HumanoidRootPart.Position;
		_beams.Beam_2.Position = _player.Character.HumanoidRootPart.Position;
		_beams.Beam_3.Position = _player.Character.HumanoidRootPart.Position;
		_beams.Beam_4.Position = _player.Character.HumanoidRootPart.Position;
		_sounds.loop:Play();
		delay(0.235, function()
			_beams.Beam_1.Lines.Enabled = true;
		end)
		wait(2.15);
		
		_star:Destroy();
		_ring2:Destroy();
		_tweenservice:Create(_highlight, TweenInfo.new(2.0, Enum.EasingStyle.Quad), {OutlineTransparency = 0}):Play();
		_tweenservice:Create(_highlight2, TweenInfo.new(2.0, Enum.EasingStyle.Quad), {OutlineTransparency = 0}):Play();
		_sounds.charging:Play();
		delay(0.5, function()
			_beams.Beam_1.Lines.Enabled = false;
		end);
		wait(1.2);
		_controller.Wings.Value = _wings;
		_wings.Parent = _player.Character;
		_attachment1.Name = "WingsAtt";
		_particle.Parent = _attachment;
		_wings.CharacterWeld.Attachment1 = _attachment1;
		if not _player.Character:FindFirstChild("FlyingVfx") then
			_vfxpart.Parent = _player.Character;
			_vfxpart.RigidConstraint.Attachment0 = _attachment;
		end;
		_player.Character.Humanoid.WalkSpeed = 16;
		_sounds.loop:Stop();
		_tweenservice:Create(_beams.Beam_4, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false, 0.15), {
			Size = Vector3.new(0, 1000, 0)
		}):Play();
		_tweenservice:Create(_beams.Beam_3, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false,  0.1), {
			Size = Vector3.new(0, 1000, 0)
		}):Play();
		_tweenservice:Create(_beams.Beam_2, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false,  0.05), {
			Size = Vector3.new(0, 1000, 0)
		}):Play();
		_tweenservice:Create(_beams.Beam_1, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false,  0), {
			Size = Vector3.new(0, 1000, 0)
		}):Play();
		_streaks.Parent = _endvfxattatchment;
		_sparks.Parent = _endvfxattatchment;
		_glow.Parent = _endvfxattatchment;
		_fireburst.Parent = _endvfxattatchment;
		_shockwave.Parent = _endvfxattatchment;
		--_shockwave2.Parent = _endvfxattatchment;
		_explosions.Parent = _endvfxattatchment;
		_emitpoint:FindFirstChild("Equip_Shockwave"):Emit(10);
		_emitpoint:FindFirstChild("Equip_FlareFlash"):Emit(10);
		_streaks:Emit(_streaks:GetAttribute("EmitCount"));
		_sparks:Emit(_sparks:GetAttribute("EmitCount"));
		_glow:Emit(_glow:GetAttribute("EmitCount"));
		_fireburst:Emit(_glow:GetAttribute("EmitCount"));
		_shockwave:Emit(_shockwave:GetAttribute("EmitCount"));
		--_shockwave2:Emit(_shockwave2:GetAttribute("EmitCount"));
		_explosions:Emit(_explosions:GetAttribute("EmitCount"));
		_sounds.finishsound:Play();
		_sounds.spawningcrack:Play();
		_sounds.finishing:Play();
		_tool:Destroy();
		_controller.Parent = _player.Backpack;
		if _player.Character:FindFirstChild("Humanoid") then
			_player.Character.Humanoid:EquipTool(_controller);
		end;
		wait(0.3);
		_tweenservice:Create(_highlight, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {FillTransparency = 1}):Play();
		_tweenservice:Create(_highlight, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {OutlineTransparency = 1}):Play();
		_tweenservice:Create(_highlight2, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {FillTransparency = 1}):Play();
		_tweenservice:Create(_highlight2, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {OutlineTransparency = 1}):Play();
		_highlight:Destroy();
		_highlight2:Destroy();
		wait(0.15);
		_alignposition:Destroy();
		_canagain = false;
		delay(15, function()
			_endvfxattatchment:Destroy();
		end);
	else
		print('already')
	end;
end);
