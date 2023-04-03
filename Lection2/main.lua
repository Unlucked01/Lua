local physics = require("physics")
physics.start()

-- Прыжок
-- local testJump = false

-- local myCircle = display.newCircle(160,100,30)
-- myCircle.ID = "Player"
-- physics.addBody(myCircle,"dynamic")

-- local myRect = display.newRect(160,550,320,100)
-- myRect.ID = "Ground"
-- physics.addBody(myRect,"static")

-- local function crash(event) 
--     if(event.phase == "began") then
--         if(event.object1.ID == "Player" and event.object2.ID == "Ground") then
--             testJump = true
--         end
--     end
-- end
-- Runtime:addEventListener("collision",crash)

-- local function push()
--     if (testJump) then 
--         myCircle:setLinearVelocity(0,-300)
--         testJump = false
--     end
-- end
-- myRect:addEventListener("tap",push)

-- Движение справа влево
-- local function spawn() 
--     local y = math.random(0,200)
--     local myCircle = display.newCircle(600,y,30)
--     physics.addBody(myCircle,"dynamic")
--     myCircle.gravityScale = 0;
--     myCircle:applyLinearImpulse(-0.15,0,myCircle.x,myCircle.y)
--     local function color()
--         myCircle:setFillColor(math.random(),math.random(),math.random())
--     end
--     timer.performWithDelay(math.random(2000,3000),color)
--     local function remove()
--         myCircle:removeSelf()
--     end
--     timer.performWithDelay(math.random(4000,5000),remove)
-- end
-- timer.performWithDelay(1000, spawn, 0)

-- Счётчик событий
-- local Text = display.newText("Счёт:",200,0,"Helvetica",40)
-- local x = 0
-- local score = display.newText(x,280,0,"Helvetica",40)
-- local ball = display.newCircle(160,150,30)
-- physics.addBody(ball,"dynamic")

-- local mySence = display.newCircle(160,350,20)
-- mySence:setFillColor(1,0,0,0.7)
-- mySence.ID = "target"
-- physics.addBody(mySence,"dynamic")
-- mySence.gravityScale = 0
-- mySence.isSensor = true

-- local function crash(self, event)
--     if (event.phase == "began" and event.other.ID == "target") then
--         x = x + 1
--         score.Text = x
--         event.other:removeSelf()
--     end 
-- end
-- ball.collision = crash
-- ball:addEventListener("collision",ball)