local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("Players")
local v_u_3 = {
	["Folder"] = script:WaitForChild("TicTacToe"),
	["BlankData"] = table.freeze(table.create(9, 0))
}
v_u_3.Nought = v_u_3.Folder:WaitForChild("Nought")
v_u_3.Cross = v_u_3.Folder:WaitForChild("Cross")
v_u_3.CorfirmTile = v_u_3.Folder:WaitForChild("ConfirmTile")
v_u_3.RejectTile = v_u_3.Folder:WaitForChild("RejectTile")
v_u_3.WinningPatterns = {
	{ 1, 2, 3 },
	{ 4, 5, 6 },
	{ 7, 8, 9 },
	{ 1, 4, 7 },
	{ 2, 5, 8 },
	{ 3, 6, 9 },
	{ 1, 5, 9 },
	{ 3, 5, 7 }
}
function v_u_3.CreateBlankData(p4) -- line: 21
	if p4 then
		return v_u_1:JSONEncode(table.create(9, 0))
	else
		return table.create(9, 0)
	end
end
function v_u_3.EncodeGameData(p5) -- line: 25
	return v_u_1:JSONEncode(p5)
end
function v_u_3.DecodeGameData(p6) -- line: 29
	return v_u_1:JSONDecode(p6)
end
function v_u_3.UpdateGameStatus(p7) -- line: 33
	local v6 = p7:GetAttribute("Player1")
	local v7 = p7:GetAttribute("Player2")
	local v8 = v_u_2:GetPlayerByUserId(v6)
	local v9 = v_u_2:GetPlayerByUserId(v7)
	local CurrentActive
	if v8 and v9 then
		local v12 = p7:GetAttribute("ActivePlayer")
		local v13 = v12 == v9.UserId
		local v14 = v12 == v8.UserId
		local v15 = v12 == nil
		local v16 = "ActivePlayer"
		local v10 = v12 == CurrentActive
		local v19 = CurrentActive == v8
		if v15 then
			CurrentActive = v8
		end
		if v13 then
			CurrentActive = v8
		elseif v14 then
			CurrentActive = v9
		end
		p7:SetAttribute(v16, CurrentActive.UserId)
		local v17 = "GameMessage"
		local v18
		if CurrentActive == v8 then
			v18 = ("%*\'s Turn\n<-----"):format(v8.DisplayName)
		elseif CurrentActive == v9 then
			v18 = ("%*\'s Turn\n----->"):format(v9.DisplayName)
		end
		p7:SetAttribute(v17, v18)
	else
		p7:SetAttribute("GameMessage", (v8 or v9) and "Waiting for an opponent" or "Waiting for players")
	end
end
function v_u_3.EvaluateResults(p19) -- line: 50
	for _, v20 in v_u_3.WinningPatterns do
		local v21 = v20[1]
		local v22 = v20[2]
		local v23 = v20[3]
		if p19[v21] == p19[v22] and p19[v22] == p19[v23] and p19[v21] ~= 0 then
			return p19[v21], v20
		end
	end
	return not table.find(p19, 0) and 0 or nil
end
return {
	["TicTacToe"] = v_u_3
}