import UIKit

public extension Anchor {
  var equal: Anchor {
    relationValue = .equal
    return self
  }

  var lessThanOrEqual: Anchor {
    relationValue = .lessThanOrEqual
    return self
  }

  var greaterThanOrEqual: Anchor {
    relationValue = .greaterThanOrEqual
    return self
  }
}
