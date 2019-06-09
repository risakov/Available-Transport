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

	scene.lineForm = display.newLine(frontObject,0,Height*0.25,Width,Height*0.25)
	scene.lineForm:setStrokeColor( 36/255,122/255,191/255, 1 )
	scene.lineForm.strokeWidth = 8
end


local function scrollListener( event )
 
    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end
 
    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        elseif ( event.direction == "left" ) then print( "Reached right limit" )
        elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end
 
    return true
end

local function showSlideAch()
  
 

local scrollView = widget.newScrollView(
    {
        x = CenterX,
        y = Height,
        width = 300,
        height = 400,
        scrollWidth = 600,
        scrollHeight = 800,
        listener = scrollListener
    }
)
 
-- Create a image and insert it into the scroll view
--local background = display.newImageRect( "assets/scrollimage.png", 768, 1024 )
--scrollView:insert( background )
end

function scene:create(event)
	local sceneGroup = self.view
	composer.removeHidden()
	showTopInfo()

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