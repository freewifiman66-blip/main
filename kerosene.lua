-- main.lua
-- Uses Exodus UI lib (save lib source as "exodus_lib.lua" in workspace first)

local library = loadstring(readfile("exodus_lib.lua"))()

local window = library:Load{
    title   = "MyScript",
    folder  = "MyScript",
    game    = "universal",
    sizex   = 700,
    sizey   = 550,
}

local watermark = library:Watermark("MyScript | " .. game.PlaceId)

-- ─── Tabs ─────────────────────────────────────────────────────────────────────

local mainTab    = window:Tab("Main")
local playerTab  = window:Tab("Player")
local visualsTab = window:Tab("Visuals")

-- ─── Main ─────────────────────────────────────────────────────────────────────

local mainLeft = mainTab:Section{ name = "General", side = "left" }

mainLeft:Toggle{
    name     = "Anti-AFK",
    flag     = "anti_afk",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

mainLeft:Toggle{
    name     = "Auto-Farm",
    flag     = "auto_farm",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

mainLeft:Slider{
    name     = "Walk Speed",
    flag     = "walk_speed",
    min      = 16,
    max      = 500,
    default  = 16,
    callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end
}

mainLeft:Slider{
    name     = "Jump Power",
    flag     = "jump_power",
    min      = 50,
    max      = 500,
    default  = 50,
    callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = v
        end
    end
}

-- ─── Player ───────────────────────────────────────────────────────────────────

local playerLeft = playerTab:Section{ name = "Movement", side = "left" }

playerLeft:Toggle{
    name     = "Fly",
    flag     = "fly",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

playerLeft:Toggle{
    name     = "Noclip",
    flag     = "noclip",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

playerLeft:Toggle{
    name     = "Infinite Jump",
    flag     = "inf_jump",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

-- ─── Visuals ──────────────────────────────────────────────────────────────────

local visualsLeft = visualsTab:Section{ name = "Rendering", side = "left" }

visualsLeft:Toggle{
    name     = "ESP",
    flag     = "esp",
    default  = false,
    callback = function(v)
        -- your logic here
    end
}

visualsLeft:Toggle{
    name     = "Fullbright",
    flag     = "fullbright",
    default  = false,
    callback = function(v)
        game.Lighting.Brightness = v and 2 or 1
        game.Lighting.ClockTime  = v and 14 or 14
        game.Lighting.FogEnd     = v and 1e9 or 100000
    end
}

visualsLeft:Colorpicker{
    name     = "ESP Color",
    flag     = "esp_color",
    default  = Color3.fromRGB(255, 0, 0),
    callback = function(color)
        -- your logic here
    end
}

-- ─── Settings tab ─────────────────────────────────────────────────────────────

window:SettingsTab(watermark)

-- ─── Init ─────────────────────────────────────────────────────────────────────

library:Init()
