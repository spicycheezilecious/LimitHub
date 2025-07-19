-- Lofi Pink UI Loader + LimitHub
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LimitHubUILoader"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- UI Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 1
frame.Parent = gui

-- Text Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 450, 0, 60)
label.Position = UDim2.new(0.5, -225, 0.8, 0)
label.BackgroundTransparency = 0.5
label.BackgroundColor3 = Color3.fromRGB(255, 192, 203) -- pink
label.Text = "🌸 Tuning LimitHub into your vibe..."
label.TextColor3 = Color3.fromRGB(255, 240, 250)
label.Font = Enum.Font.FredokaOne
label.TextScaled = true
label.Parent = frame

-- Rounded Corners
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 18)
uicorner.Parent = label

-- Fade-in
label.TextTransparency = 1
for i = 1, 10 do
	label.TextTransparency = 1 - i * 0.1
	wait(0.05)
end

-- Animated Dots
task.spawn(function()
	local baseText = "🌸 Tuning LimitHub into your vibe"
	local dots = ""
	while gui and gui.Parent do
		dots = dots == "..." and "" or dots .. "."
		label.Text = baseText .. dots
		wait(0.5)
	end
end)

-- Delay and load LimitHub
task.delay(1000, function()
	if gui then
		gui:Destroy()
	end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/spicycheezilecious/LimitHub/main/LimitHub_Loader.lua"))()
end)
