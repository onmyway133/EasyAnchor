import UIKit

public extension Anchor {

  func to(_ anchor: Anchor) -> Self {
    toValue = .anchor(anchor)
    return self
  }

  func to(_ size: CGFloat) -> Self {
    toValue = .size
    updateIfAny(.width, size)
    updateIfAny(.height, size)
    return self
  }
}
