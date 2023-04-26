local LoopController = {}
LoopController.__index = LoopController

local ThreadController = setmetatable({}, LoopController)
ThreadController.__index = ThreadController
LoopController.Thread = ThreadController

function LoopController.new()
	local self = setmetatable({}, LoopController)
	self.Heartbeat = game:GetService("RunService").Heartbeat
	self.Threads = {}
	self.Connection = self.Heartbeat:Connect(function()
		for i, v in ipairs(self.Threads) do
			v:handle()
		end
	end)
	return self
end

function LoopController:newThread(...)
	self.Threads[#self.Threads + 1] = ThreadController.new(...)
	return self.Threads[#self.Threads]
end

function LoopController:removeThread(threadController)
	table.remove(self.Threads, table.find(self, threadController))
end

function LoopController:Destroy(threadController)
	self.Connection:Disconnect()
end

function ThreadController.new(rate, func, repeatTimes, DisableError)
	local self = setmetatable({}, ThreadController)
	self.Rate = rate
	self.finished = 0
	self.repeatTimes = repeatTimes
	self.MainFunction = func
	self.Disabled = false
	self.Function = function(thread)
    	self.Status = "running"
    	self:MainFunction()
    	task.wait(self.Rate)
    	self:Finish()
	end
	self.MainThread = coroutine.create(self.Function)
	return task.spawn(self.MainThread) and self
end

function ThreadController:handle()
	if self.Disabled then
		return
	end
	local ThreadState = coroutine.status(self.MainThread)
	if self.Status == ThreadState then
		return
	end
	if self.repeatTimes and self.finished >= self.repeatTimes then
		return self:Disable()
	end
	if self.Status == "finished" or ThreadState == "dead" then
		self.MainThread = task.spawn(self.Function)
		return
	end
end

function LoopController.Thread:Finish()
	self.finished += 1
	self.Status = "finished"
end

function ThreadController:Disable()
	self.Disabled = true
	task.spawn(task.cancel,self.MainThread)
end
return LoopController
