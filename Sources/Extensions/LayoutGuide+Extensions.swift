#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

@available(iOS 9.0, *)
public extension LayoutGuide {
  var anchor: Anchor {
    return Anchor(layoutGuide: self)
  }
}
