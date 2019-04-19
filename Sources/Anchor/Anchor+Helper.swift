#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

extension Anchor {
  func updateIfAny(_ attribute: Attribute, _ constant: CGFloat) {
    let pin = pins.filter({ $0.attribute == attribute }).first
    pin?.constant = constant
  }

  func exists(_ attribute: Attribute) -> Bool {
    return pins.firstIndex(where: { $0.attribute == attribute }) != nil
  }

  func removeIfAny(_ attribute: Attribute) {
    if let index = pins.firstIndex(where: { $0.attribute == attribute }) {
      pins.remove(at: index)
    }
  }
}
