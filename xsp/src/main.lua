local wrapper = require "SDKWrapper"
local repeatSub = require "repeatSub"

wrapper.init()

local config = wrapper.prompt()
local countMax = tonumber(config["loopCount"])

repeatSub:start({countMax = countMax})

wrapper.exit()
