local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Remote = ReplicatedStorage:WaitForChild("FetchAnswer")

local apikey = "hf_YOUR_TOKEN_HERE" -- [2021] the decompile shipped a live Hugging Face token here; redacted before publishing. Drop your own key in if you rebuild this.
local apiendpoint = "https://router.huggingface.co/v1/chat/completions"

local modelai = "Qwen/Qwen2.5-7B-Instruct:together"

local function GetAIResponse(userMessage)

	local body = {
		model = modelai,

		messages = {
			{
				role = "system",
				content = "be helpful and dont make text bold"
			},
			{
				role = "user",
				content = userMessage
			}
		},

		temperature = 0.5,
		token = 200
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = apiendpoint,
			Method = "POST",
			Headers = {
				["Authorization"] = "Bearer " .. apikey,
			},
			Body = HttpService:JSONEncode(body)
		})
	end)

	if not success or not response.Success then
		warn("http request failed (mad annoying):", response and response.StatusCode, response and response.Body)
		return "..."
	end
	
	local decoded = HttpService:JSONDecode(response.Body)

	if decoded and decoded.choices and decoded.choices[1] then
		return decoded.choices[1].message.content
	end

	return "no response.."
end

Remote.OnServerEvent:Connect(function(player, message)

	if typeof(message) ~= "string" then return end
	if #message > 200 then return end

	local reply = GetAIResponse(message)

	Remote:FireClient(player, nil, reply)

end)