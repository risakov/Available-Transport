local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()

local function showTopInfo()
	if (User.image ~= nil) then
		scene.avatar = display.newImageRect(frontObject,string.format(User.image),Width*0.2,Width*0.2)
		scene.avatar.x = CenterX
		scene.avatar.y = Height * 0.1
	end
	--[[
	scene.textName = display.newText({
		parent = frontObject,
	    text = string.format(User.name),     
	    x = CenterX,
	    y = Height*0.2, 
	    width = Width*0.5,
	    font = native.systemFont,   
	    fontSize = 76*ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textName.text = User.name
	scene.textName:setFillColor(0,0,0)
	scene.textName.align = "left"
	]]
	scene.lineForm = display.newLine(frontObject,0,Height*0.25,Width,Height*0.25)
	scene.lineForm:setStrokeColor( 36/255,122/255,191/255, 1 )
	scene.lineForm.strokeWidth = 8
end


local function showSlideAch()
	--scene.mainAch = {}
	--for i = 1,3 do
		--scene.mainAch[i] = display.newCircle(i*Width*0.25,CenterY*0.65,Width*0.1)
	--	scene.mainAch[i]:setFillColor(36/255,122/255,191/255, 1)
--	end
--	scene.lineForm2 = display.newLine(frontObject,0,Height*0.4,Width,Height*0.4)
	--scene.lineForm2:setStrokeColor( 36/255,122/255,191/255, 1 )
	--scene.lineForm2.strokeWidth = 8
	scene.info = display.newImageRect(frontObject,"Images/Shapka.png",Width,Height*0.17)
	scene.info.x = CenterX
	scene.info.y = CenterY * 0.55
end

local function showButtons()
	scene.buttonOptPriory = display.newImageRect(frontObject,"Images/rnd.png",Width*0.6,Height*0.07)
	scene.buttonOptPriory.x = display.contentCenterX
	scene.buttonOptPriory.y = display.contentCenterY*0.9
	frontObject:insert(scene.buttonOptPriory)

	scene.textOptPriory = display.newText({
		parent = frontObject,
	    text = "Настройка приоритетов",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*0.93, 
	    width = Width*0.6,
	    height = Height * 0.06,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textOptPriory:setFillColor(36/255,122/255,191/255, 1)

	scene.buttonHistoryTrip = display.newImageRect(frontObject,"Images/rnd.png",Width*0.6,Height*0.07)
	scene.buttonHistoryTrip.x = display.contentCenterX
	scene.buttonHistoryTrip.y = display.contentCenterY*1.1
	frontObject:insert(scene.buttonHistoryTrip)

	scene.textHistoryTrip = display.newText({
		parent = frontObject,
	    text = "История поездок",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.13, 
	    width = Width*0.6,
	    height = Height * 0.06,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textHistoryTrip:setFillColor(36/255,122/255,191/255, 1)


	scene.buttonService = display.newImageRect(frontObject,"Images/rnd.png",Width*0.6,Height*0.07)
	scene.buttonService.x = display.contentCenterX
	scene.buttonService.y = display.contentCenterY*1.3
	frontObject:insert(scene.buttonService)

	scene.textService = display.newText({
		parent = frontObject,
	    text = "Служба поддержки",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.33, 
	    width = Width*0.6,
	    height = Height * 0.06,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textService:setFillColor(36/255,122/255,191/255, 1)


	scene.buttonPromokod = display.newImageRect(frontObject,"Images/rnd.png",Width*0.6,Height*0.07)
	scene.buttonPromokod.x = display.contentCenterX
	scene.buttonPromokod.y = display.contentCenterY*1.5
	frontObject:insert(scene.buttonPromokod)

	scene.textPromokod = display.newText({
		parent = frontObject,
	    text = "Ввести промокод",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.53, 
	    width = Width*0.6,
	    height = Height * 0.06,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textPromokod:setFillColor(36/255,122/255,191/255, 1)


	scene.buttonInfo = display.newImageRect(frontObject,"Images/rnd.png",Width*0.6,Height*0.07)
	scene.buttonInfo.x = display.contentCenterX
	scene.buttonInfo.y = display.contentCenterY*1.7
	frontObject:insert(scene.buttonInfo)

	scene.textInfo = display.newText({
		parent = frontObject,
	    text = "Информация",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.73, 
	    width = Width*0.6,
	    height = Height * 0.06,
	    font = native.systemFont,   
	    fontSize = 36 * ScaleFont,
	    align = "center"
	})
	scene.textInfo:setFillColor(36/255,122/255,191/255, 1)

	scene.buttonBack = display.newImageRect(frontObject,"Images/back.png",Width*0.075,Width*0.075)
	scene.buttonBack.x = CenterX*0.2
	scene.buttonBack.y = CenterY*0.1
	scene.buttonBack:addEventListener("touch",function(event)
		composer.gotoScene("Scenes.Main")
	end)
	scene.buttonOpt = display.newImageRect(frontObject,"Images/options.png",Width*0.15,Width*0.15)
	scene.buttonOpt.x = CenterX*1.7
	scene.buttonOpt.y = CenterY*0.15
end

function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()
	showTopInfo()
	showSlideAch()
	showButtons()
	scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )

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