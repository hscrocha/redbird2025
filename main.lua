require "libs.Class"
require "BackgroundClass"
require "BirdClass"
require "ObstacleSpawner"
require "Sounds"

myfont = love.graphics.newFont(42) -- Create Standard font size 42.
gameState = "title"
debugFlag = true

function love.load() -- Load is executed only once (use for setup)
    love.window.setTitle("Red Bird Game")
    windowWidth, windowHeight = love.graphics.getDimensions()
    math.randomseed(os.time()) -- RNG setup for later
    
    bg = BackgroundClass()

    bird = BirdClass()
    obs = ObstacleSpawner()

end

-- For keys that does not require dt (delta time) for anything...
-- We can use this function instead of update(dt)
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "return" then
        gameState = "play"
    elseif key == "space" and gameState=="play" then
        bird:flap()
    end
end
    
function love.update(dt)
-- Update is executed each frame, dt is delta time (a fraction of a sec)
    if gameState == "play" then
        bg:update(dt)
        bird:update(dt)
        obs:update(dt)

        if obs:collision(bird) then
            gameState = "over"
            sounds["collision"]:play()
        end

        obs:scoring(bird)
    end
end

function love.draw() -- Draws the game after the update
    if gameState == "title" then
        drawTitleState()
    elseif gameState == "play" then
        drawPlayState()
    elseif gameState == "over" then
        drawGameOverState()
    end
end

function drawTitleState()
    bg:drawBackground()

    love.graphics.setColor(0.6,0,0)
    love.graphics.print("Red Bird Game", myfont, 250, 120)
    --            print(message,    font,   x, y) 
    love.graphics.print("Press Enter to Start", 340, 180)
    love.graphics.setColor(1,1,1)

    bg:drawForeground()
end

function drawPlayState() 
    bg:drawBackground()

    obs:draw()

    bg:drawForeground()

    bird:draw()

    love.graphics.print("Score:"..bird.score, myfont, 10, 10)

end

function drawGameOverState()
    love.graphics.print("Game Over", myfont, 270, 120)
end

