local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Slerp = ReplicatedStorage:WaitForChild("Slerp");
local RemoteEvents = Slerp:WaitForChild("RemoteEvents", 5);
local GolfCarts = {};
local CountDown = {};
ReplicatedStorage.Slerp.RemoteEvents.SpawnCarForLocalPlayer.OnServerEvent:Connect(function(player, kind)
	task.wait(0.015);
	if kind ~= ("GolfCart") then
		warn(("invalid cart name : "):format(kind));
		return;
	end;
	if CountDown[player.UserId] and (tick() - CountDown[player.UserId] < 0.25) then
		return;
	end;
	CountDown[player.UserId] = tick();
	if not game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, 1680669801) and not (player.Name == "") then
		return print("No gamepass found");
	end;
	local GolfCart = Slerp.Assets.Cars:WaitForChild("GolfCart"):Clone();
	local GolfCartId = ("%*%*%*%*%*%*%*%*%*%*"):format(math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9));
	local Drift = Slerp.Assets.Cars.Drift:Clone();
	local Character = player.Character
	local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	GolfCart.Parent = workspace;
	local RaycastParamsOk = RaycastParams.new();
	RaycastParamsOk.FilterDescendantsInstances = {humanoidRootPart.Parent}
	local raycastResult = workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -100, 0), RaycastParamsOk)
	local GroundY
	if raycastResult then
		GroundY = raycastResult.Position.Y
	else
		GroundY = 0
	end
	local TargetHeight = humanoidRootPart.Position.Y + 5
	if TargetHeight > GroundY + 15 then
		return
	end
	GolfCart.Chassis.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 5, 0)
	if GolfCarts[GolfCartId] then
		GolfCart:Destroy();
		return;
	end;
	GolfCarts[GolfCartId] = true;
	GolfCart:SetAttribute("Id", GolfCartId);
	GolfCart:SetAttribute("OwnerID", player.UserId);
	GolfCart.LicensePlates.LicensePlate.TextLabel.Text = ("@%*"):format(player.Name);
	GolfCart.LicensePlates.LicensePlate2.TextLabel.Text = ("@%*"):format(player.Name);
	local drift1 = game.ReplicatedStorage.Slerp.Assets.Cars.Drift:Clone()
	local drift2 = game.ReplicatedStorage.Slerp.Assets.Cars.Drift:Clone()
	local drift3 = game.ReplicatedStorage.Slerp.Assets.Cars.Drift:Clone()
	local drift4 = game.ReplicatedStorage.Slerp.Assets.Cars.Drift:Clone()
	--local LocalCamera = workspace.Camera.CameraSubject == GolfCart.Seats.DriverSeat
	drift1.Parent = GolfCart
	drift1.Name = "Drift1"
	drift2.Parent = GolfCart
	drift2.Name = "Drift2"
	drift3.Parent = GolfCart
	drift3.Name = "Drift3"
	drift4.Parent = GolfCart
	drift4.Name = "Drift4"
	local data = {
		centerOfMassForce = GolfCart.Chassis.CenterOfMassForce,
		driftSounds = {
			{
				sound = GolfCart.Chassis.Drift,
				volume = 0.5
			}
		},
		forwardEngineThrustCurve = {
			{0, 6000000},
			{45, 3000000},
			{70, 1500000},
			{80, 600000}
		},
		maxSteeringAngle = 0.5235987755982988,
		wheelRecords = {
			{
				suspensionVectorForce = GolfCart.Chassis.FrontLeftSpringForce,
				isDriveWheel = false,
				vectorForceAttachment = GolfCart.Chassis.VectorForce1.Attachment0,
				suspensionSpringAttachment = GolfCart.Chassis.FrontLeftSpringForce.Attachment0,
				currentLongitudinalResistance = 8809.292187500001,
				isTurnWheel = true,
				longitudinalResistance = 8809.292187500001,
				wheelRadius = 1.3128334283828736,
				suspensionSpringTargetHeight = 4.5,
				driftTrail = GolfCart.Drift1.Trail,
				vectorForce = GolfCart.Chassis.VectorForce1,
				lateralResistance = 440464.609375,
				suspensionSpringForceFactor = 3414090.0746739238,
				model = GolfCart.Wheels.FrontLeftWheel,
				driftTrailPart = GolfCart.Drift1,
				suspensionSpringDamping = 345676.62006073477,
				currentLateralResistance = 440464.609375,
				minLateralResistance = 26427.876562499998
			},
			{
				suspensionVectorForce = GolfCart.Chassis.FrontRightSpringForce,
				isDriveWheel = false,
				vectorForceAttachment = GolfCart.Chassis.VectorForce2.Attachment0,
				suspensionSpringAttachment = GolfCart.Chassis.FrontRightSpringForce.Attachment0,
				currentLongitudinalResistance = 8809.292187500001,
				isTurnWheel = true,
				longitudinalResistance = 8809.292187500001,
				wheelRadius = 1.3128334283828736,
				suspensionSpringTargetHeight = 4.5,
				driftTrail = GolfCart.Drift2.Trail,
				vectorForce = GolfCart.Chassis.VectorForce2,
				lateralResistance = 440464.609375,
				suspensionSpringForceFactor = 3414090.0746739238,
				model = GolfCart.Wheels.FrontRightWheel,
				driftTrailPart = GolfCart.Drift2,
				suspensionSpringDamping = 345676.62006073477,
				currentLateralResistance = 440464.609375,
				minLateralResistance = 26427.876562499998
			},
			{
				suspensionVectorForce = GolfCart.Chassis.RearLeftSpringForce,
				isDriveWheel = true,
				vectorForceAttachment = GolfCart.Chassis.VectorForce3.Attachment0,
				suspensionSpringAttachment = GolfCart.Chassis.RearLeftSpringForce.Attachment0,
				currentLongitudinalResistance = 8809.292187500001,
				isTurnWheel = false,
				longitudinalResistance = 8809.292187500001,
				wheelRadius = 1.4723296165466309,
				suspensionSpringTargetHeight = 4.933001480102539,
				driftTrail = GolfCart.Drift3.Trail,
				vectorForce = GolfCart.Chassis.VectorForce3,
				lateralResistance = 440464.609375,
				suspensionSpringForceFactor = 2841041.0641988047,
				model = GolfCart.Wheels.RearLeftWheel,
				driftTrailPart = GolfCart.Drift3,
				suspensionSpringDamping = 345676.62006073477,
				currentLateralResistance = 440464.609375,
				minLateralResistance = 17618.584375000002
			},
			{
				suspensionVectorForce = GolfCart.Chassis.RearRightSpringForce,
				isDriveWheel = true,
				vectorForceAttachment = GolfCart.Chassis.VectorForce4.Attachment0,
				suspensionSpringAttachment = GolfCart.Chassis.RearRightSpringForce.Attachment0,
				currentLongitudinalResistance = 8809.292187500001,
				isTurnWheel = false,
				longitudinalResistance = 8809.292187500001,
				wheelRadius = 1.4723657369613648,
				suspensionSpringTargetHeight = 4.933001480102539,
				driftTrail = GolfCart.Drift4.Trail,
				vectorForce = GolfCart.Chassis.VectorForce4,
				lateralResistance = 440464.609375,
				suspensionSpringForceFactor = 2841041.0641988047,
				model = GolfCart.Wheels.RearRightWheel,
				driftTrailPart = GolfCart.Drift4,
				suspensionSpringDamping = 345676.62006073477,
				currentLateralResistance = 440464.609375,
				minLateralResistance = 17618.584375000002
			}
		},
		chassisPart = GolfCart.Chassis,
		wheelBase = 9.841197967529297,
		angularVelocity = GolfCart.Chassis.AngularVelocity,
		targetGravity = 100,
		exhaustParticles = {
			{
				maxVel = 30,
				maxRate = 10,
				minVel = 5,
				particle = GolfCart.Body.ExhaustPipe.ExhaustPart2.ExhaustParticles.Cloud1,
				minRate = 2
			}
		},
		model = GolfCart,
		driveVectorForce = GolfCart.Chassis.DriveForce,
		owner = player,
		engineSounds = {
			{
				maxPlaybackSpeed = 2,
				maxVel = 120,
				minVel = 5,
				sound = GolfCart.Chassis.Engine,
				minPlaybackSpeed = 1
			}
		},
		reverseLightParts = {GolfCart.Body.Lights.LeftRearLight, GolfCart.Body.Lights.RightRearLight},
		steeringWheel = {
			leftHandAttachment = GolfCart.SteeringWheel.Main.LeftHand,
			rightHandAttachment = GolfCart.SteeringWheel.Main.RightHand,
			weld = GolfCart.SteeringWheel.Main.Weld
		},
		steeringAngle = 0,
		id = GolfCartId,
		torque = GolfCart.Chassis.Torque,
		reverseEngineThrustCurve = {
			{0, 4200000},
			{45, 1500000}
		},
		gravityForce = -100,
		frontLightParts = {GolfCart.Body.Lights.FrontLeftLight, GolfCart.Body.Lights.FrontRightLight},
		lateralFrictionCoeff = 6606969.140625,
		rollingResistanceCoeff = 12.8,
		lightsAreEnabled = false,
		dragCoeff = 0.4257,
		kind = "GolfCart",
		brakeForce = 5285575.3125,
		tailLightParts = {GolfCart.Body.Lights.RightRearIndicator, GolfCart.Body.Lights.LeftRearIndicator}
	};
	local Seats = {}
	for index, seat in pairs(GolfCart.Seats:GetChildren()) do
		if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
			local seatData = {
				occupant = seat.Occupant,
				seatPart = seat,
				proximityPrompt = seat.Attachment.Enter;
			}
			table.insert(Seats, seatData);
		end
	end
	local Data = {
		occupant = GolfCart.Seats.DriverSeat,
		id = GolfCartId,
		seats = Seats,
		driveSeatIndex = 6
	};
	RemoteEvents.Cars.RegisterCar:FireAllClients(data);
	RemoteEvents.CarSeats.RegisterCar:FireAllClients(Data);
	RemoteEvents.CarSeats.SetOccupant:FireAllClients(GolfCartId, Data.driveSeatIndex, player, true);
end);
RemoteEvents.DestroyCarsForLocalPlayer.OnServerEvent:Connect(function(player)
	task.wait(0.015);
	local GolfCartModel
	for _, _model in pairs(workspace:GetChildren()) do
		if _model:GetAttribute("OwnerID") == player.UserId then
			GolfCartModel = _model
		end;
	end;
	if not GolfCarts[GolfCartModel:GetAttribute("Id")] then
		GolfCartModel:Destroy()
		return;
	end;
	GolfCarts[GolfCartModel:GetAttribute("Id")] = nil
	GolfCartModel:Destroy();
	RemoteEvents.Cars.UnregisterCar:FireAllClients(GolfCartModel:GetAttribute("Id"));
	RemoteEvents.CarSeats.UnregisterCar:FireAllClients(GolfCartModel:GetAttribute("Id"));
end);
RemoteEvents.Cars.SetLightsAreEnabled.OnServerEvent:Connect(function(player, light)
	task.wait(0.015);
	local Golf
	for _, _model in pairs(workspace:GetChildren()) do
		if _model:GetAttribute("OwnerID") == player.UserId then
			Golf = _model
		end;
	end;
	return RemoteEvents.Cars.SetLightsAreEnabled:FireAllClients(Golf:GetAttribute("Id"), light);
end);
game.Players.PlayerAdded:Connect(function(player)
	task.wait(0.5);
	local userids = {};
	local Owner = 0;
	for _, golfCarts in pairs(workspace:GetChildren()) do
		if golfCarts:IsA("Model") then
			if golfCarts:GetAttribute("OwnerID") then
				table.insert(userids, golfCarts);
			end;
		end;
	end;
	for _, carClone in pairs(userids) do
		local Seats = {}
		for index, seat in pairs(carClone.Seats:GetChildren()) do
			if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
				local seatData = {
					occupant = nil,
					seatPart = seat,
					proximityPrompt = seat.Attachment.Enter;
				}
				table.insert(Seats, seatData);
			end
		end
		local data = {
			centerOfMassForce = carClone.Chassis.CenterOfMassForce,
			driftSounds = {
				{
					sound = carClone.Chassis.Drift,
					volume = 0.5
				}
			},
			forwardEngineThrustCurve = {
				{0, 6000000},
				{45, 3000000},
				{70, 1500000},
				{80, 600000}
			},
			maxSteeringAngle = 0.5235987755982988,
			wheelRecords = {
				{
					suspensionVectorForce = carClone.Chassis.FrontLeftSpringForce,
					isDriveWheel = false,
					vectorForceAttachment = carClone.Chassis.VectorForce1.Attachment0,
					suspensionSpringAttachment = carClone.Chassis.FrontLeftSpringForce.Attachment0,
					currentLongitudinalResistance = 8809.292187500001,
					isTurnWheel = true,
					longitudinalResistance = 8809.292187500001,
					wheelRadius = 1.3128334283828736,
					suspensionSpringTargetHeight = 4.5,
					driftTrail = carClone.Drift1.Trail,
					vectorForce = carClone.Chassis.VectorForce1,
					lateralResistance = 440464.609375,
					suspensionSpringForceFactor = 3414090.0746739238,
					model = carClone.Wheels.FrontLeftWheel,
					driftTrailPart = carClone.Drift1,
					suspensionSpringDamping = 345676.62006073477,
					currentLateralResistance = 440464.609375,
					minLateralResistance = 26427.876562499998
				},
				{
					suspensionVectorForce = carClone.Chassis.FrontRightSpringForce,
					isDriveWheel = false,
					vectorForceAttachment = carClone.Chassis.VectorForce2.Attachment0,
					suspensionSpringAttachment = carClone.Chassis.FrontRightSpringForce.Attachment0,
					currentLongitudinalResistance = 8809.292187500001,
					isTurnWheel = true,
					longitudinalResistance = 8809.292187500001,
					wheelRadius = 1.3128334283828736,
					suspensionSpringTargetHeight = 4.5,
					driftTrail = carClone.Drift2.Trail,
					vectorForce = carClone.Chassis.VectorForce2,
					lateralResistance = 440464.609375,
					suspensionSpringForceFactor = 3414090.0746739238,
					model = carClone.Wheels.FrontRightWheel,
					driftTrailPart = carClone.Drift2,
					suspensionSpringDamping = 345676.62006073477,
					currentLateralResistance = 440464.609375,
					minLateralResistance = 26427.876562499998
				},
				{
					suspensionVectorForce = carClone.Chassis.RearLeftSpringForce,
					isDriveWheel = true,
					vectorForceAttachment = carClone.Chassis.VectorForce3.Attachment0,
					suspensionSpringAttachment = carClone.Chassis.RearLeftSpringForce.Attachment0,
					currentLongitudinalResistance = 8809.292187500001,
					isTurnWheel = false,
					longitudinalResistance = 8809.292187500001,
					wheelRadius = 1.4723296165466309,
					suspensionSpringTargetHeight = 4.933001480102539,
					driftTrail = carClone.Drift3.Trail,
					vectorForce = carClone.Chassis.VectorForce3,
					lateralResistance = 440464.609375,
					suspensionSpringForceFactor = 2841041.0641988047,
					model = carClone.Wheels.RearLeftWheel,
					driftTrailPart = carClone.Drift3,
					suspensionSpringDamping = 345676.62006073477,
					currentLateralResistance = 440464.609375,
					minLateralResistance = 17618.584375000002
				},
				{
					suspensionVectorForce = carClone.Chassis.RearRightSpringForce,
					isDriveWheel = true,
					vectorForceAttachment = carClone.Chassis.VectorForce4.Attachment0,
					suspensionSpringAttachment = carClone.Chassis.RearRightSpringForce.Attachment0,
					currentLongitudinalResistance = 8809.292187500001,
					isTurnWheel = false,
					longitudinalResistance = 8809.292187500001,
					wheelRadius = 1.4723657369613648,
					suspensionSpringTargetHeight = 4.933001480102539,
					driftTrail = carClone.Drift4.Trail,
					vectorForce = carClone.Chassis.VectorForce4,
					lateralResistance = 440464.609375,
					suspensionSpringForceFactor = 2841041.0641988047,
					model = carClone.Wheels.RearRightWheel,
					driftTrailPart = carClone.Drift4,
					suspensionSpringDamping = 345676.62006073477,
					currentLateralResistance = 440464.609375,
					minLateralResistance = 17618.584375000002
				}
			},
			chassisPart = carClone.Chassis,
			wheelBase = 9.841197967529297,
			angularVelocity = carClone.Chassis.AngularVelocity,
			targetGravity = 100,
			exhaustParticles = {
				{
					maxVel = 30,
					maxRate = 10,
					minVel = 5,
					particle = carClone.Body.ExhaustPipe.ExhaustPart2.ExhaustParticles.Cloud1,
					minRate = 2
				}
			},
			model = carClone,
			driveVectorForce = carClone.Chassis.DriveForce,
			owner = game.Players:GetPlayerByUserId(carClone:GetAttribute("OwnerID")),
			engineSounds = {
				{
					maxPlaybackSpeed = 2,
					maxVel = 120,
					minVel = 5,
					sound = carClone.Chassis.Engine,
					minPlaybackSpeed = 1
				}
			},
			reverseLightParts = {carClone.Body.Lights.LeftRearLight, carClone.Body.Lights.RightRearLight},
			steeringWheel = {
				leftHandAttachment = carClone.SteeringWheel.Main.LeftHand,
				rightHandAttachment = carClone.SteeringWheel.Main.RightHand,
				weld = carClone.SteeringWheel.Main.Weld
			},
			steeringAngle = 0,
			id = carClone:GetAttribute("Id"),
			torque = carClone.Chassis.Torque,
			reverseEngineThrustCurve = {
				{0, 4200000},
				{45, 1500000}
			},
			gravityForce = -100,
			frontLightParts = {carClone.Body.Lights.FrontLeftLight, carClone.Body.Lights.FrontRightLight}, --carClone.Body.Lights.LeftRearLight, carClone.Body.Lights.RightRearLight
			lateralFrictionCoeff = 6606969.140625,
			rollingResistanceCoeff = 12.8,
			lightsAreEnabled = false,
			dragCoeff = 0.4257,
			kind = "GolfCart",
			brakeForce = 5285575.3125,
			tailLightParts = {carClone.Body.Lights.LeftRearIndicator, carClone.Body.Lights.RightRearIndicator}
		};
		local Data = {
			occupant = carClone.Seats.DriverSeat.Occupant,
			id = carClone:GetAttribute("Id"),
			seats = Seats,
			driveSeatIndex = 6
		};
		RemoteEvents.Cars.RegisterCar:FireClient(player, data);
		RemoteEvents.CarSeats.RegisterCar:FireClient(player, Data);
		RemoteEvents.CarSeats.SetOccupant:FireClient(player, carClone:GetAttribute("Id"), Data.driveSeatIndex, game.Players:GetPlayerByUserId(carClone:GetAttribute("OwnerID")), true);
	end	
end);
game.Players.PlayerRemoving:Connect(function(player)
	local GolfCartModel
	for _, _model in pairs(workspace:GetChildren()) do
		if _model:GetAttribute("OwnerID") == player.UserId then
			GolfCartModel = _model
		end;
	end;
	if not GolfCartModel then
		return;
	end
	if not GolfCarts[GolfCartModel:GetAttribute("Id")] then
		GolfCartModel:Destroy()
		return;
	end;
	GolfCarts[GolfCartModel:GetAttribute("Id")] = nil
	GolfCartModel:Destroy();
	RemoteEvents.Cars.UnregisterCar:FireAllClients(GolfCartModel:GetAttribute("Id"));
	RemoteEvents.CarSeats.UnregisterCar:FireAllClients(GolfCartModel:GetAttribute("Id"));
end);