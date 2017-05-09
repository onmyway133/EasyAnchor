import UIKit

public extension Anchor {
  func find(_ attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
    guard let view = item as? UIView else {
      return nil
    }

    var constraints = view.superview?.constraints

    if attribute == .width || attribute == .height {
      constraints?.append(contentsOf: view.constraints)
    }

    return constraints?.filter({
      guard $0.firstAttribute == attribute else {
        return false
      }

      guard $0.firstItem as? NSObject == view else {
        return false
      }

      return true
    }).first
  }
}
