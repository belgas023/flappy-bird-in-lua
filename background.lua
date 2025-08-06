local background = {
    sprite = nil,
    x = 0,
    y = 0,
    width = 384
}

function background.load()
    background.sprite = love.graphics.newImage('assets/background.jpg')
end

function background.update(dt)
    background.x = background.x - 30 * dt

    if background.x < -385 then
        background.x = 0
    end
end

function background.draw()
    love.graphics.draw(background.sprite, background.x, background.y)
    love.graphics.draw(background.sprite, background.x + background.width, background.y)
end

return background
