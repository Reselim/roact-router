local Roact = require(script.Parent.Roact)

local RouterContext = require(script.Parent.RouterContext)

local function withRouter(callback)
	return Roact.createElement(RouterContext.Consumer, {
		render = callback,
	})
end

return withRouter