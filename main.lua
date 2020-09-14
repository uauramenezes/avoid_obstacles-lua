WIDTH = 800
HEIGHT = 600

function love.load()
    -- seed the RNG so that calls to random are always random
    math.randomseed(os.time())

    -- initialize text fonts
    font = love.graphics.newFont('mono.ttf', 15)
    love.graphics.setFont(font)

    love.window.setMode(WIDTH, HEIGHT, {resizable=true, vsync=false, fullscreen=false})
end

function love.update()

end

function love.draw()
    
end