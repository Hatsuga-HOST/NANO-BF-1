-- Blox Fruits Sea 1 Script - Auto Shop, Auto Unlock Abilities, Auto Farm Leveling, and Full Automation
-- Green and Black Themed Menu (Inspired by Redz Hub)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = library.CreateLib("Blox Fruits Sea 1 - NANO HUB", "GrapeTheme")

-- Variables
local player = game.Players.LocalPlayer
local belly = player.Data.Beli
local fragment = player.Data.Fragments

-- Functions
local function buyItem(npcPath, price)
    if belly.Value >= price then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", npcPath)
    end
end

local function buyFragmentItem(npcPath, price)
    if fragment.Value >= price then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFragmentItem", npcPath)
    end
end

local function autoUnlockAbility(abilityName)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", abilityName)
end

local function autoFarmLevel()
    while true do
        wait(2)
        local quest = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AutoQuest")
        if quest then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AutoFarm", quest)
        end
    end
end

-- Main Tab (Auto Farm Leveling)
local mainTab = Window:NewTab("Main")
local mainSection = mainTab:NewSection("Auto Farm Leveling")

mainSection:NewToggle("Enable Auto Farm Leveling", "Farms level automatically from 0 to 2600", function(state)
    if state then
        autoFarmLevel()
    end
end)

-- Auto Unlock Abilities
local unlockTab = Window:NewTab("Auto Unlock")
local unlockSection = unlockTab:NewSection("Abilities")

unlockSection:NewButton("Unlock Flash Step", "Unlocks Flash Step ability", function()
    autoUnlockAbility("Flash Step")
end)

unlockSection:NewButton("Unlock Aura", "Unlocks Aura (Buso Haki)", function()
    autoUnlockAbility("Buso Haki")
end)

unlockSection:NewButton("Unlock Sky Jump", "Unlocks Sky Jump ability", function()
    autoUnlockAbility("Sky Jump")
end)

-- Shop Section
local shopTab = Window:NewTab("Shop")
local swordSection = shopTab:NewSection("Swords")
local gunSection = shopTab:NewSection("Guns")
local fightingSection = shopTab:NewSection("Fighting Styles")
local accessoriesSection = shopTab:NewSection("Accessories")

-- Swords (Sea 1)
swordSection:NewButton("Buy Katana (1K Beli)", "Pirate Starter Island", function()
    buyItem("Katana", 1000)
end)
swordSection:NewButton("Buy Cutlass (1K Beli)", "Pirate Starter Island", function()
    buyItem("Cutlass", 1000)
end)
swordSection:NewButton("Buy Dual Katana (12K Beli)", "Pirate Village", function()
    buyItem("Dual Katana", 12000)
end)
swordSection:NewButton("Buy Iron Mace (25K Beli)", "Pirate Village", function()
    buyItem("Iron Mace", 25000)
end)
swordSection:NewButton("Buy Triple Katana (60K Beli)", "Frozen Village", function()
    buyItem("Triple Katana", 60000)
end)
swordSection:NewButton("Buy Dual-Headed Blade (400K Beli)", "Upper Skylands", function()
    buyItem("Dual-Headed Blade", 400000)
end)
swordSection:NewButton("Buy Bisento (1M Beli)", "Upper Skylands", function()
    buyItem("Bisento", 1000000)
end)

-- Guns (Sea 1)
gunSection:NewButton("Buy Slingshot (5K Beli)", "Starter Island", function()
    buyItem("Slingshot", 5000)
end)
gunSection:NewButton("Buy Flintlock (10K Beli)", "Middle Town", function()
    buyItem("Flintlock", 10000)
end)
gunSection:NewButton("Buy Musket (25K Beli)", "Pirate Village", function()
    buyItem("Musket", 25000)
end)
gunSection:NewButton("Buy Refined Slingshot (30K Beli)", "Marine Fortress", function()
    buyItem("Refined Slingshot", 30000)
end)
gunSection:NewButton("Buy Refined Flintlock (50K Beli)", "Marine Fortress", function()
    buyItem("Refined Flintlock", 50000)
end)
gunSection:NewButton("Buy Cannon (100K Beli)", "Marine Fortress", function()
    buyItem("Cannon", 100000)
end)

-- Fighting Styles (Sea 1)
fightingSection:NewButton("Buy Dark Step (150K Beli)", "Pirate Village", function()
    buyItem("Dark Step", 150000)
end)
fightingSection:NewButton("Buy Electric (500K Beli)", "Skylands", function()
    buyItem("Electric", 500000)
end)
fightingSection:NewButton("Buy Water Kung Fu (750K Beli)", "Underwater City", function()
    buyItem("Water Kung Fu", 750000)
end)

-- Accessories (Sea 1)
accessoriesSection:NewButton("Buy Black Cape (50K Beli)", "Marine Fortress", function()
    buyItem("Black Cape", 50000)
end)
accessoriesSection:NewButton("Buy Swordsman Hat (150K Beli)", "Desert", function()
    buyItem("Swordsman Hat", 150000)
end)
accessoriesSection:NewButton("Buy Tomoe Ring (500K Beli)", "Frozen Village", function()
    buyItem("Tomoe Ring", 500000)
end)

print("[NANO HUB - Blox Fruits Sea 1 Script Loaded Successfully with Auto Farm Leveling]")
