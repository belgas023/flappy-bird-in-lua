--table bird
local bird = {
    x = 145,
    vx = 0,
    y = 192,
    vy = 0,
    sprite = nil,
    orientation = 0.5,
    score = 0,
    sfxJump = nil
}

--constantes
local GRAVITY = 700
local gravier = 1
local vmax = 400
local vmin = -300
local UP = 700



local function isColliding(thing, object) --collisions
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

function bird.load()
    bird.sprite = love.graphics.newImage('assets/bird.png')
    bird.sfxJump = love.audio.newSource('assets/sfx/jump.wav', 'static')
end

function bird.update(dt)
    bird.vy = bird.vy + GRAVITY * dt
    bird.y = bird.y + bird.vy * dt * gravier

    if bird.vy > vmax then
        bird.vy = vmax
    elseif bird.vy < vmin then
        bird.vy = vmin
    end

    --for i, pipe in ipairs(pipes) do
    --    if isColliding(bird, pipe) then
    --        GamesStates.switch('gameOver')
    --    end
    --end
end

function bird.draw()
    love.graphics.draw(bird.sprite, bird.x, bird.y)

    love.graphics.print(bird.vy, 10, 10)

    love.graphics.print(bird.score, 10, 30)
end

function bird.keypressed(key)
    if key == 'up' then
        bird.vy = -UP

        local sfx = bird.sfxJump:clone()
        love.audio.play(sfx)
    end
end

return bird
