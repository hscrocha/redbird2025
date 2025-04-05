-- Add this to load()
-- Sound Dictionary / Table
sounds = {} -- create an empty table
sounds['music'] = love.audio.newSource("sounds/yummie.mp3","static")
sounds['score'] = love.audio.newSource("sounds/pickup_coin.wav","static")
sounds['collision'] = love.audio.newSource("sounds/hit_hurt.wav","static")

-- starts off music
sounds['music']:setLooping(true)
sounds['music']:play()

-- Except for music, call the appropriate sounds on the code
