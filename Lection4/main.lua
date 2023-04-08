local back = display.newRect(320/2,400/2,350,800)
back:setFillColor(1,1,1,1)

-- local mas = {}
-- local test = false

-- local function spawn()
--     for i = 1, 3 do
--         local x = math.random(10,300)
--         local y = math.random(10,480)
--         mas[i] = display.newCircle(x,y,40)
--         mas[i]:setFillColor(1,0,0,1)
--         local function myTouch()
--             test = true
--         end
--         mas[i]:addEventListener("tap", myTouch)
--     end
-- end
-- spawn()

-- local function clear()
--     for i = 1, 3 do
--         mas[i]:removeSelf()
--         mas[i] = nil
--     end
-- end

-- function onUpdate()
--     if (test) then
--         clear()
--         spawn()
--         test = false
--     end
-- end
-- Runtime:addEventListener("enterFrame", onUpdate)

-- -- перемещение по карте
-- local back = display.newImageRect("map.png", 1500,1000)
-- back.x = 320/2
-- back.y = 480/2

-- local cir = display.newCircle(160,250,30)
-- cir:setFillColor(1,0,0,1)

-- local group = display.newGroup()
-- group:insert(back)
-- group:insert(cir)

-- local function moveMap()
--     targetX = 320/2 - cir.x
--     targetY = 480/2 - cir.y
--     transition.moveTo(group,{x = targetX, y = targetY, time = 500})
-- end

-- local function movePers(event)
--     eventX = event.x - back.x + cir.x
--     eventY = event.y - back.y + cir.y
--     transition.moveTo(cir,{x = eventX, y = eventY, time = 500, onComplete = moveMap})
-- end

-- back:addEventListener("tap", movePers)

local sheetOptions = 
{
    width = 512,
    height = 256,
    numFrames = 8
}

local imageSheet = graphics.newImageSheet("sprites-cat-running.png", sheetOptions)

local sequenceData = 
{
    name = "run",
    start = 1,
    count = 8,
    time = 500,
    loopCount = 0,
    loopDirection = "forward"
}

local character = display.newSprite(imageSheet, sequenceData)
character.x = 160
character.y = 240
character:scale(0.8,0.8)

character:play()