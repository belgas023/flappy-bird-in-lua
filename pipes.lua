local pipes = {}

local timer = 0
local DelayPipe = 100

local function pipeSpawn()
    Pipe = {
        x = love.graphics.getWidth(),
        y = 0,
        width = 50,
        height = love.math.random(20, love.graphics.getHeight() / 3),
    }
    table.insert(pipes, Pipe)
end

local function pipeMovement(dt)
    for i, pipe in ipairs(pipes) do
        pipe.x = pipe.x - 100 * dt
    end
end

function pipes.load()
    sprite = love.graphics.newImage('assets/pipe.png')
end

function pipes.update(dt)
    timer = timer + 1
    if timer == DelayPipe then
        timer = 0
        pipeSpawn()
    end
    pipeMovement(dt)
    print(pipes)
end

function pipes.draw()
    for i, pipe in ipairs(pipes) do
        love.graphics.rectangle('fill', pipe.x, pipe.y, pipe.width, pipe.height)
    end
end

return pipes
