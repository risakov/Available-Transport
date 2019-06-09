local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local frontObject = display.newGroup()
local backObject = display.newGroup()

function scene:create(event)
	local sceneGroup = self.view
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
   	
end

function scene:show(event)

end

function scene:hide(event)

end

function scene:destroy(event)

end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene