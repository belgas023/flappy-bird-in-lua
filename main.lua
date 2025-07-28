local bird = {
    x = 20,
    y = 20,
    sprite = nil,
}

function love.load()
    sprite = love.graphics.newImage('assets/bird.png')
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(sprite, bird.x, bird.y)

    love.graphics.setColor(1, 1, 1)
    love.graphics.circle('fill', 10, 10, 10)
    love.graphics.circle('fill', 20, 20, 10)
    love.graphics.circle('fill', 50, 50, 10)
    love.graphics.circle('fill', 100, 100, 10)
end
