import Roact from "@rbxts/roact"

import { History } from "./History"

interface RouterProps {
	history?: History,

	initialEntries?: Array<string>
	initialIndex?: number
}

declare class Router extends Roact.Component<RouterProps> {
	constructor(props: RouterProps)
	public render(): Roact.ElementFragment
}

export = Router