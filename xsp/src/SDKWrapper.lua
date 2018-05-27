local wrapper =  {}

function wrapper.tap(x,y)
	touchDown(0, x, y)
    mSleep(50)
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