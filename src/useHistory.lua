local RouterContext = require(script.Parent.RouterContext)

local function useHistory(hooks)
	local context = hooks.useContext(RouterContext)
	return context.history
end

return useHistory