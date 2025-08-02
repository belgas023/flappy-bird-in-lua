local play = {}

function play.keypressed(key)
    if key == 'esc' then
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
