import Roact from "@rbxts/roact"

interface RedirectProps {
	path: string
}

declare class Redirect extends Roact.Component<RedirectProps> {
	constructor(props: RedirectProps)
	public render(): undefined
}

export = Redirect