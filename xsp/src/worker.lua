local wrapper = require "SDKWrapper"
local worker =  {}

function worker.find(thunkButton)
    x, y = thunkButton()
    return x ~= -1 and y ~= -1
end

function worker.tap(thunkButton)
    x, y = thunkButton()
    wrapper.tap(x, y)
end

return worker