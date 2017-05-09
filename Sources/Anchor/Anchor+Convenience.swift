import UIKit

public extension Anchor {
  var edges: Anchor {
    pins.removeAll()
    return top.right.bottom.left
  }

  var center: Anchor {
    return centerX.centerY
  }

  var size: Anchor {
    return width.height
  }

  func insets(_ insets: UIEdgeInsets) -> Self {
    updateIfAny(.top, insets.top)
    updateIfAny(.bottom, insets.bottom)
    updateIfAny(.left, insets.left)
    updateIfAny(.right, insets.right)
    return self
  }

  func insets(_ value: CGFloat) -> Self {
    return insets(UIEdgeInsets(top: value, left: value, bottom: -value, right: -value))
  }

  func paddingHorizontally(_ value: CGFloat) -> Self {
    updateIfAny(.leading, value)
    updateIfAny(.trailing, -value)
    return self
  }

  func paddingVertically(_ value: CGFloat) -> Self {
    updateIfAny(.top, value)
    updateIfAny(.bottom, -value)
    return self
  }
}
