-- Blox Fruits Sea 1 Script - Updated NANO HUB
-- Green and Black Themed Menu (Inspired by Redz Hub)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = library.CreateLib("BLOX FRUITS SEA 1 - PICA HUB", "GrapeTheme")

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

local function autoBuyAbility(abilityName)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", abilityName)
end

local function farmQuest()
    while getgenv().farmQuestActive do
        wait(1)
        local currentLevel = player.Data.Level.Value
        local quest = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", currentLevel)
        if quest then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BringNPC", quest)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AutoAttack", quest)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("FlyAndDamage", quest)
        end
    end
end

local function teleportToIsland(islandName)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TeleportTo", islandName)
end

-- Main Tab (Farm Quest)
local mainTab = Window:NewTab("Main")
local mainSection = mainTab:NewSection("Farm Quest")

mainSection:NewToggle("Enable Farm Quest", "Mengerjakan misi otomatis sesuai level dengan bring NPC, auto attack, dan terbang sambil menyerang.", function(state)
    getgenv().farmQuestActive = state
    if state then
        farmQuest()
    end
end)

-- Auto Buy Abilities
local abilityTab = Window:NewTab("Auto Buy Ability")
local abilitySection = abilityTab:NewSection("Abilities")

abilitySection:NewToggle("Buy Aura (Buso Haki)", "Membeli Buso Haki secara otomatis.", function(state)
    if state then autoBuyAbility("Buso Haki") end
end)
abilitySection:NewToggle("Buy Flash Step", "Membeli Flash Step secara otomatis.", function(state)
    if state then autoBuyAbility("Flash Step") end
end)
abilitySection:NewToggle("Buy Sky Jump", "Membeli Sky Jump secara otomatis.", function(state)
    if state then autoBuyAbility("Sky Jump") end
end)

-- Shop Section
local shopTab = Window:NewTab("Shop")
local swordSection = shopTab:NewSection("Swords")
local gunSection = shopTab:NewSection("Guns")
local fightingSection = shopTab:NewSection("Fighting Styles")
local accessoriesSection = shopTab:NewSection("Accessories")

-- Swords (Sea 1)
swordSection:NewToggle("Buy Katana (1K Beli)", "Pirate Starter Island", function(state) if state then buyItem("Katana", 1000) end end)
swordSection:NewToggle("Buy Cutlass (1K Beli)", "Pirate Starter Island", function(state) if state then buyItem("Cutlass", 1000) end end)
swordSection:NewToggle("Buy Dual Katana (12K Beli)", "Pirate Village", function(state) if state then buyItem("Dual Katana", 12000) end end)
swordSection:NewToggle("Buy Iron Mace (25K Beli)", "Pirate Village", function(state) if state then buyItem("Iron Mace", 25000) end end)
swordSection:NewToggle("Buy Triple Katana (60K Beli)", "Frozen Village", function(state) if state then buyItem("Triple Katana", 60000) end end)
swordSection:NewToggle("Buy Dual-Headed Blade (400K Beli)", "Upper Skylands", function(state) if state then buyItem("Dual-Headed Blade", 400000) end end)
swordSection:NewToggle("Buy Bisento (1M Beli)", "Upper Skylands", function(state) if state then buyItem("Bisento", 1000000) end end)

-- Guns (Sea 1)
gunSection:NewToggle("Buy Slingshot (5K Beli)", "Starter Island", function(state) if state then buyItem("Slingshot", 5000) end end)
gunSection:NewToggle("Buy Flintlock (10K Beli)", "Middle Town", function(state) if state then buyItem("Flintlock", 10000) end end)
gunSection:NewToggle("Buy Musket (25K Beli)", "Pirate Village", function(state) if state then buyItem("Musket", 25000) end end)
gunSection:NewToggle("Buy Refined Slingshot (30K Beli)", "Marine Fortress", function(state) if state then buyItem("Refined Slingshot", 30000) end end)
gunSection:NewToggle("Buy Refined Flintlock (50K Beli)", "Marine Fortress", function(state) if state then buyItem("Refined Flintlock", 50000) end end)
gunSection:NewToggle("Buy Cannon (100K Beli)", "Marine Fortress", function(state) if state then buyItem("Cannon", 100000) end end)

-- Fighting Styles (Sea 1)
fightingSection:NewToggle("Buy Dark Step (150K Beli)", "Pirate Village", function(state) if state then buyItem("Dark Step", 150000) end end)
fightingSection:NewToggle("Buy Electric (500K Beli)", "Skylands", function(state) if state then buyItem("Electric", 500000) end end)
fightingSection:NewToggle("Buy Water Kung Fu (750K Beli)", "Underwater City", function(state) if state then buyItem("Water Kung Fu", 750000) end end)

-- Accessories (Sea 1)
accessoriesSection:NewToggle("Buy Black Cape (50K Beli)", "Marine Fortress", function(state) if state then buyItem("Black Cape", 50000) end end)
accessoriesSection:NewToggle("Buy Swordsman Hat (150K Beli)", "Desert", function(state) if state then buyItem("Swordsman Hat", 150000) end end)
accessoriesSection:NewToggle("Buy Tomoe Ring (500K Beli)", "Frozen Village", function(state) if state then buyItem("Tomoe Ring", 500000) end end)

-- Teleportation Section
local teleportTab = Window:NewTab("Teleport")
local teleportSection = teleportTab:NewSection("Islands - First Sea")

local islands = {"Starter Island", "Pirate Village", "Middle Town", "Jungle", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Upper Skylands", "Underwater City"}

for _, island in ipairs(islands) do
    teleportSection:NewToggle("Teleport to " .. island, "Teleport otomatis ke " .. island, function(state)
        if state then teleportToIsland(island) end
    end)
end

print("[NANO HUB - Blox Fruits Sea 1 Script Updated Successfully with Toggle Features, Auto Buy Ability, Farm Quest, and Teleportation]")
