local Roact = require(script.Parent.Parent.Roact)

local Link = Roact.PureComponent:extend("Link")

function Link:render()
	return Roact.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		
		[Roact.Event.MouseButton1Click] = function()
			if self.props.back then
				self._context.history:goBack()
			else
				if self.props.replace then
					self._context.history:replace(self.props.to)
				else
					self._context.history:push(self.props.to)
				end
			end
		end
	})
end

return Link