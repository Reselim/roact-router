declare interface PathMatchOptions {
	exact?: boolean
}

declare interface PathMatchResults {
	[capture: string]: string
}

declare class Path {
	constructor(pattern: string)
	
	match(path: string, options?: PathMatchOptions): PathMatchResults | void
}

export {
	Path,
	PathMatchOptions,
	PathMatchResults
}