local composer = require("composer")

local scene = composer.newScene()

local function toMenu(event)
    composer.removeScene("Scenes.Main")
    composer.gotoScene("Scenes.Order")
end

scene:addEventListener("touch",toMenu)
composer.removeScene( "Scenes.Main")

--composer.gotoScene("Scenes.Order")
return scene