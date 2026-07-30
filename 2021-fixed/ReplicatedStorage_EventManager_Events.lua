-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_DiscoEvent_0 = script:WaitForChild("DiscoEvent");
local l_Christmas25_0 = script:WaitForChild("Christmas25");
local AdidasEvent = script:WaitForChild("AdidasEvent");
local l_Config_0 = require(script.Parent:WaitForChild("Config"));
return {
    DiscoEvent = {
        Event = l_DiscoEvent_0, 
        PlayClient = l_DiscoEvent_0:WaitForChild("Play"), 
        PlayServer = l_DiscoEvent_0:WaitForChild("Server"), 
        InitClient = l_DiscoEvent_0:WaitForChild("Play"):FindFirstChild("Init") or false, 
        InitServer = l_DiscoEvent_0:WaitForChild("Server"):FindFirstChild("Init") or false, 
        Preloads = {
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").BreakDance, 
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").Dance1, 
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").Dance2, 
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").Golden, 
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").Slick, 
            l_DiscoEvent_0:WaitForChild("Assets"):WaitForChild("Animations").YourIdol
        }, 
        MapPositions = {
            Discoball = {
                Type = "Attachment", 
                CFrame = CFrame.new(0, 255.987, 0), 
                Descendants = {}
            }, 
            Rigs = {
                Type = "Part", 
                CFrame = l_Config_0.MapRoot, 
                Descendants = {
                    ["1"] = CFrame.new(0, -9.558, 550), 
                    ["2"] = CFrame.new(476.314, -9.558, 275) * CFrame.Angles(0, 1.0471975511965976, 0), 
                    ["3"] = CFrame.new(476.314, -9.558, -275) * CFrame.Angles(0, 2.0943951023931953, 0), 
                    ["4"] = CFrame.new(-0, -9.558, -550) * CFrame.Angles(0, 3.141592653589793, 0), 
                    ["5"] = CFrame.new(-476.314, -9.558, -275) * CFrame.Angles(0, -2.0943951023931953, 0), 
                    ["6"] = CFrame.new(-476.314, -9.558, 275) * CFrame.new(0, -1.0471975511965976, 0)
                }
            }
        }, 
        RunTime = 15
	}, 
	AdidasEvent = {
		Event = AdidasEvent;
		PlayClient = AdidasEvent:WaitForChild("Play");
		PlayServer = AdidasEvent:WaitForChild("Server");
		InitClient = AdidasEvent:WaitForChild("Play"):FindFirstChild("Init") or false;
		InitServer = AdidasEvent:WaitForChild("Server"):FindFirstChild("Init") or false;
		Preloads = {AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").Intro, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").ObjectLoop1, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").ObjectLoop2, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").ObjectLoop3, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").SmallExplosion1, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").SmallExplosion2, AdidasEvent:WaitForChild("Assets"):WaitForChild("Sound").DistantSmallExplosion3, "rbxassetid://113841564999368", "rbxassetid://113841564999368"};
		MapPositions = {
			MeteorPositions = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					start = CFrame.new(-1941.948, 1214.158, 39.336);
					["end"] = CFrame.new(-158.173, -11.557, -697.095);
					meteorExplosion = CFrame.new(-158.173, -11.557, -697.095);
					tsunamiWave = CFrame.new(-75, -15, -678.945) * CFrame.Angles((math.pi/2), (math.pi/2), 0);
					tsunamiWaveEnd = CFrame.new(-25.423, 70, -74.845) * CFrame.Angles(0, (math.pi/2), 0);
				};
			};
			SmallMeteor1 = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					['0'] = CFrame.new(-1941.948, 1214.158, 162.286);
					['1'] = CFrame.new(-1401.098, 688.008, 162.286);
					['2'] = CFrame.new(-851.523, 688.008, -460.864);
					['3'] = CFrame.new(-161.998, 350, -987.239);
					['4'] = CFrame.new(207.652, -9, -709.239);
				};
			};
			SmallMeteor2 = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					['0'] = CFrame.new(-1941.948, 1214.158, -89.714);
					['1'] = CFrame.new(-1401.098, 688.008, 489.361);
					['2'] = CFrame.new(-127.723, 178.908, 850);
					['3'] = CFrame.new(317.002, 96.358, 376.786);
					['4'] = CFrame.new(430.777, -9, -16.164);
				};
			};
			SmallMeteor3 = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					['0'] = CFrame.new(-1941.948, 1353.833, -10.289);
					['1'] = CFrame.new(-1401.098, 688.008, -1102.439);
					['2'] = CFrame.new(-950, 493.958, -1133.114);
					['3'] = CFrame.new(-212.723, 223, -52.639);
					['4'] = CFrame.new(-117.173, -9, -371.564);
				};
			};
			SmallMeteor4 = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					['0'] = CFrame.new(-1900, 1129.058, 10.289);
					['1'] = CFrame.new(347.052, 317.158, -11.464);
					['2'] = CFrame.new(330.752, 76.608, 411.911);
					['3'] = CFrame.new(-212.723, 125, 445.711);
					['4'] = CFrame.new(-362.673, -9, 295.386);
				};
			};
			SmallMeteor5 = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					['0'] = CFrame.new(-1900, 1189.183, -12.111);
					['1'] = CFrame.new(-49.648, 381.283, -220.139);
					['2'] = CFrame.new(-107.723, 41.583, -411.189);
					['3'] = CFrame.new(169.877, 52.05, -413.289);
					['4'] = CFrame.new(146.377, -9, -517.189);
				};
			};
			RiftPositions = {
				Type = "Attachment";
				CFrame = CFrame.new(0, 0, 0);
				Descendants = {
					start = CFrame.new(-1941.948, 1214.158, 39.336) * CFrame.Angles(0.14505431413324874, 0.3186273082440848, -1.983776134401795);
					above = CFrame.new(0, 125, 0);
				};
			};
		};
		RunTime = 150;
	};
    Christmas25 = {
        Event = l_Christmas25_0, 
        PlayClient = l_Christmas25_0:WaitForChild("Play"), 
        PlayServer = l_Christmas25_0:WaitForChild("Server"), 
        InitClient = l_Christmas25_0:WaitForChild("Play"):FindFirstChild("Init") or false, 
        InitServer = l_Christmas25_0:WaitForChild("Server"):FindFirstChild("Init") or false, 
        Preloads = {
            l_Christmas25_0:WaitForChild("Assets"):WaitForChild("Sound").ChristmasEvent, 
            "rbxassetid://85150192536628"
        }, 
        MapPositions = {
            component_positions = {
                Type = "Attachment", 
                CFrame = CFrame.new(0, 0, 0), 
                Descendants = {
                    startCrystal = CFrame.new(0, 35, 0), 
                    endCrystal = CFrame.new(0, 55, 0), 
                    presentStart = CFrame.new(247.827, 349.891, -467.435), 
                    presentEnd = CFrame.new(247.827, 18.141, -467.435)
                }
            }, 
            weather_positions = {
                Type = "Attachment", 
                CFrame = CFrame.new(0, 0, 0), 
                Descendants = {
                    snow_flurry = CFrame.new(0, 51.338, 0), 
                    snow_floor_start = CFrame.new(0, -30, 0), 
                    snow_floor_end = CFrame.new(0, -15, 0), 
                    ice_cube_start = CFrame.new(0, -10, 0), 
                    ice_cube_end = CFrame.new(0, 5, 0)
                }
            }
        }, 
        RunTime = 50
    }
};