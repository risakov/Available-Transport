local composer = require("composer")
local widget = require("widget")
require("datePickerWheel")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()

local function gotoStart()
	composer.gotoScene("Scenes.Main")
end

local function showPeople()
	local sceneGroup = scene.view
	scene.topPanel = display.newRect(backObject,CenterX,Height*0.075,Width,Height*0.15)
	scene.topPanel:setFillColor(36/255,122/255,191/255)
	
	scene.textInfo = display.newText({
		parent = frontObject,
	    text = "Водители",     
	    x = CenterX,
	    y = Height*0.1, 
	    width = Width/4,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "left"  -- Alignment parameter
	})
	scene.textInfo:setFillColor(1,1,1)
	scene.textInfo.align = "center"

	scene.buttonExit = widget.newButton(
	{
	    onEvent = function (event)
	  		if ( "ended" == event.phase ) then
	       		print( "Button was pressed and released" )
	       		composer.gotoScene("Scenes.Destination")
	       	end
	    end,
	    emboss = false,
	    shape = "Rect",
	    width = Width*0.2,
	    height = Height * 0.1,
	    fillColor = {default = {36/255,122/255,191/255,1}, over = {36/255,122/255,191/255,0.1}}
	})
	scene.buttonExit.x = Width*0.1
	scene.buttonExit.y = Height * 0.1
	frontObject:insert(scene.buttonExit)

	scene.textBack = display.newText({
		parent = frontObject,
	    text = "Назад",     
	    x = Width*0.1,
	    y = Height*0.1, 
	    width = Width/4,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textBack:setFillColor(1,1,1,0.6)
	scene.textBack.align = "center"

	scene.roma = display.newImageRect(frontObject,"Images/roma.png",Width*0.25,Width*0.25)
	scene.roma.x = Width*0.3
	scene.roma.y = Height*0.4
	scene.backRoma =display.newRoundedRect(frontObject,Width*0.3,Height*0.52,Width*0.3,Width*0.15,20)
	scene.backRoma:setFillColor(36/255,122/255,191/255,1)
	scene.textRoma = display.newText({
		parent = frontObject,
	    text = "Роман\nРейтинг 4.4",     
	    x = Width*0.3,
	    y = Height*0.52, 
	    width = Width*0.3,
	    height = Width*0.15,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textRoma:setFillColor(1,1,1,0.6)
	scene.textRoma.align = "center"

	scene.slava = display.newImageRect(frontObject,"Images/slava.png",Width*0.25,Width*0.25)
	scene.slava.x = Width*0.7
	scene.slava.y = Height*0.4
	scene.backSlava =display.newRoundedRect(frontObject,Width*0.7,Height*0.52,Width*0.3,Width*0.15,20)
	scene.backSlava:setFillColor(36/255,122/255,191/255,1)
	scene.textSlava = display.newText({
		parent = frontObject,
	    text = "Вячеслав\nРейтинг 4.2",     
	    x = Width*0.7,
	    y = Height*0.52,
	    width = Width*0.3,
	    height = Width*0.15,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textSlava:setFillColor(1,1,1,0.6)
	scene.textSlava.align = "center"

	scene.sasha = display.newImageRect(frontObject,"Images/sasha.png",Width*0.25,Width*0.25)
	scene.sasha.x = Width*0.3
	scene.sasha.y = Height*0.72
	scene.backSasha =display.newRoundedRect(frontObject,Width*0.3,Height*0.85,Width*0.3,Width*0.15,20)
	scene.backSasha:setFillColor(36/255,122/255,191/255,1)
	scene.textSasha = display.newText({
		parent = frontObject,
	    text = "Александр\nРейтинг 4.7",     
	    x = Width*0.3,
	    y = Height*0.85, 
	    width = Width*0.3,
	    height = Width*0.15,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textSasha:setFillColor(1,1,1,0.6)
	scene.textSasha.align = "center"


end
function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()

	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
    scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    showPeople()
   	
end

function scene:show(event)
	scene.roma:addEventListener("touch",gotoStart)
	scene.slava:addEventListener("touch",gotoStart)
	scene.sasha:addEventListener("touch",gotoStart)
	scene.textRoma:addEventListener("touch",gotoStart)
	scene.textSlava:addEventListener("touch",gotoStart)
	scene.textSasha:addEventListener("touch",gotoStart)
end

function scene:hide(event)
	scene.roma:removeEventListener("touch",gotoStart)
	scene.slava:removeEventListener("touch",gotoStart)
	scene.sasha:removeEventListener("touch",gotoStart)
	scene.textRoma:removeEventListener("touch",gotoStart)
	scene.textSlava:removeEventListener("touch",gotoStart)
	scene.textSasha:removeEventListener("touch",gotoStart)
end

function scene:destroy(event)

end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene