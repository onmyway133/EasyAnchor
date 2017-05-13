#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

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

  func insets(_ insets: EdgeInsets) -> Anchor {
    updateIfAny(.top, insets.top)
    updateIfAny(.bottom, insets.bottom)
    updateIfAny(.left, insets.left)
    updateIfAny(.right, insets.right)
    return self
  }

  func insets(_ value: CGFloat) -> Anchor {
    return insets(EdgeInsets(top: value, left: value, bottom: -value, right: -value))
  }

  func paddingHorizontally(_ value: CGFloat) -> Anchor {
    updateIfAny(.leading, value)
    updateIfAny(.trailing, -value)
    return self
  }

  func paddingVertically(_ value: CGFloat) -> Anchor {
    updateIfAny(.top, value)
    updateIfAny(.bottom, -value)
    return self
  }
}
