-- RateMyAvatarBooth / BoothClientUI (Script, RunContext = Client)
-- Original client-side editor UI. Builds a small "Edit Booth" popup on the
-- fly (so this kit stays a single self-contained, drag-in Model with no
-- StarterGui setup required) letting the owner set both a text message and
-- an image (via Roblox asset id).

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local booth = script.Parent
local tabletop = booth:WaitForChild("Tabletop")
local prompt = tabletop:WaitForChild("ProximityPrompt")

local remotes = booth:WaitForChild("Remotes")
local requestClaim = remotes:WaitForChild("RequestClaim")
local requestSaveBooth = remotes:WaitForChild("RequestSaveBooth")

local state = booth:WaitForChild("State")
local ownerUserId = state:WaitForChild("OwnerUserId")
local customTextValue = state:WaitForChild("CustomTextValue")
local customImageIdValue = state:WaitForChild("CustomImageIdValue")

local playerGui = player:WaitForChild("PlayerGui")

local screenGui -- built lazily the first time it's needed

local function notify(message)
	local gui = Instance.new("ScreenGui")
	gui.Name = "RateMyAvatarBoothNotice"
	gui.ResetOnSpawn = false
	gui.Parent = playerGui

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 320, 0, 44)
	label.Position = UDim2.new(0.5, -160, 0, 24)
	label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	label.BackgroundTransparency = 0.15
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextScaled = true
	label.Font = Enum.Font.GothamMedium
	label.Text = message
	label.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = label

	task.delay(2.5, function()
		gui:Destroy()
	end)
end

local function buildEditor()
	local gui = Instance.new("ScreenGui")
	gui.Name = "RateMyAvatarBoothEditor"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.Size = UDim2.new(0, 360, 0, 260)
	frame.Position = UDim2.new(0.5, -180, 0.5, -130)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
	frame.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = frame

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -20, 0, 36)
	title.Position = UDim2.new(0, 10, 0, 10)
	title.BackgroundTransparency = 1
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.Font = Enum.Font.GothamBold
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Text = "Customize Your Booth"
	title.Parent = frame

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -20, 0, 20)
	textLabel.Position = UDim2.new(0, 10, 0, 54)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.Gotham
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Text = "Sign message"
	textLabel.Parent = frame

	local textBox = Instance.new("TextBox")
	textBox.Name = "TextInput"
	textBox.Size = UDim2.new(1, -20, 0, 36)
	textBox.Position = UDim2.new(0, 10, 0, 76)
	textBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	textBox.PlaceholderText = "Say something..."
	textBox.ClearTextOnFocus = false
	textBox.Text = customTextValue.Value
	textBox.TextScaled = true
	textBox.Font = Enum.Font.Gotham
	textBox.Parent = frame

	local tCorner = Instance.new("UICorner")
	tCorner.CornerRadius = UDim.new(0, 8)
	tCorner.Parent = textBox

	local imageLabel = Instance.new("TextLabel")
	imageLabel.Size = UDim2.new(1, -20, 0, 20)
	imageLabel.Position = UDim2.new(0, 10, 0, 122)
	imageLabel.BackgroundTransparency = 1
	imageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	imageLabel.TextScaled = true
	imageLabel.Font = Enum.Font.Gotham
	imageLabel.TextXAlignment = Enum.TextXAlignment.Left
	imageLabel.Text = "Image asset id (numbers only, optional)"
	imageLabel.Parent = frame

	local imageBox = Instance.new("TextBox")
	imageBox.Name = "ImageInput"
	imageBox.Size = UDim2.new(1, -20, 0, 36)
	imageBox.Position = UDim2.new(0, 10, 0, 144)
	imageBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
	imageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	imageBox.PlaceholderText = "e.g. 12345678901"
	imageBox.ClearTextOnFocus = false
	imageBox.Text = customImageIdValue.Value
	imageBox.TextScaled = true
	imageBox.Font = Enum.Font.Gotham
	imageBox.Parent = frame

	local iCorner = Instance.new("UICorner")
	iCorner.CornerRadius = UDim.new(0, 8)
	iCorner.Parent = imageBox

	local saveButton = Instance.new("TextButton")
	saveButton.Name = "SaveButton"
	saveButton.Size = UDim2.new(0.48, -15, 0, 40)
	saveButton.Position = UDim2.new(0, 10, 1, -50)
	saveButton.BackgroundColor3 = Color3.fromRGB(70, 160, 90)
	saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	saveButton.Font = Enum.Font.GothamBold
	saveButton.TextScaled = true
	saveButton.Text = "Save"
	saveButton.Parent = frame

	local sCorner = Instance.new("UICorner")
	sCorner.CornerRadius = UDim.new(0, 8)
	sCorner.Parent = saveButton

	local cancelButton = Instance.new("TextButton")
	cancelButton.Name = "CancelButton"
	cancelButton.Size = UDim2.new(0.48, -15, 0, 40)
	cancelButton.Position = UDim2.new(0.52, 5, 1, -50)
	cancelButton.BackgroundColor3 = Color3.fromRGB(160, 70, 70)
	cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	cancelButton.Font = Enum.Font.GothamBold
	cancelButton.TextScaled = true
	cancelButton.Text = "Cancel"
	cancelButton.Parent = frame

	local cCorner = Instance.new("UICorner")
	cCorner.CornerRadius = UDim.new(0, 8)
	cCorner.Parent = cancelButton

	saveButton.MouseButton1Click:Connect(function()
		requestSaveBooth:FireServer(textBox.Text, imageBox.Text)
		gui:Destroy()
	end)

	cancelButton.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	return gui
end

local function openEditor()
	if screenGui then
		screenGui:Destroy()
		screenGui = nil
	end
	screenGui = buildEditor()
	screenGui.Parent = playerGui
end

prompt.Triggered:Connect(function(triggeringPlayer)
	if triggeringPlayer ~= player then
		return
	end

	if ownerUserId.Value == 0 then
		requestClaim:FireServer()
		task.wait(0.2) -- give replication a moment before opening the editor
		openEditor()
		return
	end

	if ownerUserId.Value ~= player.UserId then
		notify("This booth belongs to someone else!")
		return
	end

	openEditor()
end)
