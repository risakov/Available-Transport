local Order = {}

function Order:new( options )

	local obj = {}
		obj.finalPrice = options.finalPrice or 0
		obj.elapsedTime = options.elapsedTime or 0
		obj.wayPassed = options.wayPassed or 0


	setmetatable( obj, self )
	self.__index = self
	return obj
end

return Order