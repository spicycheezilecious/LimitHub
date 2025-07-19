--// UI Loading Screen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

-- Full black background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0 -- 100% opacity
bg.Parent = screenGui

-- Loading bar frame
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0.4, 0, 0.05, 0)
loadingFrame.Position = UDim2.new(0.3, 0, 0.85, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

-- Fill for the loading bar
local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- pastel pink
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingFrame

-- Lofi label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.1, 0)
label.Position = UDim2.new(0, 0, 0.4, 0)
label.BackgroundTransparency = 1
label.Text = "Lofi vibes loading..."
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.Font = Enum.Font.GothamSemibold
label.Parent = screenGui

-- Animate the loading bar
for i = 1, 100 do
	loadingBar.Size = UDim2.new(i / 100, 0, 1, 0)
	wait(0.01) -- total 1 second animation
end

-- Load the main GitHub script
local success, err = pcall(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/spicycheezilecious/LimitHub/main/LimitHub_Loader.lua"))()
end)

-- Remove the UI after loading
screenGui:Destroy()

-- Optional: Error message if failed
if not success then
	warn("Failed to load script: " .. tostring(err))
end
