import { CoreHooks } from "@rbxts/roact-hooks";

import { PathMatchResults } from "./Path"

declare function useParams(hooks: CoreHooks): PathMatchResults | undefined

export = useParams