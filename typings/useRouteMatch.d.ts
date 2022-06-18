import { Hooks } from "./hooks";
import { PathMatchOptions, PathMatchResults } from "./Path"

export interface RouteMatchOptions extends PathMatchOptions {
        path: string
}

declare function useRouteMatch(hooks: Hooks, options: RouteMatchOptions): PathMatchResults

export default useRouteMatch