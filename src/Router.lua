local Roact = require(script.Parent.Parent.Roact)
local History = require(script.Parent.History)

local Router = Roact.Component:extend("Router")

function Router:init()
	self._context.history = History.new(self.props)
end

function Router:render()
	local children = self.props[Roact.Children]

	if Roact.createFragment then
		return Roact.createFragment(children)
	end

	return Roact.oneChild(children)
end

return Router