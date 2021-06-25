local RouteContext = require(script.Parent.RouteContext)

local function useParams(hooks)
	local context = hooks.useContext(RouteContext)
	assert(context, "useParams must be used inside of a Route")
	return context.match
end

return useParams