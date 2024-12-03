import Common
import Foundation

func parseInput(_ rawInput: String) -> [Substring] {
  return rawInput.split(separator: "\n")
}

func part1(rawInput: String) -> String? {
  let input = parseInput(rawInput)

  return nil
}

func part2(rawInput: String) -> String? {
  let input = parseInput(rawInput)

  return nil
}

@main
struct Day {

  static let dataURL = Bundle.module.url(
        forResource: "input",
        withExtension: "txt",
        subdirectory: "Data")
    
  static func main() async throws {
    try! await run(
      dataURL: dataURL,
      testMode: true,
      part1: Solution(
        part1,
        tests: [
          TestCase(
            input:
"""

""",
            expected: ""
          )
        ]),
      part2: Solution(
        part2,
        tests: [
          TestCase(
            input:
"""

""",
            expected: ""
          )
        ])
    )
  }
}
