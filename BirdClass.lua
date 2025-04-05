BirdClass = Class{}
function BirdClass:init()
    self.x = windowWidth/2-25
    self.y = windowHeight/2
    self.birdSprites = {} -- creates an empty array
    self.birdSprites[1] = love.graphics.newImage("graphics/sprites/bird01.png")
    self.birdSprites[2] = love.graphics.newImage("graphics/sprites/bird02.png")
    self.birdSprites[3] = love.graphics.newImage("graphics/sprites/bird03.png")
    self.width = self.birdSprites[1]:getWidth()
    self.height = self.birdSprites[1]:getHeight()
    self.curSprite = 1
    self.timeLapsed = 0

    self.speed = 1 -- for later
    self.score = 0 -- for later
end

function BirdClass:flap() -- New func to propel the bird upward
    self.speed = -80 -- change this value based on how it runs for you
end

function BirdClass:draw()
    love.graphics.draw(self.birdSprites[self.curSprite], self.x, self.y)
end

function BirdClass:update(dt)
    self.timeLapsed = self.timeLapsed +dt
    if self.timeLapsed >= 0.2 then -- approx 0.2 secs
        self.timeLapsed = 0
        self.curSprite = (self.curSprite%3)+1
    end

    -- Add this to BirdClass:update(dt)
    self.y = math.min(self.y + self.speed*dt, windowHeight-100)
    self.speed = self.speed + 60*dt
end
