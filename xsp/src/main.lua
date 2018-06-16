local wrapper = require "SDKWrapper"
local button = require "button"
local you = require "worker"

-- scene
-- 0: 出击界面
-- 1: 出击界面alert
-- 2: 再次出击
-- 3: 再次出击alert
-- 4: 载入中
-- 5: 战斗中
-- 6: 结算界面
-- 7: 战斗中自动未开启

function segue(lastScene)
	local scene = -1

	wrapper.holdon()

	-- 按出现频率由高到低排列，提高效率
	if you.find(button.autoEnabled) then
		scene = 5
	elseif you.find(button.loading) then
		scene = 4
	elseif you.find(button.attack) then
		scene = 0
	elseif you.find(button.retry) then
		scene = 2
	elseif you.find(button.loot) then
		scene = 6
	elseif you.find(button.no) then
		-- TODO: 第一次出击时，体力不足和编队空缺都会alert，不好区分
		-- TODO: alert时启动脚本，此时lastScene == -1
		scene = lastScene + 1
	elseif you.find(button.autoDisabled) then
		scene = 7
	else
		
	end

	wrapper.holdoff()

	return scene
end

local count = 1
function dispatcher(scene, countMax)
	if scene == 0 then
		you.tap(button.attack)
		wrapper.hudLog("出击")
	elseif scene == 1 then
		you.tap(button.yes)
	elseif scene == 2 then
		you.tap(button.retry)
		wrapper.hudLog("再挑战一次")
	elseif scene == 3 then
		you.tap(button.no)
		wrapper.exit()
	elseif scene == 4 then
		wrapper.hudLog("载入中")
	elseif scene == 5 then
		wrapper.hudLog(string.format("战斗中 (%d/%d)", count, countMax))
	elseif scene == 6 then
		you.tap(button.loot)
		wrapper.hudLog("获取战利品")
		count = count + 1
	elseif scene == 7 then
		you.tap(button.autoDisabled)
		wrapper.hudLog("开启自动")
	else
		-- 啥也不做
	end
	local shouldStop = count >= countMax
	return shouldStop
end

wrapper.init()

local config = wrapper.prompt()
local countMax = tonumber(config["loopCount"])
local scene = segue(-1)
while not dispatcher(scene, countMax) do
	scene = segue(scene)
	wrapper.sleep(3000)
end

wrapper.exit()
