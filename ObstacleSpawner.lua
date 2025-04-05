require "PipeClass"

ObstacleSpawner = Class{}
function ObstacleSpawner:init()
    self.obstacles = {}
    table.insert(self.obstacles, PipeClass()) 
    self.timeLapsed = 0
end

function ObstacleSpawner:draw()
    for k=1, #self.obstacles do
        self.obstacles[k]:draw() -- for each obstacle, draw it
    end
end

function ObstacleSpawner:update(dt)
    -- logic for adding new obstacles
    self.timeLapsed = self.timeLapsed +dt
    if self.timeLapsed >= 5 then -- after 5 secs add new obstacle
        table.insert( self.obstacles, PipeClass() ) 
        self.timeLapsed = 0
    end    
    
    -- logic for updating the current obstacles
    for k=1, #self.obstacles do
        self.obstacles[k]:update(dt)
    end
    
    -- logic for removing obstacles that left the screen
    if self.obstacles[1].x+self.obstacles[1].width < 0 then
        table.remove(self.obstacles, 1)
    end
end

function ObstacleSpawner:collision(bird)
    for k=1, #self.obstacles do
        if self.obstacles[k]:collision(bird) then
            return true
        end
    end
    return false
end

function ObstacleSpawner:scoring(bird)
    for k=1, #self.obstacles do
        local pipe = self.obstacles[k]
        if pipe.scored == false and pipe.x+pipe.width < bird.x then
            pipe.scored = true
            bird.score = bird.score + 1
            sounds["score"]:play()
        end
    end
end
    