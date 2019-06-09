local Trip = {}

function Trip:new( options )
	local obj = {}
		obj.transport = options.transport or nil
		obj.isActive = true
		obj.currentTime = 0
		obj.currentWayPassed = 0

	setmetatable( obj, self )
	self.__index = self
	return obj
end

return Trip