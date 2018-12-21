local Path = {}
Path.__index = Path

function Path.new(pattern)
	local self = setmetatable({
		pattern = pattern,
		captures = {}
	}, Path)

	self.pattern = self.pattern:match("^(/?.-)/*$") -- Remove trailing slash(es)
	self.pattern = "^" .. self.pattern:gsub(":([a-zA-Z0-9_]+)(%??)", function(name, optional)
		table.insert(self.captures, name)

		-- %s gets replaced by format
		return ("([^/?%s]+)"):format(optional)
	end)

	return self
end

function Path:match(location)
	local matched = { location:match(self.pattern) }

	if #matched == 0 then
		return nil
	else
		if #self.captures == 0 then
			return {} -- Lua returns the original string if there are no captures
		end
	end

	local output = {}

	for index, match in pairs(matched) do
		if match ~= "" then
			output[self.captures[index]] = match
		end
	end

	return output
end

return Path