local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create blur effect (store it in a variable so we can remove it later)
local blur = Instance.new("BlurEffect")
blur.Parent = Lighting
blur.Size = 24

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local uiScale = Instance.new("UIScale")
uiScale.Scale = 1.4
uiScale.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 360, 0, 160)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Size = UDim2.new(1, -70, 0, 50)
usernameLabel.Position = UDim2.new(0, 70, 0, 5)
usernameLabel.Text = ""
usernameLabel.TextColor3 = Color3.new(1, 1, 1)
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.GothamBold
usernameLabel.TextSize = 24
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
usernameLabel.Parent = mainFrame

local profileFrame = Instance.new("Frame")
profileFrame.Size = UDim2.new(0, 50, 0, 50)
profileFrame.Position = UDim2.new(0, 10, 0, 5)
profileFrame.BackgroundTransparency = 1
profileFrame.Parent = mainFrame

local profileImage = Instance.new("ImageLabel")
profileImage.Size = UDim2.new(1, 0, 1, 0)
profileImage.BackgroundTransparency = 1
profileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
profileImage.Parent = profileFrame

Instance.new("UICorner", profileImage).CornerRadius = UDim.new(5, 5)

local profileImageGradient = Instance.new("UIGradient")
profileImageGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
profileImageGradient.Rotation = 90
profileImageGradient.Parent = profileImage

local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.9, 0, 0, 25)
barBackground.Position = UDim2.new(0.05, 0, 0, 80)
barBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
barBackground.BorderSizePixel = 0
barBackground.Parent = mainFrame

Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 1, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
barFill.BorderSizePixel = 0
barFill.Parent = barBackground

Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 10)

local loadingTextLabel = Instance.new("TextLabel")
loadingTextLabel.Size = UDim2.new(0, 100, 0, 25)
loadingTextLabel.Position = UDim2.new(0.5, -50, 0, 115)
loadingTextLabel.BackgroundTransparency = 1
loadingTextLabel.Text = "Loading: 0%"
loadingTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingTextLabel.Font = Enum.Font.GothamBold
loadingTextLabel.TextSize = 18
loadingTextLabel.TextXAlignment = Enum.TextXAlignment.Center
loadingTextLabel.Parent = mainFrame

local closeHolder = Instance.new("Frame")
closeHolder.Size = UDim2.new(0, 70, 0, 28)
closeHolder.Position = UDim2.new(0.95, -35, 1, -170)
closeHolder.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeHolder.Parent = mainFrame

Instance.new("UICorner", closeHolder).CornerRadius = UDim.new(0, 10)

local closeStroke = Instance.new("UIStroke")
closeStroke.Thickness = 1.5
closeStroke.Color = Color3.fromRGB(150, 150, 150)
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
closeStroke.Parent = closeHolder

local closeGradient = Instance.new("UIGradient")
closeGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 100, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
closeGradient.Rotation = 90
closeGradient.Parent = closeHolder

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(1, 0, 1, 0)
closeButton.Text = "CLOSE"
closeButton.BackgroundTransparency = 1
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = closeHolder

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 75, 0, 30)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 70, 0, 28)}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    blur:Destroy()
    screenGui:Destroy()
end)

local centerHolder = Instance.new("Frame")
centerHolder.Size = UDim2.new(0, 140, 0, 50)
centerHolder.Position = UDim2.new(0.5, 0, 0.85, -220)
centerHolder.AnchorPoint = Vector2.new(0.5, 0.5)
centerHolder.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
centerHolder.Visible = false
centerHolder.Parent = screenGui

Instance.new("UICorner", centerHolder).CornerRadius = UDim.new(0, 12)

local centerStroke = Instance.new("UIStroke")
centerStroke.Thickness = 1.5
centerStroke.Color = Color3.fromRGB(180, 180, 180)
centerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
centerStroke.Parent = centerHolder

local centerGradient = Instance.new("UIGradient")
centerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(100, 100, 100)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
})
centerGradient.Rotation = 90
centerGradient.Parent = centerHolder

local centerButton = Instance.new("TextButton")
centerButton.Size = UDim2.new(1, 0, 1, 0)
centerButton.Text = "Run Script"
centerButton.BackgroundTransparency = 1
centerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
centerButton.Font = Enum.Font.GothamBold
centerButton.TextSize = 24
centerButton.Parent = centerHolder

centerButton.MouseEnter:Connect(function()
    TweenService:Create(centerHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 160, 0, 55)}):Play()
end)

centerButton.MouseLeave:Connect(function()
    TweenService:Create(centerHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 140, 0, 50)}):Play()
end)

centerButton.MouseButton1Click:Connect(function()
    blur:Destroy()
    screenGui:Destroy()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ThisIsDesirelesss/myscripts/refs/heads/main/best_parry.lua'))()
end)

local function typewriterEffect(text, label)
    while true do
        for i = 1, #text do
            label.Text = text:sub(1, i)
            task.wait(0.1)
        end
        task.wait(1)
        label.Text = ""
        task.wait(0.5)
    end
end

task.spawn(function()
    typewriterEffect(player.Name, usernameLabel)
end)

task.spawn(function()
    local duration = 15
    local startTime = tick()

    while tick() - startTime < duration do
        local progress = math.clamp((tick() - startTime) / duration, 0, 1)
        barFill.Size = UDim2.new(progress, 0, 1, 0)

        loadingTextLabel.Text = "Loading: " .. math.floor(progress * 100) .. "%"
        task.wait()
    end
    barFill.Size = UDim2.new(1, 0, 1, 0)

    task.wait(0.5)
    barBackground.Visible = false
    loadingTextLabel.Visible = false

    centerHolder.Visible = true
    centerHolder.BackgroundTransparency = 1
    centerButton.TextTransparency = 1

    TweenService:Create(centerHolder, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    TweenService:Create(centerButton, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
end)
