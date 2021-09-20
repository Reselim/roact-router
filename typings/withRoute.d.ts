import Roact from "@rbxts/roact";

import { RouteRendererProps } from "./Route"

declare function withRoute(
        callback: (value: RouteRendererProps) => Roact.Element | undefined
): Roact.Element

export = withRoute