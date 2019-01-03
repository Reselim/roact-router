local History = {}
History.__index = History

function History.new(options)
	options.index = options.index or 1
	options.entries = options.entries or {"/"}

	assert(#options.entries ~= 0, "options.entries is empty")
	assert(options.index >= 1 and options.index <= #options.entries, "options.index is out of range")

	local self = setmetatable({
		index = options.index,
		entries = options.entries,

		_changed = Instance.new("BindableEvent")
	}, History)

	self.location = self.entries[self.index]

	return self
end

function History:replace(location)
	self.entries[self.index] = location

	self.location = location
	self._changed:fire(location)

	-- Remove state ahead of current index, if it exists
	for index = self.index + 1, #self.entries do
		self.entries[index] = nil
	end
end

function History:push(location)
	self.index = self.index + 1
	self:replace(location)
end

function History:listen(handler)
	return self._changed.Event:connect(handler)
end

function History:reset(location)
	self.index = 1
	self.entries = { location }

	self.location = location
	self._changed:fire(location)
end

function History:go(offset)
	self.index = math.clamp(self.index + offset, 1, #self.entries)

	self.location = self.entries[self.index]
	self._changed:fire(self.location)
end

function History:goBack()
	self:go(-1)
end

function History:goForward()
	self:go(1)
end

return History