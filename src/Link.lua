local Roact = require(script.Parent.Roact)
local withRouter = require(script.Parent.withRouter)
local merge = require(script.Parent.merge)

local function Link(props)
	return withRouter(function(router)
		local elementProps = merge(props)

		-- Explicitly exclude props we don't want passed to the ImageButton
		elementProps.path = nil
		elementProps.state = nil
		
		return Roact.createElement("ImageButton", merge(elementProps, {
			BackgroundTransparency = 1,

			[Roact.Event.Activated] = function()
				local history = router.history

				if props.replace then
					history:replace(props.path, props.state)
				else
					history:push(props.path, props.state)
				end
			end,
		}))
	end)
end

return Link