local bird = require('bird')
local pipes = require('pipes')
local bg = require('background')

GamesStates = {}

local states = {
    pause = require('states.pause'),
    play = require('states.play'),
}

local current = states.play

local readyToQuit = false

function GamesStates.switch(stateName)
    current = states[stateName]
    current.load()
end

function love.keypressed(key)
    bird.keypressed(key)
    if current == states.play then
        states.play.keypressed(key)
    elseif current == states.pause then
        states.pause.keypressed(key)
    end

    if key == 'escape' then
        readyToQuit = true
    end
end

function love.quit()
    if readyToQuit == false then
        return true
    elseif readyToQuit == true then
        love.event.quit()
        return false
    end
end

function love.load()
    bird.load()
    pipes.load()
    current.load()
    bg.load()
end

function love.update(dt)
    if current == states.play then
        states.pause.update(dt)
    end
    love.quit()
end

function love.draw()
    bg.draw()
    bird.draw()
    pipes.draw()
    love.graphics.print(current.name, 100, 20)
    if current == states.pause then
        states.pause.draw()
    end
end
