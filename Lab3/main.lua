local physics = require("physics")
physics.start()

local back = display.newRect(160,250,350,750)
back:setFillColor(0.5,0.5,0.5,1)

local circle_player = display.newCircle(160,250,30)
circle_player:setFillColor(1,1,1,1)
circle_player.ID = "Player"

local function moveObject(event)
        if(event.phase == "began") then
           display.currentStage:setFocus(circle_player)
           circle_player.touchOffsetX = event.x - circle_player.x
           circle_player.touchOffsetY = event.y - circle_player.y
        end
        if(event.phase == "moved") then
            circle_player.x = event.x - circle_player.touchOffsetX
            circle_player.y = event.y - circle_player.touchOffsetY
        end
        if(event.phase == "ended") then
            display.currentStage:setFocus(nil)
        end
    end
    circle_player:addEventListener("touch", moveObject)

local function spawn_red()
    local y = math.random(0,200)
    local circle = display.newCircle(math.random(50,300),10,20)
    circle:setFillColor(1,0,0)
    circle.gravityScale = math.random(60,350)/100;
    circle.ID = "Good"
    physics.addBody(circle,"dynamic")
    circle.isSensor = true
end
timer.performWithDelay(math.random(500,1500), spawn_red, 0)

local function spawn_black()
    local y = math.random(0,200)
    local circle = display.newCircle(math.random(50,300),10,20)
    circle:setFillColor(0,0,0)
    circle.gravityScale = math.random(60,350)/100;
    circle.ID = "Bad"
    physics.addBody(circle,"dynamic")
    circle.isSensor = true
end
timer.performWithDelay(math.random(1200,1500), spawn_black, 0)

local Text1 = display.newText("Счёт:",250,-25,"Helvetica",25)
local Text2 = display.newText("Рекорд:",50,-25,"Helvetica",25)
local x = 0
local y = 0
local score = display.newText(x,300,-25,"Helvetica",25)
local record = display.newText(y,100,-25,"Helvetica",25)

local function crash_elem(self, event) 
    print("ok")
    if(event.phase == "began" and event.other.ID == "Good") then
        print("good")
        x = x + 1
        score.text = x
        event.other:removeSelf()
    end
    if (event.phase == "began" and event.other.ID == "Bad") then
        print("bad")
        if x > y then
            y = x
            record.text = y
        end
        x = 0
        score.text = x
        event.other:removeSelf()
    end 
end

circle_player.collision = crash_elem
circle_player:addEventListener("collision",circle_player)

local myRect = display.newRect(160,550,320,100)
myRect.ID = "Ground"
myRect.isSensor = true
physics.addBody(myRect,"static")

local function removeCircle(self, event) 
    if(event.phase == "began") then
        if(event.other.ID == "Bad" or "Good") then
            event.other:removeSelf()
        end
    end
end
myRect.collision = removeCircle
myRect:addEventListener("collision",myRect)

