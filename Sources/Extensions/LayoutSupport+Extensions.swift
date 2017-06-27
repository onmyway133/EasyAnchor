#if os(iOS) || os(tvOS)
import UIKit

public extension UILayoutSupport {
  var anchor: Anchor {
    return Anchor(item: self)
  }
}

#endif
