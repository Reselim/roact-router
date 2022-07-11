import { RoactContext } from "./hooks"

import Router from "./Router"
import Route, { RouteRendererProps } from "./Route"
import Redirect from "./Redirect"
import Link from "./Link"

import withRouter, { RouterRendererProps } from "./withRouter"
import withRoute from "./withRoute"

import useHistory from "./useHistory"
import useLocation from "./useLocation"
import useParams from "./useParams"
import useRouteMatch from "./useRouteMatch"

import { Path } from "./Path"
import { History } from "./History"

declare const RouteContext: RoactContext<RouteRendererProps>
declare const RouterContext: RoactContext<RouterRendererProps>

export {
	Router,
	Route,
	Redirect,
	Link,

        RouterContext,
        RouteContext,
        withRouter,
        withRoute,

        useHistory,
        useLocation,
        useParams,
        useRouteMatch,

	Path,
	History
}
