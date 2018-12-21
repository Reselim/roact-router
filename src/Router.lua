local Roact = require(script.Parent.Parent.Roact)
local History = require(script.Parent.History)

local Router = Roact.Component:extend("Router")

function Router:init()
	self._context.history = History.new(self.props)
end

function Router:render()
	return Roact.oneChild(self.props[Roact.Children])
end

return Router