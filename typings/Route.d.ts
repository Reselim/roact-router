import Roact from "@rbxts/roact"

import { PathMatchResults } from "./Path"
import { History, HistoryEntry } from "./History"

interface RouteRendererProps {
	match: PathMatchResults | undefined
	location: HistoryEntry
	history: History
}

interface RouteProps {
	path: string
	exact?: boolean

	render?: (rendererProps: RouteRendererProps) => Roact.Element | undefined
	component?: Roact.Component<RouteRendererProps>
}

declare class Route extends Roact.Component {
	constructor(props: RouteProps)
	public render(): Roact.Element | undefined
}

export = Route