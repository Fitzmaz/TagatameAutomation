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

function wrapper.sysLog(msg)
    sysLog(msg)
end

local id = createHUD()
function wrapper.hudLog(message)
    -- TODO: 自适应message长度
    showHUD(id, message, 30, "0xffffffff", "0xff000000", 0, 120, 0, 260, 80)
end

function wrapper.prompt()
    local ret, results = showUI('ui.json')
    return results
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

function _findColor(range, pointsTable)
    -- TODO: 适配其它分辨率
    return findColor(
        range,
        pointsTable,
        95,
        0,
        0,
        0
    )
end

function wrapper.findColor(pointsTable)
    return _findColor({0, 0, 1919, 1079}, pointsTable)
end

function wrapper.findColorInRange(range, pointsTable)
    return _findColor(range, pointsTable)
end

return wrapper