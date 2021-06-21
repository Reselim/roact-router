local RouteContext = require(script.Parent.RouteContext)

local function useLocation(hooks)
	local context = hooks.useContext(RouteContext)
	return context.location
end

return useLocation