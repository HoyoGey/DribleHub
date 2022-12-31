TweenService = game:GetService("TweenService")

local esp = loadstring(game:HttpGet("https://lkhub.net/s/ESP.lua"))()

local chest = esp:addESP(nil, {
    tag = true,
    distance = true,
    outline = true,
    outlineSameAsFill = true,
    Color = Color3.new(1, 0, 0)
})

local lib = loadstring(game:HttpGet "https://raw.githubusercontent.com/HoyoGey/My-Lua-Project/main/UiLibs/VapeUIModded.lua")()
local win = lib:Window("Drible", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

lib:Notif({ Name = "Warning", Content = "When teleporting, climb tall buildings so you don't get teleported back", Time = 15, Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png" })

local VSL = win:Tab("Crate Tp")
VSL:Toggle("Esp Crate", false, function(t)
    getgenv().Esp = t
    chest:Value(t)
end)

VSL:Toggle("Tp Crate", false, function(t)
    getgenv().Tp = t
end)

VSL:Button("Teleport to Elf", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "ElfCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = v:GetModelCFrame() }):Play()
        end
    end
end)

VSL:Button("Teleport to Santa", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "SantaCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = v:GetModelCFrame() }):Play()
        end
    end
end)

VSL:Button("Teleport to Gingerbeard", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "GingerbeardCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = v:GetModelCFrame() }):Play()
        end
    end
end)

game.workspace.DescendantAdded:Connect(function(inst)
    if getgenv().Tp == true then
        if inst.Name == "ElfCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = inst:GetModelCFrame() }):Play()
        end
        if inst.Name == "SantaCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = inst:GetModelCFrame() }):Play()
        end
        if inst.Name == "GingerbeardCrate" then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(2, Enum.EasingStyle.Linear), { CFrame = inst:GetModelCFrame() }):Play()
        end
    end
    if getgenv().Esp == true then
        if inst.Name == "ElfCrate" then
            chest:AddObject(inst)
        end
        if inst.Name == "SantaCrate" then
            chest:AddObject(inst)
        end
        if inst.Name == "GingerbeardCrate" then
            chest:AddObject(inst)
        end
    end
end)
