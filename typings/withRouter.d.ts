import Roact from "@rbxts/roact";

import { History, HistoryEntry } from "./History";

export interface RouterRendererProps {
    	location: HistoryEntry
    	history: History
}

declare function withRouter(
    	callback: (value: RouterRendererProps) => Roact.Element | undefined
): Roact.Element

export default withRouter