local game = true
local physics = require("physics")

physics.start()

local bird = display.newCircle(250,175,10)
bird: setFillColor (1,1,2,1)
bird.ID = "Player"
physics.addBody(bird,"dynamic")
bird.gravityScale = 7
local function push()
    bird:applyLinearImpulse(0,-0.075)
    end

local Button = display.newCircle(-40,280,50)
Button:setFillColor (1,1,1,0.5)
Button:addEventListener("tap", push)

local function spawn() 
    local y = math.random(100,220)
    local Top = display.newRect(700, y-150, 100, 50 )
    local Low = display.newRect(700, y+150, 100, 50)
    local middle = display.newRect(700, y, 100, 50)
    middle.alpha = 0
    physics.addBody(Top,"dynamic")
    physics.addBody(Low,"dynamic")
    physics.addBody(middle,"dynamic")
    Top.gravityScale = 0
    Low.gravityScale = 0
    middle.gravityScale = 0
    Top:rotate(90)
    Low:rotate(90)
    middle:rotate(90)
    Top.ID = "Ground"
    Low.ID = "Ground"
    middle.ID = "Target"
    Top.isSensor = true
    Low.isSensor = true
    middle.isSensor = true
    Top:setLinearVelocity(-35,0)
    Low:setLinearVelocity(-35,0)
    middle:setLinearVelocity(-35,0)
    local R = math.random()
    local G = math.random()
    local B = math.random()
    Top:setFillColor(R,G,B)
    Low:setFillColor(R,G,B)
    local function remove()
        Top:removeSelf()
        Low:removeSelf()
    end
    if(game) then
        timer.performWithDelay(math.random(10000,12000),remove)
    end 
end
if (game) then
        timer.performWithDelay(2500, spawn, 0)
    end


 local scoreText = display.newText("Счёт:",0,30,"Helvetica",40)
 local x = 0
 local score = display.newText(x,80,30,"Helvetica",40)


 local function crash(self, event)
     if (event.other.ID == "Target") then
         x = x + 1
         score.text = x
     end 
     if (event.other.ID == "Ground") then
        local Text = display.newText("Game Over!",200,50,"Helvetica",90)
        Text:setTextColor(1,0,0,1)
        scoreText:setTextColor(0,0,0,0)
        score:setTextColor(0,0,0,0)
        physics.pause()
        game = false 
    end 
 end

bird.collision = crash
bird:addEventListener("collision",bird)
