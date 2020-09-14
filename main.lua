WIDTH = 750
HEIGHT = 550

function love.load()
    -- initialize text fonts
    font = love.graphics.newFont('mono.ttf', 15)
    love.graphics.setFont(font)

    love.window.setMode(WIDTH, HEIGHT, {resizable=true, vsync=false, fullscreen=false})

    -- function to create walls objects
    function createWalls(x)
        local this = 
        {
            x = x,
            y = 0,
            width = 4,
            height = HEIGHT
        }

        return this
    end

    -- function to create elements objects
    function createElements(x, y, line)
        local this = 
        {
            x = x,
            y = y,
            width = 50,
            height = 50,
            line = line
        }

        return this
    end

    -- create the walls, the player and obstacles 
    wallLeft = createWalls(WIDTH / 4 - 2)
    wallRight = createWalls(WIDTH * (3 / 4) - 2)

    player = createElements(WIDTH / 2 - 25, 475, 1)

    obstacle = {}

    for i = 1, 3, 1 do
        obstacle[i] = createElements((i * 150) + 50, 300, 1)
    end

end

function love.update()

end

function love.draw()
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

    
    love.graphics.rectangle('fill', wallLeft.x, wallLeft.y, wallLeft.width, wallLeft.height)
    love.graphics.rectangle('fill', wallRight.x, wallRight.y, wallRight.width, wallRight.height)

    for i = 1, 3, 1 do
        love.graphics.rectangle('fill', obstacle[i].x, obstacle[i].y, obstacle[i].width, obstacle[i].height)
    end

end