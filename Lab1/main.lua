local physics = require("physics")

physics.start()
local grav = math.random(-5,5)

local MainCircle = display.newCircle(160,450,25)
MainCircle: setFillColor (1,1,1,1)
MainCircle.gravityScale = grav
physics.addBody(MainCircle,"dynamic")

local rightRect = display.newRect(330,480,5,1080)
physics.addBody(rightRect,"static")

local leftRect = display.newRect(-10,480,5,1080)
physics.addBody(leftRect,"static")

local topRect = display.newRect(330,-110,820,5)
physics.addBody(topRect,"static")

local firstObstacle = display.newRect(math.random(10,80),math.random(-20,30),250,12)
if grav > 0 then firstObstacle:rotate(math.random(0,15)) else firstObstacle:rotate(math.random(-15,0)) end
physics.addBody(firstObstacle,"static")

local secondObstacle = display.newRect(math.random(200,220), math.random(80,160),250,15)
physics.addBody(secondObstacle,"static")

local thirdObstacle = display.newRect(math.random(-30,80),math.random(280,340),250,15)
physics.addBody(thirdObstacle,"static")

local LeftFan = display.newRect( 260, 550, 250, 80 )
LeftFan: setFillColor (1,0,0,1)
LeftFan:rotate(135)
physics.addBody(LeftFan,"static")

local RightFan = display.newRect( 60, 550 , 250, 80 )
RightFan: setFillColor (0,0,1,1)
RightFan:rotate(45)
physics.addBody(RightFan,"static")

local function pushLeft()
    MainCircle:applyLinearImpulse(-0.3,-0.3, MainCircle.x,MainCircle.y)
end
local function pushRight()
    MainCircle:applyLinearImpulse(0.3,-0.3, MainCircle.x,MainCircle.y)
end
LeftFan:addEventListener("tap",pushLeft)
RightFan:addEventListener("tap",pushRight)