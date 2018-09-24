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

function button.autoEnabled()
    return wrapper.findColorInRange(
        {1562, 4, 1809, 100},
        {
            {x=0,y=0,color=0xfcf996},
            {x=108,y=1,color=0xfcf997},
            {x=-5,y=32,color=0x7a5f43},
            {x=110,y=30,color=0x74593a}
        }
    )
end

function button.autoDisabled()
    return wrapper.findColorInRange(
        {1562, 4, 1809, 100},
        {
            {x=0,y=0,color=0x2a2214},
            {x=-30,y=-27,color=0xa99556},
            {x=133,y=-27,color=0xa58f51},
            {x=-71,y=30,color=0xceb160},
            {x=103,y=30,color=0xcfb160}
        }
    )
end

function button.finish()
    return _findColor(
        {
            {x=0,y=0,color=0x000fb9},
            {x=-114,y=-59,color=0xdcf1f5},
            {x=104,y=-60,color=0xbef5f5},
            {x=-101,y=9,color=0x0003c8},
            {x=98,y=10,color=0x0000b1}
        }
    )
end

function button.towerstart()
    return _findColor(
        {
            {x=0,y=0,color=0x370000},
            {x=64,y=1,color=0x420000},
            {x=-133,y=-66,color=0xf54841},
            {x=124,y=-67,color=0xf64d49}
        }
    )
end

function button.towerend()
    return _findColor(
        {
            {x=0,y=0,color=0x620f00},
            {x=-126,y=-62,color=0xd0ac54},
            {x=115,y=-58,color=0xb59231},
            {x=-120,y=4,color=0x5c0a00},
            {x=112,y=5,color=0x5c0600}
        }
    )
end

function button.middle()
    return 925,500
end

return button