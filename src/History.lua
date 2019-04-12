local History = {}
History.__index = History

function History.new(options)
	options.index = options.index or 1
	options.entries = options.entries or {"/"}

	assert(#options.entries ~= 0, "options.entries is empty")
	assert(options.index >= 1 and options.index <= #options.entries, "options.index is out of range")

	for index = 1, #options.entries do
		local entry = options.entries[index]

		if type(entry) == "string" then
			options.entries[index] = {
				location = entry
			}
		end
	end

	local self = setmetatable({
		index = options.index,
		entries = options.entries,

		_changed = Instance.new("BindableEvent")
	}, History)

	local currentEntry = self.entries[self.index]

	self.location = currentEntry.location
	self.state = currentEntry.state

	return self
end

function History:replace(location, state)
	self.entries[self.index] = {
		location = location,
		state = state
	}

	self.location = location
	self.state = state

	self._changed:fire(location, state)

	-- Remove state ahead of current index, if it exists
	for index = self.index + 1, #self.entries do
		self.entries[index] = nil
	end
end

function History:push(location, state)
	self.index = self.index + 1
	self:replace(location, state)
end

function History:subscribe(handler)
	return self._changed.Event:connect(handler)
end

function History:reset(location, state)
	self.index = 0
	self:push(location, state)
end

function History:go(offset)
	self.index = math.clamp(self.index + offset, 1, #self.entries)

	local currentEntry = self.entries[self.index]

	self.location = currentEntry.location
	self.state = currentEntry.state

	self._changed:fire(currentEntry.location, currentEntry.state)
end

function History:goBack()
	self:go(-1)
end

function History:goForward()
	self:go(1)
end

return History