#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Anchor {

  func constant(_ value: CGFloat) -> Self {
    pins.forEach {
      $0.constant = value
    }

    return self
  }

  func multiplier(_ value: CGFloat) -> Self {
    multiplierValue = value
    return self
  }

  func priority(_ value: Float) -> Self {
    priorityValue = value
    return self
  }

  func id(_ value: String) -> Self {
    identifierValue = value
    return self
  }

  func ref(_ block: @escaping ([NSLayoutConstraint]) -> Void) -> Self {
    referenceBlock = block
    return self
  }
}
