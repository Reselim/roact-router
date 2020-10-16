local Roact = require(script.Parent.Roact)
local Context = require(script.Parent.Context)

local function Redirect(props)
	return Roact.createElement(Context.Consumer, {
		render = function(context)
			local history = context.history
			
			if props.replace then
				history:replace(props.path, props.state)
			else
				history:push(props.path, props.state)
			end
		end
	})
end

return Redirect