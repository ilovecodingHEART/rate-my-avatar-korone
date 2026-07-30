-- << Services > -- 

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _serverstorage = game:GetService("ServerStorage");
local _serverscriptservice = game:GetService("ServerScriptService");
local _workspace = game:GetService("Workspace");
local _collectionservice = game:GetService("CollectionService");
local _debris = game:GetService("Debris");
local _datastoreservice = game:GetService("DataStoreService");
local _httpsservice = game:GetService("HttpService");

-- << Modules > -- 

local _remotes = require(_replicatedstorge:WaitForChild("Remotes"));
local _benchmarking = require(_replicatedstorge.Benchmarking)
local _items = require(_serverscriptservice.Modules.Items);
local _data = require(_serverscriptservice.Modules.Data)
local l__Debris__19 = game:GetService("Debris");
local l__TweenService__15 = game:GetService("TweenService");
_serverscriptservice.DonationVFX.Event:Connect(function(v317, v318, v319)
	local l_Debris_1 = game.Debris;
	local l_TweenService_1 = game.TweenService;
	local l_CollectionService_1 = game.CollectionService;
	local v324 = nil;
	if v319 == 5 then
		v324 = 25;
	elseif v319 == 6 then
		v324 = 40;
	end;
	if v319 == 1 then
		local v330 = v317.RobuxParticles:Clone();
		l__Debris__19:AddItem(v330, 60);
		v330.Parent = v318;
		l__TweenService__15:Create(v330, TweenInfo.new(2.25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v330:Emit(v319 * 10);
		local v331 = v317.SolidShockwave:Clone();
		l_Debris_1:AddItem(v331, 60);
		if v318.Name == "Base" then
			v331.Parent = v318.EmitPoint;
		else
			v331.Parent = v318;
		end;
		v331:Emit(1);
		local v332 = v317.SurfaceShockwave:Clone();
		l__Debris__19:AddItem(v332, 60);
		if v318.Name == "Base" then
			v332.Parent = v318.EmitPoint;
		else
			v332.Parent = v318;
		end;
		v332:Emit(1);
		local v333 = v317.Sparks:Clone();
		l__Debris__19:AddItem(v333, 60);
		if v318.Name == "Base" then
			v333.Parent = v318.EmitPoint;
		else
			v333.Parent = v318;
		end;
		v333:Emit(25);
		local v334 = v317.SparklesExplosion:Clone();
		l__Debris__19:AddItem(v334, 60);
		if v318.Name == "Base" then
			v334.Parent = v318.EmitPoint;
		else
			v334.Parent = v318;
		end;
		v334:Emit(25);
		local v335 = v317.PointLight:Clone();
		l__Debris__19:AddItem(v335, 60);
		if v318.Name == "Base" then
			v335.Parent = v318.EmitPoint;
		else
			v335.Parent = v318;
		end;
		v335.Enabled = true;
		l__TweenService__15:Create(v335, TweenInfo.new(1.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Color = Color3.fromRGB(255, 255, 60)
		}):Play();
		l__TweenService__15:Create(v335, TweenInfo.new(2.25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Brightness = 0
		}):Play();
		v317:Destroy();
		return ;
		elseif v319 == 2 then
			local v336 = v317.RobuxParticles:Clone();
			l__Debris__19:AddItem(v336, 60);
			v336.Parent = v318;
			l__TweenService__15:Create(v336, TweenInfo.new(3.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v336:Emit(v319 * 10);
			local v337 = v317.Lines:Clone();
			l__Debris__19:AddItem(v337, 60);
			v337.Parent = v318;
			l__TweenService__15:Create(v337, TweenInfo.new(3.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v337:Emit(v319 * 10);
			local v338 = v317.Sparks:Clone();
			l__Debris__19:AddItem(v338, 60);
			if v318.Name == "Base" then
				v338.Parent = v318.EmitPoint;
			else
				v338.Parent = v318;
			end;
			v338:Emit(25);
			local v339 = v317.CrescentShockwave:Clone();
			l__Debris__19:AddItem(v339, 60);
			if v318.Name == "Base" then
				v339.Parent = v318.EmitPoint;
			else
				v339.Parent = v318;
			end;
			v339:Emit(25);
			local v340 = v317.Sparkles:Clone();
			l__Debris__19:AddItem(v340, 60);
			v340.Parent = v318;
			l__TweenService__15:Create(v340, TweenInfo.new(3.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v340:Emit(v319 * 10);
			local v341 = v317.SolidShockwave:Clone();
			l__Debris__19:AddItem(v341, 60);
			if v318.Name == "Base" then
				v341.Parent = v318.EmitPoint;
			else
				v341.Parent = v318;
			end;
			v341:Emit(1);
			local v342 = v317.SurfaceShockwave:Clone();
			l__Debris__19:AddItem(v342, 60);
			if v318.Name == "Base" then
				v342.Parent = v318.EmitPoint;
			else
				v342.Parent = v318;
			end;
			v342:Emit(1);
			local v343 = v317.ThinRays:Clone();
			l__Debris__19:AddItem(v343, 60);
			if v318.Name == "Base" then
				v343.Parent = v318.EmitPoint;
			else
				v343.Parent = v318;
			end;
			v343:Emit(20);
			local v344 = v317.SparklesExplosion:Clone();
			l__Debris__19:AddItem(v344, 60);
			if v318.Name == "Base" then
				v344.Parent = v318.EmitPoint;
			else
				v344.Parent = v318;
			end;
			v344:Emit(25);
			local v345 = v317.SoftRing:Clone();
			l__Debris__19:AddItem(v345, 60);
			if v318.Name == "Base" then
				v345.Parent = v318.EmitPoint;
			else
				v345.Parent = v318;
			end;
			v345:Emit(1);
			local v346 = v317.RadicalHalo:Clone();
			l__Debris__19:AddItem(v346, 60);
			if v318.Name == "Base" then
				v346.Parent = v318.EmitPoint;
			else
				v346.Parent = v318;
			end;
			v346:Emit(5);
			local v347 = v317.PointLight:Clone();
			l__Debris__19:AddItem(v347, 60);
			if v318.Name == "Base" then
				v347.Parent = v318.EmitPoint;
			else
				v347.Parent = v318;
			end;
			v347.Enabled = true;
			l__TweenService__15:Create(v347, TweenInfo.new(2.75, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l__TweenService__15:Create(v347, TweenInfo.new(1.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Color = Color3.fromRGB(255, 255, 60)
			}):Play();
			v317:Destroy();
			return ;
		elseif v319 == 3 then
			local v348 = v317.RobuxParticles:Clone();
			l_Debris_1:AddItem(v348, 60);
			v348.Parent = v318;
			l_TweenService_1:Create(v348, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v348:Emit(v319 * 10);
			l_CollectionService_1:AddTag(v348, "SFXEffect");
			local v349 = v317.Lines:Clone();
			l_Debris_1:AddItem(v349, 60);
			v349.Parent = v318;
			l_TweenService_1:Create(v349, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v349:Emit(v319 * 10);
			l_CollectionService_1:AddTag(v349, "SFXEffect");
			local v350 = v317.Sparks:Clone();
			l_Debris_1:AddItem(v350, 60);
			if v318.Name == "Base" then
				v350.Parent = v318.EmitPoint;
			else
				v350.Parent = v318;
			end;
			v350:Emit(25);
			l_CollectionService_1:AddTag(v350, "SFXEffect");
			local v351 = v317.SparklesExplosion:Clone();
			l_Debris_1:AddItem(v351, 60);
			if v318.Name == "Base" then
				v351.Parent = v318.EmitPoint;
			else
				v351.Parent = v318;
			end;
			v351:Emit(25);
			l_CollectionService_1:AddTag(v351, "SFXEffect");
			local v352 = v317.Sparkles:Clone();
			l_Debris_1:AddItem(v352, 60);
			v352.Parent = v318;
			l_TweenService_1:Create(v352, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v352, "SFXEffect");
			local v353 = v317.SolidShockwave:Clone();
			l_Debris_1:AddItem(v353, 60);
			if v318.Name == "Base" then
				v353.Parent = v318.EmitPoint;
			else
				v353.Parent = v318;
			end;
			v353:Emit(1);
			l_CollectionService_1:AddTag(v353, "SFXEffect");
			local v354 = v317.ScatteredShockwave:Clone();
			l_Debris_1:AddItem(v354, 60);
			if v318.Name == "Base" then
				v354.Parent = v318.EmitPoint;
			else
				v354.Parent = v318;
			end;
			v354:Emit(4);
			l_CollectionService_1:AddTag(v354, "SFXEffect");
			local v355 = v317.CrescentShockwave:Clone();
			l_Debris_1:AddItem(v355, 60);
			if v318.Name == "Base" then
				v355.Parent = v318.EmitPoint;
			else
				v355.Parent = v318;
			end;
			v355:Emit(25);
			l_CollectionService_1:AddTag(v355, "SFXEffect");
			local v356 = v317.SoftRing:Clone();
			l_Debris_1:AddItem(v356, 60);
			if v318.Name == "Base" then
				v356.Parent = v318.EmitPoint;
			else
				v356.Parent = v318;
			end;
			v356:Emit(1);
			l_CollectionService_1:AddTag(v356, "SFXEffect");
			local v357 = v317.ThinRays:Clone();
			l_Debris_1:AddItem(v357, 60);
			if v318.Name == "Base" then
				v357.Parent = v318.EmitPoint;
			else
				v357.Parent = v318;
			end;
			v357:Emit(20);
			l_CollectionService_1:AddTag(v357, "SFXEffect");
			local v358 = v317.Rays:Clone();
			l_Debris_1:AddItem(v358, 60);
			if v318.Name == "Base" then
				v358.Parent = v318.EmitPoint;
			else
				v358.Parent = v318;
			end;
			v358:Emit(10);
			l_CollectionService_1:AddTag(v358, "SFXEffect");
			local v359 = v317.RadicalHalo:Clone();
			l_Debris_1:AddItem(v359, 60);
			if v318.Name == "Base" then
				v359.Parent = v318.EmitPoint;
			else
				v359.Parent = v318;
			end;
			v359:Emit(5);
			l_CollectionService_1:AddTag(v359, "SFXEffect");
			local v360 = v317.SurfaceShockwave:Clone();
			l_Debris_1:AddItem(v360, 60);
			if v318.Name == "Base" then
				v360.Parent = v318.EmitPoint;
			else
				v360.Parent = v318;
			end;
			v360:Emit(1);
			l_CollectionService_1:AddTag(v360, "SFXEffect");
			local v361 = v317.PointLight:Clone();
			l_Debris_1:AddItem(v361, 60);
			if v318.Name == "Base" then
				v361.Parent = v318.EmitPoint;
			else
				v361.Parent = v318;
			end;
			v361.Enabled = true;
			l_TweenService_1:Create(v361, TweenInfo.new(3.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Color = Color3.fromRGB(255, 255, 60)
			}):Play();
			l_TweenService_1:Create(v361, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l_CollectionService_1:AddTag(v361, "SFXEffect");
			v317:Destroy();
			return ;
		elseif v319 == 4 then
			local v362 = v317.RobuxParticles:Clone();
			l_Debris_1:AddItem(v362, 60);
			v362.Parent = v318;
			l_TweenService_1:Create(v362, TweenInfo.new(40, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v362:Emit(50);
			l_CollectionService_1:AddTag(v362, "SFXEffect");
			local v363 = v317.BrightFlare:Clone();
			l_Debris_1:AddItem(v363, 60);
			if v318.Name == "Base" then
				v363.Parent = v318.EmitPoint;
			else
				v363.Parent = v318;
			end;
			l_TweenService_1:Create(v363, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v363:Emit(10);
			l_CollectionService_1:AddTag(v363, "SFXEffect");
			local v364 = v317.Beam:Clone();
			l_Debris_1:AddItem(v364, 60);
			if v318.Name == "Base" then
				v364.Parent = v318.EmitPoint;
			else
				v364.Parent = v318;
			end;
			l_TweenService_1:Create(v364, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v364, "SFXEffect");
			local v365 = v317.Fireflies:Clone();
			l_Debris_1:AddItem(v365, 60);
			if v318.Name == "Base" then
				v365.Parent = v318.EmitPoint;
			else
				v365.Parent = v318;
			end;
			l_TweenService_1:Create(v365, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v365, "SFXEffect");
			local v366 = v317.PulseRings:Clone();
			l_Debris_1:AddItem(v366, 60);
			if v318.Name == "Base" then
				v366.Parent = v318.EmitPoint;
			else
				v366.Parent = v318;
			end;
			l_TweenService_1:Create(v366, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v366, "SFXEffect");
			local v367 = v317.Lines:Clone();
			l_Debris_1:AddItem(v367, 60);
			v367.Parent = v318;
			l_TweenService_1:Create(v367, TweenInfo.new(40, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v367:Emit(50);
			l_CollectionService_1:AddTag(v367, "SFXEffect");
			local v368 = v317.Sparks:Clone();
			l_Debris_1:AddItem(v368, 60);
			if v318.Name == "Base" then
				v368.Parent = v318.EmitPoint;
			else
				v368.Parent = v318;
			end;
			v368:Emit(25);
			l_CollectionService_1:AddTag(v368, "SFXEffect");
			local v369 = v317.CrescentShockwave:Clone();
			l_Debris_1:AddItem(v369, 60);
			if v318.Name == "Base" then
				v369.Parent = v318.EmitPoint;
			else
				v369.Parent = v318;
			end;
			v369:Emit(25);
			l_CollectionService_1:AddTag(v369, "SFXEffect");
			local v370 = v317.Sparkles:Clone();
			l_Debris_1:AddItem(v370, 60);
			v370.Parent = v318;
			l_TweenService_1:Create(v370, TweenInfo.new(40, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v370, "SFXEffect");
			local v371 = v317.SolidShockwave:Clone();
			l_Debris_1:AddItem(v371, 60);
			if v318.Name == "Base" then
				v371.Parent = v318.EmitPoint;
			else
				v371.Parent = v318;
			end;
			v371:Emit(1);
			l_CollectionService_1:AddTag(v371, "SFXEffect");
			local v372 = v317.GlowFlash:Clone();
			l_Debris_1:AddItem(v372, 60);
			if v318.Name == "Base" then
				v372.Parent = v318.EmitPoint;
			else
				v372.Parent = v318;
			end;
			v372:Emit(1);
			l_CollectionService_1:AddTag(v372, "SFXEffect");
			local v373 = v317.ScatteredShockwave:Clone();
			l_Debris_1:AddItem(v373, 60);
			if v318.Name == "Base" then
				v373.Parent = v318.EmitPoint;
			else
				v373.Parent = v318;
			end;
			v373:Emit(5);
			l_CollectionService_1:AddTag(v373, "SFXEffect");
			local v374 = v317.SoftRing:Clone();
			l_Debris_1:AddItem(v374, 60);
			if v318.Name == "Base" then
				v374.Parent = v318.EmitPoint;
			else
				v374.Parent = v318;
			end;
			v374:Emit(1);
			l_CollectionService_1:AddTag(v374, "SFXEffect");
			local v375 = v317.SparklesExplosion:Clone();
			l_Debris_1:AddItem(v375, 60);
			if v318.Name == "Base" then
				v375.Parent = v318.EmitPoint;
			else
				v375.Parent = v318;
			end;
			v375:Emit(25);
			l_CollectionService_1:AddTag(v375, "SFXEffect");
			local v376 = v317.ThinRays:Clone();
			l_Debris_1:AddItem(v376, 60);
			if v318.Name == "Base" then
				v376.Parent = v318.EmitPoint;
			else
				v376.Parent = v318;
			end;
			l_TweenService_1:Create(v376, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v376:Emit(20);
			l_CollectionService_1:AddTag(v376, "SFXEffect");
			local v377 = v317.Rays:Clone();
			l_Debris_1:AddItem(v377, 60);
			if v318.Name == "Base" then
				v377.Parent = v318.EmitPoint;
			else
				v377.Parent = v318;
			end;
			l_TweenService_1:Create(v377, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v377:Emit(10);
			l_CollectionService_1:AddTag(v377, "SFXEffect");
			local v378 = v317.SurfaceShockwave:Clone();
			l_Debris_1:AddItem(v378, 60);
			if v318.Name == "Base" then
				v378.Parent = v318.EmitPoint;
			else
				v378.Parent = v318;
			end;
			l_TweenService_1:Create(v378, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			v378:Emit(1);
			l_CollectionService_1:AddTag(v378, "SFXEffect");
			local v379 = v317.RadicalHalo:Clone();
			l_Debris_1:AddItem(v379, 60);
			if v318.Name == "Base" then
				v379.Parent = v318.EmitPoint;
			else
				v379.Parent = v318;
			end;
			l_TweenService_1:Create(v379, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v379:Emit(5);
			l_CollectionService_1:AddTag(v379, "SFXEffect");
			local v380 = v317.SoftRadicalHalo:Clone();
			l_Debris_1:AddItem(v380, 60);
			if v318.Name == "Base" then
				v380.Parent = v318.EmitPoint;
			else
				v380.Parent = v318;
			end;
			l_TweenService_1:Create(v380, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v380:Emit(5);
			l_CollectionService_1:AddTag(v380, "SFXEffect");
			local v381 = v317.PointLight:Clone();
			l_Debris_1:AddItem(v381, 60);
			v381.Parent = v318;
			v381.Enabled = true;
			l_TweenService_1:Create(v381, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Color = Color3.fromRGB(255, 255, 60)
			}):Play();
			l_TweenService_1:Create(v381, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l_CollectionService_1:AddTag(v381, "SFXEffect");
			v317:Destroy();
			return ;
		elseif v319 == 6 then
			local v382 = v317.Start_Star:Clone();
			l_Debris_1:AddItem(v382, 60);
			if v318.Name == "Base" then
				v382.Parent = v318.EmitPoint;
			else
				v382.Parent = v318;
			end;
			v382:Emit(1);
			l_CollectionService_1:AddTag(v382, "SFXEffect");
			local v382 = v317.Start_Ring:Clone();
			l_Debris_1:AddItem(v382, 2);
			if v318.Name == "Base" then
				v382.Parent = v318.EmitPoint;
			else
				v382.Parent = v318;
			end;
			v382:Emit(1);
			v382:Emit(1);
			v382:Emit(1);
			l_CollectionService_1:AddTag(v382, "SFXEffect");
			local v383 = v317.Start_Implode:Clone();
			l_Debris_1:AddItem(v383, 5);
			if v318.Name == "Base" then
				v383.Parent = v318.EmitPoint;
			else
				v383.Parent = v318;
			end;
			--v383.Enabled = true;
			v383:Emit(15);
			l_CollectionService_1:AddTag(v383, "SFXEffect");

			local v384 = v317.Start_ImplodeDot:Clone();
			l_Debris_1:AddItem(v384, 25);
			if v318.Name == "Base" then
				v384.Parent = v318.EmitPoint;
			else
				v384.Parent = v318;
			end;
			v384.Enabled = true
			v384:Emit(20);
			l_CollectionService_1:AddTag(v384, "SFXEffect");
			wait(0.25);
			wait(0.55);
			v384.Enabled = false;
			v383.Enabled = false;
			v382.Enabled = false;
			local v386 = v317.RobuxParticles:Clone();
			l_Debris_1:AddItem(v386, 120);
			v386.Parent = v318;
			l_TweenService_1:Create(v386, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v386:Emit(50);
			l_CollectionService_1:AddTag(v386, "SFXEffect");
			local v387 = v317.BrightFlare:Clone();
			l_Debris_1:AddItem(v387, 120);
			if v318.Name == "Base" then
				v387.Parent = v318.EmitPoint;
			else
				v387.Parent = v318;
			end;
			l_TweenService_1:Create(v387, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v387:Emit(10);
			l_CollectionService_1:AddTag(v387, "SFXEffect");
			local v388 = v317.Beam:Clone();
			l_Debris_1:AddItem(v388, 120);
			if v318.Name == "Base" then
				v388.Parent = v318.EmitPoint;
			else
				v388.Parent = v318;
			end;
			l_TweenService_1:Create(v388, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v388:Emit(50);
			l_CollectionService_1:AddTag(v388, "SFXEffect");
			local v389 = v317.Fireflies:Clone();
			l_Debris_1:AddItem(v389, 120);
			if v318.Name == "Base" then
				v389.Parent = v318.EmitPoint;
			else
				v389.Parent = v318;
			end;
			l_TweenService_1:Create(v389, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v389:Emit(25);
			l_CollectionService_1:AddTag(v389, "SFXEffect");
			local v390 = v317.PulseRings:Clone();
			l_Debris_1:AddItem(v390, 120);
			if v318.Name == "Base" then
				v390.Parent = v318.EmitPoint;
			else
				v390.Parent = v318;
			end;
			l_TweenService_1:Create(v390, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v390, "SFXEffect");
			local v391 = v317.Lines:Clone();
			l_Debris_1:AddItem(v391, 120);
			v391.Parent = v318;
			l_TweenService_1:Create(v391, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v391:Emit(50);
			l_CollectionService_1:AddTag(v391, "SFXEffect");
			local v392 = v317.Sparks:Clone();
			l_Debris_1:AddItem(v392, 120);
			if v318.Name == "Base" then
				v392.Parent = v318.EmitPoint;
			else
				v392.Parent = v318;
			end;
			v392:Emit(50);
			l_TweenService_1:Create(v392, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v392, "SFXEffect");
			local v393 = v317.CrescentShockwave:Clone();
			l_Debris_1:AddItem(v393, 120);
			if v318.Name == "Base" then
				v393.Parent = v318.EmitPoint;
			else
				v393.Parent = v318;
			end;
			v393:Emit(50);
			l_CollectionService_1:AddTag(v393, "SFXEffect");
			local v394 = v317.Sparkles:Clone();
			l_Debris_1:AddItem(v394, 120);
			v394.Parent = v318;
			l_TweenService_1:Create(v394, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v394, "SFXEffect");
			local v395 = v317.SolidShockwave:Clone();
			l_Debris_1:AddItem(v395, 120);
			if v318.Name == "Base" then
				v395.Parent = v318.EmitPoint;
			else
				v395.Parent = v318;
			end;
			v395:Emit(1);
			l_CollectionService_1:AddTag(v395, "SFXEffect");
			local v396 = v317.GlowFlash:Clone();
			l_Debris_1:AddItem(v396, 120);
			if v318.Name == "Base" then
				v396.Parent = v318.EmitPoint;
			else
				v396.Parent = v318;
			end;
			v396:Emit(1);
			l_CollectionService_1:AddTag(v396, "SFXEffect");
			local v397 = v317.ScatteredShockwave:Clone();
			l_Debris_1:AddItem(v397, 120);
			if v318.Name == "Base" then
				v397.Parent = v318.EmitPoint;
			else
				v397.Parent = v318;
			end;
			v397:Emit(1);
			l_CollectionService_1:AddTag(v397, "SFXEffect");
			local v398 = v317.SoftRing:Clone();
			l_Debris_1:AddItem(v398, 120);
			if v318.Name == "Base" then
				v398.Parent = v318.EmitPoint;
			else
				v398.Parent = v318;
			end;
			v398:Emit(1);
			l_CollectionService_1:AddTag(v398, "SFXEffect");
			local v399 = v317.SparklesExplosion:Clone();
			l_Debris_1:AddItem(v399, 120);
			if v318.Name == "Base" then
				v399.Parent = v318.EmitPoint;
			else
				v399.Parent = v318;
			end;
			v399:Emit(50);
			l_CollectionService_1:AddTag(v399, "SFXEffect");
			local v400 = v317.ThinRays:Clone();
			l_Debris_1:AddItem(v400, 120);
			if v318.Name == "Base" then
				v400.Parent = v318.EmitPoint;
			else
				v400.Parent = v318;
			end;
			l_TweenService_1:Create(v400, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v400:Emit(20);
			l_CollectionService_1:AddTag(v400, "SFXEffect");
			local v401 = v317.Rays:Clone();
			l_Debris_1:AddItem(v401, 120);
			if v318.Name == "Base" then
				v401.Parent = v318.EmitPoint;
			else
				v401.Parent = v318;
			end;
			l_TweenService_1:Create(v401, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v401:Emit(10);
			l_CollectionService_1:AddTag(v401, "SFXEffect");
			local v402 = v317.SurfaceShockwave:Clone();
			l_Debris_1:AddItem(v402, 120);
			if v318.Name == "Base" then
				v402.Parent = v318.EmitPoint;
			else
				v402.Parent = v318;
			end;
			l_TweenService_1:Create(v402, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			v402:Emit(1);
			l_CollectionService_1:AddTag(v402, "SFXEffect");
			local v403 = v317.RadicalHalo:Clone();
			l_Debris_1:AddItem(v403, 120);
			if v318.Name == "Base" then
				v403.Parent = v318.EmitPoint;
			else
				v403.Parent = v318;
			end;
			l_TweenService_1:Create(v403, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v403:Emit(5);
			l_CollectionService_1:AddTag(v403, "SFXEffect");
			local v404 = v317.Flames:Clone();
			l_Debris_1:AddItem(v404, 120);
			if v318.Name == "Base" then
				v404.Parent = v318.EmitPoint;
			else
				v404.Parent = v318;
			end;
			l_TweenService_1:Create(v404, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v404:Emit(25);
			l_CollectionService_1:AddTag(v404, "SFXEffect");
			local v405 = v317.SoftRadicalHalo:Clone();
			l_Debris_1:AddItem(v405, 120);
			if v318.Name == "Base" then
				v405.Parent = v318.EmitPoint;
			else
				v405.Parent = v318;
			end;
			l_TweenService_1:Create(v405, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v405:Emit(5);
			l_CollectionService_1:AddTag(v405, "SFXEffect");
			local v406 = v317.PointLightGlow:Clone();
			l_Debris_1:AddItem(v406, 120);
			v406.Parent = v318;
			v406.Enabled = true;
			l_TweenService_1:Create(v406, TweenInfo.new(7.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Color = Color3.fromRGB(255, 102, 255)
			}):Play();
			l_TweenService_1:Create(v406, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l_CollectionService_1:AddTag(v406, "SFXEffect");
			spawn(function()
				wait(32.5);
				local v382 = v317.Start_Star:Clone();
				l_Debris_1:AddItem(v382, 60);
				if v318.Name == "Base" then
					v382.Parent = v318.EmitPoint;
				else
					v382.Parent = v318;
				end;
				v382:Emit(1);
				l_CollectionService_1:AddTag(v382, "SFXEffect");
				local v382 = v317.Start_Ring:Clone();
				l_Debris_1:AddItem(v382, 2);
				if v318.Name == "Base" then
					v382.Parent = v318.EmitPoint;
				else
					v382.Parent = v318;
				end;
				v382:Emit(1);
				v382:Emit(1);
				v382:Emit(1);
				l_CollectionService_1:AddTag(v382, "SFXEffect");
				local v383 = v317.Start_Implode:Clone();
				l_Debris_1:AddItem(v383, 5);
				if v318.Name == "Base" then
					v383.Parent = v318.EmitPoint;
				else
					v383.Parent = v318;
				end;
				--v383.Enabled = true;
				v383:Emit(15);
				l_CollectionService_1:AddTag(v383, "SFXEffect");

				local v384 = v317.Start_ImplodeDot:Clone();
				l_Debris_1:AddItem(v384, 25);
				if v318.Name == "Base" then
					v384.Parent = v318.EmitPoint;
				else
					v384.Parent = v318;
				end;
				v384.Enabled = true
				v384:Emit(20);
				l_CollectionService_1:AddTag(v384, "SFXEffect");
				wait(0.25);
				wait(0.5);
				v384.Enabled = false;
				v383.Enabled = false;
				v382.Enabled = false;
				local v386 = v317.RobuxParticles:Clone();
				l_Debris_1:AddItem(v386, 120);
				v386.Parent = v318;
				l_TweenService_1:Create(v386, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v386:Emit(50);
				l_CollectionService_1:AddTag(v386, "SFXEffect");
				local v387 = v317.BrightFlare:Clone();
				l_Debris_1:AddItem(v387, 120);
				if v318.Name == "Base" then
					v387.Parent = v318.EmitPoint;
				else
					v387.Parent = v318;
				end;
				l_TweenService_1:Create(v387, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v387:Emit(10);
				l_CollectionService_1:AddTag(v387, "SFXEffect");
				local v388 = v317.Beam:Clone();
				l_Debris_1:AddItem(v388, 120);
				if v318.Name == "Base" then
					v388.Parent = v318.EmitPoint;
				else
					v388.Parent = v318;
				end;
				l_TweenService_1:Create(v388, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v388:Emit(50);
				l_CollectionService_1:AddTag(v388, "SFXEffect");
				local v389 = v317.Fireflies:Clone();
				l_Debris_1:AddItem(v389, 120);
				if v318.Name == "Base" then
					v389.Parent = v318.EmitPoint;
				else
					v389.Parent = v318;
				end;
				l_TweenService_1:Create(v389, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v389:Emit(25);
				l_CollectionService_1:AddTag(v389, "SFXEffect");
				local v390 = v317.PulseRings:Clone();
				l_Debris_1:AddItem(v390, 120);
				if v318.Name == "Base" then
					v390.Parent = v318.EmitPoint;
				else
					v390.Parent = v318;
				end;
				l_TweenService_1:Create(v390, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				l_CollectionService_1:AddTag(v390, "SFXEffect");
				local v391 = v317.Lines:Clone();
				l_Debris_1:AddItem(v391, 120);
				v391.Parent = v318;
				l_TweenService_1:Create(v391, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v391:Emit(50);
				l_CollectionService_1:AddTag(v391, "SFXEffect");
				local v392 = v317.Sparks:Clone();
				l_Debris_1:AddItem(v392, 120);
				if v318.Name == "Base" then
					v392.Parent = v318.EmitPoint;
				else
					v392.Parent = v318;
				end;
				v392:Emit(50);
				l_TweenService_1:Create(v392, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				l_CollectionService_1:AddTag(v392, "SFXEffect");
				local v393 = v317.CrescentShockwave:Clone();
				l_Debris_1:AddItem(v393, 120);
				if v318.Name == "Base" then
					v393.Parent = v318.EmitPoint;
				else
					v393.Parent = v318;
				end;
				v393:Emit(50);
				l_CollectionService_1:AddTag(v393, "SFXEffect");
				local v394 = v317.Sparkles:Clone();
				l_Debris_1:AddItem(v394, 120);
				v394.Parent = v318;
				l_TweenService_1:Create(v394, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				l_CollectionService_1:AddTag(v394, "SFXEffect");
				local v395 = v317.SolidShockwave:Clone();
				l_Debris_1:AddItem(v395, 120);
				if v318.Name == "Base" then
					v395.Parent = v318.EmitPoint;
				else
					v395.Parent = v318;
				end;
				v395:Emit(1);
				l_CollectionService_1:AddTag(v395, "SFXEffect");
				local v396 = v317.GlowFlash:Clone();
				l_Debris_1:AddItem(v396, 120);
				if v318.Name == "Base" then
					v396.Parent = v318.EmitPoint;
				else
					v396.Parent = v318;
				end;
				v396:Emit(1);
				l_CollectionService_1:AddTag(v396, "SFXEffect");
				local v397 = v317.ScatteredShockwave:Clone();
				l_Debris_1:AddItem(v397, 120);
				if v318.Name == "Base" then
					v397.Parent = v318.EmitPoint;
				else
					v397.Parent = v318;
				end;
				v397:Emit(1);
				l_CollectionService_1:AddTag(v397, "SFXEffect");
				local v398 = v317.SoftRing:Clone();
				l_Debris_1:AddItem(v398, 120);
				if v318.Name == "Base" then
					v398.Parent = v318.EmitPoint;
				else
					v398.Parent = v318;
				end;
				v398:Emit(1);
				l_CollectionService_1:AddTag(v398, "SFXEffect");
				local v399 = v317.SparklesExplosion:Clone();
				l_Debris_1:AddItem(v399, 120);
				if v318.Name == "Base" then
					v399.Parent = v318.EmitPoint;
				else
					v399.Parent = v318;
				end;
				v399:Emit(50);
				l_CollectionService_1:AddTag(v399, "SFXEffect");
				local v400 = v317.ThinRays:Clone();
				l_Debris_1:AddItem(v400, 120);
				if v318.Name == "Base" then
					v400.Parent = v318.EmitPoint;
				else
					v400.Parent = v318;
				end;
				l_TweenService_1:Create(v400, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v400:Emit(20);
				l_CollectionService_1:AddTag(v400, "SFXEffect");
				local v401 = v317.Rays:Clone();
				l_Debris_1:AddItem(v401, 120);
				if v318.Name == "Base" then
					v401.Parent = v318.EmitPoint;
				else
					v401.Parent = v318;
				end;
				l_TweenService_1:Create(v401, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v401:Emit(10);
				l_CollectionService_1:AddTag(v401, "SFXEffect");
				local v402 = v317.SurfaceShockwave:Clone();
				l_Debris_1:AddItem(v402, 120);
				if v318.Name == "Base" then
					v402.Parent = v318.EmitPoint;
				else
					v402.Parent = v318;
				end;
				l_TweenService_1:Create(v402, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Brightness = 0
				}):Play();
				v402:Emit(1);
				l_CollectionService_1:AddTag(v402, "SFXEffect");
				local v403 = v317.RadicalHalo:Clone();
				l_Debris_1:AddItem(v403, 120);
				if v318.Name == "Base" then
					v403.Parent = v318.EmitPoint;
				else
					v403.Parent = v318;
				end;
				l_TweenService_1:Create(v403, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v403:Emit(5);
				l_CollectionService_1:AddTag(v403, "SFXEffect");
				local v404 = v317.Flames:Clone();
				l_Debris_1:AddItem(v404, 120);
				if v318.Name == "Base" then
					v404.Parent = v318.EmitPoint;
				else
					v404.Parent = v318;
				end;
				l_TweenService_1:Create(v404, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v404:Emit(25);
				l_CollectionService_1:AddTag(v404, "SFXEffect");
				local v405 = v317.SoftRadicalHalo:Clone();
				l_Debris_1:AddItem(v405, 120);
				if v318.Name == "Base" then
					v405.Parent = v318.EmitPoint;
				else
					v405.Parent = v318;
				end;
				l_TweenService_1:Create(v405, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Rate = 0
				}):Play();
				v405:Emit(5);
				l_CollectionService_1:AddTag(v405, "SFXEffect");
				local v406 = v317.PointLightGlow:Clone();
				l_Debris_1:AddItem(v406, 120);
				v406.Parent = v318;
				v406.Enabled = true;
				l_TweenService_1:Create(v406, TweenInfo.new(7.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Color = Color3.fromRGB(255, 102, 255)
				}):Play();
				l_TweenService_1:Create(v406, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
					Brightness = 0
				}):Play();
				l_CollectionService_1:AddTag(v406, "SFXEffect");

			end);
			return ;
	elseif v319 == 7 then
		local v382 = v317.Start_Star:Clone();
		l_Debris_1:AddItem(v382, 60);
		if v318.Name == "Base" then
			v382.Parent = v318.EmitPoint;
		else
			v382.Parent = v318;
		end;
		v382:Emit(1);
		l_CollectionService_1:AddTag(v382, "SFXEffect");
		local v382 = v317.Start_Ring:Clone();
		l_Debris_1:AddItem(v382, 2);
		if v318.Name == "Base" then
			v382.Parent = v318.EmitPoint;
		else
			v382.Parent = v318;
		end;
		v382:Emit(1);
		v382:Emit(1);
		v382:Emit(1);
		l_CollectionService_1:AddTag(v382, "SFXEffect");
		local v383 = v317.Start_Implode:Clone();
		l_Debris_1:AddItem(v383, 5);
		if v318.Name == "Base" then
			v383.Parent = v318.EmitPoint;
		else
			v383.Parent = v318;
		end;
		--v383.Enabled = true;
		v383:Emit(15);
		l_CollectionService_1:AddTag(v383, "SFXEffect");

		local v384 = v317.Start_ImplodeDot:Clone();
		l_Debris_1:AddItem(v384, 25);
		if v318.Name == "Base" then
			v384.Parent = v318.EmitPoint;
		else
			v384.Parent = v318;
		end;
		v384.Enabled = true
		v384:Emit(20);
		l_CollectionService_1:AddTag(v384, "SFXEffect");
		wait(0.25);
		wait(0.5);
		v384.Enabled = false;
		v383.Enabled = false;
		v382.Enabled = false;
		local v386 = v317.RobuxParticles:Clone();
		l_Debris_1:AddItem(v386, 120);
		v386.Parent = v318;
		l_TweenService_1:Create(v386, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v386:Emit(50);
		l_CollectionService_1:AddTag(v386, "SFXEffect");
		local v387 = v317.BrightFlare:Clone();
		l_Debris_1:AddItem(v387, 120);
		if v318.Name == "Base" then
			v387.Parent = v318.EmitPoint;
		else
			v387.Parent = v318;
		end;
		l_TweenService_1:Create(v387, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v387:Emit(10);
		l_CollectionService_1:AddTag(v387, "SFXEffect");
		local v388 = v317.Beam:Clone();
		l_Debris_1:AddItem(v388, 120);
		if v318.Name == "Base" then
			v388.Parent = v318.EmitPoint;
		else
			v388.Parent = v318;
		end;
		l_TweenService_1:Create(v388, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v388:Emit(50);
		l_CollectionService_1:AddTag(v388, "SFXEffect");
		local v389 = v317.Fireflies:Clone();
		l_Debris_1:AddItem(v389, 120);
		if v318.Name == "Base" then
			v389.Parent = v318.EmitPoint;
		else
			v389.Parent = v318;
		end;
		l_TweenService_1:Create(v389, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v389:Emit(25);
		l_CollectionService_1:AddTag(v389, "SFXEffect");
		local v390 = v317.PulseRings:Clone();
		l_Debris_1:AddItem(v390, 120);
		if v318.Name == "Base" then
			v390.Parent = v318.EmitPoint;
		else
			v390.Parent = v318;
		end;
		l_TweenService_1:Create(v390, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		l_CollectionService_1:AddTag(v390, "SFXEffect");
		local v391 = v317.Lines:Clone();
		l_Debris_1:AddItem(v391, 120);
		v391.Parent = v318;
		l_TweenService_1:Create(v391, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v391:Emit(50);
		l_CollectionService_1:AddTag(v391, "SFXEffect");
		local v392 = v317.Sparks:Clone();
		l_Debris_1:AddItem(v392, 120);
		if v318.Name == "Base" then
			v392.Parent = v318.EmitPoint;
		else
			v392.Parent = v318;
		end;
		v392:Emit(50);
		l_TweenService_1:Create(v392, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		l_CollectionService_1:AddTag(v392, "SFXEffect");
		local v393 = v317.CrescentShockwave:Clone();
		l_Debris_1:AddItem(v393, 120);
		if v318.Name == "Base" then
			v393.Parent = v318.EmitPoint;
		else
			v393.Parent = v318;
		end;
		v393:Emit(50);
		l_CollectionService_1:AddTag(v393, "SFXEffect");
		local v394 = v317.Sparkles:Clone();
		l_Debris_1:AddItem(v394, 120);
		v394.Parent = v318;
		l_TweenService_1:Create(v394, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		l_CollectionService_1:AddTag(v394, "SFXEffect");
		local v395 = v317.SolidShockwave:Clone();
		l_Debris_1:AddItem(v395, 120);
		if v318.Name == "Base" then
			v395.Parent = v318.EmitPoint;
		else
			v395.Parent = v318;
		end;
		v395:Emit(1);
		l_CollectionService_1:AddTag(v395, "SFXEffect");
		local v396 = v317.GlowFlash:Clone();
		l_Debris_1:AddItem(v396, 120);
		if v318.Name == "Base" then
			v396.Parent = v318.EmitPoint;
		else
			v396.Parent = v318;
		end;
		v396:Emit(1);
		l_CollectionService_1:AddTag(v396, "SFXEffect");
		local v397 = v317.ScatteredShockwave:Clone();
		l_Debris_1:AddItem(v397, 120);
		if v318.Name == "Base" then
			v397.Parent = v318.EmitPoint;
		else
			v397.Parent = v318;
		end;
		v397:Emit(1);
		l_CollectionService_1:AddTag(v397, "SFXEffect");
		local v398 = v317.SoftRing:Clone();
		l_Debris_1:AddItem(v398, 120);
		if v318.Name == "Base" then
			v398.Parent = v318.EmitPoint;
		else
			v398.Parent = v318;
		end;
		v398:Emit(1);
		l_CollectionService_1:AddTag(v398, "SFXEffect");
		local v399 = v317.SparklesExplosion:Clone();
		l_Debris_1:AddItem(v399, 120);
		if v318.Name == "Base" then
			v399.Parent = v318.EmitPoint;
		else
			v399.Parent = v318;
		end;
		v399:Emit(50);
		l_CollectionService_1:AddTag(v399, "SFXEffect");
		local v400 = v317.ThinRays:Clone();
		l_Debris_1:AddItem(v400, 120);
		if v318.Name == "Base" then
			v400.Parent = v318.EmitPoint;
		else
			v400.Parent = v318;
		end;
		l_TweenService_1:Create(v400, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v400:Emit(20);
		l_CollectionService_1:AddTag(v400, "SFXEffect");
		local v401 = v317.Rays:Clone();
		l_Debris_1:AddItem(v401, 120);
		if v318.Name == "Base" then
			v401.Parent = v318.EmitPoint;
		else
			v401.Parent = v318;
		end;
		l_TweenService_1:Create(v401, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v401:Emit(10);
		l_CollectionService_1:AddTag(v401, "SFXEffect");
		local v402 = v317.SurfaceShockwave:Clone();
		l_Debris_1:AddItem(v402, 120);
		if v318.Name == "Base" then
			v402.Parent = v318.EmitPoint;
		else
			v402.Parent = v318;
		end;
		l_TweenService_1:Create(v402, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Brightness = 0
		}):Play();
		v402:Emit(1);
		l_CollectionService_1:AddTag(v402, "SFXEffect");
		local v403 = v317.RadicalHalo:Clone();
		l_Debris_1:AddItem(v403, 120);
		if v318.Name == "Base" then
			v403.Parent = v318.EmitPoint;
		else
			v403.Parent = v318;
		end;
		l_TweenService_1:Create(v403, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v403:Emit(5);
		l_CollectionService_1:AddTag(v403, "SFXEffect");
		local v404 = v317.Flames:Clone();
		l_Debris_1:AddItem(v404, 120);
		if v318.Name == "Base" then
			v404.Parent = v318.EmitPoint;
		else
			v404.Parent = v318;
		end;
		l_TweenService_1:Create(v404, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v404:Emit(25);
		l_CollectionService_1:AddTag(v404, "SFXEffect");
		local v405 = v317.SoftRadicalHalo:Clone();
		l_Debris_1:AddItem(v405, 120);
		if v318.Name == "Base" then
			v405.Parent = v318.EmitPoint;
		else
			v405.Parent = v318;
		end;
		l_TweenService_1:Create(v405, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Rate = 0
		}):Play();
		v405:Emit(5);
		l_CollectionService_1:AddTag(v405, "SFXEffect");
		local v406 = v317.PointLightGlow:Clone();
		l_Debris_1:AddItem(v406, 120);
		v406.Parent = v318;
		v406.Enabled = true;
		l_TweenService_1:Create(v406, TweenInfo.new(7.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Color = Color3.fromRGB(255, 102, 255)
		}):Play();
		l_TweenService_1:Create(v406, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
			Brightness = 0
		}):Play();
		l_CollectionService_1:AddTag(v406, "SFXEffect");
		spawn(function()
			wait(32.5);
			local v382 = v317.Start_Star:Clone();
			l_Debris_1:AddItem(v382, 60);
			if v318.Name == "Base" then
				v382.Parent = v318.EmitPoint;
			else
				v382.Parent = v318;
			end;
			v382:Emit(1);
			l_CollectionService_1:AddTag(v382, "SFXEffect");
			local v382 = v317.Start_Ring:Clone();
			l_Debris_1:AddItem(v382, 2);
			if v318.Name == "Base" then
				v382.Parent = v318.EmitPoint;
			else
				v382.Parent = v318;
			end;
			v382:Emit(1);
			v382:Emit(1);
			v382:Emit(1);
			l_CollectionService_1:AddTag(v382, "SFXEffect");
			local v383 = v317.Start_Implode:Clone();
			l_Debris_1:AddItem(v383, 5);
			if v318.Name == "Base" then
				v383.Parent = v318.EmitPoint;
			else
				v383.Parent = v318;
			end;
			--v383.Enabled = true;
			v383:Emit(15);
			l_CollectionService_1:AddTag(v383, "SFXEffect");

			local v384 = v317.Start_ImplodeDot:Clone();
			l_Debris_1:AddItem(v384, 25);
			if v318.Name == "Base" then
				v384.Parent = v318.EmitPoint;
			else
				v384.Parent = v318;
			end;
			v384.Enabled = true
			v384:Emit(20);
			l_CollectionService_1:AddTag(v384, "SFXEffect");
			wait(0.25);
			wait(0.5);
			v384.Enabled = false;
			v383.Enabled = false;
			v382.Enabled = false;
			local v386 = v317.RobuxParticles:Clone();
			l_Debris_1:AddItem(v386, 120);
			v386.Parent = v318;
			l_TweenService_1:Create(v386, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v386:Emit(50);
			l_CollectionService_1:AddTag(v386, "SFXEffect");
			local v387 = v317.BrightFlare:Clone();
			l_Debris_1:AddItem(v387, 120);
			if v318.Name == "Base" then
				v387.Parent = v318.EmitPoint;
			else
				v387.Parent = v318;
			end;
			l_TweenService_1:Create(v387, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v387:Emit(10);
			l_CollectionService_1:AddTag(v387, "SFXEffect");
			local v388 = v317.Beam:Clone();
			l_Debris_1:AddItem(v388, 120);
			if v318.Name == "Base" then
				v388.Parent = v318.EmitPoint;
			else
				v388.Parent = v318;
			end;
			l_TweenService_1:Create(v388, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v388:Emit(50);
			l_CollectionService_1:AddTag(v388, "SFXEffect");
			local v389 = v317.Fireflies:Clone();
			l_Debris_1:AddItem(v389, 120);
			if v318.Name == "Base" then
				v389.Parent = v318.EmitPoint;
			else
				v389.Parent = v318;
			end;
			l_TweenService_1:Create(v389, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v389:Emit(25);
			l_CollectionService_1:AddTag(v389, "SFXEffect");
			local v390 = v317.PulseRings:Clone();
			l_Debris_1:AddItem(v390, 120);
			if v318.Name == "Base" then
				v390.Parent = v318.EmitPoint;
			else
				v390.Parent = v318;
			end;
			l_TweenService_1:Create(v390, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v390, "SFXEffect");
			local v391 = v317.Lines:Clone();
			l_Debris_1:AddItem(v391, 120);
			v391.Parent = v318;
			l_TweenService_1:Create(v391, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v391:Emit(50);
			l_CollectionService_1:AddTag(v391, "SFXEffect");
			local v392 = v317.Sparks:Clone();
			l_Debris_1:AddItem(v392, 120);
			if v318.Name == "Base" then
				v392.Parent = v318.EmitPoint;
			else
				v392.Parent = v318;
			end;
			v392:Emit(50);
			l_TweenService_1:Create(v392, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v392, "SFXEffect");
			local v393 = v317.CrescentShockwave:Clone();
			l_Debris_1:AddItem(v393, 120);
			if v318.Name == "Base" then
				v393.Parent = v318.EmitPoint;
			else
				v393.Parent = v318;
			end;
			v393:Emit(50);
			l_CollectionService_1:AddTag(v393, "SFXEffect");
			local v394 = v317.Sparkles:Clone();
			l_Debris_1:AddItem(v394, 120);
			v394.Parent = v318;
			l_TweenService_1:Create(v394, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v394, "SFXEffect");
			local v395 = v317.SolidShockwave:Clone();
			l_Debris_1:AddItem(v395, 120);
			if v318.Name == "Base" then
				v395.Parent = v318.EmitPoint;
			else
				v395.Parent = v318;
			end;
			v395:Emit(1);
			l_CollectionService_1:AddTag(v395, "SFXEffect");
			local v396 = v317.GlowFlash:Clone();
			l_Debris_1:AddItem(v396, 120);
			if v318.Name == "Base" then
				v396.Parent = v318.EmitPoint;
			else
				v396.Parent = v318;
			end;
			v396:Emit(1);
			l_CollectionService_1:AddTag(v396, "SFXEffect");
			local v397 = v317.ScatteredShockwave:Clone();
			l_Debris_1:AddItem(v397, 120);
			if v318.Name == "Base" then
				v397.Parent = v318.EmitPoint;
			else
				v397.Parent = v318;
			end;
			v397:Emit(1);
			l_CollectionService_1:AddTag(v397, "SFXEffect");
			local v398 = v317.SoftRing:Clone();
			l_Debris_1:AddItem(v398, 120);
			if v318.Name == "Base" then
				v398.Parent = v318.EmitPoint;
			else
				v398.Parent = v318;
			end;
			v398:Emit(1);
			l_CollectionService_1:AddTag(v398, "SFXEffect");
			local v399 = v317.SparklesExplosion:Clone();
			l_Debris_1:AddItem(v399, 120);
			if v318.Name == "Base" then
				v399.Parent = v318.EmitPoint;
			else
				v399.Parent = v318;
			end;
			v399:Emit(50);
			l_CollectionService_1:AddTag(v399, "SFXEffect");
			local v400 = v317.ThinRays:Clone();
			l_Debris_1:AddItem(v400, 120);
			if v318.Name == "Base" then
				v400.Parent = v318.EmitPoint;
			else
				v400.Parent = v318;
			end;
			l_TweenService_1:Create(v400, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v400:Emit(20);
			l_CollectionService_1:AddTag(v400, "SFXEffect");
			local v401 = v317.Rays:Clone();
			l_Debris_1:AddItem(v401, 120);
			if v318.Name == "Base" then
				v401.Parent = v318.EmitPoint;
			else
				v401.Parent = v318;
			end;
			l_TweenService_1:Create(v401, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v401:Emit(10);
			l_CollectionService_1:AddTag(v401, "SFXEffect");
			local v402 = v317.SurfaceShockwave:Clone();
			l_Debris_1:AddItem(v402, 120);
			if v318.Name == "Base" then
				v402.Parent = v318.EmitPoint;
			else
				v402.Parent = v318;
			end;
			l_TweenService_1:Create(v402, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			v402:Emit(1);
			l_CollectionService_1:AddTag(v402, "SFXEffect");
			local v403 = v317.RadicalHalo:Clone();
			l_Debris_1:AddItem(v403, 120);
			if v318.Name == "Base" then
				v403.Parent = v318.EmitPoint;
			else
				v403.Parent = v318;
			end;
			l_TweenService_1:Create(v403, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v403:Emit(5);
			l_CollectionService_1:AddTag(v403, "SFXEffect");
			local v404 = v317.Flames:Clone();
			l_Debris_1:AddItem(v404, 120);
			if v318.Name == "Base" then
				v404.Parent = v318.EmitPoint;
			else
				v404.Parent = v318;
			end;
			l_TweenService_1:Create(v404, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v404:Emit(25);
			l_CollectionService_1:AddTag(v404, "SFXEffect");
			local v405 = v317.SoftRadicalHalo:Clone();
			l_Debris_1:AddItem(v405, 120);
			if v318.Name == "Base" then
				v405.Parent = v318.EmitPoint;
			else
				v405.Parent = v318;
			end;
			l_TweenService_1:Create(v405, TweenInfo.new(45, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v405:Emit(5);
			l_CollectionService_1:AddTag(v405, "SFXEffect");
			local v406 = v317.PointLightGlow:Clone();
			l_Debris_1:AddItem(v406, 120);
			v406.Parent = v318;
			v406.Enabled = true;
			l_TweenService_1:Create(v406, TweenInfo.new(7.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Color = Color3.fromRGB(255, 102, 255)
			}):Play();
			l_TweenService_1:Create(v406, TweenInfo.new(25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l_CollectionService_1:AddTag(v406, "SFXEffect");

		end);
		return ;
		elseif v319 == 5 then
			local v432 = v317.RobuxParticles:Clone();
			l_Debris_1:AddItem(v432, 60);
			v432.Parent = v318;
			l_TweenService_1:Create(v432, TweenInfo.new(60, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v432:Emit(50);
			l_CollectionService_1:AddTag(v432, "SFXEffect");
			local v433 = v317.BrightFlare:Clone();
			l_Debris_1:AddItem(v433, 60);
			if v318.Name == "Base" then
				v433.Parent = v318.EmitPoint;
			else
				v433.Parent = v318;
			end;
			l_TweenService_1:Create(v433, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v433:Emit(10);
			l_CollectionService_1:AddTag(v433, "SFXEffect");
			local v434 = v317.Beam:Clone();
			l_Debris_1:AddItem(v434, 60);
			if v318.Name == "Base" then
				v434.Parent = v318.EmitPoint;
			else
				v434.Parent = v318;
			end;
			l_TweenService_1:Create(v434, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v434:Emit(50);
			l_CollectionService_1:AddTag(v434, "SFXEffect");
			local v435 = v317.Fireflies:Clone();
			l_Debris_1:AddItem(v435, 60);
			if v318.Name == "Base" then
				v435.Parent = v318.EmitPoint;
			else
				v435.Parent = v318;
			end;
			l_TweenService_1:Create(v435, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v435:Emit(25);
			l_CollectionService_1:AddTag(v435, "SFXEffect");
			local v436 = v317.PulseRings:Clone();
			l_Debris_1:AddItem(v436, 60);
			if v318.Name == "Base" then
				v436.Parent = v318.EmitPoint;
			else
				v436.Parent = v318;
			end;
			l_TweenService_1:Create(v436, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v436, "SFXEffect");
			local v437 = v317.Lines:Clone();
			l_Debris_1:AddItem(v437, 60);
			v437.Parent = v318;
			l_TweenService_1:Create(v437, TweenInfo.new(60, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v437:Emit(50);
			l_CollectionService_1:AddTag(v437, "SFXEffect");
			local v438 = v317.Sparks:Clone();
			l_Debris_1:AddItem(v438, 60);
			if v318.Name == "Base" then
				v438.Parent = v318.EmitPoint;
			else
				v438.Parent = v318;
			end;
			l_TweenService_1:Create(v438, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v438:Emit(25);
			l_CollectionService_1:AddTag(v438, "SFXEffect");
			local v439 = v317.CrescentShockwave:Clone();
			l_Debris_1:AddItem(v439, 60);
			if v318.Name == "Base" then
				v439.Parent = v318.EmitPoint;
			else
				v439.Parent = v318;
			end;
			v439:Emit(25);
			l_CollectionService_1:AddTag(v439, "SFXEffect");
			local v440 = v317.ConstantFlame:Clone();
			l_Debris_1:AddItem(v440, 60);
			if v318.Name == "Base" then
				v440.Parent = v318.EmitPoint;
			else
				v440.Parent = v318;
			end;
			v440:Emit(25);
			l_CollectionService_1:AddTag(v440, "SFXEffect");
			local v441 = v317.Sparkles:Clone();
			l_Debris_1:AddItem(v441, 60);
			v441.Parent = v318;
			l_TweenService_1:Create(v441, TweenInfo.new(60, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			l_CollectionService_1:AddTag(v441, "SFXEffect");
			local v442 = v317.SolidShockwave:Clone();
			l_Debris_1:AddItem(v442, 60);
			if v318.Name == "Base" then
				v442.Parent = v318.EmitPoint;
			else
				v442.Parent = v318;
			end;
			v442:Emit(1);
			l_CollectionService_1:AddTag(v442, "SFXEffect");
			local v443 = v317.GlowFlash:Clone();
			l_Debris_1:AddItem(v443, 60);
			if v318.Name == "Base" then
				v443.Parent = v318.EmitPoint;
			else
				v443.Parent = v318;
			end;
			v443:Emit(1);
			l_CollectionService_1:AddTag(v443, "SFXEffect");
			local v444 = v317.ScatteredShockwave:Clone();
			l_Debris_1:AddItem(v444, 60);
			if v318.Name == "Base" then
				v444.Parent = v318.EmitPoint;
			else
				v444.Parent = v318;
			end;
			v444:Emit(1);
			l_CollectionService_1:AddTag(v444, "SFXEffect");
			local v445 = v317.SoftRing:Clone();
			l_Debris_1:AddItem(v445, 60);
			if v318.Name == "Base" then
				v445.Parent = v318.EmitPoint;
			else
				v445.Parent = v318;
			end;
			v445:Emit(1);
			l_CollectionService_1:AddTag(v445, "SFXEffect");
			local v446 = v317.SparklesExplosion:Clone();
			l_Debris_1:AddItem(v446, 60);
			if v318.Name == "Base" then
				v446.Parent = v318.EmitPoint;
			else
				v446.Parent = v318;
			end;
			v446:Emit(25);
			l_CollectionService_1:AddTag(v446, "SFXEffect");
			local v447 = v317.ThinRays:Clone();
			l_Debris_1:AddItem(v447, 60);
			if v318.Name == "Base" then
				v447.Parent = v318.EmitPoint;
			else
				v447.Parent = v318;
			end;
			l_TweenService_1:Create(v447, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v447:Emit(20);
			l_CollectionService_1:AddTag(v447, "SFXEffect");
			local v448 = v317.Rays:Clone();
			l_Debris_1:AddItem(v448, 60);
			if v318.Name == "Base" then
				v448.Parent = v318.EmitPoint;
			else
				v448.Parent = v318;
			end;
			l_TweenService_1:Create(v448, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v448:Emit(10);
			l_CollectionService_1:AddTag(v448, "SFXEffect");
			local v449 = v317.SurfaceShockwave:Clone();
			l_Debris_1:AddItem(v449, 60);
			if v318.Name == "Base" then
				v449.Parent = v318.EmitPoint;
			else
				v449.Parent = v318;
			end;
			l_TweenService_1:Create(v449, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			v449:Emit(1);
			l_CollectionService_1:AddTag(v449, "SFXEffect");
			local v450 = v317.RadicalHalo:Clone();
			l_Debris_1:AddItem(v450, 60);
			if v318.Name == "Base" then
				v450.Parent = v318.EmitPoint;
			else
				v450.Parent = v318;
			end;
			l_TweenService_1:Create(v450, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v450:Emit(5);
			l_CollectionService_1:AddTag(v450, "SFXEffect");
			local v451 = v317.SoftRadicalHalo:Clone();
			l_Debris_1:AddItem(v451, 60);
			if v318.Name == "Base" then
				v451.Parent = v318.EmitPoint;
			else
				v451.Parent = v318;
			end;
			l_TweenService_1:Create(v451, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Rate = 0
			}):Play();
			v451:Emit(5);
			l_CollectionService_1:AddTag(v451, "SFXEffect");
			local v452 = v317.PointLight:Clone();
			l_Debris_1:AddItem(v452, 60);
			v452.Parent = v318;
			v452.Enabled = true;
			l_TweenService_1:Create(v452, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Color = Color3.fromRGB(95, 170, 255)
			}):Play();
			l_TweenService_1:Create(v452, TweenInfo.new(30, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {
				Brightness = 0
			}):Play();
			l_CollectionService_1:AddTag(v452, "SFXEffect");
			v317:Destroy();
			return ;
		end;
	end);