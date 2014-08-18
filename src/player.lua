require "vector"
require "config"

player = function(x, y, speed, gravity, jumpVelocity, sprite)
    local instance = { }

    instance.x = x
    instance.y = y

    instance.velX, instance.velY = vector:zero()

    instance.gravity = gravity
    instance.jumpVelocity = jumpVelocity

    instance.sprite = sprite
    instance.width = sprite:getWidth() * scale
    instance.height = sprite:getHeight() * scale

    instance.standing = false

    function instance:getPosition()
        return self.x, self.y
    end

    function instance:setPosition(x, y)
        self.x = x
        self.y = y
    end

    function instance:update(dt)
        self.velY = self.velY + self.gravity * dt

        if love.keyboard.isDown("left") then
            self.velX = -1
        elseif love.keyboard.isDown("right") then
            self.velX = 1
        end

        if love.keyboard.isDown("up") then
            self.standing = false
            self.velY = -self.jumpVelocity
        end

        if not vector:isZero(velX, velY) then
            self.velX, self.velY = vector:normalize(self.velX, self.velY)
        end

        self.x, self.y = vector:add(self.x, self.y, self.velX, self.velY)

        --stop the player from falling through the ground
        
        if self.y > love.graphics.getWidth() / scale - self.height then
            self.standing = true
            self.y = love.graphics.getWidth() / scale - self.height
        end
    end

    function instance:draw()
        love.graphics.draw(self.sprite, self.x, self.y)
    end

    return instance
end
