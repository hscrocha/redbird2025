require "libs.Class"

myfont = love.graphics.newFont(42) -- Create Standard font size 42.

function love.load() -- Load is executed only once (use for setup)
end

function love.update(dt)
-- Update is executed each frame, dt is delta time (a fraction of a sec)
end

function love.draw() -- Draws the game after the update
    love.graphics.print("Red Bird Game", myfont, 250, 120)
    --            print(message,    font,   x, y) 
    love.graphics.print("Press Enter to Start", 340, 180)

end
