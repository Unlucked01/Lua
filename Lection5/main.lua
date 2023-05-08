local physics = require("physics")
physics.start()
physics.setGravity(0,0)

local back = display.newRect(320/2, 480/2, 380, 700)
-- display.contentCenterX, display.contentCenterY,
back:setFillColor(0,1,0,1)

local gun = display.newRect(320/2,500,20,60)
gun:setFillColor(1,0,0,1)

local function rotateObj(event)
    if(event.phase == "began") then
        gun.rotation = math.ceil(math.atan2((event.y - gun.y), (event.x - gun.x)) * 180 / math.pi) + 90
    end 
    if(event.phase == "moved") then
        gun.rotation = math.ceil(math.atan2((event.y - gun.y), (event.x - gun.x)) * 180 / math.pi) + 90
    end
    if(event.phase == "ended" or event.phase == "cancelled") then
        local actualX, actualY = gun:localToContent(0,-20)
        local bullet = display.newCircle(actualX, actualY, 10)
        physics.addBody(bullet,"dynamic", {isSensor= true})
        bullet.ID = "bullet"
        bullet:setFillColor(1,0,0,1)
        local angle = - math.rad(gun.rotation + 90)
        local xComp = math.cos(angle)
        local yComp = - math.sin(angle)
        bullet:applyLinearImpulse(-0.05 * xComp, -0.05 * yComp, gun.x, gun.y)
    end
end
back:addEventListener("touch", rotateObj)

local function spawnBot()
    local y = math.random(0,200)
    local myRec = display.newRect(400, y, 70, 70)
    physics.addBody(myRec, "dynamic")
    myRec.isSensor = true
    myRec:setLinearVelocity(-150,0)
    local function crash(self,event)
        if(event.phase == "began") then
            if(event.other.ID == "bullet") then
                self:removeSelf()
                event.other:removeSelf()
            end
        end
    end
    myRec.collision = crash
    myRec:addEventListener("collision", myRec)
end
timer.performWithDelay(1000,spawnBot,0)