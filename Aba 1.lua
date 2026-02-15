-- ABA CRÉDITOS - Godzilla Hub
-- Este script será carregado via loadstring

return function(ContentContainer, LocalPlayer, Players, RunService, MarketplaceService, startTime)
    -- Função auxiliar para criar labels
    local function createLabel(text, parent, size, bold)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, size or 20)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
        label.TextSize = size or 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = parent
        return label
    end

    -- Função auxiliar para criar espaçadores
    local function createSpacer(height, parent)
        local spacer = Instance.new("Frame")
        spacer.Size = UDim2.new(1, 0, 0, height)
        spacer.BackgroundTransparency = 1
        spacer.Parent = parent
        return spacer
    end

    -- Função auxiliar para criar botões
    local function createButton(text, callback, parent)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 35)
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.Parent = parent
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 5)
        buttonCorner.Parent = button
        
        button.MouseButton1Click:Connect(callback)
        
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        end)
        
        return button
    end

    -- CONTEÚDO DA ABA CRÉDITOS

    -- Discord
    createLabel("Discord", ContentContainer, 18, true)
    createSpacer(5, ContentContainer)

    local discordLabel = createLabel("https://discord.gg/PDc8bHsT", ContentContainer, 14, false)
    discordLabel.TextColor3 = Color3.fromRGB(88, 101, 242)

    createSpacer(10, ContentContainer)

    -- Imagem do Discord
    local discordImage = Instance.new("ImageLabel")
    discordImage.Size = UDim2.new(0, 150, 0, 150)
    discordImage.Position = UDim2.new(0.5, -75, 0, 0)
    discordImage.BackgroundTransparency = 1
    discordImage.Image = "rbxassetid://110586608819666"
    discordImage.ScaleType = Enum.ScaleType.Fit
    discordImage.Parent = ContentContainer

    createSpacer(160, ContentContainer)

    -- Botão Copiar Link
    createButton("Copiar Link do Discord", function()
        setclipboard("https://discord.gg/PDc8bHsT")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Godzilla Hub";
            Text = "Link copiado!";
            Duration = 3;
        })
    end, ContentContainer)

    createSpacer(15, ContentContainer)

    -- Informações do Script
    createLabel("Informações do Script", ContentContainer, 18, true)
    createSpacer(5, ContentContainer)
    createLabel("Criadores: sereireconhecido, Godzilla_eoking1", ContentContainer, 12, false)
    createLabel("Organização: Godzilla Studios", ContentContainer, 12, false)

    createSpacer(15, ContentContainer)

    -- Informações do Jogador
    createLabel("Suas Informações", ContentContainer, 18, true)
    createSpacer(5, ContentContainer)

    -- Data e Hora
    createLabel("Data: " .. os.date("%d/%m/%Y"), ContentContainer, 12, false)
    local timeLabel = createLabel("Hora: " .. os.date("%H:%M:%S"), ContentContainer, 12, false)

    -- Atualizar hora em tempo real
    spawn(function()
        while ContentContainer and timeLabel and timeLabel.Parent do
            timeLabel.Text = "Hora: " .. os.date("%H:%M:%S")
            wait(1)
        end
    end)

    -- Apelido
    createLabel("Apelido: " .. LocalPlayer.Name, ContentContainer, 12, false)

    -- User ID
    createLabel("User ID: " .. LocalPlayer.UserId, ContentContainer, 12, false)

    -- Nome do Jogo
    local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    createLabel("Jogo: " .. gameInfo.Name, ContentContainer, 12, false)

    -- Tempo usando o script
    local usageLabel = createLabel("Tempo de uso: 0s", ContentContainer, 12, false)

    spawn(function()
        while ContentContainer and usageLabel and usageLabel.Parent do
            local elapsed = math.floor(tick() - startTime)
            local minutes = math.floor(elapsed / 60)
            local seconds = elapsed % 60
            usageLabel.Text = string.format("Tempo de uso: %dm %ds", minutes, seconds)
            wait(1)
        end
    end)

    -- FPS
    local fpsLabel = createLabel("FPS: 0", ContentContainer, 12, false)

    spawn(function()
        local lastTime = tick()
        local frameCount = 0
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not ContentContainer or not fpsLabel or not fpsLabel.Parent then
                connection:Disconnect()
                return
            end
            
            frameCount = frameCount + 1
            
            local currentTime = tick()
            if currentTime - lastTime >= 1 then
                fpsLabel.Text = "FPS: " .. frameCount
                frameCount = 0
                lastTime = currentTime
            end
        end)
    end)

    -- Jogadores no servidor
    local playerCountLabel = createLabel("Jogadores: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers, ContentContainer, 12, false)

    Players.PlayerAdded:Connect(function()
        if ContentContainer and playerCountLabel and playerCountLabel.Parent then
            playerCountLabel.Text = "Jogadores: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
        end
    end)

    Players.PlayerRemoving:Connect(function()
        wait(0.1)
        if ContentContainer and playerCountLabel and playerCountLabel.Parent then
            playerCountLabel.Text = "Jogadores: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
        end
    end)

    print("✅ Aba Créditos carregada com sucesso!")
end
