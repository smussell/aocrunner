export type Setup = {
  year: number
  name: string
  language: "ts" | "js" | "swift"
  packageManager: "npm" | "yarn" | "pnpm" | "swift"
  author: string
  semicolons: boolean
  strict: boolean
}

type DayConfig = {
  solved: boolean
  result: any
  attempts: any[]
  time: null | number
}

export type Config = {
  version: number
  year: number
  language: "js" | "ts" | "swift"
  days: { part1: DayConfig; part2: DayConfig }[]
}
