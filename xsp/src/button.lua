local wrapper = require "SDKWrapper"
local button = {}

local _findColor = wrapper.findColor

function button.attack() 
    return _findColor(
        {
            {x=0,y=0,color=0x900000},
            {x=-122,y=-71,color=0xffd2b6},
            {x=121,y=-74,color=0xffecc6},
            {x=-129,y=11,color=0xa30000},
            {x=126,y=13,color=0xa50000}
        }
    )
end

function button.loot()
    return _findColor(
        {
            {x=0,y=0,color=0x58d831},
            {x=0,y=-173,color=0x5cda33},
            {x=0,y=173,color=0x55d52f}
        }
    )
end

function button.retry()
    return _findColor(
        {
            {x=0,y=0,color=0x5af5fb},
            {x=-176,y=-4,color=0x6fc6cc},
            {x=176,y=-1,color=0x278ea9}
        }
    )
end

function button.yes()
    return _findColor(
        {
            {x=0,y=0,color=0x0316bd},
            {x=-87,y=-50,color=0x5bffff},
            {x=76,y=-47,color=0x3dc5fb},
            {x=-83,y=-3,color=0x0011b9},
            {x=89,y=-1,color=0x010cb0}
        }
    )
end

function button.no()
    return _findColor(
        {
            {x=0,y=0,color=0x701f05},
            {x=-89,y=-49,color=0xe8c969},
            {x=77,y=-48,color=0xd3af4e},
            {x=-91,y=2,color=0x6d1300},
            {x=81,y=7,color=0x430101}
        }
    )
end

function button.loading()
    return _findColor(
        {
            {x=0,y=0,color=0xb50000},
            {x=-100,y=0,color=0xb50000},
            {x=-200,y=0,color=0xb50000},
            {x=100,y=0,color=0xb50000},
            {x=200,y=0,color=0xb50000}
        }
    )
end

function button.auto()
    -- stub
    return -1, -1
end

return button