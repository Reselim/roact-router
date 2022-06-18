import { Hooks } from "./hooks";

import { PathMatchResults } from "./Path"

declare function useParams(hooks: Pick<Hooks, "useContext">): PathMatchResults | undefined

export = useParams