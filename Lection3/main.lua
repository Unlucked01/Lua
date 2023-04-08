local widget = require("widget")

--кликер
-- local x = 0
-- local score = display.newText(x,170,0,"Helvetica",100)

-- local function ButtonClick()
--     x = x + 1
--     score.text = x
--     return true
-- end

-- Button = widget.newButton{
--     label = "Click me!",
--     shape = 'rect',
--     fillColor = {default={1,1,1},over={0.8,0.8,0.8}},
--     labelColor = {default={0,0,0},over={0.5,0.5,0.5}},
--     fontSize = 30,
--     width = 200,
--     height = 50,
--     onRelease = ButtonClick
-- }
-- Button.x = 150
-- Button.y = 250


-- перемещение по кнопке
-- local back = display.newRect(160,250,350,750)
-- back:setFillColor(0,1,0,1)

-- local circle = display.newCircle(160,250,30)
-- circle:setFillColor(1,0,0,1)

-- local function moveUp(event)
--     if(event.phase == "began") then
--         circle.y = circle.y - 5
--     end
-- end

-- -- создание пользовательской кнопки
-- local ButtonUp = widget.newButton{
--     defaultFile = "button1.png",
--     overFile = "button2.png",
--     width = 100,
--     height = 100,
--     x = 160,
--     y = 460,
--     onEvent = moveUp
-- }

-- передвижение по клику
-- local function movePers(event)
--     local eventx = event.x
--     local eventy = event.y
--     transition.moveTo(circle, {x = eventx, y = eventy, time = 300})
-- end
-- back:addEventListener("touch",movePers)

-- перетаскивание
-- local function moveObject(event)
--     if(event.phase == "began") then
--        display.currentStage:setFocus(circle) 
--        circle.touchOffsetX = event.x - circle.x
--        circle.touchOffsetY = event.y - circle.y
--     end
--     if(event.phase == "moved") then
--         circle.x = event.x - circle.touchOffsetX
--         circle.y = event.y - circle.touchOffsetY
--     end
--     if(event.phase == "ended") then
--         display.currentStage:setFocus(nil)
--     end
-- end
-- circle:addEventListener("touch", moveObject)