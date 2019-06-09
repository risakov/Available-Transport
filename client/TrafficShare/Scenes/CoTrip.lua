local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()


local function CoTrip()

	local sceneGroup = scene.view
	

--------------------------------------------------------------------------------------------------

end
function scene:create(event)
	local sceneGroup = self.view
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
    scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    CoTrip()
   	
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