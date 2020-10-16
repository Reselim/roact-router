local Roact = require(script.Parent.Roact)
local Context = require(script.Parent.Context)
local Path = require(script.Parent.Path)
local merge = require(script.Parent.merge)

local Route = Roact.Component:extend("Route")

Route.defaultProps = {
	path = "/",
	always = false,
	exact = false
}

function Route.getDerivedStateFromProps(props)
	return {
		path = Path.new(props.path)
	}
end

function Route:init()
	local context = self.props.context
	local history = context.history

	self:setState({
		match = self.state.path:match(history.location.path, self.props)
	})

	self.listener = history.onChanged:connect(function(path)
		self:setState({
			match = self.state.path:match(path, self.props) or Roact.None
		})
	end)
end

function Route:willUnmount()
	self.listener:disconnect()
end

function Route:render()
	local context = self.props.context
	
	local routeProps = {
		match = self.state.match,
		location = context.history.location,
		history = context.history
	}

	if self.props.always or self.state.match then
		if self.props.render then
			return self.props.render(routeProps)
		elseif self.props.component then
			return Roact.createElement(self.props.component, routeProps)
		else
			return Roact.createFragment(self.props[Roact.Children])
		end
	else
		return nil
	end
end

local function RouteWrapper(props)
	return Roact.createElement(Context.Consumer, {
		render = function(context)
			return Roact.createElement(Route, merge(props, {
				context = context
			}))
		end
	})
end

return RouteWrapper