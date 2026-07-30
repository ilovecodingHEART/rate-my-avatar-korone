--[[
       
       Weld credits to @volt.qq - @VerySecretVolt.

]]

-- << Serices >> -- 

local _replicatedstorge = game:GetService("ReplicatedStorage");
local _datastoreservice = game:GetService("DataStoreService");
local _remotesmodule = require(_replicatedstorge:FindFirstChild("Remotes"));
local _alljetids = {};

-- << Events >> --

_replicatedstorge.Slerp.RemoteEvents.EquipJetpack.OnServerEvent:Connect(function(p1)
	local _characterweld = Instance.new("RigidConstraint")
	local _attachweld = Instance.new("Attachment", p1.Character.UpperTorso);
	_attachweld.Name = "JetpackWeld";
	local _jetpack = _replicatedstorge.Slerp.Assets.Jetpacks.Jetpack:Clone();
	_characterweld.Parent = _jetpack
	_characterweld.Name = "CharacterWeld"
	_characterweld.Attachment0 = _jetpack.Root.Force
	_jetpack.Parent = workspace.Jetpacks
	_jetpack.CharacterWeld.Attachment1 = _attachweld;
	local _jetid = ("%*%*%*%*%*%*%*%*%*%*"):format(math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9), math.random(1, 9));
	_alljetids[_jetid] = true;
	_jetpack:SetAttribute("Id", _jetid);
	_jetpack:SetAttribute("OwnerID", p1.UserId);
	_replicatedstorge.Slerp.RemoteEvents.Jetpack.AddJetpack:FireAllClients({
		["id"] = _jetid;
		["model"] = _jetpack;
		["root"] = _jetpack.Root;
		["owner"] = p1;
		["thrustSounds"] = {{sound = _jetpack.Root.JetpackThrust, minThrottle = 0.25, maxThrottle = 0.15, maxPlaybackSpeed = 0, minPlaybackSpeed = 0.25}};
		["endSound"] = _jetpack.Root.JetpackEnd;
		["startSound"] = _jetpack.Root.JetpackStart;
	});
end);
_replicatedstorge.Slerp.RemoteEvents.UnequipJetpack.OnServerEvent:Connect(function(p1)
	local _jetmodel
	for _, _model in pairs(workspace.Jetpacks:GetChildren()) do
		if _model:GetAttribute("OwnerID") == p1.UserId then
			_jetmodel = _model
		end;
	end;
	for _, _attachment in pairs(p1.Character.UpperTorso:GetChildren()) do
		if _attachment:IsA("Attachment") and _attachment.Name == "JetpackWeld" then
			_attachment:Destroy()
		end;
	end;
	if not _alljetids[_jetmodel:GetAttribute("Id")] then
		_jetmodel:Destroy()
		return;
	end;
	_alljetids[_jetmodel:GetAttribute("Id")] = nil
	_jetmodel:Destroy()
	_replicatedstorge.Slerp.RemoteEvents.Jetpack.RemoveJetpack:FireAllClients(_jetmodel:GetAttribute("Id"))
end);