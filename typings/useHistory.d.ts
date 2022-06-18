import { Hooks } from "./hooks";

import { History } from "./History";

declare function useHistory(hooks: Pick<Hooks, "useContext">): History

export = useHistory