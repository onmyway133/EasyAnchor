#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

/// Something that returns constraints
public protocol ConstraintProducer {
  func constraints() -> [NSLayoutConstraint]
}
