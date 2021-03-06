-- scene
-- 0: 出击界面
-- 1: 出击界面alert
-- 2: 再次出击
-- 3: 再次出击alert
-- 4: 载入中
-- 5: 战斗中
-- 6: 结算界面
-- 7: 战斗中自动未开启

local SubRoutine = require "SubRoutine"
local wrapper = require "SDKWrapper"
local button = require "button"
local you = require "worker"

local repeatSub = SubRoutine()

function repeatSub:init (props)
    -- TODO: 参数校验
    return { scene = -1, count = 0, countMax = props.countMax }
end

function repeatSub:recognize ()
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
	elseif you.find(button.loot) and you.find(button.finish) then
		scene = 61
	elseif you.find(button.loot) then
		scene = 62
	elseif you.find(button.no) then
		-- TODO: 体力不足和编队空缺都会alert，不好区分
		scene = 1
	elseif you.find(button.autoDisabled) then
		scene = 7
	else
		-- unknown
	end

	wrapper.holdoff()

	return scene
end

function repeatSub:mutate (state, scene)
    local nextScene = scene
	if nextScene < 0 then
		-- invalid scene
		return state
	end
	local currentScene = state.scene
	if nextScene == currentScene then
		-- unchanged scene
		return state
	end
	if nextScene == 61 or nextScene == 62 then
		-- counting loot
		state.count = state.count + 1
	end
	state.scene = nextScene
	return state
end

function repeatSub:react (state)
    local scene = state.scene
	if scene == 0 then
		you.tap(button.attack)
		wrapper.hudLog("出击")
	elseif scene == 1 then
		you.tap(button.no)
	elseif scene == 2 then
		you.tap(button.retry)
		wrapper.hudLog("再挑战一次")
	elseif scene == 3 then
		you.tap(button.no)
	elseif scene == 4 then
		wrapper.hudLog("载入中")
	elseif scene == 5 then
		wrapper.hudLog(string.format("战斗中 (%d/%d)", state.count + 1, state.countMax))
	elseif scene == 61 then
		you.tap(button.finish)
		wrapper.hudLog("获取战利品")
	elseif scene == 62 then
		you.tap(button.loot)
		wrapper.hudLog("获取战利品")
	elseif scene == 7 then
		you.tap(button.autoDisabled)
		wrapper.hudLog("开启自动")
	else
		-- do nothing
	end
end

function repeatSub:isCompleted (state)
    return state.count >= state.countMax
end

return repeatSub