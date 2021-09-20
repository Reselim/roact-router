import { CoreHooks } from "@rbxts/roact-hooks";
import { PathMatchOptions, PathMatchResults } from "./Path"

export interface RouteMatchOptions extends PathMatchOptions {
        path: string
}

declare function useRouteMatch(options: RouteMatchOptions, hooks: CoreHooks): PathMatchResults

export default useRouteMatch