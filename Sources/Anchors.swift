import UIKit

/// Produce constraints into group
public func group(_ anchors: ConstraintProducer ...) -> Group {
  return Group(anchors: anchors)
}

/// Produce constraints into group and activate

@discardableResult
public func activate(_ anchors: ConstraintProducer ...) -> Group {
  let group = Group(anchors: anchors)
  group.isActive = true

  return group
}
