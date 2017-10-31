#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Anchor {

  /// Find a constraint based on an attribute
  func find(_ attribute: Attribute) -> NSLayoutConstraint? {
    guard let view = item as? View else {
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
