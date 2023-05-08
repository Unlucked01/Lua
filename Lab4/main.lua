local physics = require("physics")
physics.start()

local testJump = false

local Circle = display.newCircle(100,150,20)
Circle.ID = "Player"
physics.addBody(Circle,"dynamic", {friction=1.0, bounce=0.0})

local Sensor = display.newCircle(-60,280,100)
Sensor.isSensor = true
physics.addBody(Sensor,"kinematic")

local SpawnGround = display.newRect(100,180,120,25)
SpawnGround.ID = "Ground"
physics.addBody(SpawnGround,"static", {friction=1.0, bounce=0.0})
timer.performWithDelay(100, remove, 1)

local function remove(self)
    SpawnGround:removeSelf()
end

local function jump(event) 
        if(event.phase == "began") then
            if(event.object1.ID == "Player" and event.object2.ID == "Ground") then
                testJump = true
            end
        end
    end
    Runtime:addEventListener("collision", jump)

local function move()
    if (testJump) then 
        Circle:setLinearVelocity(20,-250)
        testJump = false
    end
end
Sensor:addEventListener("tap", move)

local function spawn()
    local y = math.random(120,250)
    local obs = display.newRect(550,y,120,25)
    local crash_obs = display.newRect(550,y+10,120,25)
    obs.ID = "Ground"
    crash_obs.ID = "Crash"
    physics.addBody(obs, "kinematic", {friction=1.0, bounce=0.0})
    physics.addBody(crash_obs, "kinematic")
    obs:setLinearVelocity(-50,0)
    crash_obs:setLinearVelocity(-50,0)
end
timer.performWithDelay(math.random(2000,3500), spawn, 0)

local function crash(self,event)
    if(event.phase == "began") then
        if(event.other.ID == "Crash") then
            physics.pause()
        end 
    end
end

Circle.collision = crash
Circle:addEventListener("collision",myCircle)

