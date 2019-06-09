local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()


local function showAuth()

	local sceneGroup = scene.view
	scene.logo = display.newCircle( frontObject, CenterX, CenterY*0.4, Width*0.15)
	scene.logo:setFillColor(0.2,0.3,1)

	scene.fieldInputNameBack = display.newImageRect("Images/rectRounded1.png",Width*0.6,Height * 0.05)
	scene.fieldInputNameBack.x = CenterX
	scene.fieldInputNameBack.y = CenterY*0.8

	scene.fieldInputName = native.newTextField( CenterX, CenterY*0.8, Width*0.55, Height * 0.04 )
	scene.fieldInputName.hasBackground  = false

	scene.fieldInputName.Font = Font
	scene.fieldInputName:resizeFontToFitHeight()
	table.insert(frontObject,scene.fieldInputName)

	scene.textName = display.newText({
		parent = frontObject,
	    text = "Ваше имя",     
	    x = CenterX*0.9,
	    y = CenterY*0.7, 
	    width = Width*0.5,
	    font = native.systemFont,   
	    fontSize = 36*ScaleFont,
	    align = "left"  -- Alignment parameter
	})
	scene.textName:setFillColor(0,0,0)
	scene.textName.align = "left"
	
	--------------------------------------------------------------------------------------------------

	scene.fieldInputBack = display.newImageRect(frontObject,"Images/rectRounded1.png",Width*0.6,Height * 0.05)
	scene.fieldInputBack.x = CenterX
	scene.fieldInputBack.y = CenterY

	scene.fieldInput = native.newTextField( CenterX, CenterY, Width*0.55, Height * 0.04 )
	scene.fieldInput.hasBackground  = false

	scene.fieldInput.Font = Font
	scene.fieldInput:resizeFontToFitHeight()
	table.insert(frontObject,scene.fieldInput)

--------------------------------------------------------------------------------------------------

	scene.textNumber = display.newText({
	    text = "Номер телефона",     
	    x = CenterX*0.9,
	    y = CenterY*0.9, 
	    width = Width*0.5,
	    font = native.systemFont,   
	    fontSize = 36*ScaleFont,
	    align = "left"  -- Alignment parameter
	})
	scene.textNumber:setFillColor(0,0,0)
	scene.textNumber.align = "left"
--------------------------------------------------------------------------------------------------

	scene.textReg = display.newText({
		parent = frontObject,
	    text = "Зарегистрироваться",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.53, 
	    width = Width*0.6,
	    height = Height * 0.05,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center" 
	})

--------------------------------------------------------------------------------------------------

	scene.buttonReg = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( "ended" == event.phase ) then
	       			print( "Button was pressed and released" )
	       			local phone = scene.fieldInput.text
	       			local name = scene.fieldInputName.text
	       			if (phone ~= "" and name ~= "") then
	       				User.name = name
	       				User.number = phone
	       				composer.gotoScene("Scenes.Main")
	       			end
	   			end
	        end,
	        emboss = false,
	        shape = "roundedRect",
	        width = Width*0.6,
	        height = Height * 0.05,
	        cornerRadius = 40,
	        fillColor = {default = {36/255,122/255,191/255,1}, over = {36/255,122/255,191/255,0.5}}
	    }
	)
	scene.buttonReg.x = display.contentCenterX
	scene.buttonReg.y = display.contentCenterY*1.5
	frontObject:insert(scene.buttonReg)
	frontObject:insert(scene.textReg)

	--------------------------------------------------------------------------------------------------
	scene.textUrFace = display.newText({
		parent = frontObject,
	    text = "Я - юридическое лицо",     
	    x = display.contentCenterX,
	    y = display.contentCenterY * 1.64, 
	    width = Width * 0.6,
	    height = Height * 0.05,
	    font = native.systemFont,   
	    fontSize = 32 * ScaleFont,
	    align = "center"
	})
	scene.textUrFace:addEventListener("touch",function(event)
		composer.gotoScene("Scenes.RegistrationLegalEntity")
	end)
	scene.textUrFace:setFillColor(36/255,122/255,191/255)
end


function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()
	table.insert(sceneGroup,backObject)
	table.insert(sceneGroup,frontObject)
	scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
	showAuth()
end

function scene:show(event)
end

function scene:hide(event)

end

function scene:destroy(event)
	scene.fieldInputName:removeSelf()
	scene.fieldInput:removeSelf()

end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene