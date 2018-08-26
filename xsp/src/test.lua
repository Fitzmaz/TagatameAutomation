--

local SubRoutine = require "SubRoutine"

local test = SubRoutine()

function test:init (props)
    return {count = 0}
end

function test:recognize ()
    return 1
end

function test:mutate (state, scene)
    local delta
    if scene == 1 then
        delta = 1
    else
        delta = 2
    end
    state.count = state.count + delta
    return state
end

function test:react (state)
    local m = string.format("count: %d", state.count)
    print(m)
end

function test:isCompleted (state)
    return state.count >= 10
end

test:start()