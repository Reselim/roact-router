import Roact, { JsxInstance } from "@rbxts/roact"

interface LinkProps extends JsxInstance<ImageButton> {
	path: string
	state?: any
}

declare class Link extends Roact.Component<LinkProps> {
	constructor(props: LinkProps)
	public render(): Roact.Element
}

export = Link
