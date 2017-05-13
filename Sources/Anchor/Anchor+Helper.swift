#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

extension Anchor {
  func updateIfAny(_ attribute: NSLayoutAttribute, _ constant: CGFloat) {
    let pin = pins.filter({ $0.attribute == attribute }).first
    pin?.constant = constant
  }
}
