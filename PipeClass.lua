local imgPipe = love.graphics.newImage("graphics/sprites/pipe.png")

PipeClass = Class{}
function PipeClass:init()
    self.x = windowWidth+1
    self.y = math.random(110,460)
    self.width = imgPipe:getWidth()
    self.gap = 70
    self.scored = false -- for later when we add scoring
end

function PipeClass:update(dt)
    self.x = self.x -60*dt
end

function PipeClass:draw()
    love.graphics.draw(imgPipe, self.x, self.y+self.gap)
    love.graphics.draw(imgPipe, self.x, self.y-self.gap, 0, 1, -1)

    --if debugFlag then
    --    love.graphics.rectangle("line",self.x,self.y-self.gap,self.width,self.gap*2)
    --end
end

function PipeClass:collision(bird)
    local collisionX = self.x+self.width >= bird.x and bird.x+bird.width >= self.x

    local topY = (0+self.y-self.gap) >= bird.y and bird.y+bird.height >= 0
    local bottomY = (windowHeight) >= bird.y and bird.y+bird.height >= self.y+self.gap

    return collisionX and (topY or bottomY)
end

    