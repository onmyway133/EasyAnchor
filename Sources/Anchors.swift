import UIKit

/// Produce constraints into group
public func group(_ producers: ConstraintProducer ...) -> Group {
  return Group(producers: producers)
}

/// Produce constraints into group and activate

public func activate(_ producers: ConstraintProducer ...) {
  let group = Group(producers: producers)
  group.isActive = true
}
