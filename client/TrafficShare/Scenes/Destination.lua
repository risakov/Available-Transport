local composer = require("composer")
local widget = require("widget")
require("datePickerWheel")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()


local function Destination()

	local sceneGroup = scene.view
	local datePicker
--------------------------------------------------------------------------------------------------
	scene.textFrom = display.newText({
	    text = "Откуда?",     
	    x = CenterX*0.8,
	    y = CenterY*0.3, 
	    width = Width*0.5,
	    font = native.systemFont,   
	    fontSize = 40*ScaleFont,
	    align = "left"  -- Alignment parameter
	})
	scene.textFrom:setFillColor(0,0,0)
	scene.textFrom.align = "left"

	scene.fieldFromBack = display.newImageRect("Images/rectRounded1.png",Width*0.8,Height * 0.07)
	scene.fieldFromBack.x = CenterX
	scene.fieldFromBack.y = CenterY*0.5

	scene.fieldFrom = native.newTextField( CenterX, CenterY*0.5, Width*0.65, Height * 0.045 )
	scene.fieldFrom.hasBackground  = false

	scene.fieldFrom.Font = Font
	scene.fieldFrom.inputType = "string"
	scene.fieldFrom:resizeFontToFitHeight()
	table.insert(frontObject,scene.fieldFrom)

	local days = {}
	local years = {}
	for i = 1,31 do days[i] = i end
	for j = 1,47 do years[j] = 1969+j end

	local columnData = { 
		{
			align = "right",
			width = Width*0.3,
			startIndex = 5,
			labels = {
				"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" 
			},
		},
		{
			align = "center",
			width = Width*0.2,
			startIndex = 18,
			labels = days,
		},
		{
			align = "center",
			width = Width*0.2,
			startIndex = 21,
			labels = years,
		},
	}
		
	-- Create a new Picker Wheel
	scene.pickerWheel = widget.newPickerWheel {
		x = CenterX,
		y = Height * 0.7,
		columns = columnData,
		rowHeight = Height *0.05,
		width = Width * 0.8,
		style = "resizable"
	}
	scene.pickerWheel.x = display.contentCenterX
	frontObject:insert( scene.pickerWheel )

--------------------------------------------------------------------------------------------------

	scene.textTo = display.newText({
	    text = "Куда?",     
	    x = CenterX*0.8,
	    y = CenterY*0.7, 
	    width = Width*0.5,
	    font = native.systemFont,   
	    fontSize = 40*ScaleFont,
	    align = "left"  -- Alignment parameter
	})
	scene.textTo:setFillColor(0,0,0)
	scene.textTo.align = "left"

	scene.fieldToBack = display.newImageRect("Images/rectRounded1.png",Width*0.8,Height * 0.07)
	scene.fieldToBack.x = CenterX
	scene.fieldToBack.y = CenterY*0.9

	scene.fieldTo = native.newTextField( CenterX, CenterY*0.9, Width*0.65, Height * 0.045 )
	scene.fieldTo.hasBackground  = false

	scene.fieldTo.Font = Font
	scene.fieldTo.inputType = "string"
	scene.fieldTo:resizeFontToFitHeight()
	table.insert(frontObject,scene.fieldTo)
	
--------------------------------------------------------------------------------------------------

	scene.buttonContinue = widget.newButton(
	{
	    onEvent = function (event)
	  		if ( "ended" == event.phase ) then
	       		print( "Button was pressed and released" )
	       		composer.gotoScene("Scenes.People")
	       	end
	    end,
	    emboss = false,
	    shape = "roundedRect",
	    width = Width*0.6,
	    height = Height * 0.05,
	    cornerRadius = 40,
	    fillColor = {default = {36/255,122/255,191/255,1}, over = {36/255,122/255,191/255,0.5}}
	})
	scene.buttonContinue.x = CenterX
	scene.buttonContinue.y = Height * 0.9
	frontObject:insert(scene.buttonContinue)

	scene.textNext = display.newText({
		parent = frontObject,
	    text = "Готово",     
	    x = display.contentCenterX,
	    y = Height * 0.91, 
	    width = Width * 0.6,
	    height = Height * 0.05,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textNext:setFillColor(1,1,1)

--------------------------------------------------------------------------------------------------

	scene.buttonExit = widget.newButton(
	{
	    onEvent = function (event)
	  		if ( "ended" == event.phase ) then
	       		print( "Button was pressed and released" )
	       		composer.gotoScene("Scenes.Main")
	       	end
	    end,
	    emboss = false,
	    shape = "Rect",
	    width = Width*0.2,
	    height = Height * 0.1,
	    fillColor = {default = {36/255,122/255,191/255,1}, over = {36/255,122/255,191/255,0.1}}
	})
	scene.buttonExit.x = Width*0.1
	scene.buttonExit.y = Height * 0.05
	frontObject:insert(scene.buttonExit)

	scene.textBack = display.newText({
		parent = frontObject,
	    text = "Назад",     
	    x = Width*0.1,
	    y = Height*0.05, 
	    width = Width/4,
	    font = native.systemFont,   
	    fontSize = 42*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textBack:setFillColor(1,1,1,0.6)
	scene.textBack.align = "center"

--------------------------------------------------------------------------------------------------

end
function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
    scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    Destination()
   	
end

function scene:show(event)

end

function scene:hide(event)

end

function scene:destroy(event)
	scene.fieldTo:removeSelf()
	scene.fieldFrom:removeSelf()
end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene