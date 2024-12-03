import type { Setup } from "../types/common"
import { stripIndent } from "common-tags"

const gitignoreTXT = ({ language }: Setup) => {
  return stripIndent`
    node_modules
    *.temp.*
    */**/*.temp.*
    */**/input.txt
    *.log
    */**/*.log
    .idea
    .vscode
    .env
    /.build
    /Packages
    xcuserdata/
    DerivedData/
    .swiftpm/configuration/registries.json
    .swiftpm/xcode/package.xcworkspace/contents.xcworkspacedata
    .netrc
    lcov.info
    Package.resolved
    ${language === "ts" ? "dist" : ""}
  `
}

export default gitignoreTXT
