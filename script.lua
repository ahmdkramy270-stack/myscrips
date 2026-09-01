-- HSH X 2026 | Anime Ability Arena Ultimate Script (Fixed Jump Bug + Gold Theme)
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui") or lp:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local CORRECT_KEY = "HSH2026"

-- جلب صورة البروفايل مسبقاً
local userThumbnail = ""
do
    local success, content = pcall(function()
        return Players:GetUserThumbnailAsync(lp.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success and content then userThumbnail = content end
end

-- 0. نظام المفتاح أول ما يشتغل السكريبت
local function CreateKeySystem()
    local KeyGui = Instance.new("ScreenGui", CoreGui)
    KeyGui.Name = "HSH_KeyGui"
    KeyGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame", KeyGui)
    Frame.Size = UDim2.new(0, 310, 0, 160)
    Frame.Position = UDim2.new(0.5, -155, 0.5, -80)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", Frame).Color = Color3.fromRGB(255, 215, 0)

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.Text = "HSH X - ENTER KEY (HSH2026)"
    Title.TextColor3 = Color3.fromRGB(255, 215, 0)
    Title.TextSize = 13
    Title.Font = Enum.Font.GothamBold

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(0.85, 0, 0, 40)
    Box.Position = UDim2.new(0.075, 0, 0.35, 0)
    Box.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.PlaceholderText = "Enter Key here..."
    Box.Text = ""
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 8)

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.85, 0, 0, 35)
    Btn.Position = UDim2.new(0.075, 0, 0.7, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Btn.TextColor3 = Color3.fromRGB(10, 10, 10)
    Btn.Text = "SUBMIT"
    Btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()
        if Box.Text == CORRECT_KEY then
            KeyGui:Destroy()
            StartIntro()
        else
            Box.Text = ""
            Box.PlaceholderText = "Wrong Key! Try HSH2026"
        end
    end)
end

-- 1. الإنترو
function StartIntro()
    local IntroGui = Instance.new("ScreenGui", CoreGui)
    IntroGui.Name = "HSH_IntroGui"
    IntroGui.ResetOnSpawn = false

    local Background = Instance.new("Frame", IntroGui)
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(10, 10, 12)

    local NameLabel = Instance.new("TextLabel", Background)
    NameLabel.Size = UDim2.new(0, 600, 0, 50)
    NameLabel.Position = UDim2.new(0.5, -300, 0.12, 0)
    NameLabel.BackgroundTransparency = 1
    NameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    NameLabel.Text = "ANIME ABILITY ARENA"
    NameLabel.TextSize = 22
    NameLabel.Font = Enum.Font.GothamBold

    local ProfileImage = Instance.new("ImageLabel", Background)
    ProfileImage.Size = UDim2.new(0, 170, 0, 170)
    ProfileImage.Position = UDim2.new(0.5, -85, 0.32, 0)
    ProfileImage.BackgroundTransparency = 1
    ProfileImage.Image = userThumbnail
    Instance.new("UICorner", ProfileImage).CornerRadius = UDim.new(1, 0)

    local BottomMsg = Instance.new("TextLabel", Background)
    BottomMsg.Size = UDim2.new(0, 700, 0, 60)
    BottomMsg.Position = UDim2.new(0.5, -350, 0.72, 0)
    BottomMsg.BackgroundTransparency = 1
    BottomMsg.TextColor3 = Color3.fromRGB(255, 215, 0)
    BottomMsg.Text = "HSH X 2026 - Welcome"
    BottomMsg.TextSize = 20
    BottomMsg.Font = Enum.Font.GothamBold

    local Sound = Instance.new("Sound", Workspace)
    Sound.SoundId = "rbxassetid://105065352580494"
    Sound.Volume = 2
    Sound:Play()

    task.spawn(function()
        local startTime = tick()
        while tick() - startTime < 8 do
            ProfileImage.Rotation = ProfileImage.Rotation + 5
            task.wait(0.02)
        end
    end)

    task.delay(8, function()
        pcall(function() Sound:Stop(); Sound:Destroy(); IntroGui:Destroy() end)
        ShowLangSelection()
    end)
end

-- 2. شاشة اختيار اللغة
function ShowLangSelection()
    local LangGui = Instance.new("ScreenGui", CoreGui)
    LangGui.Name = "HSH_LangGui"
    LangGui.ResetOnSpawn = false

    local LangFrame = Instance.new("Frame", LangGui)
    LangFrame.Size = UDim2.new(0, 310, 0, 190)
    LangFrame.Position = UDim2.new(0.5, -155, 0.5, -95)
    LangFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    Instance.new("UICorner", LangFrame).CornerRadius = UDim.new(0, 14)
    Instance.new("UIStroke", LangFrame).Color = Color3.fromRGB(255, 215, 0)

    local LangTitle = Instance.new("TextLabel", LangFrame)
    LangTitle.Size = UDim2.new(1, 0, 0, 45)
    LangTitle.BackgroundTransparency = 1
    LangTitle.Text = "CHOOSE LANGUAGE / اختر اللغات"
    LangTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    LangTitle.TextSize = 12
    LangTitle.Font = Enum.Font.GothamBold

    local ArBtn = Instance.new("TextButton", LangFrame)
    ArBtn.Size = UDim2.new(0.42, 0, 0, 55)
    ArBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
    ArBtn.BackgroundColor3 = Color3.fromRGB(35, 120, 70)
    ArBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ArBtn.Text = "🇸🇦 العربية"
    Instance.new("UICorner", ArBtn).CornerRadius = UDim.new(0, 10)

    local EnBtn = Instance.new("TextButton", LangFrame)
    EnBtn.Size = UDim2.new(0.42, 0, 0, 55)
    EnBtn.Position = UDim2.new(0.53, 0, 0.45, 0)
    EnBtn.BackgroundColor3 = Color3.fromRGB(45, 85, 160)
    EnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    EnBtn.Text = "🇺🇸 English"
    Instance.new("UICorner", EnBtn).CornerRadius = UDim.new(0, 10)

    ArBtn.MouseButton1Click:Connect(function() LangGui:Destroy(); InitMain(true) end)
    EnBtn.MouseButton1Click:Connect(function() LangGui:Destroy(); InitMain(false) end)
end

-- 3. الواجهة الرئيسية
function InitMain(isAr)
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "HSH_Main"
    ScreenGui.ResetOnSpawn = false

    local ProfileBtn = Instance.new("ImageButton", ScreenGui)
    ProfileBtn.Size = UDim2.new(0, 42, 0, 42)
    ProfileBtn.Position = UDim2.new(0.04, 0, 0.25, 0)
    ProfileBtn.Image = userThumbnail
    ProfileBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    ProfileBtn.Active = true; ProfileBtn.Draggable = true
    Instance.new("UICorner", ProfileBtn).CornerRadius = UDim.new(1, 0)
    
    local ProfileStroke = Instance.new("UIStroke", ProfileBtn)
    ProfileStroke.Color = Color3.fromRGB(255, 215, 0)
    ProfileStroke.Thickness = 2

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 230, 0, 415)
    MainFrame.Position = UDim2.new(0.04, 50, 0.25, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.Active = true; MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(255, 215, 0)

    local TitleHeader = Instance.new("TextLabel", MainFrame)
    TitleHeader.Size = UDim2.new(1, 0, 0, 30)
    TitleHeader.BackgroundTransparency = 1
    TitleHeader.TextColor3 = Color3.fromRGB(255, 215, 0)
    TitleHeader.Text = "👑 HSH X ARENA"
    TitleHeader.TextSize = 12
    TitleHeader.Font = Enum.Font.GothamBold

    local function CreateButton(name, posY)
        local btn = Instance.new("TextButton", MainFrame)
        btn.Size = UDim2.new(0.9, 0, 0, 30)
        btn.Position = UDim2.new(0.05, 0, 0, posY)
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = name
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        return btn
    end

    local EspBtn = CreateButton(isAr and "👁️ كشف الأماكن: مغلق" or "👁️ ESP: OFF", 35)
    local SmoothBtn = CreateButton(isAr and "🎮 اللعب السلس: مفعل" or "🎮 Smooth Play: ON", 70)
    local AimbotBtn = CreateButton(isAr and "🎯 تثبيت الإيم: مغلق" or "🎯 Aimbot: OFF", 105)
    local LockModeBtn = CreateButton(isAr and "🔒 نمط التثبيت: ثابت (Fixed)" or "🔒 Lock Mode: Fixed", 140)
    local FovBtn = CreateButton(isAr and "⭕ دائرة الإيم: مغلق" or "⭕ FOV Circle: OFF", 175)
    local FovSizeBtn = CreateButton(isAr and "📐 حجم الدائرة: 100" or "📐 FOV Size: 100", 210)
    local JumpBtn = CreateButton(isAr and "🦘 قوة القفز: 50" or "🦘 Jump Power: 50", 245)
    local SpeedBtn = CreateButton(isAr and "⚡ السرعة: عادية (16)" or "⚡ Speed: Normal (16)", 280)
    local BlockPlayerBtn = CreateButton(isAr and "🛡️ منع التداخل مع اللاعبين: مغلق" or "🛡️ Anti-Collision: OFF", 315)
    local PassPlayerBtn = CreateButton(isAr and "👻 اختراق اللاعبين: مغلق" or "👻 Pass Players: OFF", 350)

    local isOpen = true
    ProfileBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        MainFrame.Visible = isOpen
    end)

    -- ESP
    local espEnabled = false
    local espBoxes = {}
    EspBtn.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        EspBtn.Text = espEnabled and (isAr and "👁️ كشف الأماكن: مفعل" or "👁️ ESP: ON") or (isAr and "👁️ كشف الأماكن: مغلق" or "👁️ ESP: OFF")
        EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(35, 35, 48)
        
        if espEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= lp then
                    local hl = Instance.new("Highlight", player.Character or player.CharacterAdded:Wait())
                    hl.FillColor = Color3.fromRGB(255, 215, 0)
                    table.insert(espBoxes, hl)
                end
            end
        else
            for _, h in ipairs(espBoxes) do if h then h:Destroy() end end
            espBoxes = {}
        end
    end)

    -- Smooth Play
    local smoothEnabled = true
    SmoothBtn.MouseButton1Click:Connect(function()
        smoothEnabled = not smoothEnabled
        SmoothBtn.Text = smoothEnabled and (isAr and "🎮 اللعب السلس: مفعل" or "🎮 Smooth Play: ON") or (isAr and "🎮 اللعب السلس: مغلق" or "🎮 Smooth Play: OFF")
        SmoothBtn.BackgroundColor3 = smoothEnabled and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(35, 35, 48)
    end)

    -- Aimbot & Modes
    local aimbotEnabled = false
    local lockMode = "Fixed"
    local lockedTarget = nil

    AimbotBtn.MouseButton1Click:Connect(function()
        aimbotEnabled = not aimbotEnabled
        AimbotBtn.Text = aimbotEnabled and (isAr and "🎯 تثبيت الإيم: مفعل" or "🎯 Aimbot: ON") or (isAr and "🎯 تثبيت الإيم: مغلق" or "🎯 Aimbot: OFF")
        AimbotBtn.BackgroundColor3 = aimbotEnabled and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(35, 35, 48)
        if not aimbotEnabled then lockedTarget = nil end
    end)

    LockModeBtn.MouseButton1Click:Connect(function()
        if lockMode == "Fixed" then
            lockMode = "Smooth"
            LockModeBtn.Text = isAr and "🔒 نمط التثبيت: سلس (Smooth)" or "🔒 Lock Mode: Smooth"
        else
            lockMode = "Fixed"
            LockModeBtn.Text = isAr and "🔒 نمط التثبيت: ثابت (Fixed)" or "🔒 Lock Mode: Fixed"
        end
        lockedTarget = nil
    end)

    local function GetClosestTarget()
        local closest = nil
        local shortestDist = math.huge
        local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                local hrp = player.Character.HumanoidRootPart
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closest = hrp
                    end
                end
            end
        end
        return closest
    end

    -- FOV Circle & Sizer
    local fovEnabled = false
    local fovSizes = {30, 40, 60, 90, 120, 150, 200}
    local fovSizeIdx = 4
    local currentFovRadius = 100

    local FovDrawing = Drawing.new("Circle")
    FovDrawing.Visible = false
    FovDrawing.Thickness = 1
    FovDrawing.NumSides = 32
    FovDrawing.Color = Color3.fromRGB(255, 215, 0)
    FovDrawing.Transparency = 0.6
    FovDrawing.Filled = false

    FovBtn.MouseButton1Click:Connect(function()
        fovEnabled = not fovEnabled
        FovBtn.Text = fovEnabled and (isAr and "⭕ دائرة الإيم: مفعل" or "⭕ FOV Circle: ON") or (isAr and "⭕ دائرة الإيم: مغلق" or "⭕ FOV Circle: OFF")
        FovDrawing.Visible = fovEnabled
    end)

    FovSizeBtn.MouseButton1Click:Connect(function()
        fovSizeIdx = (fovSizeIdx % #fovSizes) + 1
        currentFovRadius = fovSizes[fovSizeIdx]
        FovSizeBtn.Text = isAr and ("📐 حجم الدائرة: " .. currentFovRadius) or ("📐 FOV Size: " .. currentFovRadius)
    end)

    RunService.RenderStepped:Connect(function()
        local vp = Camera.ViewportSize
        if fovEnabled then
            FovDrawing.Position = Vector2.new(vp.X / 2, vp.Y / 2)
            FovDrawing.Radius = currentFovRadius
        end

        if aimbotEnabled then
            if lockedTarget then
                local char = lockedTarget.Parent
                local hum = char and char:FindFirstChild("Humanoid")
                if not hum or hum.Health <= 0 then
                    lockedTarget = nil
                end
            end

            if not lockedTarget then
                lockedTarget = GetClosestTarget()
            end

            if lockedTarget then
                if lockMode == "Fixed" then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, lockedTarget.Position)
                else
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, lockedTarget.Position), 0.25)
                end
            end
        end
    end)

    -- خيارات القفز الأمنة والمنطقية (تم ربطها بـ JumpPower الحقيقي بدون طيران خارجي)
    local jumpPowers = {50, 52, 55, 58, 60}
    local jumpIdx = 1

    JumpBtn.MouseButton1Click:Connect(function()
        jumpIdx = (jumpIdx % #jumpPowers) + 1
        JumpBtn.Text = isAr and ("🦘 قوة القفز: " .. jumpPowers[jumpIdx]) or ("🦘 Jump Power: " .. jumpPowers[jumpIdx])
    end)

    RunService.Heartbeat:Connect(function()
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.JumpPower = jumpPowers[jumpIdx]
        end
    end)

    -- Speed
    local speeds = {16, 20, 24, 30, 40, 50}
    local speedIdx = 1
    SpeedBtn.MouseButton1Click:Connect(function()
        speedIdx = (speedIdx % #speeds) + 1
        SpeedBtn.Text = isAr and ("⚡ السرعة: " .. speeds[speedIdx]) or ("⚡ Speed: " .. speeds[speedIdx])
    end)

    RunService.Heartbeat:Connect(function()
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = speeds[speedIdx]
        end
    end)

    -- التحكم بتداخل واختراق اللاعبين
    local blockPlayerEnabled = false
    local passPlayerEnabled = false

    BlockPlayerBtn.MouseButton1Click:Connect(function()
        blockPlayerEnabled = not blockPlayerEnabled
        if blockPlayerEnabled then passPlayerEnabled = false end
        BlockPlayerBtn.Text = blockPlayerEnabled and (isAr and "🛡️ منع التداخل مع اللاعبين: مفعل" or "🛡️ Anti-Collision: ON") or (isAr and "🛡️ منع التداخل مع اللاعبين: مغلق" or "🛡️ Anti-Collision: OFF")
        BlockPlayerBtn.BackgroundColor3 = blockPlayerEnabled and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(35, 35, 48)
        PassPlayerBtn.Text = isAr and "👻 اختراق اللاعبين: مغلق" or "👻 Pass Players: OFF"
        PassPlayerBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    end)

    PassPlayerBtn.MouseButton1Click:Connect(function()
        passPlayerEnabled = not passPlayerEnabled
        if passPlayerEnabled then blockPlayerEnabled = false end
        PassPlayerBtn.Text = passPlayerEnabled and (isAr and "👻 اختراق اللاعبين: مفعل" or "👻 Pass Players: ON") or (isAr and "👻 اختراق اللاعبين: مغلق" or "👻 Pass Players: OFF")
        PassPlayerBtn.BackgroundColor3 = passPlayerEnabled and Color3.fromRGB(40, 160, 90) or Color3.fromRGB(35, 35, 48)
        BlockPlayerBtn.Text = isAr and "🛡️ منع التداخل مع اللاعبين: مغلق" or "🛡️ Anti-Collision: OFF"
        BlockPlayerBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    end)

    RunService.Stepped:Connect(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        if passPlayerEnabled then
                            part.CanCollide = false
                        elseif blockPlayerEnabled then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end)
end

-- بدء التشغيل بنظام المفتاح
CreateKeySystem()
