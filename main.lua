WIDTH = 800
HEIGHT = 600

function love.load()
    -- seed the RNG so that calls to random are always random
    math.randomseed(os.time())

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
    wallLeft = createWalls(200)
    wallRight = createWalls(600)

    player = createElements(WIDTH / 2 - 25, 525, 1)

    obstacle1 = createElements(250, 300, 1)
    obstacle2 = createElements(350, 300, 2)
    obstacle3 = createElements(450, 300, 3)
end

function love.update()

end

function love.draw()
    
end