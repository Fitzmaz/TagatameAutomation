-- scene
-- 0: 塔
-- 1: 出击
-- 2: 载入中
-- 31: 战斗中
-- 32: 战斗中
-- 4: 战利品
-- 5: 结束

local SubRoutine = require "SubRoutine"
local wrapper = require "SDKWrapper"
local button = require "button"
local you = require "worker"

local towerSub = SubRoutine()

function towerSub:init (props)
    -- TODO: 参数校验
    return { scene = -1, count = 0, countMax = props.countMax }
end

function towerSub:recognize ()
    local scene = -1

	wrapper.holdon()

	if you.find(button.towerstart) then
		scene = 0
	elseif you.find(button.attack) then
		scene = 1
	elseif you.find(button.loading) then
		scene = 2
	elseif you.find(button.autoEnabled) then
		scene = 31
	elseif you.find(button.autoDisabled) then
		scene = 32
	elseif you.find(button.towerend) then
		scene = 5
	else
		
	end

	wrapper.holdoff()

	return scene
end

function towerSub:mutate (state, scene)
    local nextScene = scene
	local currentScene = state.scene
	if nextScene == currentScene then
		-- unchanged scene
		return state
    end
    if nextScene < 0 then
        if currentScene == 31 then
            -- counting loot
            state.count = state.count + 1
            state.scene = 4
            return state
        else
		    -- invalid scene
            return state
        end
	end
	state.scene = nextScene
	return state
end

function towerSub:react (state)
    local scene = state.scene
	if scene == 0 then
		you.tap(button.towerstart)
	elseif scene == 1 then
		you.tap(button.attack)
		wrapper.hudLog("出击")
	elseif scene == 2 then
		wrapper.hudLog("载入中")
	elseif scene == 31 then
		wrapper.hudLog(string.format("战斗中 (%d/%d)", state.count + 1, state.countMax))
	elseif scene == 32 then
		you.tap(button.autoDisabled)
		wrapper.hudLog("开启自动")
	elseif scene == 4 then
		you.tap(button.middle)
		wrapper.hudLog("获取战利品")
	elseif scene == 5 then
		you.tap(button.towerend)
		wrapper.hudLog("结束")
	else
		-- do nothing
	end
end

function towerSub:isCompleted (state)
    return state.count >= state.countMax
end

return towerSub