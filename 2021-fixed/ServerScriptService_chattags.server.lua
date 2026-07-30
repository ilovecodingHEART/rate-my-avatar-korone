-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x2, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local _players = game:GetService('Players')
local _groupId = 125814458
local _partners = {
	["Haz3mn"] = true;
	["Olix"] = true;
	[""] = true;
	["1"] = true;
}
local _secrets = {
	[5502332040] = true;
	[1] = true;
};
local _testingclr = Color3.fromRGB(255, 107, 230);
local _datastore = game:GetService("DataStoreService"):GetDataStore("PlayerVIPV2");
local _vip = {};
_players.PlayerAdded:Connect(function(p1)
	p1.CharacterAdded:Connect(function(chr)
		if _datastore:GetAsync(p1.UserId) then
			_vip[p1.UserId] = true;
		else
			_vip[p1.UserId] = false;
		end;
		p1:SetAttribute("ChatTags", "");
		local _roles = {
			['Developer'] = ('<font color="rgb(255, 80, 80)">[%s]</font>'):format("👑 Developer"),
			['Manager'] = ('<font color="rgb(255, 80, 80)">[%s]</font>'):format("🔧 Manager"),
			['Staff'] = ('<font color="rgb(255, 160, 0)">[%s]</font>'):format("🔧 Staff"),
			['Fan'] = ('<font color="rgb(50, 255, 50)">[%s]</font>'):format("✨ Fan"),
			['Partner'] = ('<font color="rgb(255, 100, 0)">[%s]</font>'):format("🔥 Partner"),
			['VIP'] = ('<font color="rgb(255, 196, 0)">[%s]</font>'):format("⚡ VIP"),
		};
		local _rank = p1:GetRankInGroup(_groupId)
		local _role = "";
		if _rank == 254 or p1.Name == "IlIIllIIlIlIlIIII" then
			_role = _roles.Developer
		--elseif _rank == 253 then
		--	_role = _roles.Manager
		elseif _rank == 253 then 
			_role = _roles.Staff
		--elseif _rank == 100 or _partners[p1.Name] then
		--	_role = _roles.Partner
		elseif _rank == 1 then
			_role = _roles.Fan
		else
			_role = "";
		end
		if _vip[p1.UserId] == true then
			_role = ("%s %s"):format(_roles.VIP, _role);
		end;
		if _role ~= "" then
			p1:SetAttribute("ChatTags", _role .. " ");
		end;
	end);
end);