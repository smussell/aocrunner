import type { Setup } from "../types/common"

const packageSwift = ({ year, language, author }: Setup) => {
  return `
// swift-tools-version: 5.9
import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "Algorithms", package: "swift-algorithms"),
    .product(name: "Collections", package: "swift-collections"),
    .product(name: "ArgumentParser", package: "swift-argument-parser"),
    .target(name: "Common")
]

let package = Package(
    name: "aoc${year}",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-algorithms.git",
            .upToNextMajor(from: "1.2.0")),
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMajor(from: "1.1.4")),
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            .upToNextMajor(from: "1.5.0")),
        .package(
            url: "https://github.com/apple/swift-format.git",
            .upToNextMajor(from: "509.0.0"))
    ],
    targets: [
        .target(name: "Common", dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")])
        // HACKY TOKEN FOR INSERTING TARGETS
    ]
)
`
}

export default packageSwift
