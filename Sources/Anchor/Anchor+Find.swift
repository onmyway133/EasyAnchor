import UIKit

public extension Anchor {
  public class Find {
    let view: UIView

    init(view: UIView) {
      self.view = view
    }
  }

  var find: Find {
    return Find(view: view)
  }
}

public extension Anchor.Find {

  func constraint(_ attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
    var constraints = view.superview?.constraints

    if attribute == .width || attribute == .height {
      constraints = view.constraints
    }

    return constraints?.filter({
      guard $0.firstAttribute == attribute else {
        return false
      }

      guard $0.firstItem as? NSObject == view || $0.secondItem as? NSObject == view else {
        return false
      }

      return true
    }).first
  }
}
