local RouteContext = require(script.Parent.RouteContext)

local function useHistory(hooks)
	local context = hooks.useContext(RouteContext)
	return context.history
end

return useHistory