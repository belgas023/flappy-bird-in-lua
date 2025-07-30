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
local SPEED = 10
local GRAVITY = 700
local UP = 700
local vmax = 400
local vmin = -300
local gravier = 1
local timer = 0

function love.keypressed(key)
    if key == 'up' then
        bird.vy = bird.vy - UP
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


    Obstacle = false
    timer = timer + 1
    if timer == 50 then
        timer = 0
        --obstacle
        Obstacle = true
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
end
