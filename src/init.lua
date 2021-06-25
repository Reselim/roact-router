return {
	Link = require(script.Link),
	Router = require(script.Router),
	Route = require(script.Route),
	Redirect = require(script.Redirect),

	RouterContext = require(script.RouterContext),
	RouteContext = require(script.RouteContext),
	withRouter = require(script.withRouter),
	withRoute = require(script.withRoute),

	useHistory = require(script.useHistory),
	useLocation = require(script.useLocation),
	useParams = require(script.useParams),
	useRouteMatch = require(script.useRouteMatch),

	-- Not intended for common use, but available anyway
	Path = require(script.Path),
	History = require(script.History),
}
