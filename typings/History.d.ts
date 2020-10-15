import { Signal } from "./Signal"

declare interface HistoryEntry {
	path: string,
	state: any
}

declare class History {
	constructor(initialEntries?: Array<string>, initialIndex?: number)

	onChanged: Signal

	push(path: string, state: any): void
	replace(path: string, state: any): void

	go(offset: number): void
	
	goBack(): void
	goForward(): void
	goToStart(): void
	goToEnd(): void
}

export {
	History,
	HistoryEntry
}