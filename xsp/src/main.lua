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

function segue(lastScene)
	local scene = -1

	wrapper.holdon()

	-- 按出现频率由高到低排列，提高效率
	if you.find(button.auto) then
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
	else
		wrapper.log("未知场景")
	end

	wrapper.holdoff()

	return scene
end

function dispatcher(scene)
	if scene == 0 then
		you.tap(button.attack)
	elseif scene == 1 then
		you.tap(button.yes)
	elseif scene == 2 then
		you.tap(button.retry)
	elseif scene == 3 then
		you.tap(button.no)
	elseif scene == 4 then
		-- TODO: 载入中
	elseif scene == 5 then
		-- TODO: 战斗中
	elseif scene == 6 then
		you.tap(button.loot)
	else
		-- 啥也不做
	end
end

wrapper.init()

local scene = -1
while true do
	scene = segue(scene)
	dispatcher(scene)
	wrapper.sleep(3000)
end
