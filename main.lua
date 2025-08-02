local bird = require('bird')
local pipes = require('pipes')

GamesStates = {}

local states = {
    pause = require('states.pause'),
    play = require('states.play'),
}

local current = states.play

function GamesStates.switch(stateName)
    current = states[stateName]
    current.load()
end

function love.keypressed(key)
    bird.keypressed(key)
    play.keypressed(key)
end

function love.load()
    bird.load()
    pipes.load()
    current.load()
end

function love.update(dt)
    bird.update(dt)
    pipes.update(dt)
end

function love.draw()
    bird.draw()
    pipes.draw()
end
