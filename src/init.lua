local Roact = require(script.Roact)
local Context = require(script.Context)

local function with(callback)
	return Roact.createElement(Context.Consumer, {
		render = callback
	})
end

return {
	Link = require(script.Link),
	Router = require(script.Router),
	Route = require(script.Route),
	Redirect = require(script.Redirect),

	-- Not intended for common use, but available anyway
	Path = require(script.Path),
	History = require(script.History),

	Context = Context,
	with = with
}
