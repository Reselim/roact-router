local Path = require(script.Parent.Path)
local RouterContext = require(script.Parent.RouterContext)

local function useRouteMatch(options, hooks)
	if type(options) == "table" then
		options = { path = options }
	end
	
	local path = hooks.useMemo(function()
		return Path.new(options.path)
	end, { options.path })

	local context = hooks.useContext(RouterContext)
	return path:match(context.location, options)
end

return useRouteMatch