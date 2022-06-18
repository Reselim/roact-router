import { Hooks } from "./hooks"

import { HistoryEntry } from "./History"

declare function useLocation(hooks: Pick<Hooks, "useContext">): HistoryEntry

export = useLocation