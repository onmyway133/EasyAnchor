#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension LayoutGuide {
  var anchor: Anchor {
    return Anchor(layoutGuide: self)
  }
}
