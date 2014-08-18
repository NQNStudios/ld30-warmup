require "player"
require "config"

function love.load()
    love.window.setTitle("Ninja 333")
    love.graphics.setBackgroundColor(0, 125, 125)

    love.graphics.setDefaultFilter("nearest")

    ninja = love.graphics.newImage("data/ninja.png")

    player1 = player(0, 0, 24, 2, 24, ninja)
    print(player1)
end

function love.update(dt)
    player1:update(dt)
end

function love.draw()
    love.graphics.scale(scale)

    player1:draw()
end
