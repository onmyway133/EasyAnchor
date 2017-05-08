import UIKit

/// Something that returns constraints
public protocol ConstraintProducer {
  func constraints() -> [NSLayoutConstraint]
}
