local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()


local function typeOfATransport()

	local sceneGroup = scene.view
	scene.lineForm = display.newLine(frontObject,0,Height*0.15,Width,Height*0.15)
	scene.lineForm:setStrokeColor( 36/255,122/255,191/255, 1 )
	scene.lineForm.strokeWidth = 8

	scene.textForm = display.newText({
	    text = "Вид транспорта",     
	    x = CenterX,
	    y = Height*0.075, 
	    width = Width/1.5,
	    font = native.systemFont,   
	    fontSize = 50*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textForm:setFillColor(36/255,122/255,191/255, 1)

--------------------------------------------------------------------------------------------------

	scene.textReg1 = display.newText({
	    text = "АВТОМОБИЛЬ",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*0.675, 
	    width = Width,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg1:setFillColor(0,0,0)

    scene.buttonReg1 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg1.x = display.contentCenterX
	scene.buttonReg1.y = display.contentCenterY*0.6
	frontObject:insert(scene.buttonReg1)
	frontObject:insert(scene.textReg1)

--------------------------------------------------------------------------------------------------

scene.textReg1 = display.newText({
	    text = "АРЕНДА",     
	    x = display.contentCenterX*0.5,
	    y = display.contentCenterY*0.92, 
	    width = Width,
	    height = Height * 0.105,
	    font = native.systemFont,   
	    fontSize = 25 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg1:setFillColor(0,0,0)

    scene.buttonReg1 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width*0.4,
	        height = Height * 0.06,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg1.x = display.contentCenterX*0.4
	scene.buttonReg1.y = display.contentCenterY*0.84
	frontObject:insert(scene.buttonReg1)
	frontObject:insert(scene.textReg1)

--------------------------------------------------------------------------------------------------

scene.textReg1 = display.newText({
	    text = "СОВМЕСТНОЕ ПОЛЬЗОВАНИЕ",     
	    x = display.contentCenterX*1.5,
	    y = display.contentCenterY*0.92, 
	    width = Width,
	    height = Height * 0.105,
	    font = native.systemFont,   
	    fontSize = 25 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg1:setFillColor(0,0,0)

    scene.buttonReg1 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width*0.55,
	        height = Height * 0.06,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg1.x = display.contentCenterX*1.5
	scene.buttonReg1.y = display.contentCenterY*0.84
	frontObject:insert(scene.buttonReg1)
	frontObject:insert(scene.textReg1)

	--------------------------------------------------------------------------------------------------

	scene.textReg2 = display.newText({
	    text = "ВЕЛОСИПЕД",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.15, 
	    width = Width,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg2:setFillColor(0,0,0)

    scene.buttonReg2 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg2.x = display.contentCenterX
	scene.buttonReg2.y = display.contentCenterY*1.07
	frontObject:insert(scene.buttonReg2)
	frontObject:insert(scene.textReg2)

--------------------------------------------------------------------------------------------------

scene.textReg3 = display.newText({
	    text = "МОТОЦИКЛ",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.42, 
	    width = Width,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg3:setFillColor(0,0,0)

    scene.buttonReg3 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg3.x = display.contentCenterX
	scene.buttonReg3.y = display.contentCenterY*1.34
	frontObject:insert(scene.buttonReg3)
	frontObject:insert(scene.textReg3)

--------------------------------------------------------------------------------------------------

scene.textReg4 = display.newText({
	    text = "ЭЛЕКТРОСАМОКАТ",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.69, 
	    width = Width,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textReg4:setFillColor(0,0,0)

    scene.buttonReg4 = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	        		
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg4.x = display.contentCenterX
	scene.buttonReg4.y = display.contentCenterY*1.61
	frontObject:insert(scene.buttonReg4)
	frontObject:insert(scene.textReg4)

--------------------------------------------------------------------------------------------------

end
function scene:create(event)
	local sceneGroup = self.view
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
    scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    typeOfATransport()
   	
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