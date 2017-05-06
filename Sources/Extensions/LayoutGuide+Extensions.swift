import UIKit

@available(iOS 9.0, *)
public extension UILayoutGuide {
  var anchor: Anchor {
    return Anchor(layoutGuide: self)
  }
}
