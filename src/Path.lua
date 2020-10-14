local Path = {}
Path.__index = Path

function Path.new(pattern)
	local captureNames = {}

	-- Add captures
	pattern = pattern:gsub(":([^/]+)", function(captureName)
		table.insert(captureNames, captureName)
		return "([^/]+)"
	end)

	-- Add start anchor
	pattern = "^" .. pattern

	-- Remove trailing slashes
	pattern = pattern:match("^(.+)/*$")

	return setmetatable({
		_pattern = pattern,
		_captureNames = captureNames
	}, Path)
end

function Path:_assignCaptureNames(...)
	local captures = {}

	for index, value in ipairs({ ... }) do
		local captureName = self._captureNames[index]
		if captureName then
			captures[captureName] = value
		end
	end

	return captures
end

function Path:match(path, options)
	options = options or {}

	local pattern = self._pattern

	if options.exact then
		pattern = pattern .. "$"
	end

	local match = { path:match(pattern) }

	if #match > 0 then
		return self:_assignCaptureNames(unpack(match))
	else
		return nil
	end
end

return Path