-- some data from atlas

local API = {}

local Data = "V1"

local DataStoreService = game:GetService("DataStoreService")
local CustomizationStore = DataStoreService:GetDataStore('PlayerCustomizations' ..Data)


local CurrentBooth = DataStoreService:GetDataStore('PlayerCurrentBooth' ..Data)


function ColorToString(color)
	local r = color.R
	local g = color.G
	local b = color.B
	return tostring(r) .. ", " .. tostring(g) .. ", " .. tostring(b)
end

function GetColor3(colorString)

	local colorStringSplitted = string.split(colorString, ",")

	local V1 = tonumber(colorStringSplitted[1])
	local V2 = tonumber(colorStringSplitted[2])
	local V3 = tonumber(colorStringSplitted[3])

	return Color3.new(V1, V2, V3)

end

function API:SetCurrentBooth(TargetId, Booth)

	CurrentBooth:SetAsync(TargetId, Booth)
end

function API:GetCurrentBooth(TargetId)
	local Data = CurrentBooth:GetAsync(TargetId)
	if Data then
		return Data
	else
		return "BasicBooth"
	end
end

function API:SetCustomazation(TargetId, BoothData)
	CustomizationStore:SetAsync(TargetId, {
		text = BoothData.text or "your text here!";
		textFont = BoothData.textFont.Name or "GothamBlack";
		textColor = ColorToString(BoothData.textColor) or "255, 255, 255";
		strokeColor = ColorToString(BoothData.strokeColor) or "0, 0, 0";
		strokeOpacity = BoothData.strokeOpacity or 0.5;
		richText = BoothData.richText or true;
		buttonTextFont = BoothData.buttonTextFont.Name or "GothamBlack";
		buttonTextColor = ColorToString(BoothData.buttonTextColor) or "0, 0, 0";
		buttonStrokeColor = ColorToString(BoothData.buttonStrokeColor) or "0, 0, 0";
		buttonHoverColor = ColorToString(BoothData.buttonHoverColor) or "174, 254, 255";
		buttonColor = ColorToString(BoothData.buttonColor) or "0, 255, 17";
		buttonLayout = BoothData.buttonLayout or "Normal";
	})
	return
end

function API:GetCustomazation(TargetId)
	local BoothData = CustomizationStore:GetAsync(TargetId);
	if not BoothData then
		return {
			text = "your text here!";
			textFont = Enum.Font.GothamBlack;
			textColor = Color3.fromRGB(255, 255, 255);
			strokeColor = Color3.fromRGB(0, 0, 0);
			strokeOpacity = 0.5;
			richText = true;
			buttonTextFont = Enum.Font.GothamBlack;
			buttonTextColor = Color3.fromRGB(0, 0, 0);
			buttonStrokeColor = Color3.fromRGB(0, 0, 0);
			buttonHoverColor = Color3.fromRGB(174, 254, 255);
			buttonColor = Color3.fromRGB(0, 255, 17);
			buttonLayout = "Normal";
		}
	end

	return {
		text = BoothData.text or "your text here!";
		textFont = Enum.Font[BoothData.textFont] or Enum.Font.GothamBlack;
		textColor = GetColor3(BoothData.textColor) or Color3.fromRGB(255, 255, 255);
		strokeColor = GetColor3(BoothData.strokeColor) or Color3.fromRGB(0, 0, 0);
		strokeOpacity = BoothData.strokeOpacity or 0.5;
		richText = BoothData.richText or true;
		buttonTextFont = Enum.Font[BoothData.buttonTextFont] or Enum.Font.GothamBlack;
		buttonTextColor = GetColor3(BoothData.buttonTextColor) or Color3.fromRGB(0, 0, 0);
		buttonStrokeColor = GetColor3(BoothData.buttonStrokeColor) or Color3.fromRGB(0, 0, 0);
		buttonHoverColor = GetColor3(BoothData.buttonHoverColor) or Color3.fromRGB(174, 254, 255);
		buttonColor = GetColor3(BoothData.buttonColor) or Color3.fromRGB(0, 255, 17);
		buttonLayout = BoothData.buttonLayout or "Normal";
	}
end

function API:PurcharseBooth(TargetId, BoothId)
	local PlayerPurchasedBooths = DataStoreService:GetDataStore('PurchasedBoothsV9')
	local success, error = pcall(function()
		local currentBooths = PlayerPurchasedBooths:GetAsync(TargetId) or {}
		for _, booth in pairs(currentBooths) do
			if booth.BoothId == BoothId then
				warn("Player already owns this booth: " .. BoothId)
				return 
			end
		end
		local whenPurchased = tonumber(DateTime.now().UnixTimestampMillis)
		table.insert(currentBooths, {BoothId = BoothId, whenPurchased = whenPurchased})
		PlayerPurchasedBooths:SetAsync(TargetId, currentBooths)
	end)
	if not success then
		warn("Failed to save purchased booth: " .. tostring(error))
	end
end
function API:IsPlayerOwningBooth(TargetId, BoothId)
	local PlayerPurchasedBooths = DataStoreService:GetDataStore('PurchasedBoothsV9')
	local success, BoothData = pcall(function()
		return PlayerPurchasedBooths:GetAsync(TargetId)
	end)
	if not success then
		warn("Failed to check booth ownership: " .. tostring(BoothData))
		return false
	end
	if BoothData then
		for _, booth in pairs(BoothData) do
			if booth.BoothId == BoothId then
				return true
			end
		end
	end
	return false
end

function API:GetPlayerBooths(TargetId, BoothType)
	if BoothType == 'PurchasedBooths' then
		local PlayerPurchasedBooths = DataStoreService:GetDataStore('PurchasedBoothsV9')
		local BoothList = {}
		pcall(function()
			local data = PlayerPurchasedBooths:GetAsync(TargetId) or {}
			for _, booth in pairs(data) do
				table.insert(BoothList, booth)
			end
		end)
		print("BoothList for Player", TargetId, ": ", BoothList)
		return BoothList
	end
end

function API:GetBoothTimePurchased(TargetId, BoothId)
	local PlayerPurchasedBooths = DataStoreService:GetDataStore('PurchasedBoothsV9')
	local success, BoothData = pcall(function()
		return PlayerPurchasedBooths:GetAsync(TargetId)
	end)
	if not success then
		warn("Failed to retrieve booth purchase time: " .. tostring(BoothData))
		return nil
	end
	if BoothData then
		for _, booth in pairs(BoothData) do
			if booth.BoothId == BoothId then
				return tonumber(booth.whenPurchased);
			end
		end
	end
	return nil
end

return API
