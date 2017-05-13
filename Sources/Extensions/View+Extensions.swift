#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension View {
  var anchor: Anchor {
    return Anchor(view: self)
  }
}
