local Signal = require(script.Parent.Signal)

local History = {}
History.__index = History

function History.new(initialEntries, initialIndex)
	initialEntries = initialEntries or { "/" }
	initialIndex = initialIndex or #initialEntries

	local entries = {}

	for _, path in ipairs(initialEntries) do
		table.insert(entries, {
			path = path,
			state = {}
		})
	end

	return setmetatable({
		location = entries[initialIndex],
		onChanged = Signal.new(),

		_entries = entries,
		_index = initialIndex
	}, History)
end

function History:_removeFutureEntries()
	if #self._entries > self._index then
		for index = self._index + 1, #self._entries do
			self._entries[index] = nil
		end
	end
end

function History:push(path, state)
	self:_removeFutureEntries()

	local entry = {
		path = path,
		state = state or {}
	}

	table.insert(self._entries, entry)
	self._index = #self._entries

	self.location = entry
	self.onChanged:fire(entry.path, entry.state)
end

function History:replace(path, state)
	self:_removeFutureEntries()

	local entry = {
		path = path,
		state = state or {}
	}

	self._entries[#self._entries] = entry

	self.location = entry
	self.onChanged:fire(entry.path, entry.state)
end

function History:go(offset)
	self._index = math.clamp(self._index + offset, 1, #self._entries)

	self.location = self._entries[self._index]
	self.onChanged:fire(self.location.path, self.location.state)
end

function History:goBack()
	return self:go(-1)
end

function History:goForward()
	return self:go(1)
end

function History:goToStart()
	return self:go(-(self._index - 1))
end

function History:goToEnd()
	return self:go(#self._entries - #self._index)
end

return History