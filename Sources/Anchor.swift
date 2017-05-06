import UIKit

public class Anchor {
  enum To {
    case anchor(Anchor)
    case size(CGFloat)
    case none
  }

  private let view: UIView

  // key: attribute
  // value: constant
  fileprivate var attributes: [NSLayoutAttribute: CGFloat] = [:]
  fileprivate var constantValue: CGFloat?
  fileprivate var multiplierValue: CGFloat?
  fileprivate var priorityValue: CGFloat?
  fileprivate var identifierValue: String?
  fileprivate var referenceBlock: ((NSLayoutConstraint) -> Void)?
  fileprivate var relationValue: NSLayoutRelation = .equal
  fileprivate var toValue: To = .none

  init(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view = view
  }
}

// MARK: - Attributes

public extension Anchor {
  var left: Anchor {
    attributes[.left] = 0
    return self
  }

  var right: Anchor {
    attributes[.right] = 0
    return self
  }

  var top: Anchor {
    attributes[.top] = 0
    return self
  }

  var bottom: Anchor {
    attributes[.bottom] = 0
    return self
  }

  var leading: Anchor {
    attributes[.leading] = 0
    return self
  }

  var trailing: Anchor {
    attributes[.trailing] = 0
    return self
  }

  var width: Anchor {
    attributes[.width] = 0
    return self
  }

  var height: Anchor {
    attributes[.height] = 0
    return self
  }

  var centerX: Anchor {
    attributes[.centerX] = 0
    return self
  }

  var centerY: Anchor {
    attributes[.centerY] = 0
    return self
  }

  var lastBaseline: Anchor {
    attributes[.lastBaseline] = 0
    return self
  }

  var firstBaseline: Anchor {
    attributes[.firstBaseline] = 0
    return self
  }

  var leftMargin: Anchor {
    attributes[.leftMargin] = 0
    return self
  }

  var rightMargin: Anchor {
    attributes[.rightMargin] = 0
    return self
  }

  var topMargin: Anchor {
    attributes[.topMargin] = 0
    return self
  }

  var bottomMargin: Anchor {
    attributes[.bottomMargin] = 0
    return self
  }

  var leadingMargin: Anchor {
    attributes[.leadingMargin] = 0
    return self
  }

  var trailingMargin: Anchor {
    attributes[.trailingMargin] = 0
    return self
  }

  var centerXWithinMargins: Anchor {
    attributes[.centerXWithinMargins] = 0
    return self
  }

  var centerYWithinMargins: Anchor {
    attributes[.centerYWithinMargins] = 0
    return self
  }
}

// MARK: - Conveninent Attributes

public extension Anchor {
  var edges: Anchor {
    attributes.removeAll()
    return top.right.bottom.left
  }

  var center: Anchor {
    return centerX.centerY
  }
}

// MARK: - Configuration

public extension Anchor {

  func edges(insets: UIEdgeInsets) -> Self {
    attributes[.top] = insets.top
    attributes[.left] = insets.left
    attributes[.right] = insets.right
    attributes[.bottom] = insets.bottom
    return self
  }

  func constant(_ value: CGFloat) -> Self {
    constantValue = value
    return self
  }

  func multiplier(_ value: CGFloat) -> Self {
    multiplierValue = value
    return self
  }

  func priority(_ value: CGFloat) -> Self {
    priorityValue = value
    return self
  }

  func id(_ value: String) -> Self {
    identifierValue = value
    return self
  }

  func ref(_ block: @escaping (NSLayoutConstraint) -> Void) -> Self {
    referenceBlock = block
    return self
  }
}

// MARK: - Relation

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

// MARK: - To

public extension Anchor {

  func to(_ anchor: Anchor) -> Self {
    toValue = .anchor(anchor)
    return self
  }

  func to(_ size: CGFloat) -> Self {
    toValue = .size(size)
    return self
  }
}

// MARK: - Constraint

extension Anchor {

  func output() -> [NSLayoutConstraint] {
    switch toValue {
    case .anchor(let anchor):
      return []
    case .size(let size):
      return []
    case .none:
      return []
    }
  }
}
