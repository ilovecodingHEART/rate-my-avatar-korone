-- RateMyAvatarBooth / BoothServer (Script, RunContext = Server)
-- Original server-side logic for a claimable, customizable booth.
-- Wired to the existing "Rate My Avatar Booth" model layout:
--   Tabletop        (Part)         -- interaction point
--     ProximityPrompt              -- added by the injector
--   Banner (Part)
--     SurfaceGui
--       Frame
--         Description (TextLabel) -- shows the booth's custom sign text
--         Icon (ImageLabel)       -- shows the booth's custom image
--
-- Handles: claiming, text updates (chat-filtered), and image updates
-- (validated to a plain numeric Roblox asset id only -- no arbitrary URLs).

local Players = game:GetService("Players")
local TextService = game:GetService("TextService")

local booth = script.Parent

local tabletop = booth:WaitForChild("Tabletop")
local prompt = tabletop:WaitForChild("ProximityPrompt")

local banner = booth:WaitForChild("Banner")
local surfaceGui = banner:WaitForChild("SurfaceGui")
local frame = surfaceGui:WaitForChild("Frame")
local textLabel = frame:WaitForChild("Description")
local imageLabel = frame:WaitForChild("Icon")

local remotes = booth:WaitForChild("Remotes")
local requestClaim = remotes:WaitForChild("RequestClaim")
local requestSaveBooth = remotes:WaitForChild("RequestSaveBooth")

local state = booth:WaitForChild("State")
local ownerUserId = state:WaitForChild("OwnerUserId")
local customTextValue = state:WaitForChild("CustomTextValue")
local customImageIdValue = state:WaitForChild("CustomImageIdValue")

local MAX_TEXT_LEN = 60
local MAX_IMAGE_ID_DIGITS = 19
local DEFAULT_TEXT = "My Booth"

-- Cache resolved usernames so we don't hammer the API every refresh.
local nameCache = {}

local function getDisplayNameFor(userId)
	if userId == 0 then
		return nil
	end
	if nameCache[userId] then
		return nameCache[userId]
	end
	local ok, name = pcall(function()
		return Players:GetNameFromUserIdAsync(userId)
	end)
	if ok and name then
		nameCache[userId] = name
		return name
	end
	return "Player " .. tostring(userId)
end

local function refreshDisplay()
	textLabel.Text = customTextValue.Value ~= "" and customTextValue.Value or DEFAULT_TEXT

	if customImageIdValue.Value ~= "" then
		imageLabel.Image = "rbxassetid://" .. customImageIdValue.Value
	else
		imageLabel.Image = ""
	end

	if ownerUserId.Value == 0 then
		prompt.ObjectText = "Unclaimed Booth"
		prompt.ActionText = "Claim Booth"
	else
		local name = getDisplayNameFor(ownerUserId.Value)
		prompt.ObjectText = (name or "Someone") .. "'s Booth"
		prompt.ActionText = "Customize"
	end
end

local function sanitizeText(player, rawText)
	if typeof(rawText) ~= "string" then
		return DEFAULT_TEXT
	end

	rawText = rawText:sub(1, MAX_TEXT_LEN)

	local filtered = rawText
	local ok, result = pcall(function()
		local filterResult = TextService:FilterStringAsync(rawText, player.UserId)
		return filterResult:GetNonChatStringForBroadcastAsync()
	end)
	if ok and result and result ~= "" then
		filtered = result
	end

	if filtered == "" then
		filtered = DEFAULT_TEXT
	end

	return filtered
end

-- Only digits are ever accepted for the image id. This intentionally
-- rejects full URLs / rbxassetid:// prefixes / anything non-numeric so a
-- player can never inject arbitrary content, only a plain Roblox asset id
-- that Roblox's own moderation pipeline is responsible for.
local function sanitizeImageId(rawImageId)
	if typeof(rawImageId) ~= "string" then
		return ""
	end

	local digitsOnly = rawImageId:gsub("%D", "")

	if #digitsOnly > MAX_IMAGE_ID_DIGITS then
		digitsOnly = digitsOnly:sub(1, MAX_IMAGE_ID_DIGITS)
	end

	return digitsOnly
end

requestClaim.OnServerEvent:Connect(function(player)
	if ownerUserId.Value == 0 then
		ownerUserId.Value = player.UserId
		refreshDisplay()
	end
end)

requestSaveBooth.OnServerEvent:Connect(function(player, rawText, rawImageId)
	-- Must already own the booth (claiming happens separately/first).
	if ownerUserId.Value ~= player.UserId then
		return
	end

	customTextValue.Value = sanitizeText(player, rawText)
	customImageIdValue.Value = sanitizeImageId(rawImageId)

	refreshDisplay()
end)

refreshDisplay()
