import UIKit

public extension Anchor {
  var edges: Anchor {
    pins.removeAll()
    return top.right.bottom.left
  }

  var center: Anchor {
    return centerX.centerY
  }

  var size: Anchor {
    return width.height
  }
}
