import ArgumentParser
import Foundation

func loadData(dataURL: URL?) -> String {
  //    let dayString = String(repeating: "%02d", count: challengeDay)
  //    let dataFilename = "Day\(dayString)"
  guard let dataURL,
    let data = try? String(contentsOf: dataURL, encoding: .utf8)
  else {
    fatalError("Couldn't find file 'input.txt' in the 'Data' directory.")
  }

  // On Windows, line separators may be CRLF. Converting to LF so that \n
  // works for string parsing.
  return data.replacingOccurrences(of: "\r", with: "")
}

public struct TestCase<T> where T: Equatable {
  let input: String
  let expected: T

  public init(input: String, expected: T) {
    self.input = input
    self.expected = expected
  }
}

public struct Solution<T> where T: Equatable {
  let fn: (String) async -> T?
  let tests: [TestCase<T>]

  public init(_ fn: @escaping (String) async -> T?, tests: [TestCase<T>]) {
    self.fn = fn
    self.tests = tests
  }
}

func run<T>(dataURL: URL?, testMode: Bool, part: Solution<T>, partName: String) async {
  var result: Result<T?, Error>?

  print("\n==== Running \(partName) ====\n")

  if testMode {
    var successful = true

    print("Running test mode:\n")

    for (i, test) in part.tests.enumerated() {
      let result = await part.fn(test.input)
      if result != test.expected {
        print("Failed test \(i)")
        print("Expected: \(test.expected) got: \(String(describing: result))")
        successful = false
      }
    }

    print("\n Test \(successful ? "Successful" : "Failed")\n")
  } else {
    let input = loadData(dataURL: dataURL)
    let timing = await ContinuousClock().measure {
      result = .success(await part.fn(input))
    }
    switch result! {
    case .success(let success):
      print("\(partName): \(String(describing: success))")
    case .failure(let failure):
      print("\(partName): Failed with error: \(failure)")
    }

    print("Completed in: \(timing)")
  }

}

public func run<T>(dataURL: URL?, testMode: Bool, part1: Solution<T>, part2: Solution<T>) async throws {
  await run(dataURL: dataURL, testMode: testMode, part: part1, partName: "Part 1")
  await run(dataURL: dataURL, testMode: testMode, part: part2, partName: "Part 2")
}
