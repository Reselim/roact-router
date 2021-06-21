local Roact = require(script.Parent.Roact)

local RouteContext = require(script.Parent.RouteContext)

local function withRoute(callback)
	return Roact.createElement(RouteContext.Consumer, {
		render = callback,
	})
end

return withRoute