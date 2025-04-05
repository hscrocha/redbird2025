BackgroundClass = Class{}
function BackgroundClass:init()
    self.imgCloud = love.graphics.newImage("graphics/bg/cloud.png")
    self.imgGrass = love.graphics.newImage("graphics/bg/grass.png")
    self.posCloud = 0
    self.posGrass = 0
    self.width = self.imgCloud:getWidth()     
end

function BackgroundClass:update(dt) -- for later
    self.posCloud = (self.posCloud +30*dt) % self.width
    self.posGrass = (self.posGrass +60*dt) % self.width
end

function BackgroundClass:drawBackground()
    love.graphics.draw(self.imgCloud, 0-self.posCloud)
    love.graphics.draw(self.imgCloud, self.width-self.posCloud)
end

function BackgroundClass:drawForeground()
    love.graphics.draw(self.imgGrass, 0-self.posGrass)
    love.graphics.draw(self.imgGrass, self.width-self.posGrass)
end
