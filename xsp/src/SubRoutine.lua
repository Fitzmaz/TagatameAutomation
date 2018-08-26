--

local SubRoutine = {}
SubRoutine.__index = SubRoutine

local function construct ()
  local self = setmetatable({}, SubRoutine)
  return self
end

setmetatable(SubRoutine, {__call = construct})

function SubRoutine:start (props)
    self.state = self:init(props)
    while not self:isCompleted(self.state) do
        local scene = self:recognize()
        self.state = self:mutate(self.state, scene)
        self:react(self.state)
        -- TODO: mSleep alternative
        mSleep(3000)
    end
end

return SubRoutine