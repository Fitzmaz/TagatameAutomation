local wrapper =  {}

function wrapper.tap(x,y)
    local offset = 20
    x = x + math.random(-offset, offset)
    y = y + math.random(-offset, offset)
    t = 50 + math.random(10)
	touchDown(0, x, y)
    mSleep(t)
    touchUp(0, x, y)
end

function wrapper.holdon()
    keepScreen(true)
end

function wrapper.holdoff()
    keepScreen(false)
end

function wrapper.log(msg)
    sysLog(msg)
end

function wrapper.sleep(time)
    mSleep(time)
end

function wrapper.init()
    -- "0": 当前应用
    local appid = "0"
    -- 0: portrait, 1: Home在右, 2: Home在左
    local orientation = 1
    -- TODO: 适配其它方向
    init(appid, orientation)
end

function wrapper.exit()
    lua_exit()
end

function wrapper.findColor(pointsTable)
    -- TODO: 适配其它分辨率
    return findColor(
        {0, 0, 1919, 1079},
        pointsTable,
        95,
        0,
        0,
        0
    )
end

return wrapper