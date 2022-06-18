import Roact from "@rbxts/roact";

export interface RoactContext<T> {
    Provider: Roact.ComponentConstructor<{
            value: T;
    }>;
    Consumer: Roact.ComponentConstructor<{
            render: (value: T) => Roact.Element | undefined;
    }>;
}

export interface Hooks {
    useContext: <T>(context: RoactContext<T>) => T;
    useMemo: <T>(createValue: () => T, dependencies?: any[]) => T;
}
