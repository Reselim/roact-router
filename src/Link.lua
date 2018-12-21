local Roact = require(script.Parent.Parent.Roact)

local Link = Roact.PureComponent:extend("Link")

function Link:render()
	return Roact.createElement("Frame", {
		Active = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		
		[Roact.Event.InputBegan] = function(_, input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
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