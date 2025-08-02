local background = {
    sprite = nil
}

function background.load()
    background.sprite = love.graphics.newImage('assets/background.jpg')
end

function background.update(dt)

end

function background.draw()
    love.graphics.draw(background.sprite, 0, 0)
end

return background
