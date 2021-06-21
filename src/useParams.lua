local RouteContext = require(script.Parent.RouteContext)

local function useParams(hooks)
	local context = hooks.useContext(RouteContext)
	return context.match
end

return useParams