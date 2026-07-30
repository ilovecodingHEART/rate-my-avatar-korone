local _players = game:GetService("Players");
local _replicatedstorge = game:GetService("ReplicatedStorage");
local _httpservice = game:GetService("HttpService");
local _datastoreservice = game:GetService("DataStoreService");
local _settingsdata = _datastoreservice:GetDataStore("SettingsV3");
local _remotes = require(_replicatedstorge:FindFirstChild("Remotes"));
local _defaultSettings = {
	['GlobalEffectsDisabled'] = false,
	['HighlightDonated'] = false,
	['PopupsDisabled'] = false,
	['HoverInfoDisabled'] = false,
	['ConvertUSD'] = false,
	['Anonymous'] = true,
	['Time'] = 11.8,
	['MusicVolume'] = 1,
	['SFXVolume'] = 1,
	['DonationSFXVolume'] = 1,
	['BoomboxVolume'] = 1,
};
local _settings = {};
_remotes.Function("GetSettings").OnServerInvoke = function(p1)
	if _settingsdata:GetAsync(p1.UserId) then
		local _data = _httpservice:JSONDecode(_settingsdata:GetAsync(p1.UserId));
		return {
			['GlobalEffectsDisabled'] = _data.GlobalEffectsDisabled,
			['HighlightDonated'] = _data.HighlightDonated,
			['PopupsDisabled'] = _data.PopupsDisabled,
			['HoverInfoDisabled'] = _data.HoverInfoDisabled,
			['ConvertUSD'] = _data.ConvertUSD,
			['Anonymous'] = _data.Anonymous,
			['Time'] = _data.Time,
			['MusicVolume'] = _data.MusicVolume,
			['SFXVolume'] = _data.SFXVolume,
			['DonationSFXVolume'] = _data.DonationSFXVolume,
			['BoomboxVolume'] = _data.BoomboxVolume,
		};
	else
		return _defaultSettings;
	end;
end;
_remotes.Function("SetSettings").OnServerInvoke = function(p1, p2)
	local _current = _httpservice:JSONDecode(p2);
	local _savetotable = _httpservice:JSONEncode(_current);
	print(_current);
	return _settingsdata:SetAsync(p1.UserId, _savetotable);
end;