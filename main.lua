WIDTH = 750
HEIGHT = 550

function love.load()
    -- initialize text fonts
    font = love.graphics.newFont(30)
    love.graphics.setFont(font)

    love.window.setMode(WIDTH, HEIGHT, {resizable=false, vsync=false, fullscreen=false})

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
    function createElements(x, y)
        local this = 
        {
            x = x,
            y = y,
            width = 50,
            height = 50,
        }

        return this
    end

    -- get random x positions to obstacles  
    function getPositionX()
        local random = love.math.random(5)
        if random == 1 then
            return 200
        elseif random == 2 then
            return 275
        elseif random == 3 then
            return 350
        elseif random == 4 then
            return 425
        else
            return 500
        end
    end

    -- create the walls, the player and obstacles 
    leftWall = createWalls(WIDTH / 4 - 2)
    rightWall = createWalls(WIDTH * (3 / 4) - 2)

    player = createElements(WIDTH / 2 - 25, HEIGHT - 51, 1)

    obstacle = {}
    for i = 1, 5, 1 do
        if i <= 2 then
            obstacle[i] = createElements(getPositionX(), -50)
        else
            obstacle[i] = createElements(getPositionX(), -150)
        end
    end
    
    gameState = 'start'
    score = 0
end

function love.update(dt)

    if gameState == 'play' then
        for i = 1, 5, 1 do
            obstacle[i].y = obstacle.y[i] + (1 / 10)
        end
    end

end



function love.draw()
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

    
    love.graphics.rectangle('fill', leftWall.x, leftWall.y, leftWall.width, leftWall.height)
    love.graphics.rectangle('fill', rightWall.x, rightWall.y, rightWall.width, rightWall.height)

    love.graphics.printf('Score', 0, 75, leftWall.x, 'center')
    love.graphics.printf(score, 0, 125, leftWall.x, 'center')

    if gameState == 'play' then
        love.graphics.printf('Press Space', rightWall.x + 2, 75, WIDTH - rightWall.x, 'center')
    elseif gameState == 'start' then
        love.graphics.printf('Press Enter to start!', 0, 125, WIDTH, 'center')
        love.graphics.printf('Press Space to pause!', 0, 175, WIDTH, 'center')
        love.graphics.printf('Press Enter', rightWall.x + 2, 75, WIDTH - rightWall.x, 'center')
    elseif gameState == 'gameOver' then
        love.graphics.printf('Press Escape to restart!', 0, 50, WIDTH, 'center')
        love.graphics.printf('Press Esc', rightWall.x + 2, 75, WIDTH - rightWall.x, 'center')
    end

    if gameState == 'play' then
        for i = 1, 5, 1 do
        love.graphics.rectangle('fill', obstacle[i].x, obstacle[i].y, obstacle[i].width, obstacle[i].height)
        end
    end
end
