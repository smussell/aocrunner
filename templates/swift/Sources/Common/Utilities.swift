infix operator ??=
func ??= <T>(lhs: inout T?, rhs: @autoclosure () -> T) {
  if lhs == nil { lhs = rhs() }
}

extension Sequence where Element: AdditiveArithmetic {
  var sum: Element { reduce(into: .zero, +=) }
}

extension Sequence where Element: BinaryInteger {
  var product: Element { reduce(into: 1, *=) }
}

extension Sequence {
  func sum<Field: AdditiveArithmetic>(_ projection: (Element) -> Field) -> Field {
    reduce(into: .zero) { $0 += projection($1) }
  }
}

extension StringProtocol {
  func splitInts() -> [Int] {
    self.split(whereSeparator: \.isWhitespace).compactMap { Int($0) }
  }
}

extension Range where Bound: Strideable {
  static func + (lhs: Self, rhs: Bound.Stride) -> Self {
    lhs.lowerBound.advanced(by: rhs)..<lhs.upperBound.advanced(by: rhs)
  }
}
