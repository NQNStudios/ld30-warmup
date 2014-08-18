vector = { }

function vector:zero()
    return 0, 0
end

function vector:isZero(x, y)
    return x == 0 and y == 0
end

function vector:length(x, y)
    return math.sqrt(x ^ 2 + y ^ 2)
end

function vector:normalize(x, y)
    assert(not self:isZero(x, y), "Tried to normalize a zero vector!")

    local len = self:length(x, y)

    return x / len, y / len
end

function vector:scale(x, y, val)
    return x * val, y * val
end

function vector:add(x1, y1, x2, y2)
    return x1 + x2, y1 + y2
end

function vector:subtract(x1, y1, x2, y2)
    return x1 - x2, y1 - y2
end
