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
		--parent = localGroup,
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
	for j = 1,50 do years[j] = 1969+j end

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

end

local localGroup

local function createOrder()
	local sceneGroup = scene.view
	localGroup = display.newGroup()

end

local function onTouchClear()
	localGroup:removeSelf()
	localGroup = nil
	Destination()
end

local function choiceCar()
	local sceneGroup = scene.view
	localGroup = display.newGroup()

	scene.textInfo = display.newText({
		parent = localGroup,
	    text = "Свободные машины",     
	    x = CenterX,
	    y = Height * 0.08, 
	    width = Width * 0.5,
	    font = native.systemFont,   
	    fontSize = 76 * ScaleFont,
	    align = "center"
	})
	scene.textInfo:setFillColor(0,0,0)
	scene.textInfo.align = "center"

	scene.lineForm = display.newLine(localGroup,0,Height*0.15,Width,Height*0.15)
	scene.lineForm:setStrokeColor( 36/255,122/255,191/255, 1 )
	scene.lineForm.strokeWidth = 8

	local cars = {
		{
			image = 'Images/car1.jpg',
			x = Width*0.2,
			text = 'Lada Priora 2012\nРейтинг: 4.3/5',
		},
		{
			image = 'Images/car2.jpg',
			x = Width*0.2,
			text = 'Renault Logan\nРейтинг: 4.7/5',
		},
		y = Height*0.3,
		textY = Height*0.28,
		offsetY = Height*0.2
	}

	for i, car in ipairs(cars) do
		local j = i - 1
		local y = cars.y + j*cars.offsetY
		scene.back = display.newRect(localGroup,0,y,Width,Height*0.15)
		scene.back:addEventListener("touch",onTouchClear)
		scene.car2 = display.newImageRect(localGroup,car.image,Width*0.35,Height*0.15)
		scene.car2.x = Width*0.2
		scene.car2.y = cars.y + j * cars.offsetY
		scene.textCar2 = display.newText({
			parent = localGroup,
		    text = car.text,     
		    x = CenterX*1.1,
		    y = cars.textY + j * cars.offsetY, 
		    width = Width * 0.5,
		    font = native.systemFont,   
		    fontSize = 50 * ScaleFont,
		    align = "center"
		})
		scene.textCar2:setFillColor(36/255,122/255,191/255, 1 )
		scene.textCar2.align = "center"
	end

end

local function onBut()
	localGroup:removeSelf()
	localGroup = nil
	choiceCar()
end

local function choiceTransport()
	local sceneGroup = scene.view
	localGroup = display.newGroup()
	frontObject:insert(localGroup)
	scene.lineForm = display.newLine(localGroup,0,Height*0.15,Width,Height*0.15)
	scene.lineForm:setStrokeColor( 36/255,122/255,191/255, 1 )
	scene.lineForm.strokeWidth = 8

	scene.textForm = display.newText({
		parent = localGroup,
	    text = "Вид транспорта",     
	    x = CenterX,
	    y = Height*0.075, 
	    width = Width/1.5,
	    font = native.systemFont,   
	    fontSize = 50*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textForm:setFillColor(36/255,122/255,191/255, 1)


	scene.textReg1 = display.newText({
		parent = localGroup,
	    text = "АВТОМОБИЛЬ",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*0.88, 
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
	        		onBut()
	   			end
	        end,
	        emboss = false,
	        shape = "Rect",
	        width = Width,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonReg1.x = display.contentCenterX
	scene.buttonReg1.y = display.contentCenterY*0.8
	localGroup:insert(scene.buttonReg1)
	localGroup:insert(scene.textReg1)

	--[[
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
	

	--]]
	scene.textReg2 = display.newText({
		parent = localGroup,
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
	localGroup:insert(scene.buttonReg2)
	localGroup:insert(scene.textReg2)

	scene.textReg3 = display.newText({
		parent = localGroup,
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
	localGroup:insert(scene.buttonReg3)
	localGroup:insert(scene.textReg3)


	scene.textReg4 = display.newText({
		parent = localGroup,
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
	localGroup:insert(scene.buttonReg4)
	localGroup:insert(scene.textReg4)
end



function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)
    scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    --Destination()
    choiceTransport()
   	--choiceCar()
   --	createOrder()
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