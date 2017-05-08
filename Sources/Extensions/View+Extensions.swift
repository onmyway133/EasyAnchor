import UIKit

public extension UIView {
  var anchor: Anchor {
    return Anchor(view: self)
  }
}
