local wrapper = require "SDKWrapper"
local repeatSub = require "repeatSub"
local towerSub = require "towerSub"

wrapper.init()

local config = wrapper.prompt()
local mode = config["mode"]
local countMax = tonumber(config["loopCount"])

if mode == "0" then
    repeatSub:start({countMax = countMax})
elseif mode == "1" then
    towerSub:start({countMax = countMax})
end

wrapper.exit()
