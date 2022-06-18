import Roact from "@rbxts/roact"

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

interface RoactContext<T> {
        Provider: Roact.ComponentConstructor<{
                value: T;
        }>;
        Consumer: Roact.ComponentConstructor<{
                render: (value: T) => Roact.Element | undefined;
        }>;
}

interface RouteContext extends RoactContext<RouteRendererProps> {}
interface RouterContext extends RoactContext<RouterRendererProps> {}

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