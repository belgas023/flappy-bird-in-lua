local bird = require('bird')
local pipes = require('pipes')

function love.load()
    bird.load()
    pipes.load()
end

function love.update(dt)
    bird.update(dt)
    pipes.update(dt)
end

function love.draw()
    bird.draw()
    pipes.draw()
end
