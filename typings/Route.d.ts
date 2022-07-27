import Roact from "@rbxts/roact"

import { PathMatchResults } from "./Path"
import { History, HistoryEntry } from "./History"

export interface RouteRendererProps {
	match: PathMatchResults | undefined
	location: HistoryEntry
	history: History
}

export interface RouteProps {
	path: string
	exact?: boolean
	alwaysRender?: boolean

	render?: (rendererProps: RouteRendererProps) => Roact.Element | undefined
	component?: Roact.Component<RouteRendererProps>
}

declare class Route extends Roact.Component {
	constructor(props: RouteProps)
	public render(): Roact.Element | undefined
}

export default Route
