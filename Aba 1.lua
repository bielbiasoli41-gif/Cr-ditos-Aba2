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
        button.Size = UDim2.new(1, -20, 0, 40)
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 18
        button.Parent = parent
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button
        
        button.MouseButton1Click:Connect(callback)
        
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 140, 235)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        end)
        
        return button
    end

    -- CONTEÚDO DA ABA CRÉDITOS

    -- Link do Discord (pequeno no topo)
    local discordLinkTop = createLabel("https://discord.gg/PDc8bHsT", ContentContainer, 12, false)
    discordLinkTop.TextColor3 = Color3.fromRGB(200, 200, 200)
    discordLinkTop.TextXAlignment = Enum.TextXAlignment.Center

    createSpacer(10, ContentContainer)

    -- Box com ID da imagem
    local imageIdBox = Instance.new("Frame")
    imageIdBox.Size = UDim2.new(0, 300, 0, 80)
    imageIdBox.Position = UDim2.new(0.5, -150, 0, 0)
    imageIdBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageIdBox.BorderSizePixel = 0
    imageIdBox.Parent = ContentContainer

    local imageIdCorner = Instance.new("UICorner")
    imageIdCorner.CornerRadius = UDim.new(0, 5)
    imageIdCorner.Parent = imageIdBox

    local imageIdLabel = Instance.new("TextLabel")
    imageIdLabel.Size = UDim2.new(1, 0, 1, 0)
    imageIdLabel.BackgroundTransparency = 1
    imageIdLabel.Text = "Id da imagem:\n110586608819666"
    imageIdLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    imageIdLabel.Font = Enum.Font.GothamBold
    imageIdLabel.TextSize = 24
    imageIdLabel.Parent = imageIdBox

    createSpacer(90, ContentContainer)

    -- Título Godzilla Hub
    local titleLabel = createLabel("Godzilla Hub", ContentContainer, 24, true)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center

    -- Link do Discord (abaixo do título)
    local discordLinkBottom = createLabel("https://discord.gg/PDc8bHsT", ContentContainer, 12, false)
    discordLinkBottom.TextColor3 = Color3.fromRGB(200, 200, 200)
    discordLinkBottom.TextXAlignment = Enum.TextXAlignment.Center

    createSpacer(10, ContentContainer)

    -- Botão Copy Link
    createButton("Copy Link", function()
        setclipboard("https://discord.gg/PDc8bHsT")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Godzilla Hub";
            Text = "Link copiado!";
            Duration = 3;
        })
    end, ContentContainer)

    createSpacer(20, ContentContainer)

    -- Informações do Script
    createLabel("Informações do Script", ContentContainer, 20, true)
    createSpacer(5, ContentContainer)
    createLabel("Criadores:", ContentContainer, 14, true)
    createLabel("sereireconhecido", ContentContainer, 14, false)
    createLabel("Godzilla_eoking1", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("By:", ContentContainer, 14, true)
    createLabel("Godzilla Studios", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("Você está usando:", ContentContainer, 14, true)
    createLabel("Godzilla Hub", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("Executor Utilizado:", ContentContainer, 14, true)
    createLabel("(Nome do Executor)", ContentContainer, 14, false)

    createSpacer(20, ContentContainer)

    -- Informações
    createLabel("Informações", ContentContainer, 20, true)
    createSpacer(5, ContentContainer)
    createLabel("Hoje é dia:", ContentContainer, 14, true)
    createLabel("(Dia do exato momento)", ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    createLabel("Seu Nickname: (NickName do jogador)", ContentContainer, 14, true)
    createSpacer(3, ContentContainer)
    createLabel("Seu ID:(ID do jogador)", ContentContainer, 14, true)
    createSpacer(3, ContentContainer)
    createLabel("Seu Jogo:", ContentContainer, 14, true)
    createLabel("(Nome do jogo que o jogador está)", ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    createLabel("Tempo de uso do script:", ContentContainer, 14, true)
    createLabel("(Tempo de uso do script)", ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    createLabel("Seu Fps:", ContentContainer, 14, true)
    createLabel("(Fps do jogador)", ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    createLabel("Quantidade de jogadores no serv", ContentContainer, 14, true)
    createLabel("(Quantidade de jogadores)", ContentContainer, 14, false)

    print("✅ Aba Créditos carregada!")
end
