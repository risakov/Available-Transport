
local composer = require("composer")
local widget = require("widget")
local json = require( "json" )

local scene = composer.newScene()
local backObject = display.newGroup()
local frontObject = display.newGroup()
local webView

local function webViewShow()
 	scene.background = display.newRect( backObject, CenterX, CenterY, Width, Height )
    local function handleResponse( event )
 
        if not event.isError then
            local response = json.decode( event.response )
            print( event.response )
        else
            print( "Error!" )
        end
 
        return
    end

    webView = native.newWebView( display.contentCenterX, display.contentCenterY*0.87, display.contentWidth*1.08 , display.contentHeight - display.contentHeight*0.097)
    webView:request("index.html", system.ResourceDirectory)
    local sceneGroup = scene.view

    --------------------------------------------------------------------------------------------------

    scene.buttonStartTrip = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( event.phase == "ended" ) then
	       			composer.gotoScene("Scenes.Destination")
	   			end
	        end,
	        emboss = false,
	        shape = "Rect",
	        width = Width*0.34,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)

	scene.buttonStartTrip.x = display.contentCenterX
	scene.buttonStartTrip.y = display.contentCenterY*1.88
	frontObject:insert(scene.buttonStartTrip)

    scene.textStartTrip = display.newText({
    	parent = frontObject,
	    text = "Поехали!",     
	    x = display.contentCenterX,
	    y = display.contentCenterY*1.968, 
	    width = Width*0.34,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textStartTrip:setFillColor(0,0,0)
--------------------------------------------------------------------------

	scene.buttonTypeTransport = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( "ended" == event.phase ) then
	       			print( "Button was pressed and released" )
	   			end
	        end,
	        emboss = false,
	        shape = "Rect",
	        width = Width*0.34,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)
	scene.buttonTypeTransport.x = display.contentCenterX*1.68
	scene.buttonTypeTransport.y = display.contentCenterY*1.88
	frontObject:insert(scene.buttonTypeTransport)

    scene.textTypeTransport = display.newText({
    	parent = frontObject,
	    text = "Вид транспорта",     
	    x = display.contentCenterX*1.68,
	    y = display.contentCenterY*1.93, 
	    width = Width*0.34,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textTypeTransport:setFillColor(0,0,0)
--------------------------------------------------------------------------------------------------
	scene.buttonProfile = widget.newButton(
	    {
	        onEvent = function (event)
	        	if ( "ended" == event.phase ) then
	       			composer.gotoScene("Scenes.Profile")
	   			end
	        end,
	        emboss = false,
	        -- Properties for a rounded rectangle button
	        shape = "Rect",
	        width = Width*0.329,
	        height = Height * 0.12,
	        fontSize = 40*ScaleFont,
	        fillColor = {default = {38/255,255/255,191/255,1}, over = {38/255,255/255,191/255,0.5}}
	    }
	)

	scene.buttonProfile.x = display.contentCenterX*0.33
	scene.buttonProfile.y = display.contentCenterY*1.88
	frontObject:insert(scene.buttonProfile)

	scene.textProfile = display.newText({
		parent = frontObject,
	    text = "Профиль",     
	    x = display.contentCenterX*0.33,
	    y = display.contentCenterY*1.968, 
	    width = Width*0.34,
	    height = Height * 0.12,
	    font = native.systemFont,   
	    fontSize = 44 * ScaleFont,
	    align = "center"  -- Alignment parameter
	})
	scene.textProfile:setFillColor(0,0,0)
	--------------------------------------------------------------------------------------------------

end

function scene:create(event)

	local sceneGroup = self.view

	composer.removeHidden()
	table.insert(sceneGroup,backObject)
    table.insert(sceneGroup,frontObject)

    webViewShow()
   	
end

function scene:show(event)
end

function scene:hide(event)
	
end

function scene:destroy(event)
	webView:removeSelf()
	scene.buttonStartTrip:removeSelf()
	scene.buttonTypeTransport:removeSelf()
	scene.buttonProfile:removeSelf()
	scene.textStartTrip:removeSelf()
	scene.textTypeTransport:removeSelf()
	scene.textProfile:removeSelf()
end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)

return scene