local play = {
    name = "play"
}

local bird = require('bird')
local pipes = require('pipes')

function play.keypressed(key)
    if key == 'a' then
        GamesStates.switch('pause')
    end
end

function play.load()

end

function play.update(dt)

end

function play.draw()

end

return play
