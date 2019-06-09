local Transport = {}

function Transport:new( options )
	local obj = {}
		obj.type = options.type or ""
		obj.model = options.model or ""
		obj.price = options.price or 0
		obj.state = options.state or 0
		obj.isReserved = options.isReserved or false
		obj.reservedTime = options.reservedTime or false

	setmetatable( obj, self )
	self.__index = self
	return obj
end

return Transport