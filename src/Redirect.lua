local withRouter = require(script.Parent.withRouter)

local function Redirect(props)
	return withRouter(function(router)
		local history = router.history
		
		if props.replace then
			history:replace(props.path, props.state)
		else
			history:push(props.path, props.state)
		end
	end)
end

return Redirect