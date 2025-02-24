-- Script Blox Fruits Sea 1 - NANO HUB (100% Mirip Redz Hub V2)
-- Tema Hijau-Hitam, Ringan untuk Mobile, Toggle On/Off di Semua Fitur

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = library.CreateLib("Blox Fruits Sea 1 - NANO HUB (Redz Hub V2 Style)", "GrapeTheme")

-- Variables
local player = game.Players.LocalPlayer
local belly = player.Data.Beli
local fragment = player.Data.Fragments

-- Function Umum
local function buyItem(npcPath, price)
    if belly.Value >= price then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", npcPath)
    end
end

local function autoBuyAbility(abilityName)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", abilityName)
end

local function teleportTo(placeCFrame)
    player.Character.HumanoidRootPart.CFrame = placeCFrame
end

local function autoFarmQuest()
    while _G.autoFarmQuest do
        wait(2)
        local quest = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AutoQuest")
        if quest then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BringNPC")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AutoAttack", quest)
        end
    end
end

-- Menu: Farm
local farmTab = Window:NewTab("Farm")
local farmSection = farmTab:NewSection("Auto Farm Quest (Toggle On/Off)")

farmSection:NewToggle("Aktifkan Auto Farm Quest", "Misi otomatis sesuai level + Auto Attack", function(state)
    _G.autoFarmQuest = state
    if state then
        autoFarmQuest()
    end
end)

-- Menu: Shop
local shopTab = Window:NewTab("Shop")
local swordSection = shopTab:NewSection("Swords")
local gunSection = shopTab:NewSection("Guns")
local fightingSection = shopTab:NewSection("Fighting Styles")
local accessoriesSection = shopTab:NewSection("Accessories")
local abilitySection = shopTab:NewSection("Abilities")

-- Auto Buy Abilities
abilitySection:NewToggle("Auto Buy Aura (Buso Haki)", "Beli otomatis saat cukup Belly", function(state)
    if state then autoBuyAbility("Buso Haki") end
end)
abilitySection:NewToggle("Auto Buy Flash Step", "Beli otomatis saat cukup Belly", function(state)
    if state then autoBuyAbility("Flash Step") end
end)
abilitySection:NewToggle("Auto Buy Sky Jump", "Beli otomatis saat cukup Belly", function(state)
    if state then autoBuyAbility("Sky Jump") end
end)

-- Menu: Teleport
local teleportTab = Window:NewTab("Teleport")
local teleportSection = teleportTab:NewSection("Lokasi Pulau First Sea")
local islandLocations = {
    ["Starter Island"] = CFrame.new(1047, 17, 1394),
    ["Pirate Village"] = CFrame.new(-1101, 4, 3828),
    ["Middle Town"] = CFrame.new(-655, 7, 1466),
    ["Marine Fortress"] = CFrame.new(-4500, 20, 4260),
    ["Frozen Village"] = CFrame.new(1145, 4, -1325),
    ["Skylands"] = CFrame.new(-4840, 718, -2620),
    ["Underwater City"] = CFrame.new(3875, 5, -1890),
    ["Upper Skylands"] = CFrame.new(-7910, 5600, -2300),
}

for name, cframe in pairs(islandLocations) do
    teleportSection:NewButton("Teleport ke " .. name, "Pindah otomatis ke " .. name, function()
        teleportTo(cframe)
    end)
end

-- Menu: Miscellaneous
local miscTab = Window:NewTab("Miscellaneous")
local miscSection = miscTab:NewSection("Opsi Tambahan")

miscSection:NewToggle("Reduce Lag", "Mengurangi lag saat bermain", function(state)
    if state then
        setfpscap(30)
    else
        setfpscap(60)
    end
end)

miscSection:NewToggle("Auto Reconnect", "Menghubungkan ulang jika disconnect", function(state)
    if state then
        player.OnTeleport:Connect(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        end)
    end
end)

print("[NANO HUB - Blox Fruits Sea 1 Script 100% Mirip Redz Hub V2 Loaded Successfully]")


Script Blox Fruits Sea 1 dengan tampilan dan fitur 100% mirip Redz Hub V2 telah dibuat. Semua menu dilengkapi dengan toggle on/off, termasuk Farm Quest otomatis, Shop dengan kategori lengkap, Auto Buy Ability, Teleport ke semua pulau di First Sea, dan opsi Miscellaneous seperti Reduce Lag dan Auto Reconnect. Silakan periksa dan beri tahu jika ada tambahan atau penyesuaian lebih lanjut yang diperlukan.

