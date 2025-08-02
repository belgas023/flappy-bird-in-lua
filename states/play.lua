local play = {
    name = "play"
}

local bird = require('bird')
local pipes = require('pipes')
local bg = require('background')

function play.keypressed(key)
    if key == 'a' then
        GamesStates.switch('pause')
    end
end

function play.load()

end

function play.update(dt)
    bird.update(dt)
    pipes.update(dt)
    bg.update(dt)
end

function play.draw()

end

return play
