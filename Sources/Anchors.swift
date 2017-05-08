import UIKit

// MARK: - Public

/// Produce constraints into group
public func group(_ anchors: Anchor ...) -> Group {
  return Group(anchors: anchors)
}

/// Produce constraints into group and activate

@discardableResult
public func activate(_ anchors: Anchor ...) -> Group {
  let group = Group(anchors: anchors)
  group.isActive = true

  return group
}
