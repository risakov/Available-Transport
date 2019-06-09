local User = {}

function User:new(options)
	local obj = {}
		obj.name = options.name or ""
		obj.number = options.number or ""
		obj.image = options.image or ""

	setmetatable( obj, self )
	self.__index = self
	return obj
end

return User