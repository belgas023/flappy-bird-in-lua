local bird = { --table bird
    x = 40,
    vx = 0,
    y = 100,
    vy = 0,
    sprite = nil,
    orientation = 0.5
}

function love.load()
    bird.sprite = love.graphics.newImage('assets/bird.png')
end

-- constantes
local GRAVITY = 700
local UP = 700
local vmax = 400
local vmin = -300
local gravier = 1
local timer = 0
local pipes = {}

function love.keypressed(key)
    if key == 'up' then
        bird.vy = bird.vy - UP
    end
end

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

local function isColliding(thing, object)
    local ax1 = thing.x
    local ax2 = thing.x + thing.sprite:getWidth()
    local ay1 = thing.y
    local ay2 = thing.y + thing.sprite:getHeight()

    local bx1 = object.x
    local bx2 = object.x + object.width
    local by1 = object.y
    local by2 = object.y + object.height

    if ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1 then
        return true
    else
        return false
    end
end

function love.update(dt)
    bird.vy = bird.vy + GRAVITY * dt
    bird.y = bird.y + bird.vy * dt * gravier

    if bird.vy > vmax then
        bird.vy = vmax
    elseif bird.vy < vmin then
        bird.vy = vmin
    end

    timer = timer + 1
    if timer == 70 then
        timer = 0
        --obstacle
        pipeSpawn()
    end

    pipeMovement(dt)

    for i, pipe in ipairs(pipes) do
        if isColliding(bird, pipe) then
            GameOver = true
        end
    end
end

function love.draw()
    --if bird.vy > 0 then
    --    love.graphics.draw(bird.sprite, bird.x, bird.y, bird.orientation)
    --elseif bird.vy < 0 then
    --    love.graphics.draw(bird.sprite, bird.x, bird.y, bird.orientation - 1)
    --end
    love.graphics.draw(bird.sprite, bird.x, bird.y)

    love.graphics.print(bird.vy, 10, 10)

    for i, pipe in ipairs(pipes) do
        love.graphics.rectangle('fill', pipe.x, pipe.y, pipe.width, pipe.height)
    end

    if GameOver then
        love.graphics.print('game over', 50, 50)
    end
end
