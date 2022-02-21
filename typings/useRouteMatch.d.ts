import { CoreHooks } from "@rbxts/roact-hooks";
import { PathMatchOptions, PathMatchResults } from "./Path"

export interface RouteMatchOptions extends PathMatchOptions {
        path: string
}

declare function useRouteMatch(hooks: CoreHooks, options: RouteMatchOptions): PathMatchResults

export default useRouteMatch