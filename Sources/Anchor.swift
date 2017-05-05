import UIKit

public class Anchor {
  private let view: UIView

  fileprivate var attributes: [NSLayoutAttribute: CGFloat] = [:]

  init(view: UIView) {
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
