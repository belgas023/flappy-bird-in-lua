local pause = {
    name = "pause"
}

local bird = require('bird')
local pipes = require('pipes')

function pause.keypressed(key)
    if key == 'a' then
        GamesStates.switch('play')
    end
end

function pause.load()

end

function pause.update(dt)
    bird.update(dt)
    pipes.update(dt)
end

function pause.draw()
    love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

return pause
