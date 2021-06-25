local Roact = require(script.Parent.Roact)

local RouterContext = require(script.Parent.RouterContext)
local History = require(script.Parent.History)

local Router = Roact.Component:extend("Router")

function Router:init()
	self.history = self.props.history or History.new(self.props.initialEntries, self.props.initialIndex)

	local function updateLocation()
		self:setState({
			location = self.history.location,
		})
	end

	updateLocation()
	self.listener = self.history.onChanged:connect(updateLocation)
end

function Router:willUnmount()
	self.listener:disconnect()
end

function Router:render()
	return Roact.createElement(RouterContext.Provider, {
		value = {
			location = self.state.location,
			history = self.history,
		},
	}, self.props[Roact.Children])
end

return Router