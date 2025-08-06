local pipes = {}

local timer = 0
local DelayPipe = 100

local bird = require('bird')

function pipes.load()
    --Pipe.sprite = love.graphics.newImage('assets/pipe.png')
end

local function pipeSpawn()
    Pipe = {
        x = love.graphics.getWidth(),
        y = 0,
        width = 50,
        height = love.math.random(20, love.graphics.getHeight() / 3),
        sprite = love.graphics.newImage('assets/pipe.png')
    }
    table.insert(pipes, Pipe)
end

local function pipeMovement(dt)
    for i, pipe in ipairs(pipes) do
        pipe.x = pipe.x - 100 * dt
    end
end


function pipes.update(dt)
    timer = timer + 1
    if timer == DelayPipe then
        timer = 0
        pipeSpawn()
        bird.score = bird.score + 1
    end
    pipeMovement(dt)
    print(pipes)
end

function pipes.draw()
    for i, pipe in ipairs(pipes) do
        love.graphics.rectangle('line', pipe.x, pipe.y, pipe.width, pipe.height)
    end
end

return pipes
