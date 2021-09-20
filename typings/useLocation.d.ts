import { CoreHooks } from "@rbxts/roact-hooks"

import { HistoryEntry } from "./History"

declare function useLocation(hooks: CoreHooks): HistoryEntry

export = useLocation