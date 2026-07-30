-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remote = ReplicatedStorage:FindFirstChild("AITextSuggestion")

if not Remote then
	Remote = Instance.new("RemoteFunction")
	Remote.Name = "AITextSuggestion"
	Remote.Parent = ReplicatedStorage
end

local apikey = "hf_YOUR_TOKEN_HERE" -- [2021] the decompile shipped a live Hugging Face token here; redacted before publishing. Drop your own key in if you rebuild this.

local apiendpoint = "https://router.huggingface.co/v1/chat/completions" -- also this doesnt matter keep this here

local modelai = "Qwen/Qwen2.5-7B-Instruct:together"

local function fetchsuggestions(userText)

	local body = {
		model = modelai,

                -- this is easily configable
		messages = {
			{
				role = "system",
				content =
				"you are a pls donate AI, you are not allowed to put anything (and i mean) anything above 15-20 words anything above that is not allowed and not supported for you do not MESS or have slurs in ur Suggestions a example of what you need to do is give people good Booth Text Suggestions and finish sentences like pls donate (you finish the sentence)"
			},

			{
				role = "user",
				content = userText
			}
		},

		temp = 0.8,
		token = 15 --im ad umbass i forgot i could change msg lenght with this
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = apiendpoint,
			Method = "POST",
			Headers = {
				["Authorization"] = "Bearer " .. apikey,
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode(body)
		})
	end)

	if not success then
		warn("http caused it to fail error")
		return false
	end

	if not response.Success then
		warn("api error:", response.StatusCode, response.Body)
		return false
	end

	local decoded = HttpService:JSONDecode(response.Body)

	if decoded.choices and decoded.choices[1] then
		local text = decoded.choices[1].message.content

		text = text:gsub("\n", "")
		text = text:gsub("\"", "")
		text = text:gsub("%.$", "")

		return text
	end

	return false
end

Remote.OnServerInvoke = function(player, text)

	if typeof(text) ~= "string" then return false end
	if #text > 200 then return false end

	local result = fetchsuggestions(text)

	return result

end